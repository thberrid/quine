#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
int main (void)
{
	int i = 5;
	char filename[19];
	char *s = "#include <unistd.h>%1$c#include <stdio.h>%1$c#include <sys/types.h>%1$c#include <sys/stat.h>%1$c#include <fcntl.h>%1$cint main (void)%1$c{%1$c%2$cint i = %6$d;%1$c%2$cchar filename[19];%1$c%2$cchar *s = %3$c%5$s%3$c;%1$c%2$cint fd;%1$c%2$cwhile (i)%1$c%2$c{%1$c%2$c%2$csprintf(filename, %3$c%7$cs%7$cd%7$cs%3$c, %3$cSully_%3$c, i, %3$c.c%3$c);%1$c%2$c%2$cfd = open(filename, O_CREAT|O_RDWR, 0777);%1$c%2$c%2$cdprintf(fd, s, '%4$cn', '%4$ct', '%3$c', '%4$c%4$c', s, i, '%7$c');%1$c%2$c%2$cclose(fd);%1$c%2$c%2$ci -= 1;%1$c%2$c}%1$c%2$creturn (0);%1$c}";
	int fd;
	while (i)
	{
		sprintf(filename, "%s%d%s", "Sully_", i, ".c");
		fd = open(filename, O_CREAT|O_RDWR, 0777);
		dprintf(fd, s, '\n', '\t', '"', '\\', s, i, '%');
		close(fd);
		i -= 1;
	}
	return (0);
}