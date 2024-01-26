#!/bin/bash
echo
echo "-------------------------------"
echo "Running tests for 02.03-constants..."
echo "-------------------------------"
echo

output=$(./a.out 'This is a long string')

expected_output="21"

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
echo "Result of 02.03-constants test"
echo "All tests passed."
echo
exit 0
