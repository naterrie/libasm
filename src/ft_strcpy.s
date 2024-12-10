bits 64

section .text
	global ft_strcpy

	ft_strcpy:
		mov rax, 0 ; counter

	_while:
		cmp BYTE [rdi + rax], 0x0 ; check if the current character is the null terminator
		je _end ; if it is,
		mov al, BYTE [rdi + rax] ; get the current character in al (lower 8 bits of rax)
		mov BYTE [rsi + rax], al ; copy the current character
		inc rax
		jmp _while

	_end:
		mov rax, rsi
		ret
