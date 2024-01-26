# Bitwise Operators

### Instruction
Write a function that accepts an unsigned integer x
and inverts its first n least significant bits starting at
position p going toward LSB.

Example 1:

x = 8;  ... 0000 1000  
n = 3;  invert 3 bits  
p = 3;  start bit is bit 3  

So we need to invert bits 3, 2, 1. Bit 0 stays unchanged because we only need to change 3 bits starting at position 3.

Our number 8 in binary is (0000 0000 0000 0000 0000 0000 0000 1000)
Our mask needs to be      (0000 0000 0000 0000 0000 0000 0000 1110)
Our result will be        (0000 0000 0000 0000 0000 0000 0000 0110)

Example 2:

x = 10;  ... 0000 1010  
n = 3;  invert 4 bits  
p = 3;  start bit is bit 3  

So we need to invert bits 3, 2, 1 and 0.

Our number 8 in binary is (0000 0000 0000 0000 0000 0000 0000 1010)
Our mask needs to be      (0000 0000 0000 0000 0000 0000 0000 1111)
Our result will be        (0000 0000 0000 0000 0000 0000 0000 0101)

Example 3:

x = 15;  ... 0000 1111  
n = 1;  invert 1 bits  
p = 5;  start bit is bit 5  

So we need to invert bits 5. Bits 4, 3, 2, 1 and 0 stay unchanged.

Our number 8 in binary is (0000 0000 0000 0000 0000 0000 0000 1111)
Our mask needs to be      (0000 0000 0000 0000 0000 0000 0010 0000)
Our result will be        (0000 0000 0000 0000 0000 0000 0010 1111)

### Notes:
- Only change the `invert.c` file. Do not change any other files that is used to test your program.
- Follow the comments in the invert() to complete your code 

To compile your program run:
```
make
```

To clear previous build files run:
```
make clean
```

Example execution and output:
```
./a.out 8 3 3
6
```