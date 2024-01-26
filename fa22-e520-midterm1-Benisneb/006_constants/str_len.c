/* 
    Write a function that returns the length of the string s
*/

unsigned int str_len(const char s[])
{
  /* >> Change ME! Write your code here. Some insturction is given to help you solve this problem. */

  /* Declare a variable to keep track of the number of characters in s */
  
  /* Write a loop to traverse the string and count the number of characters until you find '\0'. */
  
  /* Return number of characters you counted. */

	int tmp = 0;
	char c = s[0];

	while ( c != '\0' ) {
		tmp ++;
		c = s[tmp];
	}

	return tmp;
}
