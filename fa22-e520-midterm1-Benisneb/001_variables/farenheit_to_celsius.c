/*
  Update the `farenheit_to_celsius.c` to accept
  3 inputs (int lower, int upper, int step) and print
  a Fahernheit-Celsius table. Format your output to show
  maximum of 3 digits with zero decimal place for the celsius and 
  maximum of 6 digits with 1 decimal place for farenheit.
  Hint1: "%3.0f %6.1f\n"
  Hint2: farenheit to celsius formula: (5.0/9.0) * (fahr-32)
  
  To compile your program run:
  make
  To clear previous build files run:
  make clean

  Example execution and output:
  ./a.out 30 100 20
    30 -1.1
    50 10.0
    70 21.1
    90 32.2
*/

#include <stdio.h>  // for printf()

void farenheit_to_celsius(int lower, int upper, int step)
{
	double tmp_pointer = lower;
	double C_value;
	
	while ( tmp_pointer <= upper ) {
		C_value = (5.0/9.0)*(tmp_pointer - 32);
		printf("%3.0f %6.1f\n", tmp_pointer, C_value);
		tmp_pointer = tmp_pointer + step;
	}
}
