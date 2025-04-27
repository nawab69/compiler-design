%{
    #include <stdio.h>
%}

%%
[A-Z][a-z]+[ \t\n][a-z0-9]+ {printf("Matched: %s\n", yytext);}
.|\n { /* Ignore everything else */ }
%%

int main(void)
{
    printf("Enter text to match pattern: ([A-Z][a-z]+)\\s([a-z0-9]+)\n");
    printf("Examples: \"Hello world\", \"Test 123\"\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}