%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS AND
%token EOL
%token OP CP

%start calclist

%union{
    long val;
}

%type <val> exp factor term

%%
calclist:
    | calclist exp EOL {printf("=%ld\n",$2);}
    | calclist EOL {printf("> ");}
    ;

exp: factor
    | exp ADD factor {$$ = $1 + $3;}
    | exp SUB factor {$$ = $1 - $3;}
    ;

factor: term
    | factor MUL term {$$ = $1 * $3;}
    | factor DIV term {$$ = $1 / $3;}
    | factor ABS term {$$ = $1 | $3;}
    | factor AND term {$$ = $1 & $3;}
    ;

term: NUMBER
    | ABS term {$$ = $2 > 0? $2 :-$2;}
    | OP exp CP {$$ = $2}
    ;
%%
int main() {
    printf("> ");
    yyparse();
    return 0;
}
void yyerror(const char *s){
    printf("Syntax Error on line %s\n", s);
}