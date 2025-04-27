%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*  { return ID; }
[-+*/()]    { return yytext[0]; }
\n          { return '\n'; }
[ \t]       ; /* skip whitespace */
.           { printf("Invalid character: %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}