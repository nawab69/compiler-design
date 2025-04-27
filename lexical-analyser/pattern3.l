%{
#include <stdio.h>
%}

%%
(\w+ats?[[:space:]])+   { printf("Matched: %s\n", yytext); }
.|\n                   { /* ignore other characters */ }
%%

int main(void)
{
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}