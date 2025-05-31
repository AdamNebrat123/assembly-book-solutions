IDEAL
MODEL small
STACK 100h
DATASEG
	msg db 'I like to write assembly code!', 10, 13, 'Adam Nebrat', '$'
CODESEG
start:
    mov ax, @data
    mov ds, ax
	mov dx, offset msg
	mov ah, 9h
	int 21h
exit:
    mov ax, 4C00h
    int 21h
END start