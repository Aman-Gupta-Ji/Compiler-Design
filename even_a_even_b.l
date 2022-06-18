%{
	#include<stdio.h>
%}
rex ((aa|bb)|(ab|ba)(aa|bb)*(ba|ab))*
%%
{rex} printf("Accepted\n");
.* printf("Not Accepted\n");
%%
int yywrap() {return 1;}
int main() {
    yylex();
    return 0; 
}