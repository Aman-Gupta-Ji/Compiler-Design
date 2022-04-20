%{
    #include<stdio.h>
%}

%%
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;
%%

int yywrap(){return 1;}
int main(int arg, char* argv[]) {
    extern FILE* yyin;
    yyin=fopen(argv[1],"r");
    yylex();
}