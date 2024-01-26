#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    printf("Moving files for nginx configuration:\n");

    system("cp * /var/www/html/ /var/www/localhost/html");

    printf("Dashboard configuration moved to server.");

    return 0;
}
