memset:
	push ax
	push cx
	push di
.loop:
	cmp cx, 0
	je .done

	mov [di], al

	inc di
	dec cx

	jmp .loop
.done:
	pop di
	pop cx
	pop ax
	ret



strcmp:
.loop:
	mov al, [si]
	mov bl, [di]

	cmp al, bl
	jne .not_equ

	cmp al, 0
	je .equ

	inc si
	inc di

	jmp .loop
.equ:
	mov al, 1
	ret
.not_equ:
	mov al, 0
	ret