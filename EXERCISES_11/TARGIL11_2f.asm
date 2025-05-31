IDEAL
MODEL small
STACK 100h

DATASEG

CODESEG
start:
    mov ax, @data
    mov ds, ax
	
	mov ah, 1h
	int 21h
	mov bl, al
	mov ah, 1h
	int 21h
	mov bh, al
	
	;new line
	mov dl, 10
	mov ah, 2
	int 21h
	;carriage return
	mov dl, 13
	mov ah, 2
	int 21h
	
	cmp bl, bh
	jae bigger
	jmp smaller
bigger:
	sub bl, bh
	mov dl, bl
	add dl, '0'
	mov ah, 2h
	int 21h
	jmp exit
	
smaller:
	
	mov dl, '-'
	mov ah, 2h
	int 21h
	sub bh, bl
	mov dl, bh
	add dl, '0'
	mov ah, 2h
	int 21h
	
exit:
    mov ax, 4C00h
    int 21h
END start