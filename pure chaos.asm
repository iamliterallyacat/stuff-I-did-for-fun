org 0x7c00

xor ax, ax 
mov ss, ax
mov ds, ax
mov sp, 0x9c00

mov ax, 0xb800
mov es, ax

jmp gameloop

gameloop:

int 0x16  

cmp al, 0x11
je up

cmp al, 0x1E
je left

cmp al, 0x1F
je down

cmp al, 0x20
je right
xor ax, ax

call calcpos

call drawframe
jmp gameloop


drawframe:
mov ah, 3 
mov ax, word [pos]
mov word [tofill], ax
dec word [tofill]
call fill
ret

calcpos:
;mov ax, word [xpos1]
;mov cx, word [ypos1]
;mul cx
inc word [pos]
ret



clear:
mov ah, 13 
mov word [tofill], 2000
call fill
ret

fill:
call drawpixel
inc word [fillcounter]
mov ax, word [tofill]
cmp word [fillcounter], ax
jne fill

mov word [fillcounter], 0
mov ah, 2
call drawpixel
ret

drawpixel:
mov al, 0xDB
mov cx, ax
movzx ax, byte [ypos]
mov dx, 160
mul dx
movzx bx, byte [xpos]
shl bx, 1
mov ax, cx
stosw
ret

left:
dec byte [xpos1]

jmp gameloop

right:
inc byte [xpos1]

jmp gameloop

down:
dec byte [ypos1]

jmp gameloop

up:
inc byte [ypos1]
;call dot
jmp gameloop

xpos   db 0
ypos   db 0

xpos1  db 0
ypos1  db 0

pos    dw 00000000, 00000010

tofill dw 00000000, 00000000

fillcounter dw 00000000, 00000000
times 510-($-$$) db 0
db 0x55
db 0xAA
