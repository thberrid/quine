#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#define OPEN(S) (open((S), O_CREAT|O_RDWR, 0777))
#define s "#include <stdio.h>%1$c#include <sys/types.h>%1$c#include <sys/stat.h>%1$c#include <fcntl.h>%1$c#define OPEN(S) (open((S), O_CREAT|O_RDWR, 0777))%1$c#define s %3$c%5$s%3$c%1$c#define m int main(void){ dprintf(OPEN(%3$cGrace_kid.c%3$c), s, '%4$cn', '%4$ct', '%3$c', '%4$c%4$c', s); return (0); }%1$c/*%1$c%2$ccommentaire%1$c*/%1$cm"
#define m int main(void){ dprintf(OPEN("Grace_kid.c"), s, '\n', '\t', '"', '\\', s); return (0); }
/*
	commentaire
*/
m