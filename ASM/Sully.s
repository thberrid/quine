section .data
	start_index db 5
	data db "section .data%1$c%2$cstart_index db %4$d%1$c%2$cdata db %5$c%3$s%5$c, 0%1$c%2$cfilename :%1$c%2$c%2$c.fmt db %5$c%6$cs%6$cd%6$cs%5$c, 0%1$c%2$c%2$c.prefix db %5$cSully_%5$c, 0%1$c%2$c%2$c.suffix db %5$c.s%5$c, 0%1$csection .text%1$c%2$cextern open%1$c%2$cextern close%1$c%2$cextern dprintf%1$c%2$cextern sprintf%1$c%2$cglobal _start%1$c_start :%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%2$csub rsp, 32%1$c%2$cpush rdi%2$c; for alignment%1$c%2$cpush 0x25%2$c; 6nth arg%1$c%2$cpush 0x22%2$c; 5nth arg%1$c_set_index :%1$c%2$cxor r12, r12%1$c%2$cmov r12b, [start_index]%1$c_loop :%1$c%2$ccmp r12, 0%1$c%2$cjl _end%1$c%2$c; create filename%1$c%2$clea rdi, [rbp - 32]%1$c%2$cmov rsi, filename.fmt%1$c%2$cmov rdx, filename.prefix%1$c%2$cmov rcx, r12%1$c%2$cmov r8, filename.suffix%1$c%2$cxor rax, rax%1$c%2$ccall sprintf%1$c%2$c; open filename%1$c%2$clea rdi, [rbp - 32]%1$c%2$cmov rsi, 102%1$c%2$cmov edx, 511%1$c%2$cmov rax, 0%1$c%2$ccall open%1$c%2$c; save FD%1$c%2$cxor r13, r13%1$c%2$cmov r13, rax%1$c%2$c; write in file%1$c%2$cmov rdi, rax%1$c%2$cmov rsi, data%1$c%2$cmov rdx, 0x0a%1$c%2$cmov rcx, 0x09%1$c%2$cmov r8,  data%1$c%2$cmov r9,  r12%1$c%2$cmov rax, 2%1$c%2$ccall dprintf%1$c%2$c; close%1$c%2$cmov rdi, r13%1$c%2$ccall close%1$c%2$c; dec%1$c%2$csub r12, 1%1$c%2$cjmp _loop%1$c_end :%1$c%2$cmov rsp, rbp%1$c%2$cpop rbp%1$c%2$cmov rbx, 0%1$c%2$cmov rax, 1%1$c%2$cint 0x80", 0
	filename :
		.fmt db "%s%d%s", 0
		.prefix db "Sully_", 0
		.suffix db ".s", 0
section .text
	extern open
	extern close
	extern dprintf
	extern sprintf
	global _start
_start :
	push rbp
	mov rbp, rsp
	sub rsp, 32
	push rdi	; for alignment
	push 0x25	; 6nth arg
	push 0x22	; 5nth arg
_set_index :
	xor r12, r12
	mov r12b, [start_index]
_loop :
	cmp r12, 0
	jl _end
	; create filename
	lea rdi, [rbp - 32]
	mov rsi, filename.fmt
	mov rdx, filename.prefix
	mov rcx, r12
	mov r8, filename.suffix
	xor rax, rax
	call sprintf
	; open filename
	lea rdi, [rbp - 32]
	mov rsi, 102
	mov edx, 511
	mov rax, 0
	call open
	; save FD
	xor r13, r13
	mov r13, rax
	; write in file
	mov rdi, rax
	mov rsi, data
	mov rdx, 0x0a
	mov rcx, 0x09
	mov r8,  data
	mov r9,  r12
	mov rax, 2
	call dprintf
	; close
	mov rdi, r13
	call close
	; dec
	sub r12, 1
	jmp _loop
_end :
	mov rsp, rbp
	pop rbp
	mov rbx, 0
	mov rax, 1
	int 0x80