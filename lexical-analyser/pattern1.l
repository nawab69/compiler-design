%{
    #include <stdio.h>
%}

%%
[A-Z][a-z]+[[:space:]][a-z0-9]+ {printf("Matched: %s\n", yytext);}
.|\n { /* Ignore everything else */ }
%%

int main(void)
{
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}