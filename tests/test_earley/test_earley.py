import skippy_earley.main as sem
from skippy_earley.earley_parser import *
import unittest


class TestEarley(unittest.TestCase):
    def test_easy(self):
        grammar = Grammar()
        grammar.add(Rule('E', ['E', '+', 'E']))
        grammar.add(Rule('E', ['int']))
        grammar.starting_symbol = 'E'

        tokens = 'int + int + int'.split(' ')

        parser = EarleyParser(tokens, grammar)
        parser.parse()
        si = parser.extract()
        self.assertListEqual(sorted(si),
                             [(),
                              (0, 1),  # int(2) +(3) int(4)
                              (0, 1, 2, 3),  # int(4)
                              (0, 1, 3, 4),  # int(2)
                              (1, 2),  # int(0) +(3) int(4)
                              (1, 2, 3, 4),  # int(0)
                              (2, 3),  # int(0) +(1) int(4)
                              (3, 4)])  # int(0) +(1) int(2)

    def test_01_sequence(self):
        si = sem.main('tests/test_earley/01-sequence/tmp.g4',
                      'tests/test_earley/01-sequence/tmpLexer.py',
                      'tests/test_earley/01-sequence/stream.txt')
        self.assertListEqual(sorted(si),
                             [(2, 3, 4), (3, 4, 5), (3, 5, 6), (4, 5, 6)])

    def test_02_top_level_alt(self):
        si = sem.main('tests/test_earley/02-top-level-alternations/tmp.g4',
                      'tests/test_earley/02-top-level-alternations/tmpLexer.py',
                      'tests/test_earley/02-top-level-alternations/stream.txt')
        self.assertListEqual(sorted(si),
                             [(0, 1),
                              # (0, 1, 2, 3), #empty stream not considered
                              (0, 3), (1, 2), (2, 3)])

    def test_03_nested_alt(self):
        si = sem.main('tests/test_earley/03-nested-alternations/tmp.g4',
                      'tests/test_earley/03-nested-alternations/tmpLexer.py',
                      'tests/test_earley/03-nested-alternations/stream.txt')
        self.assertListEqual(sorted(si),
                             [(0, 2), (0, 3), (1, 2), (1, 3)])

    def test_04_terminals(self):
        si = sem.main('tests/test_earley/04-terminals/tmp.g4',
                      'tests/test_earley/04-terminals/tmpLexer.py',
                      'tests/test_earley/04-terminals/stream.txt')
        self.assertListEqual(sorted(si),
                             [  # (0,), no 0 since the tokens are classified before the parsing rule
                                 (1,), (2,)])

    def test_05_quantifiers(self):
        si = sem.main('tests/test_earley/05-quantifiers/tmp.g4',
                      'tests/test_earley/05-quantifiers/tmpLexer.py',
                      'tests/test_earley/05-quantifiers/stream.txt')
        self.assertListEqual(sorted(si),  # todo: too many!
                             [(0, 1, 2, 3, 4), (0, 1, 2, 3, 4, 6), (0, 1, 2, 4), (0, 1, 2, 4, 5), (0, 1, 2, 4, 5, 6),
                              (0, 1, 2, 4, 6), (0, 1, 2, 5, 6), (0, 1, 3, 4), (0, 1, 3, 4, 5), (0, 1, 3, 4, 5, 6),
                              (0, 1, 3, 4, 6), (0, 1, 3, 5, 6), (0, 1, 4), (0, 1, 4, 5), (0, 1, 4, 5, 6), (0, 1, 4, 6),
                              (0, 1, 5, 6), (0, 2, 3, 4), (0, 2, 3, 4, 6), (0, 2, 4), (0, 2, 4, 5), (0, 2, 4, 5, 6),
                              (0, 2, 4, 6), (0, 2, 5, 6), (0, 3, 4), (0, 3, 4, 5), (0, 3, 4, 5, 6), (0, 3, 4, 6),
                              (0, 3, 5, 6), (0, 4), (0, 4, 5), (0, 4, 5, 6), (0, 4, 6), (0, 5, 6), (1, 2, 3, 4),
                              (1, 2, 3, 4, 6), (1, 2, 4), (1, 2, 4, 5), (1, 2, 4, 5, 6), (1, 2, 4, 6), (1, 2, 5, 6),
                              (1, 3, 4), (1, 3, 4, 5), (1, 3, 4, 5, 6), (1, 3, 4, 6), (1, 3, 5, 6), (1, 4), (1, 4, 5),
                              (1, 4, 5, 6), (1, 4, 6), (1, 5, 6), (2, 3, 4), (2, 3, 4, 6), (2, 4), (2, 4, 5),
                              (2, 4, 5, 6),
                              (2, 4, 6), (2, 5, 6), (3, 4), (3, 4, 5), (3, 4, 5, 6), (3, 4, 6), (3, 5, 6), (4,), (4, 5),
                              (4, 5, 6), (4, 6), (5, 6)])

    def test_06_recursive(self):
        si = sem.main('tests/test_earley/06-recursive/tmp.g4',
                      'tests/test_earley/06-recursive/tmpLexer.py',
                      'tests/test_earley/06-recursive/stream.txt')
        self.assertListEqual(sorted(si),
                             [(),
                              (0, 1), (0, 1, 2, 3), (0, 1, 3, 4),
                              (1, 2), (1, 2, 3, 4),
                              (2, 3),
                              (3, 4)])  # same as test_easy

    def test_07_binarize(self):
        si = sem.main('tests/test_earley/07-binarize/tmp.g4',
                      'tests/test_earley/07-binarize/tmpLexer.py',
                      'tests/test_earley/07-binarize/stream.txt')
        self.assertListEqual(sorted(si),
                             [(0, 1, 2), (3,), (4,), (5,)])

    def test_08_epsilons(self):
        si = sem.main('tests/test_earley/08-epsilons/tmp.g4',
                      'tests/test_earley/08-epsilons/tmpLexer.py',
                      'tests/test_earley/08-epsilons/stream.txt')
        self.assertListEqual(sorted(si),
                             [()])


if __name__ == '__main__':
    unittest.main()
