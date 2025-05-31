IDEAL
MODEL small
STACK 100h
DATASEG
    character db ?

CODESEG
start:
    mov ax, @data
    mov ds, ax
	
	mov ah, 1h
	int 21h
	mov [character], al
	
	mov ah, 1h
	int 21h
	
	cmp [character], al
	jae printChar
	mov [character], al
	
	

printChar:
	;new line
	mov dl, 10
	mov ah, 2
	int 21h
	;carriage return
	mov dl, 13
	mov ah, 2
	int 21h
	
	mov dl, [character]
	mov ah, 2h
	int 21h

exit:
    mov ax, 4C00h
    int 21h
END start