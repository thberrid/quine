SHELL = /bin/sh
VPATH = .
CC = clang
CFLAGS = #-Wall -Wextra -Werror

.SUFFIXES : .c

NAME = drquine

.PHONY : all
all : $(NAME)

$(NAME) : Colleen Grace Sully

Colleen : Colleen.c
	$(CC) -o $@ $< $(CFLAGS)
	
Grace : Grace.c
	$(CC) -o $@ $< $(CFLAGS)

Sully : Sully.c
	$(CC) -o $@ $< $(CFLAGS)

.PHONY : clean
clean :
	rm -f Sully_*.c
	rm -f Grace_kid.c

.PHONY : fclean
fclean : clean
	rm -f Sully Colleen Grace

.PHONY : re
re: fclean all