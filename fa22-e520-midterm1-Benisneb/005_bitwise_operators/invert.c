/* 
    Write a function that accepts an unsigned integer x
    and inverts its first n least significant bits starting at
    position p going toward LSB.
    For example:
    x = 8 ; ... 1000
    n = 3 <- invert 3 bits
    p = 3 <- start bit is bit 3

    So we need to invert bits 3, 2, 1. Bit 0 stays unchanged because we only need to change 3 bits starting at position 3.

    Our number 8 in binary is (0000 0000 0000 0000 0000 0000 0000 1000)
    Our mask needs to be      (0000 0000 0000 0000 0000 0000 0000 1110)
    Our result will be        (0000 0000 0000 0000 0000 0000 0000 0110)
*/

#include <stdio.h>

unsigned int invert(unsigned int x, unsigned int n, unsigned int p)
{
    /* >> Change ME! Write your code here. Some insturction is given to help you solve this problem. */
    
    /* Place zeros in the rightmost n bits and make mask with ones in the rightmost n bits */
    
    /* Calculate how many positions you need to move to the left to start at position p */
    
    /* Shift mask so that mask bits will start at correct position */
    
    /* Toggle targeted bits and return the result */
	unsigned int Mask = 0;
	unsigned int startP = p+1;

	for (int i=0; i<n; i++) {
		Mask = Mask << 1;
		Mask = Mask + 1;
	}	

	if (startP >= n) {
		Mask = Mask << (startP - n);
	} else {
		Mask = Mask >> (n - startP);
	}

	return (x ^ Mask);
}
