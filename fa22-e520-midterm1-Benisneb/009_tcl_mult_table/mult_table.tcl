#!/usr/bin/tclsh

proc multable {rows cols} {
    # Change ME! Write your code here. Some insturction is given to help you solve this problem. 
    
    # If you struggle read the following wiki page
    # https://en.wikibooks.org/wiki/Tcl_Programming/Examples
    
    # Create an empty list
    
    # Create a nested loop 
    # The outer loop should traverse rows
    # The inner loop should traverse cols
    # Use the following code to perform the multiplication, format the result and append it to your list 
    # append res [format %4d [expr {$i*$j}]]
    # At the end of your inner loop add a new line to the list to show each row on a separate line
    
}

if { $argc != 2 } {
    puts "The multable.tcl script requires two numbers to be inputed."
    puts "For example, tclsh multable.tcl 10 10"
    puts "Please try again."
} else {
    multable [lindex $argv 0] [lindex $argv 1]
}