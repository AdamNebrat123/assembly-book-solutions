IDEAL
MODEL small
STACK 100h
DATASEG
CODESEG
proc compareAXtoBX far
	push ds
	push dx
	cmp ax, bx
	ja printAxMsg
	jb printBxMsg
	je printSameMsg
printAxMsg:
	mov dx, offset AxMsg
	push seg AxMsg 
	pop ds
	
	mov ah, 9h
	int 21h
	jmp finnish
printBxMsg:
	mov dx, offset BxMsg
	push seg BxMsg 
	pop ds
	
	mov ah, 9h
	int 21h
	jmp finnish
printSameMsg:
	mov dx, offset SameMsg
	push seg SameMsg 
	pop ds
	
	mov ah, 9h
	int 21h
	jmp finnish
finnish:
	pop dx 
	pop ds
	iret
	;data is after the iret so it won't be translated to OpCodes
	AxMsg db 'ax$'
	BxMsg db 'bx$'
	SameMsg db 'SAME$'
endp compareAXtoBX
start:
    mov ax, @data
    mov ds, ax
	
	mov dx, offset compareAXtoBX
	push seg compareAXtoBX
	pop ds
	mov al, 0F0h ; The ISR will be placed as number 0F0h in the IVT (int 0F0h will run it)
	mov ah, 25h
	int 21h
	
	mov ax, 5
	mov bx, 3
	; Call compareAXtoBX
	int 0F0h
exit:
    mov ax, 4C00h
    int 21h
END start