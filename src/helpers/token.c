#include <stdio.h>

typedef enum {
    TOKEN_EXIT,

} TokenType;

typedef struct { 
    TokenType value;
    char* sequence;
    int (*associated_func)();
} Token;