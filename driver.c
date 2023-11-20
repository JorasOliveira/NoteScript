#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

extern int yyparse();

int main() {
    yyparse();
    return 0;
}