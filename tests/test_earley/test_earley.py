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
                             [[],
                              [0, 1],  # int(2) +(3) int(4)
                              [0, 1, 2, 3],  # int(4)
                              [0, 1, 3, 4],  # int(2)
                              [1, 2],  # int(0) +(3) int(4)
                              [1, 2, 3, 4],  # int(0)
                              [2, 3],  # int(0) +(1) int(4)
                              [3, 4]])  # int(0) +(1) int(2)

    def test_sequence(self):
        si = sem.main('tests/test_earley/01-sequence/tmp.g4',
                      'tests/test_earley/01-sequence/tmpLexer.py',
                      'tests/test_earley/01-sequence/sequence.txt')
        self.assertListEqual(sorted(si),
                             [[2, 3, 4], [3, 4, 5], [3, 5, 6], [4, 5, 6]])


if __name__ == '__main__':
    unittest.main()
