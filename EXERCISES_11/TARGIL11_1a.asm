IDEAL
MODEL small
STACK 100h
DATASEG
	bigger db ?
	
	
CODESEG
start :
	mov ax, @data
	mov ds, ax
	
	mov ah, 1h
    int 21h ; al now has the ascii
	mov [bigger], al
	
	mov ah, 1h
    int 21h ; al now has the ascii
	
	cmp al, [bigger]
	jbe exit
	mov [bigger], al
exit :
	mov ax, 4c00h
	int 21h
END start