SHELL = /bin/sh
VPATH = .
CC = clang
CFLAGS = #-Wall -Wextra -Werror

.SUFFIXES : .c

NAME = drquine

.PHONY : all
all : $(NAME)

$(NAME) : Sully Collen Grace

Sully : Sully.c
	$(CC) -o $@ $< $(CFLAGS)

Collen : Collen.c
	$(CC) -o $@ $< $(CFLAGS)
	
Grace : Grace.c
	$(CC) -o $@ $< $(CFLAGS)

.PHONY : clean
clean :
	rm -f Sully Collen Grace

.PHONY : fclean
fclean : clean

.PHONY : re
re: fclean all