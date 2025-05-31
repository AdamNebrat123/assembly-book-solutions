IDEAL
MODEL small
STACK 100h
DATASEG
CODESEG
proc addOneISR far
	push dx
	add al, 1
	mov dl, al
	mov ah, 2
	int 21h
	pop dx
	iret
endp addOneISR
start:
    mov ax, @data
    mov ds, ax
	mov al, 0FEh
	mov ah, 25h
	mov dx, offset addOneISR
	push seg addOneISR
	pop ds
	int 21h
	; Call addOneISR
	mov al, 'A'
	int 0FEh
exit:
    mov ax, 4C00h
    int 21h
END start