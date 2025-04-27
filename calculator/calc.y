%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS

%%
program:
    program statement '\n'
    |
    ;

statement:
    expr                    { printf("Result: %d\n", $1); }
    | /* empty */
    ;

expr:
    NUMBER                  { $$ = $1; }
    | expr '+' expr         { $$ = $1 + $3; }
    | expr '-' expr         { $$ = $1 - $3; }
    | expr '*' expr         { $$ = $1 * $3; }
    | expr '/' expr         { 
                              if ($3 == 0) {
                                  yyerror("Division by zero");
                                  $$ = 0;
                              } else {
                                  $$ = $1 / $3;
                              }
                            }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'          { $$ = $2; }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Calculator\n");
    printf("Enter expressions, each ending with a newline. Press Ctrl+D to exit.\n");
    yyparse();
    printf("Bye!\n");
    return 0;
}