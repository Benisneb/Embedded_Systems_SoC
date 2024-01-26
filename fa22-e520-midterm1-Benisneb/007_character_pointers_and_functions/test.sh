#!/bin/bash
echo
echo "-------------------------------"
echo "Running tests for 05.05-character_pointers_and_functions..."
echo "-------------------------------"
echo

output=$(./a.out ThisIsOneWord Word)

expected_output="1"

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
echo "Result of 05.05-character_pointers_and_functions test"
echo "All tests passed."
echo
exit 0
