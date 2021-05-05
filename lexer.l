%option yylineno
%pointer

%{
    #include <cstdlib>
    #include <cerrno>
    #include <climits>
    #include <limits>
    #include "parser.hpp"
    
	void yyerror(const char *);
%}

/* WRITEME: Write any definitions here. You can find information on
            definitions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC10 */

/* WRITEME: If you are going to use start conditions, write them here.
            You can find more information on start conditions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC11
            You will probably want to use exclusive conditions rather
            than inclusive conditions (use the %x instead of the %s). */

%%

  /* WRITEME: Write your Flex token rules here */

[0-9]+              { return T_NUMBER; }
"."                 { return T_DOT; }
"("                 { return T_LPAREN; }
")"                 { return T_RPAREN; }
"or"                { return T_OR; }
"and"               { return T_AND; }
">"                 { return T_GT; }
">="                { return T_GTE; }
"equals"            { return T_EQUALS; }
"+"                 { return T_PLUS; }
"-"                 { return T_MINUS; }
"*"                 { return T_MULT; }
"/"                 { return T_DIV; }
"not"               { return T_NOT; }
"***negative***"    { return U_MINUS }
"true"              { return T_TRUE; }
"false"             { return T_FALSE; }
"."                 { return T_DOT; }
"integer"           { return T_INT; }
"boolean"           { return T_BOOL; }
"none"              { return T_NONE; }
"if"                { return T_IF; }
"else"              { return T_ELSE; }
"while"             { return T_WHILE; }
"do"                { return T_DO; }
"print"             { return T_PRINT; }
"return"            { return T_RETURN; }
"new"               { return T_NEW; }
"extends"           { return T_EXTENDS; }
"/*"                { return T_LCOMM; }
"*/"                { return T_RCOMM; }
"asdfqwer"          { return T_ID; }
[ \t\n]             { }
.                   { yyerror("invalid character"); }

%%

int yywrap(void) {
  return 1;
}
