/* Write a function reverse(s) that reverses the characte string s. 
   Use it to write a program that reverses its input a line at a time. */
#include <stdio.h>
#include <string.h>

#define MAXLINE 1000

void readstring(char s[], int limit);
void reverse(char s[]);

int main(void)
{
    char s[MAXLINE];

    printf("Enter a line:\n");
    readstring(s, MAXLINE);
    reverse(s);
    printf("String reversed: %s\n", s);

    return 0;
}

void readstring(char s[], int lim)
{
    int i, c;

    for (i = 0; ((c = getchar()) != EOF) && (c != '\n') && (i < (lim - 1)); ++i)
        s[i] = c;
    s[i] = '\0';
}

void reverse(char s[]) {
	
	char temp;
	size_t n = strlen(s);

	for ( int j = 0; j < n/2 ; j++ ) {
		temp = s[j];
		s[j] = s[n-j-1];
		s[n-j-1] = temp;
	}
}
