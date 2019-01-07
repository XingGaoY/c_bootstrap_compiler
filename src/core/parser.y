%{
#include "node.hpp"
extern int yylex();
void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

%union {
    long ival;   /* integer constant */
    double fval;    /* floating constant */
    Node* node;     /* node ptr */
    NodeExpr* expr;     /* node expr */
};
%token IDENTIFIER STRING_LITERAL
%token IF ELSE
%token <ival> INT
%token <fval> FLOAT

%type <expr> constant

%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%%
primary_expression
    : IDENTIFIER
    | constant
    | STRING_LITERAL
    ;

constant
    : INT { $$ = new ExprInt((long int)$1);}
    | FLOAT {$$ = new ExprFloat($1);}
    ;
%%
