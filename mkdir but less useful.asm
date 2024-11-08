section .data
stdmessage	db 	'mkdir: '
stdmessage_l	equ	$-stdmessage
exists		db	'File exists', 10
exists_l	equ	$-exists
permDen 	db 	'Permission denied', 10
permDen_l 	equ 	$-permDen
success 	db	'WE DID IT', 10
success_l  	equ	$-success
noArg		db	'Missing arguments', 10
noArg_l		equ 	$-noArg
eaccess equ 13
eexist	equ 17
unkownErr	db	'Unkown error', 10
unkownErr_l	equ	$-unkownErr
badPerm		db	'Invalid Permissions', 10
badPerm_l	equ	$-badPerm
m		db	'-m'
perm		dq	0o755
section .bss

;perm_b		resb 	4

section .text
global _start
_start:

mov rdi, [rsp]
cmp rdi, 2
jl noArg_
;jg setPerm


;setPerm:
;lea rdi, [rsp + 24]
;mov rsi, [rsp + 32]
;mov rax, 83
;syscall
;mov rbx, rax
;jmp exit

normal:
mov rdi, [rsp + 16]
mov rax, 83
mov rsi, perm
syscall
mov r8, 0
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
cmp r8, 2
je unkownErr

neg rbx
cmp rbx, eaccess
je permDen_

cmp rbx, eexist
je exists_

jmp close

printErr:

mov rax, 1
mov rdi, 2
syscall
jmp close
unkownErr_:
lea rsi, [unkownErr]
mov rdx, unkownErr_l
mov r9, 255
jmp printErr

badPerm_:

lea rsi, [badPerm]
mov rdx, badPerm_l
mov r9, 67
jmp printErr

permDen_:
lea rsi, [permDen]
mov rdx, permDen_l
mov r9, 13
jmp printErr

exists_:
lea rsi, [exists]
mov rdx, exists_l
mov r9, 17
jmp printErr

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
mov rdi, r9
mov rax, 60
syscall
