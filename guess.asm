bits 16
org 0x7c00

main:
	xor ax, ax
	xor bx, bx
	xor cx, cx
	xor dx, dx

clear_screen:
    mov al, 0x03
	int 0x10

print_welcome:
    mov ax, 0x1301
    mov bx, 0x0E
    mov cx, 0x1C
    mov dx, 0x0200
    mov bp, welcome
    int 0x10

print_question:
    mov ax, 0x1301
    mov bx, 0x0E
    mov cx, 27
    mov dx, 0x0300
    mov bp, question
    int 0x10

read:
    mov ah, 0x00
    int 0x16

convert_number:
    sub al, 48

cursor:
    mov ah, 0x02
    mov bh, 0x00
    mov dx, 0x0400
    int 0x10

compare:
    cmp al, 9
    jne print_failed
    jmp print_success


print_failed:
    mov ax, 0x1301
    mov bx, 0x0E
    mov cx, 0x06
    mov dx, 0x0400
    mov bp, failed
    int 0x10
    jmp halt

print_success:
    mov ax, 0x1301
    mov bx, 0x0E
    mov cx, 0x07
    mov dx, 0x0500
    mov bp, success
    int 0x10
    jmp halt

halt:
	cli
	hlt

welcome:
    db `Welcome to the guessing game`

question:
    db `Enter a number from 0 to 9:`

failed:
    db `Failed`

success:
    db `Success`

pad:
	times 510-($-$$) db 0

sig:
	dw 0xaa55
