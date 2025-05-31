IDEAL
MODEL small
STACK 100h
DATASEG
	
CODESEG

XorDl:
	xor dx, dx
	jmp exit
	
start :
	mov ax, @data
	mov ds, ax
	
	xor dx, dx
	mov cx, 10
	
loop10times:
	mov ah, 1h
    int 21h ; al now has the ascii
	
	cmp al, '0'
	jb XorDl
	
	cmp al, '9'
	ja XorDl
	
	sub al, 30h
	add dl, al
	loop loop10times
	
	
	
	
exit :
	mov ax, 4c00h
	int 21h
END start