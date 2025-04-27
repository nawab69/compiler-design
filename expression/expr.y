%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER ID

/* Define operator precedence and associativity */
%left '+' '-'
%left '*' '/'
%right UMINUS

%%
start:
    lines               { printf("Parsing completed successfully\n"); }
    ;

lines:
    lines line
    |
    ;

line:
    expr '\n'           { printf("Valid arithmetic expression\n"); }
    | '\n'              /* Empty line */
    ;

expr:
    NUMBER              /* Constant value */
    | ID                /* Variable */
    | expr '+' expr     
    | expr '-' expr     
    | expr '*' expr     
    | expr '/' expr     
    | '-' expr %prec UMINUS  /* Unary minus */
    | '(' expr ')'      
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Arithmetic Expression Validator\n");
    printf("Enter expressions, each ending with a newline. Press Ctrl+D to exit.\n");
    yyparse();
    printf("Bye!\n");
    return 0;
}