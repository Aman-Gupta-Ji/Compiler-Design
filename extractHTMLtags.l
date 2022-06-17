%{
    #include<stdio.h>
%}

%%
[<].*[>] ECHO;
.* ;
%%

int yywrap() { return 1;}
int main(int ar, char* arg[]) {
    extern FILE *yyin, *yyout;
    yyin=fopen(arg[1],"r");
    yyout=fopen(arg[2],"w");
    yylex();
    return 0;
}