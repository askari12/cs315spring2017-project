%glr-parser
%expect 3

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char* s);
int errorNumber = 0;

%}

%token FUNCTION IF ELSEIF ELSE END FOR WHILE RETURN SHAPE THIS MAIN NULLTYPE TRUE FALSE
%token IDENTIFIER COMMENT
%token INT FLOAT STRING
%token EQUAL SEMICOLON COMMA DOT
%token LEFTSQUAREBRACKET RIGHTSQUAREBRACKET
%token LEFTPAR RIGHTPAR
%token NOT
%token ASSIGNMENT
%token COLON
%token CONNECT
%token LENGHT
%token EQUAL


%left AND OR
%nonassoc ISEQUAL NOTEQUAL
%nonassoc LESSTHAN GREATERTHAN LESS_THAN_EQUAL GREATER_THAN_EQUAL
%left PLUS MINUS
%left MULTIPLICATION DIVISION REMAINDER
%left UNARY //unary plus, minus, not
%left EXPONENTIAL

%%


entry:
	MAIN LPARAN RPARAN LBRACKET functionbody RBRACKET
;


functionbody:
	functionbody stmt
	|stmt
	;

stmt:
	graph_definition
	;


graph_definition:
	DIRECTED IDENTIFIER LBRACKET component_list RBRACKET
|UNDIRECTED IDENTIFIER LBRACKET component_list RBRACKET
	;

component_list:
	component_list component
	|component
	;

component:
	vertex_declaration end
	|edge_declaration end
	|graph_object_declaration end
	|methodcall end
	|assignment end
	|conditional
	|loop
	|COMMENT
	;


vertex_declaration:
	VERTEX IDENTIFIER
	;

edge_declaration:
	EDGE IDENTIFIER

graph_object_declaration:
	property
	;

property:
	PROPERTY IDENTIFIER ASSIGNMENT LPRAN property_stmt RPRAN
	;

methodcall:
	IDENTIFIER DOT INCLUDEPROPERTY LPRAN property_stmt
	|CONNECT LPRAN IDENTIFIER COMMA IDENTIFIER COMMA IDENTIFIER RPRAN
	;

assignment:
	|VARIABLE ASSIGNMENT element
	;

conditional:
	if_cond | ifelse_cond
	;

if_cond:
	IFSTATEMENT LPRAN cond RPRAN LBRACKET component_list if_stmt RBRACKET
	;

ifelse_cond:
	IFSTATEMENT LPRAN cond RPRAN LBRACKET component_list RBRACKET ELSESTATEMENT LBRACKET component RBRACKET
	;

cond:
	|BOOLEAN
	|IDENTIFIER booleanopr element
	|element booleanopr IDENTIFIER
	|IDENTIFIER booleaopr IDENTIFIER
	;

booleanopr:
	COMPARISON
	|GREATER
	|LESS
	|GREATEREQUAL
	|LESSEQUAL
	|NOTEQUAL
	;

loop:
	for
	|while
	;

for:
	FOR LPRAN assignment SEMICOLON cond SEMICOLON asignment RPRAN LBRACKET component_list RBRACKET
	;

while:
	WHILE LPRAN cond RPRAN LBRACKET component_list RBRACKET
	;

property_stmt:
	STRING COMMA element
	;

map:
	LBRACKET mapbody RBRACKET
	;

set:
	SLBRACKET setbody1 SRBRACKET
	SLBRACKET setbody2 SRBRACKET
	SLBRACKET setbody3 SRBRACKET
	SLBRACKET setbody4 SRBRACKET
	SLBRACKET setbody5 SRBRACKET
	SLBRACKET setbody6 SRBRACKET
	;

list:
	SLBRACKET listbody SRBRACKET
	;

mapbody:
	map_body COMMA map_tail
	|map_tail
	|
	;

map_tail:
	STRING COLON element
	;

setbody1:
	setbody1 COMMA set_tail1
	|set_tail1
	|
	;

setbody2:
	setbody2 COMMA set_tail2
	|set_tail2
	|
	;

setbody3:
	setbody3 COMMA set_tail3
	|set_tail3
	|
	;

setbody4:
	setbody4 COMMA set_tail4
	|set_tail4
	|
	;

setbody5:
	setbody5 COMMA set_tail5
	|set_tail5
	|
	;

setbody6:
	setbody6 COMMA set_tail6
	|set_tail6
	|
	;

set_tail1:
	INTEGER
	;

set_tail2:
	FLOAT
	;

set_tail3:
	STRING
	;

set_tail4:
	set
	;

set_tail5:
	map
	;

set_tail6:
	list
	;

listbody:
	list COMMA list_tail
	|list_tail
	|
	;

list_tail:
	element
	;


element:
	INTEGER|FLOAT|STRING|map|list|set
	;

end:
	SEMICOLON
	;



%%
void yyerror(char *s) {
	fprintf(stdout, "%s\n", s);
}

int main(void){
 yyparse();
 return 0;
}
