from skippy_earley.earley_parser import *


def _load_grammar(fpath):
    """Loads the grammar from file"""
    grammar = Grammar()

    with open(fpath) as f:
        for line in f:
            line = line.strip()
            if len(line) == 0:
                continue
            entries = line.split('->')
            lhs = entries[0].strip()
            for rhs in entries[1].split('|'):
                grammar.add(Rule(lhs, rhs.strip().split()))
    return grammar


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(description='Runs the Earley parser according to a given grammar.')
    parser.add_argument('grammar', help='path to grammar file')
    parser.add_argument('lex', help='path to lexical rule')
    parser.add_argument('file', help='path to test case')
    args = parser.parse_args()

    grammar = _load_grammar(args.grammar_file)

    tokens = 'int + int + int'.split(' ')

    parser = EarleyParser(tokens, grammar)
    parser.parse()
