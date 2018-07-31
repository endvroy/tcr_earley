from normalize_antlr4 import make_builder
import argparse


def to_cnf(grammar_path, start):
    builder = make_builder(grammar_path)
    builder.to_cnf(start)
    s = builder.to_antlr_string()
    with open('tmp.g4', 'w') as f:
        f.write('grammar tmp;\n\n')
        f.write(s)


if __name__ == '__main__':
    arg_parser = argparse.ArgumentParser(description='Normalize ANTLR Grammar to CNF')
    arg_parser.add_argument('grammar', help='path to grammar file')
    arg_parser.add_argument('start', help='starting symbol')
    args = arg_parser.parse_args()

    to_cnf(args.grammar, args.start)
