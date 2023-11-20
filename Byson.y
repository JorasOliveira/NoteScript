%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* Define token types */
enum {
    IDENTIFIER,
    NUMBER,
    STRING,
    NOTES,
    NOTE_MODIFIERS,
    ASSIGN,
    IF,
    ELSE,
    FOR,
    VAR,
    PRINT,
    SCAN,
    LPAREN,
    RPAREN,
    LCURLY,
    RCURLY,
    COMMA,
    PLUS,
    MINUS,
    TIMES,
    DIVIDE,
    DOT,
    EQUAL,
    NOT,
    AND,
    OR,
    GREATEREQUAL,
    LESSEQUAL,
    GREATER,
    LESS,
};

// TODO -> alterar para o correto
/* Declare variables */
char *musical_identifier; // TODO -> alterar para o correto
int  *number; // TODO -> alterar para o correto
char *variable_name;
char *variable_type;
char *expression_string;
char *statement_string;

/* Function prototypes */
void parse_statement(void);
int parse_expression(void);
int parse_term(void);
int parse_factor(void);

%}

%%

/* Grammar rules */

program: MUSICAL_IDENTIFIER COMMA Clef LCLY { STATEMENT RCLY } ;

musical_identifier: NOTES NOTE_MODIFIERS* NUMBER* ;

block: LCLY NEWLINE STATEMENT* RCLY ;

statement: ASSIGN | PRINT | IF | FOR | VAR NEWLINE ;

assign: MUSICAL_IDENTIFIER EQUAL expression ;

print: PRINT LPAREN expression RPAREN ;

if: IF expression block ELSE block* ;

for: FOR assign SEMICOLON expression SEMICOLON assign block ;

var: VAR musical_identifier type_specifier assign* ;

type_specifier: INT | STRING | BOOL | FLOAT ;

expression: term expression_list ;

expression_list: PLUS term expression_list | MINUS term expression_list | empty ;

empty: ;

term: factor term_list ;

term_list: TIMES factor term_list | DIVIDE factor term_list | empty ;

factor: NUMBER | STRING | musical_identifier | NOT factor | LPAREN expression RPAREN | SCAN ;

%%