%union {
    long ival;   /* integer constant */
    double fval;    /* floating constant */
    /* node ptr */
};
%token IDENTIFIER CONSTANT STRING_LITERAL
%token IF ELSE
%token <ival> INT
%token <fval> FLOAT
%%
primary_expression
    : IDENTIFIER
    | CONSTANT
    | STRING_LITERAL
    ;
%%
int main(){
    yyparse();
    return 0;
}
