%{
#include <stdio.h>
#include <ctype.h>

void add_to_list(char *item, FILE *file) {
    fprintf(file, "%s\n", item);
}

FILE *numbers_file;
FILE *words_file;
%}

%%

[0-9]+ { // Matches numbers
    add_to_list(yytext, numbers_file);
}

[a-zA-Z]+ { // Matches words
    add_to_list(yytext, words_file);
}

[ \t\n]+ ; // Ignore whitespace

. ; // Ignore any other character

%%

int main() {
    numbers_file = fopen("numbers.txt", "w");
    words_file = fopen("words.txt", "w");

    if (!numbers_file || !words_file) {
        fprintf(stderr, "Error opening files.\n");
        return 1;
    }

    yylex();

    fclose(numbers_file);
    fclose(words_file);

    printf("Numbers have been written to numbers.txt\n");
    printf("Words have been written to words.txt\n");

    return 0;
}

int yywrap() {
    return 1;
}
