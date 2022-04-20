%{
    #include<stdio.h>
    int integer=0, floating=0;
%}
sign [-];
digit [0-9];
%%
({sign})?({digit})+ {printf("%s is Integer\n",yytext); integer++;}
({sign})?({digit})*[.]({digit})+ {printf("%s is Floating\n",yytext); floating++;}
.* {printf("Invalid\n");}
%%

int yywrap() {return 1;}
int main() {
    yylex();
    printf("\nTotal\nInteger \t: %d\nFloating \t: %d\n",integer,floating);
    return 0;
}