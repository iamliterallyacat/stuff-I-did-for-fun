org 0x7c00


section .text

bits 16
xor ax, ax
mov sp, 0x9c00
mov ss, ax
mov ax, 0x8b00
mov es, ax


call silly

silly:

;lodsb ;ds:si into al
mov al, 0xDB
mov ah, 0x1F
mov di, 0x20
stosw ;es:di
ret



times 510-($-$$) db 0
dw 0AA55h
