IDEAL
MODEL small
Stack 100h
DATASEG
	sum dw 0
	num_elements equ 5
	arr db 2,2,5,4,5
	max db 0
	
CODESEG
proc sumElements
	push bp
	mov bp, sp
	push cx
	push si
	push ax 
	mov cx, [bp+8]      ; num_elements
    mov si, [bp+6]       ; pointer to array
    mov dx, 0               ; sum accumulator

loopThruElems:

	
	xor ax, ax
	mov al, [si]        ; load array item
	add dx, ax
	inc si
	loop loopThruElems
	
	mov di, [bp+4]
	mov [di], dx
	pop ax
	pop si
	pop cx
	pop bp
	ret 6
endp sumElements

start :	
	mov ax, @data
	mov ds, ax
	push num_elements
	push offset arr
	push offset sum
	call sumElements
	
exit :
	mov ax, 4C00h
	int 21h
END start