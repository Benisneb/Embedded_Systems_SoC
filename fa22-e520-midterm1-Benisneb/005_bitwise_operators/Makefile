a.out: main.c invert.c input_check.c
	gcc -c main.c
	gcc -c invert.c
	gcc -c input_check.c
	gcc main.o invert.o input_check.o -o a.out
	rm -f *.o

clean:
	rm -f a.out

test: a.out
	bash test.sh
