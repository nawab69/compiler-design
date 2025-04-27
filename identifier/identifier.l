%{
#include <stdio.h>
int identifier_count = 0;
%}

%%
[a-zA-Z][a-zA-Z0-9_]*    { printf("Identifier: %s\n", yytext); identifier_count++; }
[0-9][a-zA-Z0-9_]*       { printf("Invalid identifier (starts with digit): %s\n", yytext); }
[ \t\n]+                 { /* ignore whitespace */ }
.                        { printf("Non-identifier character: %s\n", yytext); }
%%

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    printf("\nTotal number of identifiers: %d\n", identifier_count);
    return 0;
}

int yywrap() {
    return 1;
}