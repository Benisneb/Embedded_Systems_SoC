#include <stdlib.h> // for atoi()
#include "farenheit_to_celsius.h"

int main(int argc, char **argv)
{
    if (input_check(argc, argv) != 0)
        return -1;
        
    farenheit_to_celsius(
        atoi(argv[1]), 
        atoi(argv[2]), 
        atoi(argv[3]));

    return 0;
}