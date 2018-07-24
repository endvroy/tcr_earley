import argparse
import os
import importlib
from antlr4 import FileStream, CommonTokenStream
from normalize_antlr4 import make_builder
from ANTLRv4Lexer import ANTLRv4Lexer
from .earley_parser import Rule, Grammar, EarleyParser


def get_grammar(grammar_path, start, canonicalize_lexer_rules=True):
    inp = FileStream(grammar_path)
    lexer = ANTLRv4Lexer(inp)
    token_map = {name: i for i, name in enumerate(lexer.symbolicNames)}
    builder = make_builder(grammar_path, canonicalize_lexer_rules=canonicalize_lexer_rules)
    builder.to_cnf(start)
    grammar = builder.build(token_map)
    return grammar


def transform_grammar(grammar):
    g = Grammar()
    g.starting_symbol = -1
    for lhs, rhs_list in grammar.nonterminals.items():
        if lhs > g.starting_symbol:
            g.starting_symbol = lhs
        for rhs in rhs_list:
            g.add(Rule(lhs, rhs))
    return g


def load_lexer(file_name):
    import sys

    lexer_dir, lexer_file = os.path.split(file_name)
    lexer_name = lexer_file[:lexer_file.rfind('.py')]
    sys.path.append(lexer_dir)

    module = importlib.import_module(lexer_name)
    FileLexer = getattr(module, lexer_name)

    return FileLexer


def get_stream(Lexer, file_path):
    inp = FileStream(file_path)
    lexer = Lexer(inp)
    stream = CommonTokenStream(lexer)
    stream.fill()
    tokens = stream.tokens
    new_stream = [t.type for t in tokens]
    return new_stream, tokens


if __name__ == '__main__':
    arg_parser = argparse.ArgumentParser(description='Test Case Reduction')
    arg_parser.add_argument('grammar', help='path to grammar file')
    arg_parser.add_argument('start', help='starting symbol of the grammar')
    arg_parser.add_argument('lexer', help='path to lexer for target language')
    arg_parser.add_argument('file', help='path to test case')
    args = arg_parser.parse_args()

    # read the grammar
    grammar = transform_grammar(get_grammar(args.grammar, args.start))
    # load the lexer
    Lexer = load_lexer(args.lexer)
    # read token stream
    tokens, orig_tokens = get_stream(Lexer, args.file)

    # get skipped indices
    parser = EarleyParser(tokens, grammar)
    skipped_indices = parser.parse()

    # todo: print out all test cases
