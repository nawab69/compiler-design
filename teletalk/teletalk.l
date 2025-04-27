%{
#include <stdio.h>
%}

%%
015[0-9]{8}    { printf("Valid Teletalk number: %s\n", yytext); }
[0-9]+         { printf("Not a valid Teletalk number: %s\n", yytext); }
.|\n           { /* ignore other characters */ }
%%

int main(void)
{
    printf("Enter phone numbers (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}