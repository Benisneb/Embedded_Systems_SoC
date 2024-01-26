a.out: farenheit_to_celsius.c input_check.c main.c
	gcc -c input_check.c
	gcc -c farenheit_to_celsius.c
	gcc -c main.c
	gcc input_check.o farenheit_to_celsius.c main.o -o a.out
	rm -f *.o

clean:
	rm -f a.out

test: a.out
	bash test.sh
