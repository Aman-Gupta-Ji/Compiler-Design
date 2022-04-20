%{
    #include<stdio.h>
    int integer=0, floating=0;
%}
sign [-+];
digit [0-9];
%%
[{sign}]{0,1}[{digit}]+ {printf("Integer\n"); integer++;}
[{sign}]{0,1}[{digit}]*[.][{digit}]+ {printf("Floating\n"); floating++;}
.* {printf("Invalid\n");}
%%

int yywrap() {return 1;}
int main() {
    yylex();
    printf("\nTotal\nInteger \t: %d\nFloating \t: %d\n",integer,floating);
    return 0;
}