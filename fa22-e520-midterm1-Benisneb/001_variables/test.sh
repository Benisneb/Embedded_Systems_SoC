#!/bin/bash
echo
echo "-------------------------------"
echo "Running tests for 01.02-variables..."
echo "-------------------------------"
echo

output=$(./a.out 32 32 1)
expected_output=" 32    0.0"

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
echo "Result of 01.02-variables test"
echo "All tests passed."
echo
exit 0
