# NoteScript
A programming language that you (hopefully) can play with your favorite instrument.


# EBNF (Extended Backus-Naur Form)

### Grammar Definitions

PROGRAM = MUSICAL_IDENTIFIER, ", ", Clef, { STATEMENT } ;

MUSICAL_IDENTIFIER = NOTES, {λ | NOTES | NOTE_MODIFIERS | NUMBER };
NOTES = (a | b | c | d | e | f | g | A | B | C | D | E | F | G )  ;
NOTE_MODIFIERS = (# | b_ | maj | m | dim | aug ) ;

BLOCK = "{", "\n", { STATEMENT }, "}" ;
STATEMENT = ( λ | ASSIGN | PRINT | IF | FOR | VAR), "\n" ;

ASSIGN = MUSICAL_IDENTIFIER, "=", BOOLEAN EXPRESSION ;

PRINT = "Println", "(", BOOLEAN EXPRESSION, ")" ;

IF = "if", BOOLEAN EXPRESSION, BLOCK, { "else", BLOCK } ;
FOR = "for", ASSIGN, ";", BOOLEAN EXPRESSION, ";", ASSIGN, BLOCK ;
VAR = "note", MUSICAL_IDENTIFIER, ( "int" | "string" ), ( λ | "=", BOOLEAN EXPRESSION ) ;

BOOLEAN EXPRESSION = BOOLEAN TERM, { "||" BOOLEAN TERM } ;
BOOLEAN TERM = RELATIONAL EXPRESSION, { "&&", RELATIONAL EXPRESSION } ;

RELATIONAL EXPRESSION = EXPRESSION, { ("==" | ">" | "<"), EXPRESSION } ;

EXPRESSION = TERM, { ("+" | "-" | "." ), TERM } ;
TERM = FACTOR, { ("*" | "/"), FACTOR } ;
FACTOR = NUMBER | STRING | MUSICAL_IDENTIFIER | (("+" | "-" | "!"), FACTOR) | "(", BOOLEAN EXPRESSION, ")" | SCAN ;

SCAN = "Scanln", "(", ")" ;


IDENTIFIER = LETTER, { LETTER | DIGIT | "_" } ;
NUMBER = DIGIT, { DIGIT } ;
STRING = ( `"` | `'` ), { λ | LETTER | DIGIT }, ( `"` | `'` ) ;
LETTER = ( a | ... | z | A | ... | Z ) ;
DIGIT = ( 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ) ;

![alt text](diagrama.png)
