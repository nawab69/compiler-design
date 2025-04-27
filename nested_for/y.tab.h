/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     FOR = 258,
     LPAREN = 259,
     RPAREN = 260,
     LBRACE = 261,
     RBRACE = 262,
     SEMICOLON = 263,
     ASSIGN = 264,
     INCREMENT = 265,
     DECREMENT = 266,
     LT = 267,
     GT = 268,
     LE = 269,
     GE = 270,
     EQ = 271,
     NE = 272,
     PLUS = 273,
     MINUS = 274,
     MULT = 275,
     DIV = 276,
     MOD = 277,
     ID = 278,
     NUMBER = 279
   };
#endif
/* Tokens.  */
#define FOR 258
#define LPAREN 259
#define RPAREN 260
#define LBRACE 261
#define RBRACE 262
#define SEMICOLON 263
#define ASSIGN 264
#define INCREMENT 265
#define DECREMENT 266
#define LT 267
#define GT 268
#define LE 269
#define GE 270
#define EQ 271
#define NE 272
#define PLUS 273
#define MINUS 274
#define MULT 275
#define DIV 276
#define MOD 277
#define ID 278
#define NUMBER 279




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

