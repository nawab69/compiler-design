%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[-+*/()=\n] { return *yytext; }
[ \t]       ; /* skip whitespace */
.           { printf("Invalid character: %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}