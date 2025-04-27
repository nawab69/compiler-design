%{
#include <stdio.h>
int complex_count = 0;
%}

%%
[+-]?[0-9]+[.][0-9]+[ \t]*[+-][ \t]*[0-9]+[.][0-9]+[iI]    { printf("Complex number (decimal): %s\n", yytext); complex_count++; }
[+-]?[0-9]+[ \t]*[+-][ \t]*[0-9]+[.][0-9]+[iI]             { printf("Complex number (mixed): %s\n", yytext); complex_count++; }
[+-]?[0-9]+[.][0-9]+[ \t]*[+-][ \t]*[0-9]+[iI]             { printf("Complex number (mixed): %s\n", yytext); complex_count++; }
[+-]?[0-9]+[ \t]*[+-][ \t]*[0-9]+[iI]                      { printf("Complex number (integer): %s\n", yytext); complex_count++; }
[+-]?[0-9]+[.][0-9]+[iI]                                   { printf("Pure imaginary number (decimal): %s\n", yytext); complex_count++; }
[+-]?[0-9]+[iI]                                            { printf("Pure imaginary number (integer): %s\n", yytext); complex_count++; }
[0-9]+[.][0-9]+                                            { printf("Regular float: %s\n", yytext); }
[0-9]+                                                     { printf("Regular integer: %s\n", yytext); }
[ \t\n]+                                                   { /* ignore whitespace */ }
.                                                          { /* ignore other characters */ }
%%

int main() {
    printf("Enter numbers to identify complex numbers (Ctrl+D to end):\n");
    yylex();
    printf("\nTotal complex numbers found: %d\n", complex_count);
    return 0;
}

int yywrap() {
    return 1;
}