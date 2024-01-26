#include <stdio.h>
#include "strend.h"

int main(int argc, char **argv)
{
    if (input_check(argc, argv) != 0)
        return -1;

  printf("%d\n", strend(argv[1], argv[2]));
  return 0;
}
