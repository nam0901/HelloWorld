.SUFFIXES:

# specify C standard
STD=-std=c11
# specify C compiler
CC=gcc $(STD)
# specify optimization information
OPT=-O3 -march=x86-64 -mtune=generic -pipe
# specify compile flags
CFLAGS=-Wall -Wextra -pedantic $(OPT)
# preprocessor flags (needed for M_PI)
CPPFLAGS=-D_XOPEN_SOURCE=500
# specify link flags
LDFLAGS=-s
# specify libraries
LIBS=-lm

all:    hello

hello:  main.o hello.o 
	$(CC) $(LDFLAGS) $^ -o $@ $(LIBS)

main.o: main.c hello.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

hello.o: hello.c hello.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	$(RM) main.o hello.o  core

distclean:      clean
	$(RM) hello

.PHONY: all clean distclean
