#include "lex.h"

int main(){
    char* src = "ie.c";
    FILE *fp = fopen(src, "r");
    input(fp);
    fclose(fp);
    return 0;
}
