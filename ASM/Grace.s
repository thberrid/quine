section .data
	filename db "Grace_kid.s", 0
	data db "section .data%1$c%2$cfilename db %3$cGrace_kid.s%3$c, 0%1$c%2$cdata db %3$c%4$s%3$c%1$csection .text%1$c%2$c%5$cdefine ENTRYPOINT _start%1$c%2$c%5$cdefine FLAGS 102%1$c%2$cextern open%1$c%2$cextern dprintf%1$c%2$cglobal ENTRYPOINT%1$c; a comment%1$c%5$cmacro MACRO 0%1$cENTRYPOINT%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$cmov rdi, filename%1$c%2$cmov rsi, FLAGS%1$c%2$ccall open%1$c%2$cmov rdi, rax%1$c%2$cmov rax, 1%1$c%2$cpush 0x25%1$c%2$cmov rsi, data%1$c%2$cmov rdx, 0x0a%1$c%2$cmov rcx, 0x09%1$c%2$cmov r8,  0x22%1$c%2$cmov r9,  data%1$c%2$ccall dprintf%1$c%2$cmov rsp, rbp%1$c%2$cpop rbp%1$c%2$cmov rbx, 0%1$c%2$cmov rax, 1%1$c%2$cint 0x80%1$c%5$cendmacro%1$cMACRO"
section .text
	%define ENTRYPOINT _start
	%define FLAGS 102
	extern open
	extern dprintf
	global ENTRYPOINT
; a comment
%macro MACRO 0
ENTRYPOINT
	push rbp
	mov rbp, rsp
	mov rdi, filename
	mov rsi, FLAGS
	call open
	mov rdi, rax
	mov rax, 1
	push 0x25
	mov rsi, data
	mov rdx, 0x0a
	mov rcx, 0x09
	mov r8,  0x22
	mov r9,  data
	call dprintf
	mov rsp, rbp
	pop rbp
	mov rbx, 0
	mov rax, 1
	int 0x80
%endmacro
MACRO