/* 
  Write the function strend(s,t), which returns 1 if the string t occurs at the
  end of the string s and zero otherwise. 
*/

int strend(char *s, char *t)
{
  /* >> Change ME! Write your code here. Some insturction is given to help you solve this problem. */

  // Use pointer arithmatic (e.g s++) to move the s pointer to the end of the string
  // You need to keep looking for termination char '\0' and end your loop when you are at the end of string

  // Set a variable to keep track of number of characters in t

  // Use pointer arithmatic (e.g t++) to move the t pointer to the end of the string
  // While moving to the end of the t string keep track of the number of characters you traversed

  // Now move back to the start of the string by using pointer arithmatic (e.g s-- , t--)
  // and look dereference both pointers and check if they are equal (e.g *s-- == *t--)
  // You need to stop when you have traversed all the characters of t (e.g n-- until n > 0)


  // If n is still greater than 0 it means you got out of the search due to finding substrings that
  // were not the same. So return 0 to indicate t was not at the end of s. Otherwise return 1 to indicate
  // t was at the end of s

}