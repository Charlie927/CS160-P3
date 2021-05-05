%{
    #include <cstdlib>
    #include <cstdio>
    #include <iostream>

    #define YYDEBUG 1

    int yylex(void);
    void yyerror(const char *);
%}

%error-verbose

/* WRITEME: List all your tokens here */

%token T_DOT T_COMMA T_LPAREN T_RPAREN T_LCOMM T_RCOMM
%token T_INT T_BOOL T_NONE T_NUMBER T_TRUE T_FALSE
%token T_IF T_ELSE T_WHILE T_DO T_PRINT T_RETURN T_NEW T_EXTENDS
%token<std::string> T_ID

/* WRITEME: Specify precedence here */

%left T_OR
%left T_AND
%left T_GT T_GTE T_EQUALS
%left T_PLUS T_MINUS
%left T_MULT T_DIV
%right T_NOT
%right U_MINUS

%type<int> expr

%%

/* WRITEME: This rule is a placeholder, since Bison requires
            at least one rule to run successfully. Replace
            this with your appropriate start rules. */
start : expr
      | method
      ;

expr : expr T_PLUS expr { $$ = $1 + $3 }
     | expr T_MINUS expr { $$ = $1 - $3 }
     | expr T_MULT expr { $$ = $1 * $3 }
     | expr T_DIV expr { $$ = $1 / $3 }
     | T_NUMBER
     ;

method : T_ID T_LPAREN args T_RPAREN
       | T_ID T_DOT T_ID T_LPAREN args T_RPAREN
       ;

args : argsp
     | 
     ;

argsp : argsp T_COMMA expr
      : expr

/* WRITME: Write your Bison grammar specification here */

%%

extern int yylineno;

void yyerror(const char *s) {
  fprintf(stderr, "%s at line %d\n", s, yylineno);
  exit(1);
}
