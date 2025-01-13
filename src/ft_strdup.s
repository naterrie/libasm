bits 64

extern ft_strlen
extern ft_strcpy
extern malloc

section .text
	global ft_strdup

	ft_strdup:
		push rdi ; save the pointer to the string
		call ft_strlen
		inc rax ; add 1 to the length of the string
		mov rdi, rax
		push rax
		call malloc wrt ..plt
		pop rdi
		dec rdi
		pop rsi ; restore the pointer to the string
		cmp rax, 0
		je _end
		mov BYTE [rax + rdi], 0
		mov rdi, rax
		call ft_strcpy
		ret

	_end:
		ret
