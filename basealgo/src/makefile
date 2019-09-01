#### a sub-make configuration file
CC=gcc
RM=-rm -f
target=algo
obj=base.o
all:$(obj)
	$(CC) $(obj) -Wall -o ../../$(target)
%.o:%.c
	$(CC) -c $^ -o $@ -I ../inc
.PHONY:clean
clean:
	$(RM) *.o $(target)
