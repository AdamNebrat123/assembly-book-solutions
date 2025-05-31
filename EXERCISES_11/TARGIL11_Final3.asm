IDEAL
MODEL small
STACK 100h
DATASEG
	msg db 'aabcdadaa$'  ; there is 5 'a' in the str
CODESEG
proc HowManyTimesInMsg ; returns in ax the number
	push bp
	mov bp, sp
	push bx 
	push dx
	xor ax,ax 
	mov bx, [bp+6]
	mov dl, [bp+4]
loopThruMsg:
	mov dh, [bx]
	inc bx
	cmp dh, 24h
	je finnish
	cmp dh, dl  ; dh - the current character, dl the character we count
	jne loopThruMsg
	inc ax
	jmp loopThruMsg
finnish:
	pop dx
	pop bx
	pop bp
	ret
endp HowManyTimesInMsg
start:
    mov ax, @data
    mov ds, ax
	push offset msg
	push 'a'
	call HowManyTimesInMsg
	mov dl, al ; all is the returned value 
	add dl, '0' ; to actually print a number
	mov ah, 2
	int 21h
exit:
    mov ax, 4C00h
    int 21h
END start