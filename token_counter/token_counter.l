%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int identifier_count = 0;
int keyword_count = 0;
int operator_count = 0;

// Function to check if a given string is a C keyword
int is_keyword(char* str) {
    char* keywords[] = {
        "auto", "break", "case", "char", "const", "continue", "default", "do",
        "double", "else", "enum", "extern", "float", "for", "goto", "if",
        "int", "long", "register", "return", "short", "signed", "sizeof", "static",
        "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"
    };
    int num_keywords = sizeof(keywords) / sizeof(char*);
    
    for (int i = 0; i < num_keywords; i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

%%
[ \t\n]+                    { /* Ignore whitespace */ }

"+"                         { operator_count++; printf("Operator: %s\n", yytext); }
"-"                         { operator_count++; printf("Operator: %s\n", yytext); }
"*"                         { operator_count++; printf("Operator: %s\n", yytext); }
"/"                         { operator_count++; printf("Operator: %s\n", yytext); }
"%"                         { operator_count++; printf("Operator: %s\n", yytext); }
"++"                        { operator_count++; printf("Operator: %s\n", yytext); }
"--"                        { operator_count++; printf("Operator: %s\n", yytext); }
"="                         { operator_count++; printf("Operator: %s\n", yytext); }
"+="                        { operator_count++; printf("Operator: %s\n", yytext); }
"-="                        { operator_count++; printf("Operator: %s\n", yytext); }
"*="                        { operator_count++; printf("Operator: %s\n", yytext); }
"/="                        { operator_count++; printf("Operator: %s\n", yytext); }
"%="                        { operator_count++; printf("Operator: %s\n", yytext); }
"=="                        { operator_count++; printf("Operator: %s\n", yytext); }
"!="                        { operator_count++; printf("Operator: %s\n", yytext); }
">"                         { operator_count++; printf("Operator: %s\n", yytext); }
"<"                         { operator_count++; printf("Operator: %s\n", yytext); }
">="                        { operator_count++; printf("Operator: %s\n", yytext); }
"<="                        { operator_count++; printf("Operator: %s\n", yytext); }
"&&"                        { operator_count++; printf("Operator: %s\n", yytext); }
"||"                        { operator_count++; printf("Operator: %s\n", yytext); }
"!"                         { operator_count++; printf("Operator: %s\n", yytext); }
"&"                         { operator_count++; printf("Operator: %s\n", yytext); }
"|"                         { operator_count++; printf("Operator: %s\n", yytext); }
"^"                         { operator_count++; printf("Operator: %s\n", yytext); }
"<<"                        { operator_count++; printf("Operator: %s\n", yytext); }
">>"                        { operator_count++; printf("Operator: %s\n", yytext); }

[a-zA-Z][a-zA-Z0-9_]*       {
                              if (is_keyword(yytext)) {
                                  keyword_count++;
                                  printf("Keyword: %s\n", yytext);
                              } else {
                                  identifier_count++;
                                  printf("Identifier: %s\n", yytext);
                              }
                            }

"//".*                      { /* Skip single-line comments */ }
"/*"([^*]|"*"+[^*/])*"*/"   { /* Skip multi-line comments */ }

.                           { /* Skip other characters */ }

%%

int yywrap(void) {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s input_file\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        fprintf(stderr, "Cannot open input file %s\n", argv[1]);
        return 1;
    }

    yyin = input_file;
    
    printf("Analyzing file: %s\n\n", argv[1]);
    yylex();
    
    printf("\nSummary:\n");
    printf("Number of identifiers: %d\n", identifier_count);
    printf("Number of keywords: %d\n", keyword_count);
    printf("Number of operators: %d\n", operator_count);
    printf("Total tokens: %d\n", identifier_count + keyword_count + operator_count);
    
    fclose(input_file);
    return 0;
}