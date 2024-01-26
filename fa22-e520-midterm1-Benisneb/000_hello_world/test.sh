#!/bin/bash
echo
echo "-------------------------------"
echo "Running tests for 01.01-hello_world..."
echo "-------------------------------"
echo

output=$(./a.out)
expected_output="Hello World"

if [ $? -eq 0 ] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit -1
fi

if [ "$output" == "$expected_output" ] ; then
  echo "Pass: Output is correct"
else
  echo "Expected '$expected_output' but got: $output"
  exit -1
fi

echo
echo "Result of 01.01-hello_world test"
echo "All tests passed."
echo
exit 0
