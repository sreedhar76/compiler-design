%{
#include <stdio.h>
%}

%%
[A-Z]+  printf("%s\n", yytext);
.|\n    ;  // Ignore all other characters
%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
