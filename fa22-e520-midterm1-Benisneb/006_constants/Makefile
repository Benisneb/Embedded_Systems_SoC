a.out: main.c str_len.c input_check.c
	gcc -c main.c
	gcc -c str_len.c
	gcc -c input_check.c
	gcc main.o str_len.o input_check.o -o a.out
	rm -f *.o

clean:
	rm -f a.out

test: a.out
	bash test.sh
