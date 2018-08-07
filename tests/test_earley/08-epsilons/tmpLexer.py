# Generated from tmpLexer.g4 by ANTLR 4.5.3
from antlr4 import *
from io import StringIO


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2\5")
        buf.write("\17\b\1\4\2\t\2\4\3\t\3\4\4\t\4\3\2\3\2\3\3\3\3\3\4\3")
        buf.write("\4\2\2\5\3\3\5\4\7\5\3\2\2\16\2\3\3\2\2\2\2\5\3\2\2\2")
        buf.write("\2\7\3\2\2\2\3\t\3\2\2\2\5\13\3\2\2\2\7\r\3\2\2\2\t\n")
        buf.write("\7\62\2\2\n\4\3\2\2\2\13\f\7\63\2\2\f\6\3\2\2\2\r\16\7")
        buf.write("\64\2\2\16\b\3\2\2\2\3\2\2")
        return buf.getvalue()


class tmpLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]


    CNF_TERM_0 = 1
    CNF_TERM_1 = 2
    CNF_TERM_2 = 3

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "'0'", "'1'", "'2'" ]

    symbolicNames = [ "<INVALID>",
            "CNF_TERM_0", "CNF_TERM_1", "CNF_TERM_2" ]

    ruleNames = [ "CNF_TERM_0", "CNF_TERM_1", "CNF_TERM_2" ]

    grammarFileName = "tmpLexer.g4"

    def __init__(self, input=None):
        super().__init__(input)
        self.checkVersion("4.5.3")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


