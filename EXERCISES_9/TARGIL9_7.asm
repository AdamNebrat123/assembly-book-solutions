IDEAL
MODEL small
Stack 100h
DATASEG

	param1 dw 4
	param2 dw 5
	max db 0
	
CODESEG
proc XYZ
	X equ [bp + 8]
	Y equ [bp + 6]
	Z equ [bp + 4]
	LocalX equ [bp - 2]
	LocalY equ [bp - 4]
	LocalZ equ [bp - 6]
	push bp
	mov bp, sp
	sub sp, 6
	push ax
	mov ax, X 
	mov LocalX, ax 
	mov ax, Y 
	mov LocalY, ax 
	mov ax, Z 
	mov LocalZ, ax 
	
	pop ax
	add sp, 6
	pop bp
	ret 6
endp XYZ

start :	
	mov ax, @data
	mov ds, ax
	push 3
	push 4
	push 5
	call XYZ
	
exit :
	mov ax, 4C00h
	int 21h
END start