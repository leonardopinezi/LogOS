;	Output Functions
putc:
	mov ah, 0x0E
	int 0x10
	ret

puts:
.loop:
	lodsb
	cmp al, 0
	je .done
	call putc
	jmp .loop
.done:
	ret

clear:
	mov ax, 0x0600
	mov bh, 0x07
	mov cx, 0x0000
	mov dx, 0x184F
	int 0x10

	mov ah, 0x02
	mov bh, 0
	mov dx,0x0000
	int 0x10
	
	ret

newline:
	mov al, 0x0D
	call putc
	mov al, 0x0A
	call putc
	ret


; Input Functions
getc:
	mov ah, 0x00
	int 0x16

	push ax
	call putc
	pop ax

	ret
