IDEAL
MODEL small
Stack 100h
DATASEG
	ReturnAddress dw 0
	param db 0
	Min dw 0FFFFh ;max value
	Max dw 0 ;min value
CODESEG
proc SimpleAdd

	;Takes as input the address of a parameter, adds 2 to the parameter
	pop [ReturnAddress] ; Save the return address
	pop bx ; bx holds the offset of "parameter "
	inc [byte ptr bx]; This actually changes the value of "parameter "
	push [ReturnAddress]
	ret
endp SimpleAdd

start :	
	mov ax, @data
	mov ds, ax
	push offset param 
	call SimpleAdd
exit :
	mov ax, 4C00h
	int 21h
END start
