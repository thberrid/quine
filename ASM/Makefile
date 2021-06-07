SHELL = /bin/sh
VPATH = .
ASFLAGS = -f elf64
NAME = drquine
BINS = Colleen Grace Sully

.PHONY : all
all : $(NAME)

$(NAME) : $(BINS)

Colleen: Colleen.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc $< -o $@

Grace: Grace.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc $< -o $@

Sully: Sully.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc $< -o $@

%.o: %.s
	nasm $(ASFLAGS) -o $@ $<

.PHONY : clean
clean :
	rm -f $(addsuffix .o, $(BINS))
	rm -f Sully_*.s
	rm -f Grace_kid.s

.PHONY : fclean
fclean : clean
	rm -f $(BINS)

.PHONY : re
re: fclean all