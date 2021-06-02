SHELL = /bin/sh
VPATH = .
CC = clang
CFLAGS = -Wall -Wextra -Werror

.SUFFIXES : .c

NAME = drquine

.PHONY : all
all : $(NAME)

$(NAME) : Sully Collen Grace

Sully : Sully.s
	$(CC) -o $@ $< $(CFLAGS)

Collen : Collen.s
	$(CC) -o $@ $< $(CFLAGS)
	
Grace : Grace.s
	$(CC) -o $@ $< $(CFLAGS)

.PHONY : clean
clean :
	rm -f Sully Collen Grace

.PHONY : fclean
fclean : clean

.PHONY : re
re: fclean all