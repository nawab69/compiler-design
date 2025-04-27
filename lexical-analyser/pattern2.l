%{
#include <stdio.h>
%}

%%
[A-Z][a-zA-Z0-9_]+[ \t][a-zA-Z0-9_]+[ \t][a-zA-Z0-9_]+[!] {printf("Matched: %s\n", yytext);}
.|\n { /* Ignore everything else */ }
%%

int main(void) {
    printf("Enter text to match pattern: [A-Z]\\w+\\s\\w+\\s\\w+[!]\n");
    printf("Examples: \"Hello world example!\", \"Test this pattern!\"\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}