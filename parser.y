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

%%

/* WRITEME: This rule is a placeholder, since Bison requires
            at least one rule to run successfully. Replace
            this with your appropriate start rules. */
start : expr
      ;

/* WRITME: Write your Bison grammar specification here */

expr : expr T_PLUS expr
     | expr T_MINUS expr
     | expr T_MULT expr
     | expr T_DIV expr
     | T_NUMBER
     ;

%%

extern int yylineno;

void yyerror(const char *s) {
  fprintf(stderr, "%s at line %d\n", s, yylineno);
  exit(1);
}
