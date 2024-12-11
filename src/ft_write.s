bits 64
extern __errno_location

section .text
	global ft_write

	ft_write:
		mov rax, 1		; syscall number for write
		syscall			; call write
		cmp rax, 0		; check if the return value is 0
		jl _error		; if it is, return
		ret

	_error:
		neg rax			; errno to positive value
		mov r8, rax		; save errno
		call __errno_location wrt ..plt	; get errno location in rax with linker
		mov [rax], r8	; save errno in the location pointed by rax
		mov rax, -1
		ret


