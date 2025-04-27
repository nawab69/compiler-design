%{
#include <stdio.h>

int char_count = 0;
int word_count = 0;
int space_count = 0;
int line_count = 0;

// Initialize line count to 1 for the first line
%}

%%
[a-zA-Z0-9]+    { char_count += yyleng; word_count++; }
" "             { char_count++; space_count++; }
\t              { char_count++; }
\n              { char_count++; line_count++; }
.               { char_count++; }
%%

int main() {
    printf("Enter text (Ctrl+D to end input):\n");
    yylex();
    
    printf("\nStatistics:\n");
    printf("Number of characters: %d\n", char_count);
    printf("Number of words: %d\n", word_count);
    printf("Number of spaces: %d\n", space_count);
    printf("Number of lines: %d\n", line_count);
    
    return 0;
}

int yywrap() {
    return 1;
}