/*
 * Simple flex scanner for C.
 *
 *
 */
%{
#include <math.h>
#include <node.hpp>
#include "parser.tab.hpp"
extern "C" int yywrap(){}
%}

DIGIT [0-9]
H     [a-zA-Z0-9]
E     [Ee][+-]?{DIGIT}+
P     [Pp][+-]?{H}+
ID    [a-z][a-z0-9]*
IS    (u|U|l|L)*
FS    (f|F|l|L)
%%

{DIGIT}+{IS}? {
                /* decimal constant */
                yylval.ival = atoi(yytext);
                return INT; 
              }

{DIGIT}*"."{DIGIT}+({E})?{FS}? {
                /* decimal float constant */    
                yylval.fval = atof(yytext);
                return FLOAT;
              }

["+""-""*""/"] {
                return *yytext;
              }

">="    return GE;
"<="    return LE;
"=="    return EQ;
"!="    return NE;

{ID}            printf("An identifier: %s\n", yytext);
[ \t\v\n\f] ;   /* ignore whitespace */
%%
