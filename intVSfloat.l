%{
    #include<stdio.h>
    int integer=0, floating=0;
%}

%%
[-+]?[0-9]+ {ECHO; integer++;}
[-+]?[0-9]*[.][0-9]+ {ECHO; floating++;}
.* {printf("Invalid\n");}
%%

int yywrap() {return 1;}
int main() {
    yylex();
    printf("Integer \t: %d\nFloating \t: %d\n",integer,floating);
    return 0;
}