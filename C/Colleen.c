#include <stdio.h>

void fn(void)
{
	char a = 0;
	a += 1;
	return ;
}

/*
	out comment
*/

int main(void)
{
	/*
		in comment
	*/
	char *s = "#include <stdio.h>%1$c%1$cvoid fn(void)%1$c{%1$c%2$cchar a = 0;%1$c%2$ca += 1;%1$c%2$creturn ;%1$c}%1$c%1$c/*%1$c%2$cout comment%1$c*/%1$c%1$cint main(void)%1$c{%1$c%2$c/*%1$c%2$c%2$cin comment%1$c%2$c*/%1$c%2$cchar *s = %3$c%5$s%3$c;%1$c%2$cfn();%1$c%2$cprintf(s, '%4$cn', '%4$ct', '%3$c', '%4$c%4$c', s);%1$c%2$creturn (0);%1$c}";
	fn();
	printf(s, '\n', '\t', '"', '\\', s);
	return (0);
}