bits 64

section .text
	global ft_strlen

	ft_strlen:
		xor rax, rax ; counter

	_while:
		cmp BYTE [rdi + rax], 0x0 ; check if the current character is the null terminator
		je _end ; if it is, return
		inc rax ; increment the counter
		jmp _while ; loop

	_end:
		ret
