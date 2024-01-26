#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    printf("Flashing LED 0 and 1 [^Z to Stop]: \n");

    system("echo 1012 > /sys/class/gpio/export");
    system("echo out > /sys/class/gpio/gpio1012/direction");
    
    system("echo 1013 > /sys/class/gpio/export");
    system("echo out > /sys/class/gpio/gpio1013/direction");

    system("echo 1014 > /sys/class/gpio/export");
    system("echo out > /sys/class/gpio/gpio1014/direction");

    system("echo 1015 > /sys/class/gpio/export");
    system("echo out > /sys/class/gpio/gpio1015/direction");

    int count = 0;

    if (argc > 1){

    	while(count < argv[1]){
        	system("echo 0 > /sys/class/gpio/gpio1012/value");
		system("echo 0 > /sys/class/gpio/gpio1013/value");
		system("echo 0 > /sys/class/gpio/gpio1014/value");
		system("echo 0 > /sys/class/gpio/gpio1015/value");
		sleep(2);
		system("echo 1 > /sys/class/gpio/gpio1012/value");
		system("echo 1 > /sys/class/gpio/gpio1013/value");
		system("echo 0 > /sys/class/gpio/gpio1014/value");
		system("echo 0 > /sys/class/gpio/gpio1015/value");
		sleep(2);
		system("echo 0 > /sys/class/gpio/gpio1012/value");
        	system("echo 0 > /sys/class/gpio/gpio1013/value");
        	system("echo 1 > /sys/class/gpio/gpio1014/value");
        	system("echo 1 > /sys/class/gpio/gpio1015/value");
        	sleep(2);
		system("echo 1 > /sys/class/gpio/gpio1012/value");
        	system("echo 1 > /sys/class/gpio/gpio1013/value");
        	system("echo 1 > /sys/class/gpio/gpio1014/value");
        	system("echo 1 > /sys/class/gpio/gpio1015/value");
        	sleep(2);
		count += 1;
    	}
    }
    system("echo 0 > /sys/class/gpio/gpio1012/value");
    system("echo 0 > /sys/class/gpio/gpio1013/value");
    system("echo 0 > /sys/class/gpio/gpio1014/value");
    system("echo 0 > /sys/class/gpio/gpio1015/value");
    return 0;
}
