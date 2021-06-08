section .data
	data db "section .data%1$c%2$cdata db %3$c%4$s%3$c%1$c%1$csection .text%1$c%2$cglobal _start%1$c%2$cextern printf%1$c%2$cextern exit%1$c%2$cextern fflush%1$c%1$c_fn :%1$c%2$cmov rax, 0%1$c%2$cret%1$c%1$c; a comment%1$c%1$c_start :%1$c%1$c%2$ccall _fn%1$c%1$c%2$cmov rdi, data%1$c%2$cmov rsi, 0x0a%1$c%2$cmov rdx, 0x09%1$c%2$cmov rcx, 0x22%1$c%2$cmov r8,  data%1$c%2$cxor rax, rax%2$c; because no extra params on stack have to be considered%1$c%1$c%2$ccall printf%1$c%1$c%2$cxor rdi, rdi%1$c%2$ccall fflush%2$c%2$c; because of printf, simply call exit works too%1$c%1$c%2$cmov rbx, 0%2$c%2$c; exit code value%1$c%2$cmov rax, 1%2$c%2$c; sys call #, 1 = exit%1$c%2$cint 0x80%2$c%2$c; call kernel"

section .text
	global _start
	extern printf
	extern exit
	extern fflush

_fn :
	mov rax, 0
	ret

; a comment

_start :

	call _fn

	mov rdi, data
	mov rsi, 0x0a
	mov rdx, 0x09
	mov rcx, 0x22
	mov r8,  data
	xor rax, rax	; because no extra params on stack have to be considered
	
	call printf
	
	xor rdi, rdi
	call fflush		; because of printf, simply call exit works too

	mov rbx, 0		; exit code value
	mov rax, 1		; sys call #, 1 = exit
	int 0x80		; call kernel