%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token A B C EOL

%%
program:
    lines           { printf("Parsing completed successfully\n"); }
    ;

lines:
    lines line
    |
    ;

line:
    S EOL           { printf("Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)\n"); }
    | EOL           /* empty line */
    | error EOL     { yyerrok; }
    ;

/* Grammar for a^n b^(n+m) c^m where n,m >= 0 */
S:
    A_part B_part C_part
    ;

A_part:
    A A_part        /* a^n */
    |               /* empty for n=0 */
    ;

B_part:
    B B_part        /* b^(n+m) */
    |               /* can be empty only when both A_part and C_part are empty */
    ;

C_part:
    C C_part        /* c^m */
    |               /* empty for m=0 */
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    fprintf(stderr, "Invalid string: Does not match a^n b^(n+m) c^m grammar\n");
}

int main(void) {
    printf("a^n b^(n+m) c^m Grammar Recognizer (n,m >= 0)\n");
    printf("Enter strings to check (one per line). Press Ctrl+D to exit.\n");
    printf("Examples of valid strings: empty string, 'ab', 'bc', 'abc', 'abbc', 'abbcc'\n");
    yyparse();
    return 0;
}