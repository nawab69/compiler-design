%{
#include <stdio.h>
#include "y.tab.h"
#include <string.h>

/* This lexer recognizes tokens needed for C-style for loops */
%}

%%
"for"           { return FOR; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
";"             { return SEMICOLON; }
"="             { return ASSIGN; }
"++"            { return INCREMENT; }
"--"            { return DECREMENT; }
"<"             { return LT; }
">"             { return GT; }
"<="            { return LE; }
">="            { return GE; }
"=="            { return EQ; }
"!="            { return NE; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULT; }
"/"             { return DIV; }
"%"             { return MOD; }

[0-9]+          { return NUMBER; }

[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

[ \t\n]+        { /* Ignore whitespace */ }

\/\/.*          { /* Ignore single-line comments */ }

\/\*([^*]|\*+[^*/])*\*+\/ { /* Ignore multi-line comments */ }

.               { /* Ignore other characters */ }

%%

int yywrap(void) {
    return 1;
}