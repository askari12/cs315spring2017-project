%{
	#include "y.tab.h"
	#include <stdlib.h>
	#include <stdio.h>

	void yyerror(char *);
	extern int yylineno;
%}
RANDEDGE \$\P
RANDVERT \#\P
SPACE [ \t]+
NEWLINE [\n]
COMMENT [/]+.*
DIGIT [0-9]
LOWERCASE [a-z]
UPPERCASE [A-Z]
LPARAN \(
RPARAN \)
LBRACKETS \{
RBRACKETS \}
LSQR \[
RSQL \]
SEMICOLON \;
COMMA \,
DOT \.
COLON \:
ASSIGNMENT =
COMPARISON ==
GREATER >
LESS <
GREATEREQUAL >=
LESSEQUAL <=
NOTEQUAL !=
NOT !
MULTIPLICATION \*
DIVISION \:\:
SUBTRACTION \-
ADDITION \+
CONCATENATION \&
ALTERNATION \|
REPETITION \^
HASH \#
DOLAR \$
OROR \|\|
ANDAND \&\&
STRCONCAT \~
IFSTM If
ELSE Else
BOOLEAN True|False
FOR For
WHILE While
STRING \"([^\\\"]|\\\"|\\\n|\\\\)*\"
ALPHANUMERIC ({LOWERCASE}|{UPPERCASE}|{DIGIT})
VARIABLE {LOWERCASE}{ALPHANUMERIC}*
PROPERTY Property
DIRECTEDGRAPH DirGraph
UNDIRECTEDGRAPH UndirGraph
VERTEX Vertex
EDGE Edge
INTEGER [-+]?{DIGIT}+
FLOAT [-+]?{DIGIT}*(\.{DIGIT}+)
%option yylineno
%%
{COMMENT} return"COMMENT";
{SEMICOLON} return"SEMICOLON";
{COMMA} return"COMMA";
{DOT} return"DOT";
{COLON} return"COLON";
{ASSIGNMENT} return"ASSIGNMENT";
{COMPARISON} return"ISEQUAL";
{GREATER} return"GREATER";
{LESS} return"LESS";
{GREATEREQUAL} return"GREATEREQUAL";
{LESSEQUAL} return"LESSEQUAL";
{NOTEQUAL} return"NOTEQUAL";
{NOT} return"NOT";
{VARIABLE} return"VARIABLE";
{PROPERTY} return"PROPERTY";
{DIRECTEDGRAPH} return"DIRECTED";
{UNDIRECTEDGRAPH} return"UNDIRECTED";
{VERTEX} return"VERTEX";
{EDGE} return"EDGE";
{INTEGER} return"INTEGER";
{FLOAT}	return"FLOAT";
{STRING} return"STRING";
{ADDITION} return"PLUS";
{SUBTRACTION} return"MINUS";
{MULTIPLICATION} return"MULTIPLICATION";
{LBRACKETS} return"LBRACKET";
{RBRACKETS} return"RBRACKET";
{LPARAN} return"LPARAN";
{RPARAN} return"RPARAN";
{CONCATENATION} return"CONCATENATION";
{ALTERNATION} return"ALTERNATION";
{DIVISION} return"DIVISION";
{REPETITION} return"REPETITION";
{IFSTM} return"IFSTATEMENT";
{ELSE} return"ELSESTATEMENT";
{FOR} return"FOR";
{WHILE} return"WHILE";
{HASH} return"HASH";
{DOLAR} return"DOLAR";
{RANDVERT} return"RANDVERTEX";
{RANDEDGE} return"RANDEDGE";
{STRCONCAT} return"STRCONCAT";
{LSQR} return"SLBRACKET";
{RSQL} return"SRBRACKET";
{SPACE} return"SPACE";
{NEWLINE} return"NEWLINE";
. { yyerror("invalid character"); }
%%
int main(void){
	yylex();
	return 0;
}
