import argparse
import os
import importlib
from antlr4 import FileStream, CommonTokenStream
from normalize_antlr4 import make_builder
from skippy_earley.baseline import Rule, Grammar, EarleyParser


def transform_grammar(grammar):
    g = Grammar()
    g.starting_symbol = -1
    for lhs, rhs_list in grammar.nonterminals.items():
        if g.starting_symbol == -1:
            g.starting_symbol = lhs
        for rhs in rhs_list:
            g.add(Rule(lhs, rhs))
    return g


def load_grammar(grammar_path, lexer_path):
    import sys
    lexer_dir, lexer_file = os.path.split(lexer_path)
    lexer_name = lexer_file[:lexer_file.rfind('.py')]
    sys.path.append(lexer_dir)

    module = importlib.import_module(lexer_name)
    FileLexer = getattr(module, lexer_name)

    inp = FileStream(grammar_path)
    lexer = FileLexer(inp)
    token_map = {name: i for i, name in enumerate(lexer.symbolicNames)}
    builder = make_builder(grammar_path, False)
    grammar = builder.build(token_map)
    return FileLexer, transform_grammar(grammar)


def get_stream(Lexer, file_path, strip_eof=True):
    inp = FileStream(file_path)
    lexer = Lexer(inp)
    stream = CommonTokenStream(lexer)
    stream.fill()
    tokens = stream.tokens
    if strip_eof:
        new_stream = [t.type for t in tokens[:-1]]
    else:
        new_stream = [t.type for t in tokens]
    return new_stream, tokens


def main(grammar_path, lexer_path, file_path, strip_eof=True):
    # load the grammar and lexer
    Lexer, grammar = load_grammar(grammar_path, lexer_path)
    # read token stream
    tokens, orig_tokens = get_stream(Lexer, file_path, strip_eof)

    # get skipped indices
    parser = EarleyParser(tokens, grammar)
    parser.parse()
    skipped_indices = parser.extract()

    # todo: print out all test cases
    return skipped_indices


if __name__ == '__main__':
    arg_parser = argparse.ArgumentParser(description='Test Case Reduction')
    arg_parser.add_argument('grammar', help='path to grammar file')
    arg_parser.add_argument('lexer', help='path to lexer for target language')
    arg_parser.add_argument('file', help='path to test case')
    args = arg_parser.parse_args()
    si = main(args.grammar, args.lexer, args.file, strip_eof=False)
    print(si)
