#include <stdio.h> // for printf()
#include <stdlib.h> // for atoi()
#include "power.h"

int main(int argc, char **argv)
{
    if (input_check(argc, argv) != 0)
        return -1;
        
    int result = power(
        atoi(argv[1]), 
        atoi(argv[2]));

    printf("%d\n", result);

    return 0;
}