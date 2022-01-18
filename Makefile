CC = gcc
#CFLAGS = -Wall -Wextra -O0 -g
CFLAGS = -O0 -g

all: demo
	./demo

demo: demo.o libhashmap.so
	$(CC) ${CFLAGS}  -o $@ demo.o -Lshared -lhashmap

demo.o: demo.c
	$(CC) ${CFLAGS} -c $<

libhashmap.so: hashmap.o
	mkdir -p shared
	$(CC) -shared hashmap.o -o shared/$@

hashmap.o: hashmap.c hashmap.h
	$(CC) ${CFLAGS} -fPIC -c $<

clean:
	rm -rf demo *.o shared
