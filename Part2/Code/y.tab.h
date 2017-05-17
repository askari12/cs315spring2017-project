/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Skeleton interface for Bison GLR parsers in C

   Copyright (C) 2002-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    COLON = 258,
    EXEC = 259,
    FILTER = 260,
    LENGTHM = 261,
    PREDICATE = 262,
    QUERY = 263,
    RANDEDGE = 264,
    RANDVERTEX = 265,
    LESSTHANM = 266,
    MORETHANM = 267,
    FUNCTION = 268,
    IFSTATEMENT = 269,
    ELSESTATEMENT = 270,
    END = 271,
    FOR = 272,
    WHILE = 273,
    RETURN = 274,
    COMMENT = 275,
    INT = 276,
    FLOAT = 277,
    STRING = 278,
    SEMICOLON = 279,
    COMMA = 280,
    DOT = 281,
    SLBRACKET = 282,
    SRBRACKET = 283,
    NOT = 284,
    ASSIGNMENT = 285,
    CONNECT = 286,
    DOLAR = 287,
    HASH = 288,
    LENGHT = 289,
    INCLUDEPROPERTY = 290,
    MAIN = 291,
    PROPERTY = 292,
    VARIABLE = 293,
    VERTEX = 294,
    BOOLEAN = 295,
    CHARATM = 296,
    EQUALSM = 297,
    DIRECTED = 298,
    UNDIRECTED = 299,
    EDGE = 300,
    LPARAN = 301,
    RPARAN = 302,
    LBRACKET = 303,
    RBRACKET = 304,
    INTEGER = 305,
    CONCATENATION = 306,
    ALTERNATION = 307,
    REPETITION = 308,
    SPACE = 309,
    NEWLINE = 310,
    AND = 311,
    OR = 312,
    LESS = 313,
    GREATER = 314,
    LESSEQUAL = 315,
    GREATEREQUAL = 316,
    ISEQUAL = 317,
    NOTEQUAL = 318,
    EQUAL = 319,
    PLUS = 320,
    MINUS = 321,
    MULTIPLICATION = 322,
    DIVISION = 323
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
