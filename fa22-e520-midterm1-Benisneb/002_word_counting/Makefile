a.out: count.c
	gcc count.c -o a.out
	rm -f *.o

clean:
	rm -f a.out

test: a.out
	bash test.sh
