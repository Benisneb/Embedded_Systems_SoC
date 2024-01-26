#include <stdio.h>
#include "swap_macro.h"

int main(void)
{

    int x_i = 3, y_i = 7;
    printf("orig int: x=%d, y=%d\n", x_i, y_i);
    swap(int, x_i, y_i);
    printf("swap int: x=%d, y=%d\n", x_i, y_i);

    char x_c = 'a', y_c = 'b';
    printf("orig char: x=%c, y=%c\n", x_c, y_c);
    swap(char, x_c, y_c);
    printf("swap char: x=%c, y=%c\n", x_c, y_c);

    return 0;
}
