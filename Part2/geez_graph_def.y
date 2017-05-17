%glr-parser
%expect 3

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char* s);
int errorNumber = 0;

%}
%define parse.error verbose

%token COLON
%token FUNCTION IFSTATEMENT ELSESTATEMENT END FOR WHILE RETURN
%token IDENTIFIER COMMENT
%token INT FLOAT STRING
%token EQUAL SEMICOLON COMMA DOT
%token SLBRACKET SRBRACKET
%token NOT
%token ASSIGNMENT
%token CONNECT
%token LENGHT
%token INCLUDEPROPERTY
%token MAIN
%token PROPERTY
%token VARIABLE
%token VERTEX
%token BOOLEAN
%token DIRECTED
%token UNDIRECTED
%token EDGE
%token LPARAN
%token RPARAN
%token LBRACKET
%token RBRACKET
%token INTEGER
%token CONCATENATION
%token ALTERNATION
%token REPETITION
%token SPACE
%token NEWLINE
%left AND OR
%nonassoc ISEQUAL NOTEQUAL
%nonassoc LESS GREATER LESSEQUAL GREATEREQUAL
%left PLUS MINUS
%left MULTIPLICATION DIVISION

%%
entry:
    MAIN LPARAN RPARAN LBRACKET functionbody RBRACKET     
;

functionbody:    
    stmt functionbody
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
    component component_list
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
    PROPERTY IDENTIFIER ASSIGNMENT LPARAN property_stmt RPARAN
    ;

methodcall:
    IDENTIFIER DOT INCLUDEPROPERTY LPARAN property_stmt
    |CONNECT LPARAN IDENTIFIER COMMA IDENTIFIER COMMA IDENTIFIER RPARAN
    ;

assignment:
    |VARIABLE ASSIGNMENT element
    ;

conditional:
    if_cond | ifelse_cond
    ;

if_cond:
    IFSTATEMENT LPARAN cond RPARAN LBRACKET component_list RBRACKET
    ;

ifelse_cond:
    IFSTATEMENT LPARAN cond RPARAN LBRACKET component_list RBRACKET ELSESTATEMENT LBRACKET component_list RBRACKET
    ;    

cond:
    |BOOLEAN
    |IDENTIFIER booleanopr element
    |element booleanopr IDENTIFIER
    |IDENTIFIER booleanopr IDENTIFIER
    ;

booleanopr:
    ISEQUAL
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
    FOR LPARAN assignment SEMICOLON cond SEMICOLON assignment RPARAN LBRACKET component_list RBRACKET
    ;

while:
    WHILE LPARAN cond RPARAN LBRACKET component_list RBRACKET
    ;
    
property_stmt:
    STRING COMMA element
    ;

map:
    LBRACKET mapbody RBRACKET
    ;

set:
    SLBRACKET setbody SRBRACKET
    ;

list:
    SLBRACKET listbody SRBRACKET
    ;

mapbody:
    mapbody COMMA map_tail
    |map_tail
    ;

map_tail:
    STRING COLON element
    ;

setbody:
    setbody COMMA list_tail
    |list_tail
    |
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
