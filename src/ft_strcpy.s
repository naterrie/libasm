bits 64

section .text
	global ft_strcpy

	ft_strcpy:
		xor rax, rax				; counter

	_while:
		cmp BYTE [rsi + rax], 0x0	; check if the current character is the null terminator
		je _end						; if it is,
		mov dl, BYTE [rsi + rax]	; get the current character in al (lower 8 bits of rax)
		mov BYTE [rdi + rax], dl	; copy the current character
		inc rax
		jmp _while

	_end:
		mov rax, rdi
		ret
