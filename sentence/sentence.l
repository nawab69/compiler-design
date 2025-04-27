%{
#include <stdio.h>
#include <string.h>

/* 
   This program identifies whether a sentence is:
   - Simple: Contains a single independent clause
   - Compound: Contains multiple independent clauses joined by coordinating conjunctions
   - Complex: Contains at least one independent clause and at least one dependent clause
*/

int coord_conjunctions = 0;    /* Count of coordinating conjunctions (and, but, or, nor, for, yet, so) */
int subord_conjunctions = 0;   /* Count of subordinating conjunctions */
int clauses = 0;               /* Total number of clauses */
char sentence[1000];           /* Store the input sentence */
%}

%%
[Aa][Nn][Dd]|[Bb][Uu][Tt]|[Oo][Rr]|[Nn][Oo][Rr]|[Ff][Oo][Rr]|[Yy][Ee][Tt]|[Ss][Oo]    { 
    coord_conjunctions++; 
    strcat(sentence, yytext);
    strcat(sentence, " ");
}

[Aa][Ff][Tt][Ee][Rr]|[Aa][Ll][Tt][Hh][Oo][Uu][Gg][Hh]|[Aa][Ss]|[Bb][Ee][Cc][Aa][Uu][Ss][Ee]|[Bb][Ee][Ff][Oo][Rr][Ee]|[Ii][Ff]|[Ss][Ii][Nn][Cc][Ee]|[Tt][Hh][Aa][Tt]|[Ww][Hh][Ee][Nn]|[Ww][Hh][Ii][Ll][Ee]|[Ww][Hh][Oo]|[Ww][Hh][Ii][Cc][Hh]|[Ww][Hh][Aa][Tt]|[Hh][Oo][Ww]|[Ww][Hh][Ee][Rr][Ee]    { 
    subord_conjunctions++; 
    strcat(sentence, yytext);
    strcat(sentence, " ");
}

[.!?]    { 
    clauses++; 
    strcat(sentence, yytext);
}

[,;:]    {
    strcat(sentence, yytext);
    strcat(sentence, " ");
}

[^ \t\n,;:.!?]+    { 
    strcat(sentence, yytext);
    strcat(sentence, " ");
}

[ \t\n]+    { /* Ignore whitespace */ }

%%

int main() {
    printf("Enter a sentence to analyze (end with '.' or '!' or '?' and press Enter):\n");
    sentence[0] = '\0'; /* Initialize the sentence string */
    yylex();
    
    printf("\nAnalyzing sentence: %s\n\n", sentence);
    
    /* Use the counts to determine sentence type */
    if (clauses == 0) {
        printf("Not a valid sentence (no ending punctuation).\n");
    } else if (subord_conjunctions > 0) {
        printf("Complex sentence: Contains at least one dependent clause.\n");
        printf("Found %d subordinating conjunction(s).\n", subord_conjunctions);
    } else if (coord_conjunctions > 0) {
        printf("Compound sentence: Multiple independent clauses joined by coordinating conjunction(s).\n");
        printf("Found %d coordinating conjunction(s).\n", coord_conjunctions);
    } else {
        printf("Simple sentence: Contains a single independent clause.\n");
    }
    
    return 0;
}

int yywrap() {
    return 1;
}