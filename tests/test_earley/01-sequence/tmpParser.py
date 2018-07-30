# Generated from tmp.g4 by ANTLR 4.5.3
# encoding: utf-8
from antlr4 import *
from io import StringIO

def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3\6")
        buf.write("\"\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b")
        buf.write("\t\b\3\2\3\2\3\2\3\3\3\3\3\3\3\4\3\4\3\4\3\5\3\5\3\6\3")
        buf.write("\6\3\7\3\7\3\b\3\b\3\b\2\2\t\2\4\6\b\n\f\16\2\2\32\2\20")
        buf.write("\3\2\2\2\4\23\3\2\2\2\6\26\3\2\2\2\b\31\3\2\2\2\n\33\3")
        buf.write("\2\2\2\f\35\3\2\2\2\16\37\3\2\2\2\20\21\5\b\5\2\21\22")
        buf.write("\5\n\6\2\22\3\3\2\2\2\23\24\5\f\7\2\24\25\5\16\b\2\25")
        buf.write("\5\3\2\2\2\26\27\5\2\2\2\27\30\5\4\3\2\30\7\3\2\2\2\31")
        buf.write("\32\7\3\2\2\32\t\3\2\2\2\33\34\7\4\2\2\34\13\3\2\2\2\35")
        buf.write("\36\7\5\2\2\36\r\3\2\2\2\37 \7\6\2\2 \17\3\2\2\2\2")
        return buf.getvalue()


class tmpParser ( Parser ):

    grammarFileName = "tmp.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'0'", "'1'", "'2'", "'3'" ]

    symbolicNames = [ "<INVALID>", "CNF_TERM_0", "CNF_TERM_1", "CNF_TERM_2", 
                      "CNF_TERM_3" ]

    RULE_b = 0
    RULE_c = 1
    RULE_cnf_start = 2
    RULE_terminal_1 = 3
    RULE_terminal_2 = 4
    RULE_terminal_3 = 5
    RULE_terminal_4 = 6

    ruleNames =  [ "b", "c", "cnf_start", "terminal_1", "terminal_2", "terminal_3", 
                   "terminal_4" ]

    EOF = Token.EOF
    CNF_TERM_0=1
    CNF_TERM_1=2
    CNF_TERM_2=3
    CNF_TERM_3=4

    def __init__(self, input:TokenStream):
        super().__init__(input)
        self.checkVersion("4.5.3")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None



    class BContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def terminal_1(self):
            return self.getTypedRuleContext(tmpParser.Terminal_1Context,0)


        def terminal_2(self):
            return self.getTypedRuleContext(tmpParser.Terminal_2Context,0)


        def getRuleIndex(self):
            return tmpParser.RULE_b

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterB" ):
                listener.enterB(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitB" ):
                listener.exitB(self)




    def b(self):

        localctx = tmpParser.BContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_b)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 14
            self.terminal_1()
            self.state = 15
            self.terminal_2()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class CContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def terminal_3(self):
            return self.getTypedRuleContext(tmpParser.Terminal_3Context,0)


        def terminal_4(self):
            return self.getTypedRuleContext(tmpParser.Terminal_4Context,0)


        def getRuleIndex(self):
            return tmpParser.RULE_c

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterC" ):
                listener.enterC(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitC" ):
                listener.exitC(self)




    def c(self):

        localctx = tmpParser.CContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_c)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 17
            self.terminal_3()
            self.state = 18
            self.terminal_4()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class Cnf_startContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def b(self):
            return self.getTypedRuleContext(tmpParser.BContext,0)


        def c(self):
            return self.getTypedRuleContext(tmpParser.CContext,0)


        def getRuleIndex(self):
            return tmpParser.RULE_cnf_start

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterCnf_start" ):
                listener.enterCnf_start(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitCnf_start" ):
                listener.exitCnf_start(self)




    def cnf_start(self):

        localctx = tmpParser.Cnf_startContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_cnf_start)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 20
            self.b()
            self.state = 21
            self.c()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class Terminal_1Context(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def CNF_TERM_0(self):
            return self.getToken(tmpParser.CNF_TERM_0, 0)

        def getRuleIndex(self):
            return tmpParser.RULE_terminal_1

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTerminal_1" ):
                listener.enterTerminal_1(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTerminal_1" ):
                listener.exitTerminal_1(self)




    def terminal_1(self):

        localctx = tmpParser.Terminal_1Context(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_terminal_1)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 23
            self.match(tmpParser.CNF_TERM_0)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class Terminal_2Context(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def CNF_TERM_1(self):
            return self.getToken(tmpParser.CNF_TERM_1, 0)

        def getRuleIndex(self):
            return tmpParser.RULE_terminal_2

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTerminal_2" ):
                listener.enterTerminal_2(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTerminal_2" ):
                listener.exitTerminal_2(self)




    def terminal_2(self):

        localctx = tmpParser.Terminal_2Context(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_terminal_2)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 25
            self.match(tmpParser.CNF_TERM_1)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class Terminal_3Context(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def CNF_TERM_2(self):
            return self.getToken(tmpParser.CNF_TERM_2, 0)

        def getRuleIndex(self):
            return tmpParser.RULE_terminal_3

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTerminal_3" ):
                listener.enterTerminal_3(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTerminal_3" ):
                listener.exitTerminal_3(self)




    def terminal_3(self):

        localctx = tmpParser.Terminal_3Context(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_terminal_3)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 27
            self.match(tmpParser.CNF_TERM_2)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class Terminal_4Context(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def CNF_TERM_3(self):
            return self.getToken(tmpParser.CNF_TERM_3, 0)

        def getRuleIndex(self):
            return tmpParser.RULE_terminal_4

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTerminal_4" ):
                listener.enterTerminal_4(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTerminal_4" ):
                listener.exitTerminal_4(self)




    def terminal_4(self):

        localctx = tmpParser.Terminal_4Context(self, self._ctx, self.state)
        self.enterRule(localctx, 12, self.RULE_terminal_4)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 29
            self.match(tmpParser.CNF_TERM_3)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





