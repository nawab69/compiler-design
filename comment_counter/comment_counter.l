%{
#include <stdio.h>
#include <stdlib.h>

int comment_lines = 0;
FILE *output_file;
%}

%x SINGLE_LINE_COMMENT
%x MULTI_LINE_COMMENT

%%
"//".* {
    /* Single-line comment - count it and ignore */
    comment_lines++;
}

"/*" {
    /* Start of multi-line comment */
    BEGIN(MULTI_LINE_COMMENT);
    comment_lines++; /* Count the first line of the comment */
}

<MULTI_LINE_COMMENT>"*/" {
    /* End of multi-line comment */
    BEGIN(INITIAL);
}

<MULTI_LINE_COMMENT>\n {
    /* Newline inside multi-line comment */
    comment_lines++;
    fprintf(output_file, "\n"); /* Preserve line numbers in output file */
}

<MULTI_LINE_COMMENT>. {
    /* Any character inside multi-line comment - ignore */
}

\n {
    /* Preserve line breaks in output */
    fprintf(output_file, "\n");
}

. {
    /* Any other character - copy to output */
    fprintf(output_file, "%s", yytext);
}

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s input_file output_file\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        fprintf(stderr, "Cannot open input file %s\n", argv[1]);
        return 1;
    }

    output_file = fopen(argv[2], "w");
    if (output_file == NULL) {
        fprintf(stderr, "Cannot create output file %s\n", argv[2]);
        fclose(input_file);
        return 1;
    }

    yyin = input_file;
    yylex();

    printf("Total comment lines: %d\n", comment_lines);
    printf("Program without comments copied to %s\n", argv[2]);

    fclose(input_file);
    fclose(output_file);
    return 0;
}