IDEAL
MODEL small
STACK 100h
DATASEG
	upMSG db 'Move Up',13,10,'$'
	downMSG db 'Move Down',13,10,'$'
	leftMSG db 'Move Left',13,10,'$'
	rightMSG db 'Move Right',13,10,'$'
	message db 'ESC key pressed',13,10,'$'
CODESEG
start:
	mov ax, @data
	mov ds, ax
WaitForData:
	mov ah, 1
	Int 16h
	jz WaitForData
	mov ah, 0
	int 16h
	cmp ah, 1h
	je ESCPressed
	cmp ah, 11h ; 'W'
	je UpPressed
	cmp ah, 1Fh ; 'S'
	je DownPressed
	cmp ah, 1Eh ; 'A'
	je LeftPressed
	cmp ah, 20h ; 'D'
	je RightPressed
	jmp WaitForData
	
UpPressed:
	mov dx, offset upMSG
	mov ah, 9h
	int 21h
	jmp WaitForData
DownPressed:
	mov dx, offset downMSG
	mov ah, 9h
	int 21h
	jmp WaitForData
LeftPressed:
	mov dx, offset leftMSG
	mov ah, 9h
	int 21h
	jmp WaitForData
RightPressed:
	mov dx, offset rightMSG
	mov ah, 9h
	int 21h
	jmp WaitForData

ESCPressed:
	mov dx, offset message
	mov ah, 9
	int 21h
exit:
mov ax, 4C00h
int 21h
END start
