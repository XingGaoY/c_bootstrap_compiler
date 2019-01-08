%{
#include "node.hpp"
Block *programBlock;
extern int yylex();
void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

%union {
    long ival;   /* integer constant */
    double fval;    /* floating constant */
    Node* node;     /* node ptr */
    NodeExpr* expr;     /* node expr */
    Block *block;
    NodeStmt* stmt;
};
%token IDENTIFIER STRING_LITERAL
%token IF ELSE
%token <ival> INT
%token <fval> FLOAT

%type <expr> constant expr
%type <block> program stmts
%type <stmt> stmt

%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%start program
%%
program
    : stmts {programBlock = $1;}
    ;

stmts
    : { $$ = new Block();
      }
    | stmts stmt { $$->stmts.push_back($2); }
    ;

stmt
    : expr ';' { $$ = new StmtExpr(*$1);}
    ;

expr
    : IDENTIFIER
    | constant
    | STRING_LITERAL
    ;

constant
    : INT { $$ = new ExprInt((long int)$1);}
    | FLOAT {$$ = new ExprFloat($1);}
    ;
%%
