%{
#include <stdio.h>
%}

%%
.|\n { ECHO; }
%%

int main(void)
{
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
