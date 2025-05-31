IDEAL
MODEL small
STACK 100h

DATASEG
	msg db 'enter a digit', 10, 13, '$'
	
CODESEG
start:
    mov ax, @data
    mov ds, ax
	mov dx, offset msg
	mov ah, 9h
	int 21h
	mov ah, 1
	int 21h
exit:
    mov ax, 4C00h
    int 21h
END start