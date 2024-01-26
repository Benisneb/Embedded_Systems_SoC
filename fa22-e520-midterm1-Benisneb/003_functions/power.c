/* Test for a power function. */
#include <stdio.h>

/* power: raise base to n-th power; n >= 0 */
int power(int base, int n)
{
	int pow_out = 0;

	for (int i = n; i > 0; i--){
		pow_out = pow_out + base*base;
	}
	return pow_out;
}
