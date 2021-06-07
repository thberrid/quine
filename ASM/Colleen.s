section .data
	msg db "section .data", 0

section .text
	global _start
	global _fn
	extern printf

_fn:
	ret

; a comment

_start :
	mov rdi, msg
	mov rsi, 0x0a
	mov rdx, 0x9
	mov rcx, 0x22
	mov r8, 0x5c
	mov r9, msg
	xor rax, rax
	call printf
	call _fn

	mov rbx, 0		; exit code value
	mov rax, 1		; sys call #, 1 = exit
	int 0x80		; call kernel