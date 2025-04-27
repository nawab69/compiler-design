%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
a       { return A; }
b       { return B; }
c       { return C; }
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Invalid character: %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}