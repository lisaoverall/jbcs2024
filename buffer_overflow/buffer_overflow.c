#include <stdio.h>
#include <unistd.h>

__attribute__((optimize(0))) int main(int argc, char *argv[]) {
    char buffer[16] = {0};

    printf("Enter a string:\n");
    
    size_t n = read(STDIN_FILENO, buffer, 61);
    printf("read %zd bytes\n", n);
    printf("string is: %s\n", buffer);
}
