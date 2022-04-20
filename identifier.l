%{
    #include<stdio.h>
    int valid=0, invalid=0;
%}

%%
[a-zA-Z][a-zA-Z0-9]* {valid++;}
.* {invalid++;}
%%

int yywrap() {return 1;}
int main() {
    yylex();
    printf("valid \t: %d\ninvalid \t: %d\n",valid,invalid);
    return 0;
}