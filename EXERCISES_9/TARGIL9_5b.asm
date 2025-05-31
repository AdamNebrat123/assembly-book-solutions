IDEAL
MODEL small
Stack 100h
DATASEG
	ReturnAddress dw 0
	param1 db 1
	param2 db 2
	param3 db 3
	param4 db 4
	Min dw 0FFFFh ;max value
	Max dw 0 ;min value
CODESEG
proc SimpleZero

	;Takes as input the address of a parameter, adds 2 to the parameter
	mov cx, 4
	pop [ReturnAddress] ; Save the return address
loop4:
	
	pop bx ; bx holds the offset of "parameter "
	mov al, [byte ptr bx]
	xor [byte ptr bx], al
	loop loop4
	
	push [ReturnAddress]
	ret
endp SimpleZero

start :	
	mov ax, @data
	mov ds, ax
	push offset param1
	push offset param2
	push offset param3
	push offset param4
	call SimpleZero
exit :
	mov ax, 4C00h
	int 21h
END start
