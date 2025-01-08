section .text
	global ft_strcmp

	ft_strcmp:
	xor rax, rax			; equale to move rax, 0

	_while:
		mov al, BYTE [rdi]	; Load byte from s1 into al
		mov dl, BYTE [rsi]	; Load byte from s2 into dl
		cmp al, dl
		jne _end			; if not equal

		test al, al			; Check if al == 0
		je _end				; if strings are equal

		inc rdi				; Move to next character in s1
		inc rsi				; Move to next character in s2
		jmp _while

	_end:
		cmp al, dl			; Compare the last characters
		jl _less			; if s1 < s2
		mov rax, 1		; Mov with zero extend
		ret

	_less:
		mov rax, -1		; Mov with sign extend
		ret
