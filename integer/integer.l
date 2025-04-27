%{
#include <stdio.h>
%}

%%
[0-9]+\.[0-9]+   { printf("Floating Point Number: %s\n", yytext); }
[0-9]+           { printf("Integer Number: %s\n", yytext); }
.|\n             { /* ignore everything else */ }
%%

int main(void)
{
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}