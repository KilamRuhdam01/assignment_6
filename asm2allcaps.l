%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
//void showError();
#include "asm2allcaps.tab.h"
int yywrap();
%}

numbers		[A-Fa-f0-9]+
small		([a-z][a-z][a-z])
caps		([A-Z][A-Z][A-Z])

%%

'extern'.*		return EXTERN;
'section'.*		return SECTION;
'str:'.*		return STR;
'strLen'.*		return STRLEN;
{numbers}		return NUM;
small			{int j =0;
			char ch;
			while(yytext[j]){ 
        		ch = yytext[j]; 
        		putchar(toupper(ch)); 
        		j++; 
    			} return SMALL;}
caps			return CAPS;
[ \t\n]+ 		;
'\n'			return NEWLINE;
','			return COMMA;
';'.*			;
.			;

%%

int yywrap() {
   return 1;
}
