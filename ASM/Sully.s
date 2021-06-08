section .data
	%define START_INDEX 5
	data db "ok %4$d", 10, 0
	filename :
		.fmt db "%s%d%s", 0
		.prefix db "Sully_", 0
		.suffix db ".s", 0
		.str times 19 b 0

section .text
	extern open
	extern close
	extern dprintf
	extern sprintf
	global _start

_start :
	push rbp
	mov rbp, rsp
_set_index :
	mov r12, START_INDEX
_loop :
	cmp r12, 0
	je _end

	; create filename

	mov rdi, filename.str
	mov rsi, filename.fmt
	mov rdx, filename.prefix
	mov rcx, r12
	mov r8, filename.suffix
	call sprintf

	; open filename

	mov rdi, filename.str
	mov rsi, 102
	call open
	mov rdi, rax

	; write in file

	mov rax, 2
	push 0x22
	push 0x25
	mov rsi, data
	mov rdx, 0x0a
	mov rcx, 0x09
	mov r8,  data
	mov r9,  r12
	call dprintf

	; close fd

	;mov rdi, [FD]
	;call close
	
	sub r12, 1
	jmp _loop
_end :
	mov rsp, rbp
	pop rbp
	mov rbx, 0
	mov rax, 1
	int 0x80