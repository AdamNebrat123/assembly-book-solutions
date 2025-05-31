IDEAL
MODEL small
Stack 100h
DATASEG
	ReturnAddress dw 0
	paramArr dw 4 dup (0)
	Min dw 0FFFFh ;max value
	Max dw 0 ;min value
CODESEG

proc MinMax
	pop [ReturnAddress]

	pop [paramArr + 6]
	pop [paramArr + 4]
	pop [paramArr + 2]
	pop [paramArr]
	push ax
	push bx
	push cx
	push dx
	push [paramArr + 6]
	push [paramArr + 4]
	push [paramArr + 2]
	push [paramArr]
	mov cx, 4
loopAllParams:
	pop ax
	cmp ax, [Min]
	jb SetMin
	cmp ax, [Max]
	ja SetMax
	loop loopAllParams
	
	pop dx
	pop cx
	pop bx
	pop ax
	push [ReturnAddress]
	ret
SetMin:
	mov [Min], ax
	jmp loopAllParams
	
SetMax:
	mov [Max], ax
	jmp loopAllParams
	
endp MinMax


start :	
	mov ax, @data
	mov ds, ax
	mov ax, 1
	mov bx, 2
	mov cx, 3
	mov dx, 4
	
	push ax
	push bx
	push cx
	push dx
	
	call MinMax
	
exit :
	mov ax, 4C00h
	int 21h
END start
