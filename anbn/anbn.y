%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token A B EOL

%%
program:
    lines           { printf("Parsing completed successfully\n"); }
    ;

lines:
    lines line
    |
    ;

line:
    anbn EOL        { printf("Valid string: Matches a^n b^n grammar (n > 0)\n"); }
    | EOL           /* empty line */
    | error EOL     { yyerrok; }
    ;

anbn:
    A anbn B        /* recursive rule for a^n b^n */
    | A B           /* base case for a^1 b^1 */
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    fprintf(stderr, "Invalid string: Does not match a^n b^n grammar\n");
}

int main(void) {
    printf("a^n b^n Grammar Recognizer\n");
    printf("Enter strings to check (one per line). Press Ctrl+D to exit.\n");
    printf("Examples of valid strings: 'ab', 'aabb', 'aaabbb'\n");
    printf("Examples from prompt: 'aaab', 'abbb', 'ab', 'a'\n");
    yyparse();
    return 0;
}