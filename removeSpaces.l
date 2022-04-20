%{
	#include<stdio.h>
%}

%%
[ ]+  fprintf(yyout," ");
[\t]+ fprintf(yyout,"\t");
[\n]+ fprintf(yyout,"\n");
. ECHO;
%%
int yywrap() {return 1;}
int main(){
    extern FILE *yyin, *yyout;
    yyin = fopen("sample.txt", "r"); 
    yyout = fopen("output.txt", "w");
    yylex(); 
}