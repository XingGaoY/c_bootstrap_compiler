/*
 * Simple flex scanner for C.
 *
 *
 */
%{
#include <math.h>
#include <parser.tab.h>
%}

DIGIT [0-9]
ID    [a-z][a-z0-9]*

%%

{DIGIT}+    {
                printf("An integer: %s (%d)\n", yytext,
                       atoi(yytext));
            }

{DIGIT}+"."{DIGIT}*     {
                printf("An float: %s (%g)\n", yytext,
                       atof(yytext));
            }

{ID}            printf("An identifier: %s\n", yytext);
%%

main(){
    yylex();
}
