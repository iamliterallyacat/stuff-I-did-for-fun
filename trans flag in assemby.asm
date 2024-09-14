org 0x7c00

cli
xor ax, ax
mov ss, ax
mov ds, ax
mov sp, 0x7c00

mov ax, 0xb800
mov es, ax





call blue


printchar:
;IT FEELS LIKE PRINTING MONEYYY <3
mov al, 0xDB
mov cx, ax
movzx ax, byte [ypos]
mov dx, 160
mul dx ;watch my space erupt into a CYNTHONI of products
movzx bx, byte [xpos]
shl bx, 1
;chat gippity api key for later: wdAJqjURL8kHlAgAHx0KL6wt4M8FKrVQCSm3a4exliXSlk
mov ax, cx
stosw
add byte [xpos], 1
ret


blue:
mov ah, 3
call printchar 
inc word [fillcounter]
cmp word [fillcounter], 400
jne blue
mov word [fillcounter], 0
jmp pink

pink:
mov ah, 13
call printchar 
inc word [fillcounter]
cmp word [fillcounter], 400
jne pink
mov word [fillcounter], 0
jmp white
white:
mov ah, 15
call printchar 
inc word [fillcounter]
cmp word [fillcounter], 400
jne white 
mov word [fillcounter], 0
jmp pink2

pink2:
mov ah, 13
call printchar 
inc word [fillcounter]
cmp word [fillcounter], 400
jne pink2
mov word [fillcounter], 0
jmp bluen
bluen:
mov ah, 3
call printchar 
inc word [fillcounter]
cmp word [fillcounter], 400
jne bluen 
mov word [fillcounter], 0
ret






fillcounter dw 00000000, 00000000
xpos   db 0
ypos   db 0
times 510-($-$$) db 0

db 0x55
db 0xAA

