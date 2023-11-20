%{
    #include <stdio.h>
    #include <stdlib.h>

    void yyerror(const char *s);
    extern int yylex(void);
    extern char *yytext; 

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
    Clef,
    NEWLINE,
    SEMICOLON,
    INT,
    STRING,
    BOOL,
    FLOAT,
};

/* Function prototypes */
void parse_statement(void);
int parse_expression(void);
int parse_term(void);
int parse_factor(void);

%}

%%

/* Grammar rules */

program: musical_identifier COMMA Clef NEWLINE block ;

musical_identifier: NOTES NOTE_MODIFIERS* NUMBER* ;

block: LCURLY NEWLINE statement* RCURLY ;

statement: assignment | print | if | for | var NEWLINE ;

assignment: musical_identifier EQUAL expression ;

print: PRINT LPAREN expression RPAREN ;

if: IF expression block else_block* ;

else_block: ELSE block ;

for: for_assign SEMICOLON expression SEMICOLON for_assign block ;

for_assign: assignment ;

var: VAR musical_identifier type_specifier assignment* ;

type_specifier: INT | STRING | BOOL | FLOAT ;

expression: term expression_list ;

expression_list: PLUS term expression_list | MINUS term expression_list | empty ;

empty: ;

term: factor term_list ;

term_list: TIMES factor term_list | DIVIDE factor term_list | empty ;

factor: NUMBER | STRING | musical_identifier | NOT factor | LPAREN expression RPAREN | SCAN ;

%%

void yyerror(const char *s) {
    extern int yylval;   // Token value
    fprintf(stderr, "Error near token '%s': %s\n", yytext, s);
}

int main(void) {
    extern int yy_flex_debug;
    yy_flex_debug = 1;
    if (yyparse()) {
        printf("Error in parsing!\n");
        return 1;
    }
    return 0;
}