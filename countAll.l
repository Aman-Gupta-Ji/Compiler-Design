%{
    #include<stdio.h>
    int sp=0, nl=0, t=0, ch=0;
%}

%%
[ ] {sp++; ch++;}
\t {t++; ch++;}
\n {nl++; ch++;}
. {ch++;}
%%

int yywrap() {return 1;}
int main(int arg, char* argv[]) {
    extern FILE *yyin, *yyout;
    yyin = fopen(argv[1],"r");
    yyout = fopen("./output.txt","w");
	yylex();
	fprintf(yyout," Spaces: %d \n",sp);
	fprintf(yyout," Tabs: %d \n",t);
	fprintf(yyout," Lines: %d \n",nl);
	fprintf(yyout," words: %d \n",ch);
    printf("space \t = %d\ntab \t = %d\nnew line = %d\nchacters = %d\n",
    sp,t,nl,ch);
    return 0;
}