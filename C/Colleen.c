#include <stdio.h>

void fn(void)
{
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
	char n = '\n';
	char t = '\t';
	char q = '"';
	char b = '\\';
	char *s1 = "#include <stdio.h>%c%cvoid fn(void)%c{%c%creturn ;%c}%c%c";
	char *s2 = "/*%c%cout comment%c*/%c%c";
	char *s3 = "int main(void)%c{%c%c/*%c%c%cin comment%c%c%c*/%c";
	char *s4 = "%cchar n = '%cn';%c%cchar t = '%ct';%c%cchar q = '%c';%c%cchar b = '%c%c';%c";
	char *s5 = "%cchar *s1 = %c%s%c;%c%cchar *s2 = %c%s%c;%c%cchar *s3 = %c%s%c;%c%cchar *s4 = %c%s%c;%c%cchar *s5 = %c%s%c;%c%cfn();%c%cprintf(s1, n, n, n, n, t, n, n, n);%c%cprintf(s2 , n, t, n, n, n);%c%cprintf(s3, n, n, t, n, t, t, n, n, t, n);%c%cprintf(s4, t, b, n, t, b, n, t, q, n, t, b, b, n);%c%cprintf(s5, t, q, s1, q, n, t, q, s2, q, n, t, q, s3, q, n, t, q, s4, q, n, t, q, s5, q, n, t, n, t, n, t, n, t, n, t, n, t, n, t, n, n);%c%creturn (0);%c}%c";

	fn();
	printf(s1, n, n, n, n, t, n, n, n);
	printf(s2 , n, t, n, n, n);
	printf(s3, n, n, t, n, t, t, n, n, t, n);
	printf(s4, t, b, n, t, b, n, t, q, n, t, b, b, n);
	printf(s5, t, q, s1, q, n, t, q, s2, q, n, t, q, s3, q, n, t, q, s4, q, n, t, q, s5, q, n, t, n, t, n, t, n, t, n, t, n, t, n, t, n, n);
	return (0);
}
