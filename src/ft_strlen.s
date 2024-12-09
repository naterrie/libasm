bits 64

section .text
	global ft_strlen

	ft_strlen:
		mov rax, 0

	_while:
		cmp BYTE [rdi + rax], 0x0
		je _end
		inc rax
		jmp _while

	_end:
		ret
