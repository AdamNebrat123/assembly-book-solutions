IDEAL
MODEL small
Stack 100h
DATASEG
	num_elements equ 5
	arr db 5,1,4,3,2
	max db 0
	
CODESEG


proc FindMin
	; this proc returns in ax the index of the min in arr
	push bp
	mov bp, sp
	push si 
	push cx
	push bx
	xor dx, dx
	mov si, [bp + 4] ; arr offset
	mov cx, [bp + 6] ; num of items
	mov ax, si
	mov bl, [si]
loopThruArr:
	mov dl, [si]
	cmp dx, bx 
	
	jae continueLoop
setMinIndex:
	mov ax, si
	mov bl, [si]
continueLoop:
	inc si
	loop loopThruArr
	
	sub ax, [bp + 4]  ; now it the actual index
	
	pop bx
	pop cx 
	pop si
	pop bp
	ret 4
endp FindMin


proc Swap
	push bp
	mov bp, sp
	push si
	push di
	push bx
	xor bx,bx

	
	sub sp, 4  ; two local vars
	mov si, [bp + 4] ; X
	mov di, [bp + 6]  ; Y
	
	mov bl, [si]
	mov [bp - 2], bl ; X
	
	mov bl, [di]
	mov [bp - 4], bl ; Y
	
	mov bl, [bp - 4]
	mov [si], bl ; Y
	mov bl, [bp - 2]
	mov [di], bl  ; X
	
	
	add sp, 4 
	pop bx
	pop di
	pop si 
	pop bp
	ret 4
endp Swap

proc SortArray
	push bp
	mov bp, sp
	push bx ; will hold the arr Offset
	push cx

	
	mov cx, [bp+6] ;NUM of Elements
	mov bx, [bp+4] ;offset
loopAndSort:

	push cx
	push bx
	call FindMin ; now ax has the index of the min array
	
	add ax, bx ; to get the offset of the [bp+4] + the absolute index of item (ax)
	push ax ; index of the min array
	push bx ; array offset
	call Swap
	
	inc bx
	loop loopAndSort
	
	pop cx
	pop bx
	pop bp
	ret 4
endp SortArray

start :	
	mov ax, @data
	mov ds, ax
	
	push num_elements
	push offset arr
	call SortArray
	
exit :
	mov ax, 4C00h
	int 21h
END start