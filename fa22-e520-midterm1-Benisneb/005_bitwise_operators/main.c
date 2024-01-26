#include <stdio.h> // for printf()
#include <stdlib.h> // for atou()
#include "invert.h"

int main(int argc, char **argv)
{
    if (input_check(argc, argv) != 0)
        return -1;
        
    unsigned int result = invert(
        (unsigned int) atoi(argv[1]), 
        (unsigned int) atoi(argv[2]),
        (unsigned int) atoi(argv[3]));

    printf("%u\n", result);

    return 0;
}