#include <stdio.h>  // for printf()
#include <string.h> // for strlen

int input_check(int arg_num, char **arg_val)
{
    // Check for number of inputs
    if (arg_num != 3)
    {
        printf("[Error] This program requires 2 inputs: s1 s2\n");
        printf("s is the main word\n");
        printf("t is a substring that needs to be checked if exists at the end of s\n");
        printf("Usecase example\n");
        printf("./a.out ThisIsOneWord Word\n");
        return -1;
    }

    // Check for empty argument
    for (int i = 1; i <= 2; i++)
    {
        if (strlen(arg_val[i]) == 0)
        {
            printf("[Error] argument cannot be empty string\n");
            return -1;
        }
    }
    return 0;
}