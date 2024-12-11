bits 64
extern __errno_location

section .text
	global ft_read

	ft_read:
		mov rax, 0		; syscall number for read
		syscall			; call read
		cmp rax, 0		; check if the return value is 0
		jl _error		; if it is, return
		ret

	_error:
		neg rax			; errno to positive value
		mov r8, rax		; save errno
		call __errno_location wrt ..plt	; get errno location in rax
		mov [rax], r8	; save errno in the location
		mov rax, -1
		ret


