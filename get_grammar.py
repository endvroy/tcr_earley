from normalize_antlr4 import make_builder
from antlr4 import FileStream
from ANTLRv4Lexer import ANTLRv4Lexer
from earley_parser import Rule, Grammar


def get_grammar(grammar_path, start):
    input = FileStream(grammar_path)
    lexer = ANTLRv4Lexer(input)
    token_map = {name: i for i, name in enumerate(lexer.symbolicNames)}
    builder = make_builder(grammar_path)
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


if __name__ == '__main__':
    # grammar = get_grammar('test/01-sequence.g4', 'entry')

    grammar_path = 'test/01-sequence.g4'
    start = 'entry'
    inp = FileStream(grammar_path)
    lexer = ANTLRv4Lexer(inp)
    token_map = {name: i for i, name in enumerate(lexer.symbolicNames)}
    builder = make_builder(grammar_path, canonicalize_lexer_rules=False)
    builder.to_cnf(start)
    grammar = builder.build(token_map)
    g = transform_grammar(grammar)
