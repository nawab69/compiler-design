%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);

/* Track nesting level */
int nesting_level = 0;
int max_nesting_level = 0;
%}

%token FOR LPAREN RPAREN LBRACE RBRACE SEMICOLON
%token ASSIGN INCREMENT DECREMENT 
%token LT GT LE GE EQ NE
%token PLUS MINUS MULT DIV MOD
%token ID NUMBER

%%

program
    : nested_for
    ;

nested_for
    : valid_for_loop
    | error { yyerror("Invalid FOR loop structure"); }
    ;

valid_for_loop
    : FOR LPAREN for_init SEMICOLON for_cond SEMICOLON for_update RPAREN LBRACE for_body RBRACE
        {
            if (max_nesting_level >= 3) {
                printf("Valid nested FOR loop with nesting level: %d (minimum 3 levels met)\n", max_nesting_level);
            } else {
                printf("Valid FOR loop, but nesting level is only %d (minimum 3 levels not met)\n", max_nesting_level);
            }
        }
    ;

for_init
    : ID ASSIGN expr
    | /* empty */
    ;

for_cond
    : expr comparison_op expr
    | /* empty */
    ;

for_update
    : ID INCREMENT
    | ID DECREMENT
    | ID ASSIGN expr
    | /* empty */
    ;

for_body
    : { 
        nesting_level++;
        if (nesting_level > max_nesting_level) {
            max_nesting_level = nesting_level;
        }
      }
      nested_for_block
      { nesting_level--; }
    | { nesting_level = 0; max_nesting_level = 0; } /* reset counters for new input */
    ;

nested_for_block
    : nested_for
    | statement_list nested_for
    | nested_for statement_list
    | statement_list
    ;

statement_list
    : statement
    | statement_list statement
    ;

statement
    : expr SEMICOLON
    | LBRACE statement_list RBRACE
    | SEMICOLON
    ;

expr
    : ID
    | NUMBER
    | ID ASSIGN expr
    | expr PLUS expr
    | expr MINUS expr
    | expr MULT expr
    | expr DIV expr
    | expr MOD expr
    | LPAREN expr RPAREN
    ;

comparison_op
    : LT
    | GT
    | LE
    | GE
    | EQ
    | NE
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Nested FOR Loop Recognizer\n");
    printf("Enter a C code snippet with nested FOR loops (minimum 3 levels).\n");
    printf("Press Ctrl+D (EOF) when done.\n\n");
    
    yyparse();
    return 0;
}