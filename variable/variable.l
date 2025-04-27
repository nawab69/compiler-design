%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]*    { return VARIABLE; }
[0-9][a-zA-Z0-9]*       { return INVALID; }
[ \t\n]                 { /* Ignore whitespace */ }
.                       { return INVALID; }
%%

int yywrap(void) {
    return 1;
}