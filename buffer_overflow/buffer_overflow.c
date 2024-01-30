#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    char buffer[16] = {0};
    
    printf("Enter a string:\n");
    
    read(STDIN_FILENO, buffer, 61);
    printf("string is: %s\n", buffer);
}
