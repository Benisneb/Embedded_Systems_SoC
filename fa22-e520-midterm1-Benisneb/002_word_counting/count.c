/* count lines, words, and characters in input */
#include <stdio.h>

#define IN 1  // inside a word
#define OUT 0 // outside a word

int main(void)
{
    int c;     // To record user char inputs
    int nl;    // To count number of lines
    int nw;    // To count number of words
    int nc;    // To count number of chars
    int state; // Keep track of being inside a word or outside of a word

    state = OUT;
    nl = nw = nc = 0;
    while ( (c = getchar()) != EOF ) {
        nc = nc + 1;

        if ( c == '\n' ) {
            nl = nl + 1;
        }
        if ( (c == ' ') || (c == '\t') || (c == '\n') ) {
            state = OUT;
        }
        else if (state == OUT) {
            state = IN;
            nw = nw + 1;
        }
    }

    printf("%d %d %d\n", nl, nw, nc);
    return 0;
}
