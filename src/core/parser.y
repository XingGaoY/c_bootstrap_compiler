%token IDENTIFIER CONSTANT STRING
%token IF ELSE
%%
primary_expression
    : IDENTIFIER
    | CONSTANT
    | STRING
    ;
%%
int main(){
    yyparse();
    return 0;
}
