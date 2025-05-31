IDEAL
MODEL small
Stack 100h
DATASEG
	ReturnAddress dw 0
	param1 dw 0
	param2 dw 0
CODESEG

proc ABC
	pop [ReturnAddress]
	pop [param2]
	pop [param1]
	push ax
	push bx
	push cx
	push dx
	mov ax, [param1]
	mov bx, [param2]
	cmp ax, bx
	ja PrintA
	jb PrintB
	je PrintC
PrintA:
    mov dl, 'A'
    jmp PrintChar

PrintB:
    mov dl, 'B'
    jmp PrintChar

PrintC:
    mov dl, 'C'

PrintChar:
    mov ah, 02h
    int 21h
	
	pop dx
	pop cx
	pop bx
	pop ax
	push [ReturnAddress]
	ret
endp ABC

start :	
	mov ax, @data
	mov ds, ax
	mov ax, 4
	mov bx, 5
	xor cx,cx
	xor dx, dx
	push ax
	push bx
	
	call ABC

exit :
	mov ax, 4C00h
	int 21h
END start
