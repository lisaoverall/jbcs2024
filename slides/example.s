	.file	"example.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -24[rbp], esi
	mov	QWORD PTR -32[rbp], rdx
	mov	DWORD PTR -36[rbp], ecx
	cmp	DWORD PTR -20[rbp], 0
	jne	.L2
	mov	edi, 1
	call	exit@PLT
.L2:
	mov	DWORD PTR -12[rbp], 0
	cmp	DWORD PTR -24[rbp], 0
	jne	.L3
	mov	DWORD PTR -8[rbp], 0
	jmp	.L4
.L5:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	add	DWORD PTR -12[rbp], eax
	add	DWORD PTR -8[rbp], 1
.L4:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L5
	jmp	.L6
.L3:
	cmp	DWORD PTR -24[rbp], 1
	jne	.L7
	mov	DWORD PTR -12[rbp], 1
	mov	DWORD PTR -4[rbp], 0
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	edx, DWORD PTR -12[rbp]
	imul	eax, edx
	mov	DWORD PTR -12[rbp], eax
	add	DWORD PTR -4[rbp], 1
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L9
	jmp	.L6
.L7:
	mov	edi, 2
	call	exit@PLT
.L6:
	mov	eax, DWORD PTR -12[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	foo, .-foo
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -20[rbp], 1
	mov	DWORD PTR -16[rbp], 2
	mov	DWORD PTR -12[rbp], 3
	mov	DWORD PTR -28[rbp], 3
	mov	edx, DWORD PTR -28[rbp]
	lea	rax, -20[rbp]
	mov	ecx, edx
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 1
	call	foo
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	edx, DWORD PTR -28[rbp]
	lea	rax, -20[rbp]
	mov	ecx, edx
	mov	rdx, rax
	mov	esi, 1
	mov	edi, 1
	call	foo
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
