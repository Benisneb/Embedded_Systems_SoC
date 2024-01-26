a.out: main.c power.c input_check.c
	gcc -c main.c
	gcc -c power.c
	gcc -c input_check.c
	gcc main.o power.o input_check.o -o a.out
	rm -f *.o

clean:
	rm -f a.out

test: a.out
	bash test.sh
