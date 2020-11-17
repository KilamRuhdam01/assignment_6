%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
extern FILE *yyout;
void yyerror(const char *s);
%}

%token	NUM
%token	SMALL
%token	CAPS
%token	NEWLINE
%token	COMMA
%token	EXTERN
%token	SECTION
%token	STR
%token	STRLEN
%type <name> SMALL
%type <name> CAPS
%type <name> NUM
%type <name> EXTERN
%type <name> SECTION
%type <name> STR
%type <name> STRLEN
%type <name> COMMA
%union{
	  char name[100];
}
%%
prog : 
     stmts;
stmts:
      |stmt NEWLINE stmts;
stmt:
	 EXTERN
	{
	fprintf(yyout, "%s \n",$1);
	}

	|SECTION
	{
	fprintf(yyout, "%s \n", $1);
	}

	| STR
	{fprintf(yyout, "%s \n", $1);}

	|STRLEN
	{fprintf(yyout, "%s \n", $1);}

	|CAPS CAPS COMMA NUM
	{fprintf(yyout, "%s %s %s %s", $1,$2,$3,$4);}

	|CAPS CAPS COMMA CAPS
        {fprintf(yyout, "%s %s %s %s", $1,$2,$3,$4);}

	|CAPS NUM
        {fprintf(yyout, "%s %s", $1,$2);}

	|SMALL SMALL COMMA NUM
        {fprintf(yyout, "%s %s %s %s", $1,$2,$3,$4);}

        |SMALL SMALL COMMA SMALL
        {fprintf(yyout, "%s %s %s %s", $1,$2,$3,$4);}

        |SMALL NUM
        {fprintf(yyout, "%s %s", $1,$2);} 
%%

int main() {
// open a file handle to a particular file:
  FILE *yyin = fopen("input.asm", "r");
  FILE *yyout = fopen("output.asm", "w");
  // Parse through the input:
  yyparse();
}
