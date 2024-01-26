# Bash programming

### Instruction
Write a Bash program to: 
1. create a file named result.log
2. write the phrase "TestString" to the first line of the file
3. write the current username to the second line of the file
4. write host name to the third line of the file
5. write today's date to the forth line of the file
6. print the content of the file to the stdout

### Notes:
- Only change the `create_file.sh` file. Do not change any other files that is used to test your program. 

To run your program first make it executable by changing its permission:
```
chmod +x create_file.sh
```
Then run the program:
```
./create_file.sh
```

To clear previous create log files run:
```
make clean
```

Example execution and output:
```
./create_file.sh
TestString
YourUserName
YourComputerHostName
Fri 04 Mar 2022 11:19:42 PM PST
```