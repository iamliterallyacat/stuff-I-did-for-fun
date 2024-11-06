section .data
stdmessage	db 	'mkdir: '
stdmessage_l	equ	$-stdmessage

exists		db	'File exists'
exists_l	equ	$-exists

permDen 	db 	'Permission denied'
permDen_l 	equ 	$-permDen    

success 	db	'WE DID IT'
success_l  	equ	$-success

noArg		db	'Missing arguments'
noArg_l		equ 	$-noArg
;==============================|

eaccess equ 13

eexist	equ 17

;==============================|
section .text

global _start

_start:


mov rdi, [rsp]


cmp rdi, 2
jl noArg_

mov rdi, [rsp + 16]

mov rax, 83
mov rsi, 7
syscall

mov rbx, rax

jmp exit

exit:
test rbx, rbx
je success1
js error

error: 
mov rax, 1
mov rdi, 2
lea rsi, [stdmessage]
mov rdx, stdmessage_l
syscall

neg rbx

cmp rbx, eaccess
je permDen_

cmp rbx, eexist
je exists_

jmp close

permDen_:
mov rax, 1
mov rdi, 2
lea rsi, [permDen]
mov rdx, permDen_l
syscall
mov rdi, 13
jmp close

exists_:
mov rax, 1
mov rdi, 2
lea rsi, [exists]
mov rdx, exists_l
syscall 
mov rdi, 17
jmp close

noArg_:
mov rax, 1
mov rdi, 2
lea rsi, [stdmessage]
mov rdx, stdmessage_l
syscall

mov rax, 1
mov rdi, 2
lea rsi, [noArg]
mov rdx, noArg_l
syscall
jmp close

success1:

mov rax, 1
mov rdi, 1
lea rsi, [success]
mov rdx, success_l
syscall
mov rdi, 0

close:
mov rax, 60
syscall
