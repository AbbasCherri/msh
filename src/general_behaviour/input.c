#include <stdio.h>
#include <string.h>

void print_buffer();

#define BUFFER_SIZE 300

char buffer[BUFFER_SIZE];

int take_input() {
    while (1) {
        printf("msh>");
        
        if (fgets(buffer, BUFFER_SIZE, stdin) != NULL) {
            buffer[strcspn(buffer, "\n")] = '\0';
        } else {
            printf("ERROR TAKING INPUT\n");
            return -1;
        }

        print_buffer();
    }
    return 0;
}

void print_buffer() {
    int i;
    for (i = 0; i < BUFFER_SIZE && buffer[i] != '\0'; i++) {
        printf("%c", buffer[i]);
    }
    printf("\n");

}

void clear_buffer() {
    for (int i = 0; i < BUFFER_SIZE && buffer[i] != '\0'; i++) {
        buffer[i] = '\0';
    }
}