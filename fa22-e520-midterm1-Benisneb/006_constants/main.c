#include <stdio.h>
#include "str_len.h"

int main(int argc, char **argv)
{
    if (input_check(argc, argv) != 0)
        return -1;

  printf("%d\n", str_len(argv[1]));
  return 0;
}
