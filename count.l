%{
    // count characters, tabs, spaces, new lines
    #include<stdio.h>
    int spaces=0, characters=0, tabs=0, newlines=0;
%}

%%
[ ] {spaces++;}
\n  {newlines++;}
\t  {tabs++;}
.   {characters++;}
%%

int yywrap() { return 1;}
int main() {
    yylex();
    printf("Spaces \t: %d\nTabs \t: %d\nNewLines\t: %d\nCharacter\t: %d\n",spaces,tabs,newlines,characters);
    return 0;
}