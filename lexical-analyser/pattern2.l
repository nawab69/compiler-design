%{
#include <stdio.h>
%}

%%
[A-Z]\w+[[:space:]]\w+[[:space:]]\w+[!] {printf("Matched: %s\n", yytext);}
.|\n { /* Ignore everything else */ }
%%

int main(void) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}