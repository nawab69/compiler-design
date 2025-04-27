%{
#include <stdio.h>
%}

%%
([a-zA-Z0-9_]*at[ \t\n])+         { printf("Matched: %s\n", yytext); }
([a-zA-Z0-9_]*ats[ \t\n])+        { printf("Matched: %s\n", yytext); }
([a-zA-Z0-9_]+(at|ats)[ \t\n])+   { printf("Matched sequence: %s\n", yytext); }
[\n]                              { /* ignore newlines outside pattern */ }
[ \t]                             { /* ignore individual spaces/tabs */ }
.                                 { /* ignore other characters */ }
%%

int main(void)
{
    printf("Enter text to match pattern: (\\w+ats?\\s)+\n");
    printf("Examples: \"cats dogs hats\", \"bat mat cat\"\n");
    printf("This pattern matches words ending with 'at' or 'ats' followed by whitespace\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}