IDEAL
MODEL small
Stack 100h
DATASEG

	param1 db 4
	param2 db 5

CODESEG
proc switch
	push bp
	mov bp, sp

	mov bx, [bp + 4]
	mov al, [byte ptr bx]
	mov di, [bp + 6]
	mov ah, [byte ptr di]
	mov [byte ptr bx], ah
	mov [byte ptr di], al
	
	pop bp
	ret 4
endp switch

start :	
	mov ax, @data
	mov ds, ax
	push offset param1
	push offset param2

	call switch
exit :
	mov ax, 4C00h
	int 21h
END start
