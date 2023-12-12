%%

%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"
%}

%%

/* Lexical rules */

MUSICAL_IDENTIFIER: [a-zA-Z]+;

NOTES: [a-gA-G];

NOTE_MODIFIERS: [#, b_, maj, m, dim, aug];

NUMBER: [0-9]+

STRING: "([^"]*)" | '([^'])'

LETTER: [a-zA-Z];

DIGIT: [0-9];

%%