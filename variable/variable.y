%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
extern FILE* yyin;
%}

%token VARIABLE INVALID

%%
program: 
    variable_list
    ;

variable_list:
    variable_list variable
    | variable_list invalid
    | /* empty */
    ;

variable:
    VARIABLE { printf("Valid variable\n"); }
    ;

invalid:
    INVALID { printf("Invalid variable - must start with a letter\n"); }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *file;
        file = fopen(argv[1], "r");
        if (!file) {
            fprintf(stderr, "Cannot open file %s\n", argv[1]);
            return 1;
        }
        yyin = file;
    }
    
    printf("Variable Validator\n");
    printf("Enter variable names, separated by whitespace. Press Ctrl+D to exit.\n");
    
    yyparse();
    
    if (argc > 1) {
        fclose(yyin);
    }
    
    return 0;
}