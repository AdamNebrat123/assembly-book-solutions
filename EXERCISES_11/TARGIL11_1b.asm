IDEAL
MODEL small
STACK 100h
DATASEG
	isDigit db 0  ; 0 = false, 1 = true
	
	
CODESEG
start :
	mov ax, @data
	mov ds, ax
	
	mov ah, 1h
    int 21h ; al now has the ascii
	
	cmp al, '0'
	jb exit
	
	cmp al, '9'
	ja exit

	mov [isDigit], 1
	
	
exit :
	mov ax, 4c00h
	int 21h
END start