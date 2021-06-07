#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
int main (void)
{
	int i = 5;
	char filename[19];
	char *s = "#include <stdio.h>%1$c#include <sys/types.h>%1$c#include <sys/stat.h>%1$c#include <fcntl.h>%1$cint main (void)%1$c{%1$c%2$cint i = %6$d;%1$c%2$cchar filename[19];%1$c%2$cchar *s = %3$c%5$s%3$c;%1$c%2$cwhile (i)%1$c%2$c{%1$c%2$c%2$csprintf(filename, %3$c%7$cs%7$cd%7$cs%3$c, %3$cSully_%3$c, i, %3$c.c%3$c);%1$c%2$c%2$cdprintf(open(filename, O_CREAT|O_RDWR, 0777), s, '%4$cn', '%4$ct', '%3$c', '%4$c%4$c', s, i, '%7$c');%1$c%2$c%2$ci -= 1;%1$c%2$c}%1$c%2$creturn (0);%1$c}";
	while (i)
	{
		sprintf(filename, "%s%d%s", "Sully_", i, ".c");
		dprintf(open(filename, O_CREAT|O_RDWR, 0777), s, '\n', '\t', '"', '\\', s, i, '%');
		i -= 1;
	}
	return (0);
}