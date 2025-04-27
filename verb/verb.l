%{
#include <stdio.h>
int to_be_count = 0;
%}

%%
[ \t\n]+                   { /* ignore whitespace */ }
"am"[ \t\n,.;:!?]          { printf("'to be' verb found: %s\n", "am"); to_be_count++; }
"is"[ \t\n,.;:!?]          { printf("'to be' verb found: %s\n", "is"); to_be_count++; }
"are"[ \t\n,.;:!?]         { printf("'to be' verb found: %s\n", "are"); to_be_count++; }
"was"[ \t\n,.;:!?]         { printf("'to be' verb found: %s\n", "was"); to_be_count++; }
"were"[ \t\n,.;:!?]        { printf("'to be' verb found: %s\n", "were"); to_be_count++; }
"be"[ \t\n,.;:!?]          { printf("'to be' verb found: %s\n", "be"); to_be_count++; }
"being"[ \t\n,.;:!?]       { printf("'to be' verb found: %s\n", "being"); to_be_count++; }
"been"[ \t\n,.;:!?]        { printf("'to be' verb found: %s\n", "been"); to_be_count++; }
[a-zA-Z]+                 { /* ignore other words */ }
.                         { /* ignore other characters */ }
%%

int main() {
    printf("Enter text to identify 'to be' verbs (Ctrl+D to end):\n");
    yylex();
    printf("\nTotal 'to be' verbs found: %d\n", to_be_count);
    return 0;
}

int yywrap() {
    return 1;
}