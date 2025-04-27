%{
#include <stdio.h>
int exp_count = 0;
%}

%%
[+-]?[0-9]+[.][0-9]+[eE][+-]?[0-9]+    { printf("Exponential number (decimal form): %s\n", yytext); exp_count++; }
[+-]?[0-9]+[eE][+-]?[0-9]+             { printf("Exponential number (integer form): %s\n", yytext); exp_count++; }
[0-9]+                                 { printf("Regular integer: %s\n", yytext); }
[0-9]+[.][0-9]+                        { printf("Regular float: %s\n", yytext); }
[ \t\n]+                               { /* ignore whitespace */ }
.                                      { printf("Other character: %s\n", yytext); }
%%

int main() {
    printf("Enter numbers to identify exponential notation (Ctrl+D to end):\n");
    yylex();
    printf("\nTotal exponential numbers found: %d\n", exp_count);
    return 0;
}

int yywrap() {
    return 1;
}