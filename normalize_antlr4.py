#!/usr/bin/env python3
#
# Copyright 2018 Nick Sumner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import itertools
import collections
from argparse import ArgumentParser

from antlr4 import *
from ANTLRv4Lexer import ANTLRv4Lexer
from ANTLRv4Parser import ANTLRv4Parser
from ANTLRv4ParserVisitor import ANTLRv4ParserVisitor


class Grammar:
    def __init__(self, lexer_rules, terminals, nonterminals):
        self.lexer_rules = lexer_rules
        self.terminals = terminals
        self.nonterminals = nonterminals

    def to_antlr_string(self):
        chunks = []
        for name, rules in self.nonterminals.items():
            rule = name + '\n  : '
            rule += '\n  | '.join(' '.join(x) for x in rules) + '\n  ;\n'
            chunks.append(rule)
        return '\n'.join(chunks)


def get_all_leaves(tree):
    leaves = []

    def dfs_leaf_helper(subtree):
        if isinstance(subtree, TerminalNode):
            leaves.append(subtree)
        elif subtree.children:
            for child in subtree.children:
                dfs_leaf_helper(child)
        else:
            debug_message(repr(subtree))
    dfs_leaf_helper(tree)
    return leaves


def get_tree_as_string(tree):
    return ''.join(str(x) for x in get_all_leaves(tree))


class GrammarBuilder:
    def __init__(self):
        self.lexer_rules = []
        self.nonrule_terminals = set()
        self.nonterminals = {}
        self.rule_deduper = {}

    # Note, this computes the CNF for L(G)-ε
    def to_cnf(self, old_start_symbol, new_start='cnf_start'):
        self.add_nonterminal(new_start, [(old_start_symbol,)])
        self.binarize()
        self.eliminate_epsilon()
        self.eliminate_units()
        self.prune_unreachable(new_start)

    def binarize(self):
        def binarize_rule(name, rule):
            while len(rule) > 2:
                new_rules = (rule[-2:],)
                new_name = '{0}_bin_{1}'.format(name, next(counter))
                new_name = self.find_or_add_nonterminal(new_name, new_rules)
                rule = rule[:-2] + (new_name,)
            return rule

        for name, rules in self.nonterminals.copy().items():
            old_key = self._make_key(rules)
            counter = itertools.count(1)
            rules = tuple(binarize_rule(name, rule) for rule in rules)
            new_key = self._make_key(rules)
            if old_key != new_key and self.rule_deduper[old_key] == name:
                del self.rule_deduper[old_key]
                self.rule_deduper[new_key] = name
                self.nonterminals[name] = rules

    def eliminate_epsilon(self):
        null = set(name for name, rules in self.nonterminals.items()
                   if all(len(rule) == 0 for rule in rules))
        nullable = set(name for name, rules in self.nonterminals.items()
                       if any(len(rule) == 0 for rule in rules))
        # Compute the fixed point of the nullable set
        old_size = 0
        while len(nullable) != old_size:
            old_size = len(nullable)
            nullable.update(name for name, rules in self.nonterminals.items()
                            if any(all(term in nullable for term in rule)
                                   for rule in rules))

        def propagate(rule):
            terms = [[(term,)] + ([()] if term in nullable else [])
                     for term in rule if term not in null]
            return tuple(tuple(itertools.chain.from_iterable(rule))
                         for rule in itertools.product(*terms))

        # First compute the effects of propagating empty strings
        self.nonterminals = {name: tuple(x for rule in rhs
                                            for x in propagate(rule)
                                            if x)
                             for name, rhs in self.nonterminals.items()}
        # Then remove all empty rules.
        self.nonterminals = {name: rules
                             for name, rules in self.nonterminals.items()
                             if rules}
        self._recompute_dedup()

    def eliminate_units(self):
        terminals = set(self.lexer_rules) | self.nonrule_terminals

        def unit(first_rule):
            seen = set()
            to_clean = collections.deque([first_rule])
            rules = []
            while len(to_clean) > 0:
                rule = to_clean.popleft()
                if len(rule) != 1 or rule[0] in terminals or rule[0] in seen:
                    rules.append(rule)
                else:
                    name = rule[0]
                    seen.add(name)
                    to_clean.extend(self.nonterminals[name])
            return rules

        self.nonterminals = {name: tuple(x for rule in rules
                                           for x in unit(rule))
                            for name, rules in self.nonterminals.copy().items()}
        self._recompute_dedup()

    def prune_unreachable(self, start):
        reachable = set()

        def dfs_helper(name):
            if name in self.nonterminals and name not in reachable:
                reachable.add(name)
                for term in {t for r in self.nonterminals[name] for t in r}:
                    dfs_helper(term)
        dfs_helper(start)
        self.nonterminals = {name: rules
                             for name, rules in self.nonterminals.items()
                             if name in reachable}
        self._recompute_dedup()

    def build(self):
        return Grammar(self.lexer_rules,
                       self.nonrule_terminals,
                       self.nonterminals)

    def add_lexer_rule(self, name):
        self.lexer_rules.append(name)
        nonterminal_name = 'lexer_rule_' + str(len(self.lexer_rules))
        self.add_nonterminal(nonterminal_name, [(name,)])

    def add_terminal(self, text):
        if text not in self.nonrule_terminals:
            self.nonrule_terminals.add(text)
            name = 'terminal_' + str(len(self.nonrule_terminals))
            self.add_nonterminal(name, [(text,)])

    def add_nonterminal(self, name, derivations, force=False):
        key = self._make_key(derivations)
        assert force or key not in self.rule_deduper
        self.nonterminals[name] = derivations
        self.rule_deduper[key] = name

    # Finds a nonterminal based on its possible derivations (*not* name)
    def find_or_add_nonterminal(self, name, derivations):
        used_name = self.get_nonterminal(derivations)
        if not used_name:
            used_name = name
            self.add_nonterminal(name, derivations)
        return used_name

    def get_terminal_symbol(self, text):
        key = self._make_key([(text,)])
        return self.rule_deduper[key]

    def get_nonterminal(self, rules):
        key = self._make_key(rules)
        return self.rule_deduper[key] if key in self.rule_deduper else None

    def _make_key(self, derivations):
        return '|'.join(str(x) for x in derivations)

    def _recompute_dedup(self):
        self.rule_deduper = {self._make_key(rules): name
                             for name, rules in self.nonterminals.items()}


class LexerRuleExtractor(ANTLRv4ParserVisitor):
    def __init__(self, grammar):
        self.grammar = grammar

    def visitGrammarSpec(self, ctx: ANTLRv4Parser.GrammarSpecContext):
        self.visitChildren(ctx)
        # Handle build int lexer symbols
        self.grammar.add_lexer_rule('EOF')

    def visitLexerRuleSpec(self, ctx: ANTLRv4Parser.LexerRuleSpecContext):
        if not ctx.FRAGMENT():
            self.grammar.add_lexer_rule(str(ctx.TOKEN_REF()))

    def visitAtom(self, ctx: ANTLRv4Parser.AtomContext):
        if ctx.terminal() and ctx.terminal().STRING_LITERAL():
            self.grammar.add_terminal(str(ctx.terminal().STRING_LITERAL()))
        elif ctx.notSet():
            self.grammar.add_terminal(get_tree_as_string(ctx.notSet()))


class ParserRuleExtractor(ANTLRv4ParserVisitor):
    def __init__(self, grammar):
        self.grammar = grammar
        self.last_rule = None
        self.subrule_count = 0

    def visitLexerRuleSpec(self, ctx: ANTLRv4Parser.LexerRuleSpecContext):
        # Skip exploring lexer rules any further.
        pass

    def visitParserRuleSpec(self, ctx: ANTLRv4Parser.ParserRuleSpecContext):
        # Extract the name and reset subrules before exploring deeper.
        name = str(ctx.RULE_REF())
        self.last_rule = name
        self.subrule_count = 0

        # Recurse into the subtree of this rule.
        rules = ctx.ruleBlock().accept(self)
        self.grammar.add_nonterminal(name, rules, True)

    def visitRuleAltList(self, ctx: ANTLRv4Parser.ParserRuleSpecContext):
        return tuple(x.accept(self) for x in ctx.labeledAlt())

    def visitLabeledAlt(self, ctx: ANTLRv4Parser.LabeledAltContext):
        return ctx.alternative().accept(self)

    def visitAlternative(self, ctx: ANTLRv4Parser.AlternativeContext):
        return tuple(symbol for element in ctx.element()
                            for symbol in (element.accept(self),) if symbol)

    def visitElement(self, ctx: ANTLRv4Parser.ElementContext):
        if ctx.actionBlock():
            return None
        # Get the base regardless of labeledElement, atom, or ebnf
        base = ctx.children[0].accept(self)
        if ctx.ebnfSuffix():
            return self.handleSuffix(ctx.ebnfSuffix(), base)
        else:
            return base

    def visitEbnf(self, ctx: ANTLRv4Parser.EbnfContext):
        base = ctx.block().accept(self)
        if ctx.blockSuffix():
            return self.handleSuffix(ctx.blockSuffix().ebnfSuffix(), base)
        else:
            return base

    def visitBlock(self, ctx: ANTLRv4Parser.BlockContext):
        rules = tuple(x.accept(self) for x in ctx.altList().alternative())
        self.subrule_count += 1
        name = '{0}_block_{1}'.format(self.last_rule, self.subrule_count)
        name = self.grammar.find_or_add_nonterminal(name, rules)
        return name

    def visitLabeledElement(self, ctx: ANTLRv4Parser.LabeledElementContext):
        to_extract = ctx.atom() or ctx.block()
        return to_extract.accept(self)

    def visitAtom(self, ctx: ANTLRv4Parser.AtomContext):
        if ctx.terminal():
            node = ctx.terminal().STRING_LITERAL() or ctx.terminal().TOKEN_REF()
            return self.grammar.get_terminal_symbol(str(node))
        elif ctx.ruleref():
            return str(ctx.ruleref().RULE_REF())
        elif ctx.notSet():
            tree_string = get_tree_as_string(ctx.notSet())
            return self.grammar.get_terminal_symbol(tree_string)
        else:
            return None

    def handleSuffix(self, suffix, base):
        # TODO: These could be deduplicated across subrules with more work.
        self.subrule_count += 1
        name = '{0}_suffix_{1}'.format(self.last_rule, self.subrule_count)
        if suffix.STAR():
            rules = ((base, name), ())
        elif suffix.PLUS():
            rules = ((base, name), (base,))
        else:  # QUESTION
            rules = ((base,), ())
        name = self.grammar.find_or_add_nonterminal(name, rules)
        return name


def print_cnf_grammar(grammar_path, start):
    input = FileStream(grammar_path)
    lexer = ANTLRv4Lexer(input)
    stream = CommonTokenStream(lexer)
    parser = ANTLRv4Parser(stream)
    tree = parser.grammarSpec()

    builder = GrammarBuilder()
    lexer_rule_extractor = LexerRuleExtractor(builder)
    tree.accept(lexer_rule_extractor)
    parser_rule_extractor = ParserRuleExtractor(builder)
    tree.accept(parser_rule_extractor)
    builder.to_cnf(start)
    grammar = builder.build()

    print(grammar.to_antlr_string())


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument("grammar", help="Path to an ANTLR4 grammar")
    parser.add_argument("start", help="Name of the start symbol in the grammar")
    args = parser.parse_args()

    print_cnf_grammar(args.grammar, args.start)
