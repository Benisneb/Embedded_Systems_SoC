# Variables, loop, and printf formatting

### Instruction
Update the `farenheit_to_celsius.c` to accept
3 inputs (int lower, int upper, int step) and print
a Fahernheit-Celsius table. Format your output to show
maximum of 3 digits with zero decimal place for the celsius and 
maximum of 6 digits with 1 decimal place for farenheit.

### Notes:
- Only change the `farenheit_to_celsius.c` file. Do not change any other files that is used to test your program.
- You can use the following format "%3.0f %6.1f\n"
- farenheit to celsius formula is (5.0/9.0) * (fahr-32)


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
./a.out 30 100 20
30 -1.1
50 10.0
70 21.1
90 32.2
```