# Generated from tmpLexer.g4 by ANTLR 4.5.3
from antlr4 import *
from io import StringIO


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2\4")
        buf.write("\13\b\1\4\2\t\2\4\3\t\3\3\2\3\2\3\3\3\3\2\2\4\3\3\5\4")
        buf.write("\3\2\2\n\2\3\3\2\2\2\2\5\3\2\2\2\3\7\3\2\2\2\5\t\3\2\2")
        buf.write("\2\7\b\7\62\2\2\b\4\3\2\2\2\t\n\7\63\2\2\n\6\3\2\2\2\3")
        buf.write("\2\2")
        return buf.getvalue()


class tmpLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]


    CNF_TERM_0 = 1
    CNF_TERM_1 = 2

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "'0'", "'1'" ]

    symbolicNames = [ "<INVALID>",
            "CNF_TERM_0", "CNF_TERM_1" ]

    ruleNames = [ "CNF_TERM_0", "CNF_TERM_1" ]

    grammarFileName = "tmpLexer.g4"

    def __init__(self, input=None):
        super().__init__(input)
        self.checkVersion("4.5.3")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


