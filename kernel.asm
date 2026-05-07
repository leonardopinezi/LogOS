[org 0x0000]

jmp start

%include "lib/stdio.asm"
%include "lib/stdlib.asm"
%include "lib/string.asm"

%include "shell/cmd.asm"

start:
	cld

	mov ax, 0x1000
	mov ds, ax
	mov es, ax
	mov ss, ax

	mov sp, 0xFFFF

	call clear

	mov si, msg
	call puts
	call newline

.cmd:
	call getc
	cmp al, 0x0D
	je .bk

	xor bx, bx
	mov bl, [buffer_pointer]
	mov [buffer_input + bx], al
	inc byte [buffer_pointer]
	
	jmp .cmd
.bk:
	xor bx, bx
	mov bl, [buffer_pointer]
	mov byte [buffer_input + bx], 0

	call shell
	
	mov di, buffer_input
	mov al, 0
	mov cx, 64
	call memset

	mov byte [buffer_pointer], 0

	jmp .cmd

msg db "LogOS v0.0.1", 0
buffer_input times 64 db 0
buffer_pointer db 0
