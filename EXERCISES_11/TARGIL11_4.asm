IDEAL
MODEL small
STACK 100h
DATASEG
	buffer db 13 dup (?)
	newLine db 10,13, '$'
CODESEG
start:
    mov ax, @data
    mov ds, ax
	mov dx, offset buffer
	mov bx, dx
	mov [byte ptr bx], 11
	mov ah, 0Ah
	int 21h
	
	mov dx, offset newLine
	mov ah, 9h
	int 21h
	
	mov bx, offset buffer
	mov cl, [bx + 1]
	add bx, 2 ; the actual data stars from index 2
loopBuffer:
	mov dl, [bx]
	sub dl, 20h
	mov ah, 2h
	int 21h
	inc bx
	loop loopBuffer
exit:
    mov ax, 4C00h
    int 21h
END start