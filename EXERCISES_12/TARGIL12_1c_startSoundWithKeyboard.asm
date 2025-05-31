

;===================================================
; if the button 'F' is pressed, a sound will play, when 'F' is released the sound stops
;===================================================

IDEAL
MODEL small
STACK 100h
DATASEG
CODESEG
checkIfPressed:
	mov ah, 1
	int 16
	jz checkIfPressed
	in al, 60h
	cmp al, 21h ; 'F' pressed scan code
	je startSound
	cmp al, 0A1h ; 'F' released scan code
	je stopSound
	jmp checkIfPressed
startSound:
	in al, 61h
	or al, 00000011b
	out 61h, al
	mov al, 0b6h
	out 43h, al
	mov ax, 2394h
	out 42h, al
	mov al, ah
	out 42h, al
	jmp checkIfPressed
stopSound:
	in al, 61h
	and al, 11111100b
	out 61h, al
	jmp exit
start:
	mov ax, @data
	mov ds, ax
	jmp checkIfPressed
exit:
	mov ax, 4C00h
	int 21h
END start
