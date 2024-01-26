a.out: main.c swap_macro.h
	gcc main.c -o a.out
	rm -f *.o

clean:
	rm -f a.out

test: a.out
	bash test.sh
