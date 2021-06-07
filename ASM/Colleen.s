section .data
	msg db "section .data_%c_msg db %s"

section .text
	global _start
	global _fn
	extern printf

_fn:
	ret

; a comment

_start :
	mov rdi, msg
	mov sil, 10
	lea rdx, [msg]
	mov rcx, 0x22
	mov r8, 0x5c
	mov r9, msg
	call printf
	call _fn

	mov rbx, 0		; exit code value
	mov rax, 1		; sys call #, 1 = exit
	int 0x80		; call kernel