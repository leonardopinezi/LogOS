[org 0x7c00]

xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7C00

jmp start

print:
	lodsb	; Carrega o byte de SI em AL
	cmp al, 0
	je .done
	mov ah, 0x0E
	int 0x10
	jmp print
.done:
	call breakline
	ret


breakline:
	mov ah,  0x0E
	mov al, 0x0D
	int 0x10
	mov al, 0x0A
	int 0x10
	ret



start:
	mov si, msg
	call print


	mov ax, 0x1000		; Byte alto em AX
	mov es, ax			; Carrega o byte alto
	
	mov ah, 0x02		; Read Sector
	mov al, 1			; Carrega N setores
	
	mov ch, 0 			; Cilindro 0
	mov cl, 2			; CIlindro em kernel (2)
	mov dh, 0 			; Head em 0
	
	mov bx, 0x0000		; Byte baixo
	
	int 0x13

	jmp 0x1000:0x0000	; Carrega o kernel no setor 1

msg db "LogOS v1.0.0", 0x0D, 0x0A, "Booting Kernel...", 0

times 510-($-$$) db 0
dw 0xaa55
