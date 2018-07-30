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
                              [0, 1],
                              [0, 1, 2, 3],
                              [0, 1, 3, 4],
                              [1, 2],
                              [1, 2, 3, 4],
                              [2, 3],
                              [3, 4]])


if __name__ == '__main__':
    unittest.main()
