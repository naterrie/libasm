bits 64

extern ft_strlen
extern ft_strcpy
extern malloc

section .text
	global ft_strdup

	ft_strdup:
		push rdi ; save the pointer to the string
		call ft_strlen
		mov rdi, rax
		call malloc wrt ..plt
		pop rsi ; restore the pointer to the string
		cmp rax, 0
		je _end
		mov rdi, rax
		call ft_strcpy
		ret

	_end:
		ret
