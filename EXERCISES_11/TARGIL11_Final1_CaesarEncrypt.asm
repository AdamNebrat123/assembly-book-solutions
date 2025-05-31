IDEAL
MODEL small
STACK 100h
DATASEG
	msg db 'this is encrypted$'
CODESEG
proc encryptMSG
	push bp
	mov bp, sp
	push ax
	push bx
	push cx 
	push dx
	mov cx, [bp + 4] ; the num of shiting
	mov bx, [bp + 6]
EncrtptAndPrint:
	mov dl, [bx]
	cmp dl, 20h
	je print
	cmp dl, 24h
	je finnish
	add dl, cl ; add and shitf the text
	
print:
	mov ah, 2
	int 21h
	inc bx
	jmp EncrtptAndPrint
	
finnish:
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret
endp encryptMSG

start:
    mov ax, @data
    mov ds, ax
	push offset msg
	push 5
	call encryptMSG

exit:
    mov ax, 4C00h
    int 21h
END start