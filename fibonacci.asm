section .text

global _start

_start:

mov rbx, 1
mov rax, 0

calcfib:

inc r13

mov r8, rax ; holds what was previously in r9

mov r9, rbx ; holds the sum of the last add

add r8, r9

mov rax, r9

mov rbx, r8

cmp r13, 5

jg convertToAscii
jmp calcfib



convertToAscii:

inc r12 ; length for printstr
xor rdx, rdx
mov rax, r8 ; divide rdx 
mov rbx, 10 ; by 10
div rbx
add rdx, 48 ; convert value in remainder to ascii
push rdx ; store ascii digit (this also helps reverse the output so it represents the actual number because of how the stack works)
mov r8, rax ; this will be divided until the remainder is 0



test rbx, rbx
jz printStr
jmp convertToAscii

printStr:
lea rdi, meow

pop:
cld
mov rcx, 255
mov r15, r12 
pop rax 
stosb
dec r15
cmp r15, 0
jz sysWrite
jg pop

sysWrite:
mov rax, 1
mov rdi, 1
lea rsi, meow
mov rdx, r12 
syscall

exit:
mov rax, 60
mov rdi, 0
syscall





section .bss
meow resb 255

