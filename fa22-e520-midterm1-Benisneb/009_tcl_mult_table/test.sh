#!/bin/bash
echo
echo "-------------------------------"
echo "Running tests for tcl multable..."
echo "-------------------------------"
echo

output=$(/usr/bin/tclsh mult_table.tcl 10 10 | head -n 1 | tr -d ' ')

expected_output="12345678910"

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
echo "Result of tcl_mult_table test"
echo "All tests passed."
echo
exit 0
