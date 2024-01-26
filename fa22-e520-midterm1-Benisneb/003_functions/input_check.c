#include <stdio.h>  // for printf()
#include <string.h> // for strlen

int input_check(int arg_num, char **arg_val)
{
    // Check for number of inputs
    if (arg_num != 3)
    {
        printf("[Error] This program requires 2 inputs: base power\n");
        printf("Usecase example\n");
        printf("./a.out 2 4\n");
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