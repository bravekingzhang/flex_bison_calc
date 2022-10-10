%{
#include "calc.tab.h"
%}
%%
"+"             {return ADD;}
"-"             {return SUB;}
"*"             {return MUL;}
"/"             {return DIV;}
"&"             {return AND;}
"|"             {return ABS;}
"("             {return OP;}
")"             {return CP;}
[0-9]+          {yylval.val = atoi(yytext); return NUMBER; }
0x[a-f0-9]+     {char *ptr;yylval.val = strtol(yytext,&ptr,16);return NUMBER; }
[\n\r]          {return EOL;}
[ \t]           {/*啥都不干*/}
"//".*          {}
.               {printf("unexpected token %s",yytext);}
%%
int yywrap(){
    return 1;
}