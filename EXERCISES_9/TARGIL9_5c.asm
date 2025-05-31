IDEAL
MODEL small
Stack 100h
DATASEG
	ReturnAddress dw 0
	param1 db 4
	param2 db 5
	Min dw 0FFFFh ;max value
	Max dw 0 ;min value
CODESEG
proc switch

	;Takes as input the address of a parameter, adds 2 to the parameter

	pop [ReturnAddress] ; Save the return address
	pop bx ; bx holds the offset of "parameter1 "
	mov al, [byte ptr bx]
	pop di ; bx holds the offset of "parameter2 "
	mov ah, [byte ptr di]
	mov [byte ptr bx], ah
	mov [byte ptr di], al
	
	push [ReturnAddress]
	ret
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
