IDEAL
MODEL small
Stack 100h
DATASEG

	param1 dw 4
	param2 dw 5
	max db 0
CODESEG
proc Setmax
	push bp
	mov bp, sp

	mov bx, [bp + 4] ; max offset
	mov ah, [bp + 8] ; param1 value
	mov al, [bp + 6] ; param2 value
	cmp ah, al
	ja set_max_ax
	mov ah, al

set_max_ax:
    mov bx, [bp+4]
    mov [bx], ah
	
	pop bp
	ret 6
endp Setmax

start :	
	mov ax, @data
	mov ds, ax
	push [param1]
	push [param2]
	push offset max
	call Setmax
	
exit :
	mov ax, 4C00h
	int 21h
END start
