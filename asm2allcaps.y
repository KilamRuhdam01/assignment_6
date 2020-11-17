%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyparse();
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

%%
prog : 
     stmts;
stmts:
      |stmt stmts;
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

int main(int, char**) {
extern FILE *yyin, *yyout


// open a file handle to a particular file:
  FILE *yyin = fopen("input.asm", "r");
  FILE *yyout = fopen("output.asm", "w");
  // make sure it is valid:
  if (!yyin) {
    cout << "I can't open the file!" << endl;
    return -1;
  }
  // Parse through the input:
  yyparse();
}
