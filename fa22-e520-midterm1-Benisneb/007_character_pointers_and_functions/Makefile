a.out: main.c strend.c input_check.c
	gcc -c main.c
	gcc -c strend.c
	gcc -c input_check.c
	gcc main.o strend.o input_check.o -o a.out
	rm -f *.o

clean:
	rm -f a.out

test: a.out
	bash test.sh
