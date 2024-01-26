#!/bin/bash
echo
echo "-------------------------------"
echo "Running tests for 01.09-character_arrays..."
echo "-------------------------------"
echo

output=$(./a.out < test_input.txt | tail -n 1)

expected_output="String reversed: evil war stink"

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
echo "Result of 01.09-character_arrays test"
echo "All tests passed."
echo
exit 0
