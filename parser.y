%{
#include <stdio.h>
#include "Token.h"

int yylex();

void yyerror(char *s) {
    printf("Error: %s\n", s);
}
%}

%token IDENTIFIER
%token OPERATOR
%token NOTE_MODIFIER
%token NOTE
%token NUMBER
%token STRING

%type <IDENTIFIER> musical_identifier
%type <IDENTIFIER> identifier

%%

program : declaration;

declaration : musical_identifier, "Clef:", "(", { identifier, type, "," }, ")", type, block, "\n";

musical_identifier : notes, { | notes | note_modifiers | number };

notes : NOTE, { NOTE };

note_modifiers : NOTE_MODIFIER, { NOTE_MODIFIER };

block : "{" newline { statement } "}";

statement : assign | print | if_statement | for_statement | var_declaration;

assign : musical_identifier, "=", boolean_expression;

print : "Println", "(", boolean_expression, ")";

if_statement : "if", boolean_expression, block, { "else", block };

for_statement : "for", assign, ";", boolean_expression, ";", assign, block;

var_declaration : "note", musical_identifier, type, { "=", boolean_expression };

boolean_expression : boolean_term, { "||" boolean_term };

boolean_term : relational_expression, { "&&" relational_expression };

relational_expression : expression, { relational_operator expression };

expression : term, { additive_operator term };

term : factor, { multiplicative_operator factor };

factor : NUMBER | STRING | musical_identifier | unary_operator factor | "(" boolean_expression ")" | scan;

scan : "Scanln", "(", ")";

relational_operator : "==" | ">" | "<";

additive_operator : "+" | "-";

multiplicative_operator : "*" | "/";

unary_operator : "+" | "-" | "!";

type : "int" | "string" | "bool" | "float";

newline : "\n";

%%