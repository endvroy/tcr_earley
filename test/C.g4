/*
 [The "BSD licence"]
 Copyright (c) 2013 Sam Harwell
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/** C 2011 grammar built from the C11 Spec */
lexer grammar C;


abstractDeclarator
  : lexer_rule_61 directDeclarator_suffix_1
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | lexer_rule_68 pointer_bin_1
  | Star
  | Caret
  | declarator_suffix_1 abstractDeclarator_bin_1
  | directAbstractDeclarator abstractDeclarator_suffix_2
  | lexer_rule_45 directAbstractDeclarator_bin_2
  | lexer_rule_47 directDeclarator_bin_3
  | lexer_rule_47 directDeclarator_bin_7
  | lexer_rule_47 directDeclarator_bin_11
  | lexer_rule_47 directDeclarator_bin_13
  | lexer_rule_45 directAbstractDeclarator_bin_13
  | directAbstractDeclarator directDeclarator_bin_4
  | directAbstractDeclarator directDeclarator_bin_8
  | directAbstractDeclarator directDeclarator_bin_12
  | directAbstractDeclarator directAbstractDeclarator_bin_26
  | directAbstractDeclarator directAbstractDeclarator_bin_29
  ;

abstractDeclarator_bin_1
  : directAbstractDeclarator abstractDeclarator_suffix_2
  | lexer_rule_45 directAbstractDeclarator_bin_2
  | lexer_rule_47 directDeclarator_bin_3
  | lexer_rule_47 directDeclarator_bin_7
  | lexer_rule_47 directDeclarator_bin_11
  | lexer_rule_47 directDeclarator_bin_13
  | lexer_rule_45 directAbstractDeclarator_bin_13
  | directAbstractDeclarator directDeclarator_bin_4
  | directAbstractDeclarator directDeclarator_bin_8
  | directAbstractDeclarator directDeclarator_bin_12
  | directAbstractDeclarator directAbstractDeclarator_bin_26
  | directAbstractDeclarator directAbstractDeclarator_bin_29
  ;

abstractDeclarator_suffix_2
  : gccDeclaratorExtension abstractDeclarator_suffix_2
  | asmName gccDeclaratorExtension_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

additiveExpression
  : multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  ;

additiveExpression_bin_1
  : lexer_rule_57 multiplicativeExpression
  ;

additiveExpression_bin_2
  : lexer_rule_59 multiplicativeExpression
  ;

andExpression
  : equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | andExpression andExpression_bin_1
  ;

andExpression_bin_1
  : lexer_rule_64 equalityExpression
  ;

argumentExpressionList_block_1
  : lexer_rule_74 assignmentExpression
  ;

argumentExpressionList_suffix_2
  : argumentExpressionList_block_1 argumentExpressionList_suffix_2
  | lexer_rule_74 assignmentExpression
  ;

asmName
  : CNF_TERM_20
  | CNF_TERM_1
  | CNF_TERM_2
  ;

assignmentExpression
  : primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | unaryExpression assignmentExpression_bin_1
  ;

assignmentExpression_bin_1
  : assignmentOperator assignmentExpression
  ;

assignmentOperator
  : Assign
  | StarAssign
  | DivAssign
  | ModAssign
  | PlusAssign
  | MinusAssign
  | LeftShiftAssign
  | RightShiftAssign
  | AndAssign
  | XorAssign
  | OrAssign
  ;

blockItem
  : declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  | asmName statement_bin_6
  | lexer_rule_93 labeledStatement_bin_1
  | lexer_rule_3 labeledStatement_bin_3
  | lexer_rule_7 labeledStatement_bin_1
  | lexer_rule_49 compoundStatement_bin_1
  | conditionalExpression_suffix_2 lexer_rule_73
  | lexer_rule_16 selectionStatement_bin_4
  | lexer_rule_28 selectionStatement_bin_7
  | lexer_rule_34 selectionStatement_bin_7
  | lexer_rule_8 iterationStatement_bin_8
  | lexer_rule_14 iterationStatement_bin_15
  | lexer_rule_14 iterationStatement_bin_21
  | lexer_rule_15 jumpStatement_bin_1
  | lexer_rule_6 lexer_rule_73
  | lexer_rule_2 lexer_rule_73
  | lexer_rule_22 expressionStatement
  | lexer_rule_15 jumpStatement_bin_3
  | Semi
  | functionDefinition_suffix_1 functionDefinition_bin_2
  | declarator functionDefinition_bin_1
  ;

blockItemList
  : declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | asmName statement_bin_6
  | functionDefinition_suffix_1 functionDefinition_bin_2
  | lexer_rule_43 staticAssertDeclaration_bin_5
  | lexer_rule_93 labeledStatement_bin_1
  | lexer_rule_3 labeledStatement_bin_3
  | lexer_rule_7 labeledStatement_bin_1
  | lexer_rule_49 compoundStatement_bin_1
  | conditionalExpression_suffix_2 lexer_rule_73
  | lexer_rule_16 selectionStatement_bin_4
  | lexer_rule_28 selectionStatement_bin_7
  | lexer_rule_34 selectionStatement_bin_7
  | lexer_rule_8 iterationStatement_bin_8
  | lexer_rule_14 iterationStatement_bin_15
  | lexer_rule_14 iterationStatement_bin_21
  | lexer_rule_15 jumpStatement_bin_1
  | lexer_rule_6 lexer_rule_73
  | lexer_rule_2 lexer_rule_73
  | lexer_rule_22 expressionStatement
  | lexer_rule_15 jumpStatement_bin_3
  | declarator functionDefinition_bin_1
  | Semi
  | blockItemList blockItem
  ;

castExpression
  : lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_2
  | lexer_rule_45 castExpression_bin_5
  ;

castExpression_bin_1
  : lexer_rule_46 castExpression
  ;

castExpression_bin_2
  : typeName castExpression_bin_1
  ;

castExpression_bin_3
  : lexer_rule_45 castExpression_bin_2
  ;

castExpression_bin_4
  : lexer_rule_46 initializer
  ;

castExpression_bin_5
  : typeName castExpression_bin_4
  ;

cnf_start
  : compilationUnit_suffix_1 lexer_rule_105
  | EOF
  ;

compilationUnit_suffix_1
  : translationUnit externalDeclaration
  | asmName externalDeclaration_bin_3
  | IncludeDirective
  | PragmaDirective
  | functionDefinition_suffix_1 functionDefinition_bin_2
  | declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | Semi
  | declarator functionDefinition_bin_1
  | lexer_rule_43 staticAssertDeclaration_bin_5
  ;

compoundStatement
  : lexer_rule_49 compoundStatement_bin_1
  ;

compoundStatement_bin_1
  : compoundStatement_suffix_1 lexer_rule_50
  | RightBrace
  ;

compoundStatement_suffix_1
  : blockItemList blockItem
  | declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | asmName statement_bin_6
  | functionDefinition_suffix_1 functionDefinition_bin_2
  | lexer_rule_43 staticAssertDeclaration_bin_5
  | lexer_rule_93 labeledStatement_bin_1
  | lexer_rule_3 labeledStatement_bin_3
  | lexer_rule_7 labeledStatement_bin_1
  | lexer_rule_49 compoundStatement_bin_1
  | conditionalExpression_suffix_2 lexer_rule_73
  | lexer_rule_16 selectionStatement_bin_4
  | lexer_rule_28 selectionStatement_bin_7
  | lexer_rule_34 selectionStatement_bin_7
  | lexer_rule_8 iterationStatement_bin_8
  | lexer_rule_14 iterationStatement_bin_15
  | lexer_rule_14 iterationStatement_bin_21
  | lexer_rule_15 jumpStatement_bin_1
  | lexer_rule_6 lexer_rule_73
  | lexer_rule_2 lexer_rule_73
  | lexer_rule_22 expressionStatement
  | lexer_rule_15 jumpStatement_bin_3
  | declarator functionDefinition_bin_1
  | Semi
  ;

conditionalExpression
  : primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

conditionalExpression_bin_1
  : logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

conditionalExpression_block_3_bin_1
  : lexer_rule_72 conditionalExpression
  ;

conditionalExpression_block_3_bin_2
  : conditionalExpression_suffix_2 conditionalExpression_block_3_bin_1
  | lexer_rule_72 conditionalExpression
  ;

conditionalExpression_suffix_2
  : expression argumentExpressionList_block_1
  | unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

conditionalExpression_suffix_4
  : lexer_rule_71 conditionalExpression_block_3_bin_2
  ;

constantExpression
  : primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

declaration
  : declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  ;

declarationList
  : declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  | declarationList declaration
  ;

declarationSpecifier
  : Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_15 functionSpecifier_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  ;

declarationSpecifier_suffix_1
  : pointer declarationSpecifier_suffix_1
  | lexer_rule_61 directDeclarator_suffix_1
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | lexer_rule_68 pointer_bin_1
  | Star
  | Caret
  ;

declarationSpecifiers
  : declarationSpecifiers_suffix_1 declarationSpecifiers_bin_2
  | typeSpecifier declarationSpecifiers_bin_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  ;

declarationSpecifiers2
  : declarationSpecifier declarationSpecifiers2_suffix_1
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

declarationSpecifiers2_suffix_1
  : declarationSpecifier declarationSpecifiers2_suffix_1
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

declarationSpecifiers_bin_1
  : declarationSpecifiers_suffix_2 declarationSpecifiers_suffix_3
  | pointer declarationSpecifiers_suffix_2
  | lexer_rule_61 directDeclarator_suffix_1
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | lexer_rule_68 pointer_bin_1
  | Star
  | Caret
  | declarationSpecifier declarationSpecifiers_suffix_3
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

declarationSpecifiers_bin_2
  : typeSpecifier declarationSpecifiers_bin_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  ;

declarationSpecifiers_suffix_1
  : declarationSpecifier declarationSpecifiers_suffix_1
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

declarationSpecifiers_suffix_2
  : pointer declarationSpecifiers_suffix_2
  | lexer_rule_61 directDeclarator_suffix_1
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | lexer_rule_68 pointer_bin_1
  | Star
  | Caret
  ;

declarationSpecifiers_suffix_3
  : declarationSpecifier declarationSpecifiers_suffix_3
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

declaration_bin_1
  : initDeclaratorList lexer_rule_73
  ;

declarator
  : declarator_suffix_1 declarator_bin_1
  | directDeclarator declarator_suffix_2
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  | Identifier
  ;

declarator_bin_1
  : directDeclarator declarator_suffix_2
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  | Identifier
  ;

declarator_suffix_1
  : lexer_rule_61 directDeclarator_suffix_1
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | lexer_rule_68 pointer_bin_1
  | Star
  | Caret
  ;

declarator_suffix_2
  : gccDeclaratorExtension declarator_suffix_2
  | asmName gccDeclaratorExtension_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

designator
  : lexer_rule_47 designator_bin_2
  | lexer_rule_89 lexer_rule_93
  ;

designatorList
  : lexer_rule_47 designator_bin_2
  | lexer_rule_89 lexer_rule_93
  | designatorList designator
  ;

designator_bin_1
  : designator_suffix_2 lexer_rule_48
  | RightBracket
  ;

designator_bin_2
  : constantExpression designator_bin_1
  ;

designator_suffix_2
  : lexer_rule_90 constantExpression
  ;

directAbstractDeclarator
  : lexer_rule_45 directAbstractDeclarator_bin_2
  | lexer_rule_47 directDeclarator_bin_3
  | lexer_rule_47 directDeclarator_bin_7
  | lexer_rule_47 directDeclarator_bin_11
  | lexer_rule_47 directDeclarator_bin_13
  | lexer_rule_45 directAbstractDeclarator_bin_13
  | directAbstractDeclarator directDeclarator_bin_4
  | directAbstractDeclarator directDeclarator_bin_8
  | directAbstractDeclarator directDeclarator_bin_12
  | directAbstractDeclarator directAbstractDeclarator_bin_26
  | directAbstractDeclarator directAbstractDeclarator_bin_29
  ;

directAbstractDeclarator_bin_1
  : lexer_rule_46 directAbstractDeclarator_suffix_1
  | RightParen
  ;

directAbstractDeclarator_bin_12
  : lexer_rule_46 directAbstractDeclarator_suffix_6
  | RightParen
  ;

directAbstractDeclarator_bin_13
  : directAbstractDeclarator_suffix_5 directAbstractDeclarator_bin_12
  | lexer_rule_46 directAbstractDeclarator_suffix_6
  | RightParen
  ;

directAbstractDeclarator_bin_2
  : abstractDeclarator directAbstractDeclarator_bin_1
  ;

directAbstractDeclarator_bin_26
  : lexer_rule_47 directDeclarator_bin_13
  ;

directAbstractDeclarator_bin_27
  : lexer_rule_46 directAbstractDeclarator_suffix_11
  | RightParen
  ;

directAbstractDeclarator_bin_28
  : directAbstractDeclarator_suffix_5 directAbstractDeclarator_bin_27
  | lexer_rule_46 directAbstractDeclarator_suffix_11
  | RightParen
  ;

directAbstractDeclarator_bin_29
  : lexer_rule_45 directAbstractDeclarator_bin_28
  ;

directAbstractDeclarator_suffix_1
  : gccDeclaratorExtension directAbstractDeclarator_suffix_1
  | asmName gccDeclaratorExtension_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

directAbstractDeclarator_suffix_11
  : gccDeclaratorExtension directAbstractDeclarator_suffix_11
  | asmName gccDeclaratorExtension_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

directAbstractDeclarator_suffix_5
  : parameterList parameterTypeList_bin_1
  | parameterDeclaration parameterList_suffix_2
  | declarationSpecifiers declarator
  | declarationSpecifiers2 parameterDeclaration_suffix_1
  | declarationSpecifier declarationSpecifiers2_suffix_1
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

directAbstractDeclarator_suffix_6
  : gccDeclaratorExtension directAbstractDeclarator_suffix_6
  | asmName gccDeclaratorExtension_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

directDeclarator
  : Identifier
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  ;

directDeclarator_bin_1
  : declarator lexer_rule_46
  ;

directDeclarator_bin_10
  : lexer_rule_26 directDeclarator_bin_5
  ;

directDeclarator_bin_11
  : typeQualifierList directDeclarator_bin_10
  ;

directDeclarator_bin_12
  : lexer_rule_47 directDeclarator_bin_11
  ;

directDeclarator_bin_13
  : lexer_rule_61 lexer_rule_48
  ;

directDeclarator_bin_14
  : directDeclarator_suffix_1 directDeclarator_bin_13
  | lexer_rule_61 lexer_rule_48
  ;

directDeclarator_bin_15
  : lexer_rule_47 directDeclarator_bin_14
  ;

directDeclarator_bin_16
  : parameterTypeList lexer_rule_46
  ;

directDeclarator_bin_17
  : lexer_rule_45 directDeclarator_bin_16
  ;

directDeclarator_bin_18
  : directDeclarator_suffix_5 lexer_rule_46
  | RightParen
  ;

directDeclarator_bin_19
  : lexer_rule_45 directDeclarator_bin_18
  ;

directDeclarator_bin_2
  : directDeclarator_suffix_2 lexer_rule_48
  | RightBracket
  ;

directDeclarator_bin_3
  : directDeclarator_suffix_1 directDeclarator_bin_2
  | directDeclarator_suffix_2 lexer_rule_48
  | RightBracket
  ;

directDeclarator_bin_4
  : lexer_rule_47 directDeclarator_bin_3
  ;

directDeclarator_bin_5
  : assignmentExpression lexer_rule_48
  ;

directDeclarator_bin_6
  : directDeclarator_suffix_1 directDeclarator_bin_5
  | assignmentExpression lexer_rule_48
  ;

directDeclarator_bin_7
  : lexer_rule_26 directDeclarator_bin_6
  ;

directDeclarator_bin_8
  : lexer_rule_47 directDeclarator_bin_7
  ;

directDeclarator_suffix_1
  : typeQualifierList typeQualifier
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  ;

directDeclarator_suffix_2
  : unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

directDeclarator_suffix_5
  : lexer_rule_93 identifierList_suffix_2
  | Identifier
  ;

enumSpecifier_bin_1
  : enumeratorList lexer_rule_50
  ;

enumSpecifier_bin_2
  : lexer_rule_49 enumSpecifier_bin_1
  ;

enumSpecifier_bin_3
  : structOrUnionSpecifier_suffix_2 enumSpecifier_bin_2
  | lexer_rule_49 enumSpecifier_bin_1
  ;

enumSpecifier_bin_5
  : enumeratorList postfixExpression_bin_11
  ;

enumSpecifier_bin_6
  : lexer_rule_49 enumSpecifier_bin_5
  ;

enumSpecifier_bin_7
  : structOrUnionSpecifier_suffix_2 enumSpecifier_bin_6
  | lexer_rule_49 enumSpecifier_bin_5
  ;

enumerationConstant
  : Identifier
  ;

enumerator
  : Identifier
  | enumerationConstant enumerator_bin_1
  ;

enumeratorList
  : enumerator enumeratorList_suffix_2
  | enumerationConstant enumerator_bin_1
  | Identifier
  ;

enumeratorList_block_1
  : lexer_rule_74 enumerator
  ;

enumeratorList_suffix_2
  : enumeratorList_block_1 enumeratorList_suffix_2
  | lexer_rule_74 enumerator
  ;

enumerator_bin_1
  : lexer_rule_75 constantExpression
  ;

equalityExpression
  : relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  ;

equalityExpression_bin_1
  : lexer_rule_86 relationalExpression
  ;

equalityExpression_bin_2
  : lexer_rule_87 relationalExpression
  ;

exclusiveOrExpression
  : andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  ;

exclusiveOrExpression_bin_1
  : lexer_rule_68 andExpression
  ;

expression
  : unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | expression argumentExpressionList_block_1
  ;

expressionStatement
  : conditionalExpression_suffix_2 lexer_rule_73
  | Semi
  ;

externalDeclaration
  : IncludeDirective
  | PragmaDirective
  | functionDefinition_suffix_1 functionDefinition_bin_2
  | declarator functionDefinition_bin_1
  | declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  | asmName externalDeclaration_bin_3
  | Semi
  ;

externalDeclaration_bin_2
  : externalDeclaration_suffix_1 staticAssertDeclaration_bin_1
  ;

externalDeclaration_bin_3
  : lexer_rule_45 externalDeclaration_bin_2
  ;

externalDeclaration_suffix_1
  : lexer_rule_95 externalDeclaration_suffix_1
  | StringLiteral
  ;

functionDefinition_bin_1
  : functionDefinition_suffix_2 compoundStatement
  | lexer_rule_49 compoundStatement_bin_1
  ;

functionDefinition_bin_2
  : declarator functionDefinition_bin_1
  ;

functionDefinition_suffix_1
  : declarationSpecifiers_suffix_1 declarationSpecifiers_bin_2
  | typeSpecifier declarationSpecifiers_bin_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  ;

functionDefinition_suffix_2
  : declarationList declaration
  | declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  ;

functionSpecifier_bin_1
  : lexer_rule_93 lexer_rule_46
  ;

functionSpecifier_bin_2
  : lexer_rule_45 functionSpecifier_bin_1
  ;

gccAttribute
  : terminal_18 gccAttribute_suffix_3
  | CNF_TERM_22
  ;

gccAttributeList
  : gccAttribute gccAttributeList_suffix_2
  | terminal_18 gccAttribute_suffix_3
  | CNF_TERM_22
  | gccAttributeList_block_1 gccAttributeList_suffix_2
  | lexer_rule_74 gccAttribute
  | Comma
  ;

gccAttributeList_block_1
  : lexer_rule_74 gccAttribute
  | Comma
  ;

gccAttributeList_suffix_2
  : gccAttributeList_block_1 gccAttributeList_suffix_2
  | lexer_rule_74 gccAttribute
  | Comma
  ;

gccAttributeSpecifier_bin_1
  : lexer_rule_46 lexer_rule_46
  ;

gccAttributeSpecifier_bin_2
  : gccAttributeList gccAttributeSpecifier_bin_1
  | lexer_rule_46 lexer_rule_46
  ;

gccAttributeSpecifier_bin_3
  : lexer_rule_45 gccAttributeSpecifier_bin_2
  ;

gccAttributeSpecifier_bin_4
  : lexer_rule_45 gccAttributeSpecifier_bin_3
  ;

gccAttribute_suffix_3
  : lexer_rule_45 postfixExpression_bin_3
  ;

gccDeclaratorExtension
  : asmName gccDeclaratorExtension_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

gccDeclaratorExtension_bin_1
  : gccDeclaratorExtension_suffix_1 lexer_rule_46
  ;

gccDeclaratorExtension_bin_2
  : lexer_rule_45 gccDeclaratorExtension_bin_1
  ;

gccDeclaratorExtension_suffix_1
  : lexer_rule_95 gccDeclaratorExtension_suffix_1
  | StringLiteral
  ;

genericAssocList
  : genericAssociation genericAssocList_suffix_2
  | typeName genericAssociation_bin_1
  | lexer_rule_7 genericAssociation_bin_1
  ;

genericAssocList_block_1
  : lexer_rule_74 genericAssociation
  ;

genericAssocList_suffix_2
  : genericAssocList_block_1 genericAssocList_suffix_2
  | lexer_rule_74 genericAssociation
  ;

genericAssociation
  : typeName genericAssociation_bin_1
  | lexer_rule_7 genericAssociation_bin_1
  ;

genericAssociation_bin_1
  : lexer_rule_72 assignmentExpression
  ;

genericSelection_bin_1
  : genericAssocList lexer_rule_46
  ;

genericSelection_bin_2
  : lexer_rule_74 genericSelection_bin_1
  ;

genericSelection_bin_3
  : assignmentExpression genericSelection_bin_2
  ;

genericSelection_bin_4
  : lexer_rule_45 genericSelection_bin_3
  ;

identifierList_block_1
  : lexer_rule_74 lexer_rule_93
  ;

identifierList_suffix_2
  : identifierList_block_1 identifierList_suffix_2
  | lexer_rule_74 lexer_rule_93
  ;

inclusiveOrExpression
  : exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  ;

inclusiveOrExpression_bin_1
  : lexer_rule_65 exclusiveOrExpression
  ;

initDeclarator
  : declarator_suffix_1 declarator_bin_1
  | directDeclarator declarator_suffix_2
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  | Identifier
  | declarator initDeclarator_bin_1
  ;

initDeclaratorList
  : initDeclarator initDeclaratorList_suffix_2
  | declarator initDeclarator_bin_1
  | declarator_suffix_1 declarator_bin_1
  | directDeclarator declarator_suffix_2
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  | Identifier
  ;

initDeclaratorList_block_1
  : lexer_rule_74 initDeclarator
  ;

initDeclaratorList_suffix_2
  : initDeclaratorList_block_1 initDeclaratorList_suffix_2
  | lexer_rule_74 initDeclarator
  ;

initDeclarator_bin_1
  : lexer_rule_75 initializer
  ;

initializer
  : unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | lexer_rule_49 initializer_bin_1
  ;

initializerList
  : initializerList_suffix_1 initializerList_bin_1
  | initializer initializerList_suffix_4
  | lexer_rule_49 initializer_bin_1
  | unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

initializerList_bin_1
  : initializer initializerList_suffix_4
  | lexer_rule_49 initializer_bin_1
  | unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

initializerList_block_3
  : lexer_rule_74 initializerList_block_3_bin_1
  ;

initializerList_block_3_bin_1
  : initializerList_suffix_1 initializer
  | lexer_rule_49 initializer_bin_1
  | unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

initializerList_suffix_1
  : designatorList lexer_rule_75
  | lexer_rule_93 lexer_rule_72
  ;

initializerList_suffix_4
  : initializerList_block_3 initializerList_suffix_4
  | lexer_rule_74 initializerList_block_3_bin_1
  ;

initializer_bin_1
  : initializer_suffix_3 lexer_rule_50
  | RightBrace
  ;

initializer_suffix_1
  : Comma
  ;

initializer_suffix_3
  : initializerList initializer_suffix_1
  | initializerList_suffix_1 initializerList_bin_1
  | initializer initializerList_suffix_4
  | lexer_rule_49 initializer_bin_1
  | unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

iterationStatement_bin_10
  : conditionalExpression_suffix_2 selectionStatement_bin_5
  | lexer_rule_46 statement
  ;

iterationStatement_bin_11
  : lexer_rule_73 iterationStatement_bin_10
  ;

iterationStatement_bin_12
  : conditionalExpression_suffix_2 iterationStatement_bin_11
  | lexer_rule_73 iterationStatement_bin_10
  ;

iterationStatement_bin_13
  : lexer_rule_73 iterationStatement_bin_12
  ;

iterationStatement_bin_14
  : conditionalExpression_suffix_2 iterationStatement_bin_13
  | lexer_rule_73 iterationStatement_bin_12
  ;

iterationStatement_bin_15
  : lexer_rule_45 iterationStatement_bin_14
  ;

iterationStatement_bin_20
  : declaration iterationStatement_bin_12
  ;

iterationStatement_bin_21
  : lexer_rule_45 iterationStatement_bin_20
  ;

iterationStatement_bin_5
  : expression staticAssertDeclaration_bin_1
  ;

iterationStatement_bin_6
  : lexer_rule_45 iterationStatement_bin_5
  ;

iterationStatement_bin_7
  : lexer_rule_34 iterationStatement_bin_6
  ;

iterationStatement_bin_8
  : statement iterationStatement_bin_7
  ;

jumpStatement_bin_1
  : lexer_rule_93 lexer_rule_73
  ;

jumpStatement_bin_3
  : unaryExpression lexer_rule_73
  ;

labeledStatement_bin_1
  : lexer_rule_72 statement
  ;

labeledStatement_bin_3
  : constantExpression labeledStatement_bin_1
  ;

lexer_rule_10
  : Else
  ;

lexer_rule_105
  : EOF
  ;

lexer_rule_11
  : Enum
  ;

lexer_rule_14
  : For
  ;

lexer_rule_15
  : Goto
  ;

lexer_rule_16
  : If
  ;

lexer_rule_2
  : Break
  ;

lexer_rule_22
  : Return
  ;

lexer_rule_25
  : Sizeof
  ;

lexer_rule_26
  : Static
  ;

lexer_rule_28
  : Switch
  ;

lexer_rule_3
  : Case
  ;

lexer_rule_34
  : While
  ;

lexer_rule_35
  : Alignas
  ;

lexer_rule_37
  : Atomic
  ;

lexer_rule_40
  : Generic
  ;

lexer_rule_43
  : StaticAssert
  ;

lexer_rule_45
  : LeftParen
  ;

lexer_rule_46
  : RightParen
  ;

lexer_rule_47
  : LeftBracket
  ;

lexer_rule_48
  : RightBracket
  ;

lexer_rule_49
  : LeftBrace
  ;

lexer_rule_50
  : RightBrace
  ;

lexer_rule_51
  : Less
  ;

lexer_rule_52
  : LessEqual
  ;

lexer_rule_53
  : Greater
  ;

lexer_rule_54
  : GreaterEqual
  ;

lexer_rule_55
  : LeftShift
  ;

lexer_rule_56
  : RightShift
  ;

lexer_rule_57
  : Plus
  ;

lexer_rule_58
  : PlusPlus
  ;

lexer_rule_59
  : Minus
  ;

lexer_rule_6
  : Continue
  ;

lexer_rule_60
  : MinusMinus
  ;

lexer_rule_61
  : Star
  ;

lexer_rule_62
  : Div
  ;

lexer_rule_63
  : Mod
  ;

lexer_rule_64
  : And
  ;

lexer_rule_65
  : Or
  ;

lexer_rule_66
  : AndAnd
  ;

lexer_rule_67
  : OrOr
  ;

lexer_rule_68
  : Caret
  ;

lexer_rule_7
  : Default
  ;

lexer_rule_71
  : Question
  ;

lexer_rule_72
  : Colon
  ;

lexer_rule_73
  : Semi
  ;

lexer_rule_74
  : Comma
  ;

lexer_rule_75
  : Assign
  ;

lexer_rule_8
  : Do
  ;

lexer_rule_86
  : Equal
  ;

lexer_rule_87
  : NotEqual
  ;

lexer_rule_88
  : Arrow
  ;

lexer_rule_89
  : Dot
  ;

lexer_rule_90
  : Ellipsis
  ;

lexer_rule_93
  : Identifier
  ;

lexer_rule_95
  : StringLiteral
  ;

logicalAndExpression
  : inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | logicalAndExpression logicalAndExpression_bin_1
  ;

logicalAndExpression_bin_1
  : lexer_rule_66 inclusiveOrExpression
  ;

logicalOrExpression
  : logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | logicalOrExpression logicalOrExpression_bin_1
  ;

logicalOrExpression_bin_1
  : lexer_rule_67 logicalAndExpression
  ;

multiplicativeExpression
  : primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  ;

multiplicativeExpression_bin_1
  : lexer_rule_61 castExpression
  ;

multiplicativeExpression_bin_2
  : lexer_rule_62 castExpression
  ;

multiplicativeExpression_bin_3
  : lexer_rule_63 castExpression
  ;

parameterDeclaration
  : declarationSpecifiers declarator
  | declarationSpecifiers2 parameterDeclaration_suffix_1
  | declarationSpecifier declarationSpecifiers2_suffix_1
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

parameterDeclaration_suffix_1
  : declarator_suffix_1 abstractDeclarator_bin_1
  | lexer_rule_61 directDeclarator_suffix_1
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | lexer_rule_68 pointer_bin_1
  | directAbstractDeclarator abstractDeclarator_suffix_2
  | Star
  | Caret
  | lexer_rule_45 directAbstractDeclarator_bin_2
  | lexer_rule_47 directDeclarator_bin_3
  | lexer_rule_47 directDeclarator_bin_7
  | lexer_rule_47 directDeclarator_bin_11
  | lexer_rule_47 directDeclarator_bin_13
  | lexer_rule_45 directAbstractDeclarator_bin_13
  | directAbstractDeclarator directDeclarator_bin_4
  | directAbstractDeclarator directDeclarator_bin_8
  | directAbstractDeclarator directDeclarator_bin_12
  | directAbstractDeclarator directAbstractDeclarator_bin_26
  | directAbstractDeclarator directAbstractDeclarator_bin_29
  ;

parameterList
  : parameterDeclaration parameterList_suffix_2
  | declarationSpecifiers declarator
  | declarationSpecifiers2 parameterDeclaration_suffix_1
  | declarationSpecifier declarationSpecifiers2_suffix_1
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  ;

parameterList_block_1
  : lexer_rule_74 parameterDeclaration
  ;

parameterList_suffix_2
  : parameterList_block_1 parameterList_suffix_2
  | lexer_rule_74 parameterDeclaration
  ;

parameterTypeList
  : parameterDeclaration parameterList_suffix_2
  | declarationSpecifiers declarator
  | declarationSpecifiers2 parameterDeclaration_suffix_1
  | declarationSpecifier declarationSpecifiers2_suffix_1
  | typeSpecifier declarationSpecifier_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | terminal_15 functionSpecifier_bin_2
  | lexer_rule_35 unaryExpression_bin_2
  | lexer_rule_35 typeSpecifier_bin_4
  | Typedef
  | Extern
  | Static
  | ThreadLocal
  | Auto
  | Register
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | Inline
  | Noreturn
  | CNF_TERM_11
  | CNF_TERM_10
  | CNF_TERM_16
  | parameterList parameterTypeList_bin_1
  ;

parameterTypeList_bin_1
  : lexer_rule_74 lexer_rule_90
  ;

pointer
  : lexer_rule_61 directDeclarator_suffix_1
  | Star
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | Caret
  | lexer_rule_68 pointer_bin_1
  ;

pointer_bin_1
  : directDeclarator_suffix_1 pointer
  | lexer_rule_61 directDeclarator_suffix_1
  | lexer_rule_61 pointer_bin_1
  | lexer_rule_68 directDeclarator_suffix_1
  | lexer_rule_68 pointer_bin_1
  | Star
  | Caret
  ;

postfixExpression
  : lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  ;

postfixExpression_bin_1
  : expression lexer_rule_48
  ;

postfixExpression_bin_10
  : typeName postfixExpression_bin_9
  ;

postfixExpression_bin_11
  : lexer_rule_74 lexer_rule_50
  ;

postfixExpression_bin_12
  : initializerList postfixExpression_bin_11
  ;

postfixExpression_bin_13
  : lexer_rule_49 postfixExpression_bin_12
  ;

postfixExpression_bin_14
  : lexer_rule_46 postfixExpression_bin_13
  ;

postfixExpression_bin_15
  : typeName postfixExpression_bin_14
  ;

postfixExpression_bin_2
  : lexer_rule_47 postfixExpression_bin_1
  ;

postfixExpression_bin_20
  : lexer_rule_45 postfixExpression_bin_10
  ;

postfixExpression_bin_26
  : lexer_rule_45 postfixExpression_bin_15
  ;

postfixExpression_bin_3
  : postfixExpression_suffix_1 lexer_rule_46
  | RightParen
  ;

postfixExpression_bin_4
  : lexer_rule_45 postfixExpression_bin_3
  ;

postfixExpression_bin_5
  : lexer_rule_89 lexer_rule_93
  ;

postfixExpression_bin_6
  : lexer_rule_88 lexer_rule_93
  ;

postfixExpression_bin_7
  : initializerList lexer_rule_50
  ;

postfixExpression_bin_8
  : lexer_rule_49 postfixExpression_bin_7
  ;

postfixExpression_bin_9
  : lexer_rule_46 postfixExpression_bin_8
  ;

postfixExpression_suffix_1
  : assignmentExpression argumentExpressionList_suffix_2
  | unaryExpression assignmentExpression_bin_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

primaryExpression_bin_1
  : expression lexer_rule_46
  ;

primaryExpression_bin_10
  : typeName primaryExpression_bin_9
  ;

primaryExpression_bin_11
  : lexer_rule_45 primaryExpression_bin_10
  ;

primaryExpression_bin_2
  : compoundStatement lexer_rule_46
  ;

primaryExpression_bin_3
  : lexer_rule_45 primaryExpression_bin_2
  ;

primaryExpression_bin_4
  : typeName lexer_rule_46
  ;

primaryExpression_bin_5
  : lexer_rule_74 primaryExpression_bin_4
  ;

primaryExpression_bin_6
  : unaryExpression primaryExpression_bin_5
  ;

primaryExpression_bin_7
  : lexer_rule_45 primaryExpression_bin_6
  ;

primaryExpression_bin_8
  : unaryExpression lexer_rule_46
  ;

primaryExpression_bin_9
  : lexer_rule_74 primaryExpression_bin_8
  ;

primaryExpression_suffix_1
  : lexer_rule_95 primaryExpression_suffix_1
  | StringLiteral
  ;

primaryExpression_suffix_2
  : CNF_TERM_9
  ;

relationalExpression
  : shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  ;

relationalExpression_bin_1
  : lexer_rule_51 shiftExpression
  ;

relationalExpression_bin_2
  : lexer_rule_53 shiftExpression
  ;

relationalExpression_bin_3
  : lexer_rule_52 shiftExpression
  ;

relationalExpression_bin_4
  : lexer_rule_54 shiftExpression
  ;

selectionStatement_bin_1
  : statement selectionStatement_suffix_2
  | asmName statement_bin_6
  | lexer_rule_93 labeledStatement_bin_1
  | lexer_rule_3 labeledStatement_bin_3
  | lexer_rule_7 labeledStatement_bin_1
  | lexer_rule_49 compoundStatement_bin_1
  | conditionalExpression_suffix_2 lexer_rule_73
  | lexer_rule_16 selectionStatement_bin_4
  | lexer_rule_28 selectionStatement_bin_7
  | lexer_rule_34 selectionStatement_bin_7
  | lexer_rule_8 iterationStatement_bin_8
  | lexer_rule_14 iterationStatement_bin_15
  | lexer_rule_14 iterationStatement_bin_21
  | lexer_rule_15 jumpStatement_bin_1
  | lexer_rule_6 lexer_rule_73
  | lexer_rule_2 lexer_rule_73
  | lexer_rule_22 expressionStatement
  | lexer_rule_15 jumpStatement_bin_3
  | Semi
  ;

selectionStatement_bin_2
  : lexer_rule_46 selectionStatement_bin_1
  ;

selectionStatement_bin_3
  : expression selectionStatement_bin_2
  ;

selectionStatement_bin_4
  : lexer_rule_45 selectionStatement_bin_3
  ;

selectionStatement_bin_5
  : lexer_rule_46 statement
  ;

selectionStatement_bin_6
  : expression selectionStatement_bin_5
  ;

selectionStatement_bin_7
  : lexer_rule_45 selectionStatement_bin_6
  ;

selectionStatement_suffix_2
  : lexer_rule_10 statement
  ;

shiftExpression
  : additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  ;

shiftExpression_bin_1
  : lexer_rule_55 additiveExpression
  ;

shiftExpression_bin_2
  : lexer_rule_56 additiveExpression
  ;

specifierQualifierList
  : typeSpecifier specifierQualifierList_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  | typeQualifier specifierQualifierList_suffix_1
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  ;

specifierQualifierList_suffix_1
  : typeSpecifier specifierQualifierList_suffix_1
  | typeQualifier specifierQualifierList_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  ;

statement
  : lexer_rule_93 labeledStatement_bin_1
  | lexer_rule_3 labeledStatement_bin_3
  | lexer_rule_7 labeledStatement_bin_1
  | lexer_rule_49 compoundStatement_bin_1
  | conditionalExpression_suffix_2 lexer_rule_73
  | Semi
  | lexer_rule_16 selectionStatement_bin_4
  | lexer_rule_28 selectionStatement_bin_7
  | lexer_rule_34 selectionStatement_bin_7
  | lexer_rule_8 iterationStatement_bin_8
  | lexer_rule_14 iterationStatement_bin_15
  | lexer_rule_14 iterationStatement_bin_21
  | lexer_rule_15 jumpStatement_bin_1
  | lexer_rule_6 lexer_rule_73
  | lexer_rule_2 lexer_rule_73
  | lexer_rule_22 expressionStatement
  | lexer_rule_15 jumpStatement_bin_3
  | asmName statement_bin_6
  ;

statement_bin_2
  : statement_suffix_13 staticAssertDeclaration_bin_1
  | lexer_rule_46 lexer_rule_73
  ;

statement_bin_3
  : statement_suffix_7 statement_bin_2
  | statement_suffix_13 staticAssertDeclaration_bin_1
  | lexer_rule_46 lexer_rule_73
  ;

statement_bin_4
  : lexer_rule_45 statement_bin_3
  ;

statement_bin_5
  : statement_suffix_3 statement_bin_4
  | lexer_rule_45 statement_bin_3
  ;

statement_bin_6
  : statement_suffix_2 statement_bin_5
  | statement_suffix_3 statement_bin_4
  | lexer_rule_45 statement_bin_3
  ;

statement_block_12
  : lexer_rule_72 statement_suffix_11
  | Colon
  ;

statement_block_4
  : lexer_rule_74 logicalOrExpression
  ;

statement_suffix_11
  : logicalOrExpression statement_suffix_9
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

statement_suffix_13
  : statement_block_12 statement_suffix_13
  | lexer_rule_72 statement_suffix_11
  | Colon
  ;

statement_suffix_2
  : Volatile
  | CNF_TERM_19
  ;

statement_suffix_3
  : Goto
  ;

statement_suffix_5
  : statement_block_4 statement_suffix_5
  | lexer_rule_74 logicalOrExpression
  ;

statement_suffix_7
  : logicalOrExpression statement_suffix_5
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

statement_suffix_9
  : statement_block_4 statement_suffix_9
  | lexer_rule_74 logicalOrExpression
  ;

staticAssertDeclaration_bin_1
  : lexer_rule_46 lexer_rule_73
  ;

staticAssertDeclaration_bin_2
  : staticAssertDeclaration_suffix_1 staticAssertDeclaration_bin_1
  ;

staticAssertDeclaration_bin_3
  : lexer_rule_74 staticAssertDeclaration_bin_2
  ;

staticAssertDeclaration_bin_4
  : constantExpression staticAssertDeclaration_bin_3
  ;

staticAssertDeclaration_bin_5
  : lexer_rule_45 staticAssertDeclaration_bin_4
  ;

staticAssertDeclaration_suffix_1
  : lexer_rule_95 staticAssertDeclaration_suffix_1
  | StringLiteral
  ;

structDeclaration
  : structDeclaration_suffix_1 structDeclaration_bin_2
  | specifierQualifierList structDeclaration_bin_1
  | structDeclaration_suffix_1 structDeclaration_bin_3
  | specifierQualifierList lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  ;

structDeclarationList
  : structDeclaration structDeclarationList_suffix_1
  | structDeclaration_suffix_1 structDeclaration_bin_2
  | structDeclaration_suffix_1 structDeclaration_bin_3
  | specifierQualifierList structDeclaration_bin_1
  | specifierQualifierList lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  ;

structDeclarationList_suffix_1
  : structDeclaration structDeclarationList_suffix_1
  | structDeclaration_suffix_1 structDeclaration_bin_2
  | structDeclaration_suffix_1 structDeclaration_bin_3
  | specifierQualifierList structDeclaration_bin_1
  | specifierQualifierList lexer_rule_73
  | lexer_rule_43 staticAssertDeclaration_bin_5
  ;

structDeclaration_bin_1
  : structDeclaratorList lexer_rule_73
  ;

structDeclaration_bin_2
  : specifierQualifierList structDeclaration_bin_1
  ;

structDeclaration_bin_3
  : specifierQualifierList lexer_rule_73
  ;

structDeclaration_suffix_1
  : asmName gccDeclaratorExtension_bin_2
  | terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

structDeclarator
  : declarator_suffix_1 declarator_bin_1
  | directDeclarator declarator_suffix_2
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  | Identifier
  | structDeclarator_suffix_1 structDeclarator_bin_2
  | lexer_rule_72 structDeclarator_bin_1
  ;

structDeclaratorList
  : structDeclarator structDeclaratorList_suffix_2
  | structDeclarator_suffix_1 structDeclarator_bin_2
  | declarator_suffix_1 declarator_bin_1
  | lexer_rule_72 structDeclarator_bin_1
  | directDeclarator declarator_suffix_2
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  | Identifier
  ;

structDeclaratorList_block_1
  : lexer_rule_74 structDeclarator
  ;

structDeclaratorList_suffix_2
  : structDeclaratorList_block_1 structDeclaratorList_suffix_2
  | lexer_rule_74 structDeclarator
  ;

structDeclarator_bin_1
  : constantExpression structOrUnionSpecifier_suffix_1
  | primaryExpression_suffix_2 conditionalExpression_bin_1
  | logicalOrExpression conditionalExpression_suffix_4
  | logicalOrExpression logicalOrExpression_bin_1
  | logicalAndExpression logicalAndExpression_bin_1
  | inclusiveOrExpression inclusiveOrExpression_bin_1
  | exclusiveOrExpression exclusiveOrExpression_bin_1
  | andExpression andExpression_bin_1
  | equalityExpression equalityExpression_bin_1
  | equalityExpression equalityExpression_bin_2
  | relationalExpression relationalExpression_bin_1
  | relationalExpression relationalExpression_bin_2
  | relationalExpression relationalExpression_bin_3
  | relationalExpression relationalExpression_bin_4
  | shiftExpression shiftExpression_bin_1
  | shiftExpression shiftExpression_bin_2
  | additiveExpression additiveExpression_bin_1
  | additiveExpression additiveExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_1
  | multiplicativeExpression multiplicativeExpression_bin_2
  | multiplicativeExpression multiplicativeExpression_bin_3
  | primaryExpression_suffix_2 castExpression_bin_3
  | lexer_rule_45 castExpression_bin_5
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  | lexer_rule_45 castExpression_bin_2
  | postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  ;

structDeclarator_bin_2
  : lexer_rule_72 structDeclarator_bin_1
  ;

structDeclarator_suffix_1
  : declarator_suffix_1 declarator_bin_1
  | directDeclarator declarator_suffix_2
  | lexer_rule_45 directDeclarator_bin_1
  | directDeclarator directDeclarator_bin_4
  | directDeclarator directDeclarator_bin_8
  | directDeclarator directDeclarator_bin_12
  | directDeclarator directDeclarator_bin_15
  | directDeclarator directDeclarator_bin_17
  | directDeclarator directDeclarator_bin_19
  | Identifier
  ;

structOrUnion
  : Struct
  | Union
  ;

structOrUnionSpecifier_bin_1
  : structDeclarationList lexer_rule_50
  | RightBrace
  ;

structOrUnionSpecifier_bin_2
  : lexer_rule_49 structOrUnionSpecifier_bin_1
  ;

structOrUnionSpecifier_bin_3
  : structOrUnionSpecifier_suffix_2 structOrUnionSpecifier_bin_2
  | lexer_rule_49 structOrUnionSpecifier_bin_1
  ;

structOrUnionSpecifier_bin_4
  : structOrUnionSpecifier_suffix_1 structOrUnionSpecifier_bin_3
  | structOrUnionSpecifier_suffix_2 structOrUnionSpecifier_bin_2
  | lexer_rule_49 structOrUnionSpecifier_bin_1
  ;

structOrUnionSpecifier_suffix_1
  : terminal_16 gccAttributeSpecifier_bin_4
  | terminal_17 gccAttributeSpecifier_bin_4
  ;

structOrUnionSpecifier_suffix_2
  : Identifier
  ;

terminal_1
  : CNF_TERM_9
  ;

terminal_10
  : CNF_TERM_17
  ;

terminal_15
  : CNF_TERM_8
  ;

terminal_16
  : CNF_TERM_4
  ;

terminal_17
  : CNF_TERM_3
  ;

terminal_18
  : CNF_TERM_22
  ;

terminal_2
  : CNF_TERM_7
  ;

terminal_3
  : CNF_TERM_5
  ;

terminal_5
  : CNF_TERM_6
  ;

terminal_9
  : CNF_TERM_18
  ;

translationUnit
  : asmName externalDeclaration_bin_3
  | IncludeDirective
  | PragmaDirective
  | functionDefinition_suffix_1 functionDefinition_bin_2
  | declarationSpecifiers declaration_bin_1
  | declarationSpecifiers lexer_rule_73
  | Semi
  | declarator functionDefinition_bin_1
  | lexer_rule_43 staticAssertDeclaration_bin_5
  | translationUnit externalDeclaration
  ;

typeName
  : structDeclaration_suffix_1 typeName_bin_1
  | specifierQualifierList parameterDeclaration_suffix_1
  | typeSpecifier specifierQualifierList_suffix_1
  | typeQualifier specifierQualifierList_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  ;

typeName_bin_1
  : specifierQualifierList parameterDeclaration_suffix_1
  | typeSpecifier specifierQualifierList_suffix_1
  | typeQualifier specifierQualifierList_suffix_1
  | terminal_1 typeSpecifier_bin_2
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | Identifier
  ;

typeQualifier
  : Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  ;

typeQualifierList
  : Const
  | Restrict
  | CNF_TERM_15
  | Volatile
  | Atomic
  | CNF_TERM_9
  | typeQualifierList typeQualifier
  ;

typeSpecifier
  : Void
  | Char
  | Short
  | Int
  | Long
  | Float
  | Double
  | Signed
  | Unsigned
  | Bool
  | Complex
  | Imaginary
  | CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  | terminal_1 typeSpecifier_bin_2
  | lexer_rule_37 unaryExpression_bin_2
  | structOrUnion structOrUnionSpecifier_bin_4
  | structOrUnion lexer_rule_93
  | lexer_rule_11 enumSpecifier_bin_3
  | lexer_rule_11 enumSpecifier_bin_7
  | lexer_rule_11 lexer_rule_93
  | Identifier
  | terminal_9 typeSpecifier_bin_4
  | terminal_10 typeSpecifier_bin_4
  ;

typeSpecifier_bin_1
  : typeSpecifier_block_2 lexer_rule_46
  ;

typeSpecifier_bin_2
  : lexer_rule_45 typeSpecifier_bin_1
  ;

typeSpecifier_bin_3
  : constantExpression lexer_rule_46
  ;

typeSpecifier_bin_4
  : lexer_rule_45 typeSpecifier_bin_3
  ;

typeSpecifier_block_2
  : CNF_TERM_12
  | CNF_TERM_13
  | CNF_TERM_14
  ;

unaryExpression
  : postfixExpression postfixExpression_bin_2
  | postfixExpression postfixExpression_bin_4
  | postfixExpression postfixExpression_bin_5
  | postfixExpression postfixExpression_bin_6
  | postfixExpression lexer_rule_58
  | postfixExpression lexer_rule_60
  | lexer_rule_45 postfixExpression_bin_10
  | lexer_rule_45 postfixExpression_bin_15
  | terminal_1 postfixExpression_bin_20
  | terminal_1 postfixExpression_bin_26
  | lexer_rule_45 primaryExpression_bin_1
  | primaryExpression_suffix_2 primaryExpression_bin_3
  | terminal_2 primaryExpression_bin_7
  | terminal_3 primaryExpression_bin_11
  | Identifier
  | Constant
  | lexer_rule_95 primaryExpression_suffix_1
  | lexer_rule_40 genericSelection_bin_4
  | lexer_rule_45 primaryExpression_bin_2
  | StringLiteral
  | lexer_rule_58 unaryExpression
  | lexer_rule_60 unaryExpression
  | unaryOperator castExpression
  | lexer_rule_25 unaryExpression
  | lexer_rule_25 unaryExpression_bin_2
  | unaryExpression_block_1 unaryExpression_bin_2
  | terminal_5 unaryExpression_bin_8
  | lexer_rule_66 lexer_rule_93
  | unaryExpression_block_2 unaryExpression
  ;

unaryExpression_bin_2
  : lexer_rule_45 primaryExpression_bin_4
  ;

unaryExpression_bin_7
  : typeName primaryExpression_bin_5
  ;

unaryExpression_bin_8
  : lexer_rule_45 unaryExpression_bin_7
  ;

unaryExpression_block_1
  : Alignof
  | CNF_TERM_0
  ;

unaryExpression_block_2
  : RealPart
  | ImaginaryPart
  ;

unaryOperator
  : And
  | Star
  | Plus
  | Minus
  | Tilde
  | Not
  ;


CNF_TERM_0: '__alignof__';
CNF_TERM_1: '__asm';
CNF_TERM_2: '__asm__';
CNF_TERM_3: '__attribute';
CNF_TERM_4: '__attribute__';
CNF_TERM_5: '__builtin_offsetof';
CNF_TERM_6: '__builtin_types_compatible_p';
CNF_TERM_7: '__builtin_va_arg';
CNF_TERM_8: '__declspec';
CNF_TERM_9: '__extension__';
CNF_TERM_10: '__inline';
CNF_TERM_11: '__inline__';
CNF_TERM_12: '__m128';
CNF_TERM_13: '__m128d';
CNF_TERM_14: '__m128i';
CNF_TERM_15: '__restrict';
CNF_TERM_16: '__stdcall';
CNF_TERM_17: '__typeof';
CNF_TERM_18: '__typeof__';
CNF_TERM_19: '__volatile__';
CNF_TERM_20: 'asm';


Auto : 'auto';
Break : 'break';
Case : 'case';
Char : 'char';
Const : 'const';
Continue : 'continue';
Default : 'default';
Do : 'do';
Double : 'double';
Else : 'else';
Enum : 'enum';
Extern : 'extern';
Float : 'float';
For : 'for';
Goto : 'goto';
If : 'if';
Inline : 'inline';
Int : 'int';
Long : 'long';
Register : 'register';
Restrict : 'restrict';
Return : 'return';
Short : 'short';
Signed : 'signed';
Sizeof : 'sizeof';
Static : 'static';
Struct : 'struct';
Switch : 'switch';
Typedef : 'typedef';
Union : 'union';
Unsigned : 'unsigned';
Void : 'void';
Volatile : 'volatile';
While : 'while';

Alignas : '_Alignas';
Alignof : '_Alignof';
Atomic : '_Atomic';
Bool : '_Bool';
Complex : '_Complex';
Generic : '_Generic';
Imaginary : '_Imaginary';
Noreturn : '_Noreturn';
StaticAssert : '_Static_assert';
ThreadLocal : '_Thread_local';

LeftParen : '(';
RightParen : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';

Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
LeftShift : '<<';
RightShift : '>>';

Plus : '+';
PlusPlus : '++';
Minus : '-';
MinusMinus : '--';
Star : '*';
Div : '/';
Mod : '%';

And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Caret : '^';
Not : '!';
Tilde : '~';

Question : '?';
Colon : ':';
Semi : ';';
Comma : ',';

Assign : '=';
// '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
StarAssign : '*=';
DivAssign : '/=';
ModAssign : '%=';
PlusAssign : '+=';
MinusAssign : '-=';
LeftShiftAssign : '<<=';
RightShiftAssign : '>>=';
AndAssign : '&=';
XorAssign : '^=';
OrAssign : '|=';

Equal : '==';
NotEqual : '!=';

Arrow : '->';
Dot : '.';
Ellipsis : '...';

RealPart : '__real__';
ImaginaryPart : '__imag__';

Identifier
    :   IdentifierNondigit
        (   IdentifierNondigit
        |   Digit
        )*
    ;

fragment
IdentifierNondigit
    :   Nondigit
    |   UniversalCharacterName
    //|   // other implementation-defined characters...
    ;

fragment
Nondigit
    :   [a-zA-Z_]
    ;

fragment
Digit
    :   [0-9]
    ;

fragment
UniversalCharacterName
    :   '\\u' HexQuad
    |   '\\U' HexQuad HexQuad
    ;

fragment
HexQuad
    :   HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
    ;

Constant
    :   IntegerConstant
    |   FloatingConstant
    //|   EnumerationConstant
    |   CharacterConstant
    |   ComplexConstant
    ;

fragment
IntegerConstant
    :   DecimalConstant IntegerSuffix?
    |   OctalConstant IntegerSuffix?
    |   HexadecimalConstant IntegerSuffix?
    |	BinaryConstant
    ;

fragment
BinaryConstant
	:	'0' [bB] [0-1]+
	;

fragment
DecimalConstant
    :   NonzeroDigit Digit*
    ;

fragment
OctalConstant
    :   '0' OctalDigit*
    ;

fragment
HexadecimalConstant
    :   HexadecimalPrefix HexadecimalDigit+
    ;

fragment
HexadecimalPrefix
    :   '0' [xX]
    ;

fragment
NonzeroDigit
    :   [1-9]
    ;

fragment
OctalDigit
    :   [0-7]
    ;

fragment
HexadecimalDigit
    :   [0-9a-fA-F]
    ;

fragment
IntegerSuffix
    :   UnsignedSuffix LongSuffix?
    |   UnsignedSuffix LongLongSuffix
    |   LongSuffix UnsignedSuffix?
    |   LongLongSuffix UnsignedSuffix?
    ;

fragment
UnsignedSuffix
    :   [uU]
    ;

fragment
LongSuffix
    :   [lL]
    ;

fragment
LongLongSuffix
    :   'll' | 'LL'
    ;

fragment
FloatingConstant
    :   DecimalFloatingConstant
    |   HexadecimalFloatingConstant
    ;

fragment
DecimalFloatingConstant
    :   FractionalConstant ExponentPart? FloatingSuffix?
    |   DigitSequence ExponentPart FloatingSuffix?
    ;

fragment
HexadecimalFloatingConstant
    :   HexadecimalPrefix HexadecimalFractionalConstant BinaryExponentPart FloatingSuffix?
    |   HexadecimalPrefix HexadecimalDigitSequence BinaryExponentPart FloatingSuffix?
    ;

fragment
FractionalConstant
    :   DigitSequence? '.' DigitSequence
    |   DigitSequence '.'
    ;

fragment
ExponentPart
    :   'e' Sign? DigitSequence
    |   'E' Sign? DigitSequence
    ;

fragment
Sign
    :   '+' | '-'
    ;

fragment
DigitSequence
    :   Digit+
    ;

fragment
HexadecimalFractionalConstant
    :   HexadecimalDigitSequence? '.' HexadecimalDigitSequence
    |   HexadecimalDigitSequence '.'
    ;

fragment
BinaryExponentPart
    :   'p' Sign? DigitSequence
    |   'P' Sign? DigitSequence
    ;

fragment
HexadecimalDigitSequence
    :   HexadecimalDigit+
    ;

fragment
FloatingSuffix
    :   'f' | 'l' | 'F' | 'L'
    ;

fragment
CharacterConstant
    :   '\'' CCharSequence '\''
    |   'L\'' CCharSequence '\''
    |   'u\'' CCharSequence '\''
    |   'U\'' CCharSequence '\''
    ;

fragment
ComplexConstant
    :   IntegerConstant 'i'
    |   FloatingConstant 'i'
    |   FractionalConstant ExponentPart? 'i' FloatingSuffix?
    |   DigitSequence ExponentPart 'i' FloatingSuffix?
    ;

fragment
CCharSequence
    :   CChar+
    ;

fragment
CChar
    :   ~['\\\r\n]
    |   EscapeSequence
    ;

fragment
EscapeSequence
    :   SimpleEscapeSequence
    |   OctalEscapeSequence
    |   HexadecimalEscapeSequence
    |   UniversalCharacterName
    ;

fragment
SimpleEscapeSequence
    :   '\\' ['"?abfnrtv\\]
    ;

fragment
OctalEscapeSequence
    :   '\\' OctalDigit
    |   '\\' OctalDigit OctalDigit
    |   '\\' OctalDigit OctalDigit OctalDigit
    ;

fragment
HexadecimalEscapeSequence
    :   '\\x' HexadecimalDigit+
    ;

StringLiteral
    :   EncodingPrefix? '"' SCharSequence? '"'
    ;

fragment
EncodingPrefix
    :   'u8'
    |   'u'
    |   'U'
    |   'L'
    ;

fragment
SCharSequence
    :   SChar+
    ;

fragment
SChar
    :   ~["\\\r\n]
    |   EscapeSequence
    |   '\\\n'   // Added line
    |   '\\\r\n' // Added line
    ;

ComplexDefine
    :   '#' Whitespace? 'define'  ~[#]*
        -> skip
    ;

// ignore the following asm blocks:
/*
    asm
    {
        mfspr x, 286;
    }
 */
/*AsmBlock
    :   'asm' ~['{']* '{' ~['}']* '}'
	-> skip
    ;*/
	
// ignore the lines generated by c preprocessor                                   
// sample line : '#line 1 "/home/dm/files/dk1.h" 1'                           
LineAfterPreprocessing
    :   '#line' Whitespace* ~[\r\n]*
        -> skip
    ;  

LineDirective
    :   '#' Whitespace? DecimalConstant Whitespace? StringLiteral ~[\r\n]*
        -> skip
    ;

IncludeDirective
    :   '#' Whitespace? 'include' Whitespace ~[\r\n]*
    ;

PragmaDirective
    :   '#' Whitespace? 'pragma' Whitespace ~[\r\n]*
    ;

Whitespace
    :   [ \t]+
        -> skip
    ;

Newline
    :   (   '\r' '\n'?
        |   '\n'
        )
        -> skip
    ;

BlockComment
    :   '/*' .*? '*/'
        -> skip
    ;

LineComment
    :   '//' ~[\r\n]*
        -> skip
    ;


CNF_TERM_21: ~('('|')');
CNF_TERM_22: ~(','|'('|')');
