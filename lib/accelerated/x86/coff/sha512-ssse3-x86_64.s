# Copyright (c) 2011-2013, Andy Polyakov <appro@openssl.org>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 
#     * Redistributions of source code must retain copyright notices,
#      this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials
#      provided with the distribution.
#
#     * Neither the name of the Andy Polyakov nor the names of its
#      copyright holder and contributors may be used to endorse or
#      promote products derived from this software without specific
#      prior written permission.
#
# ALTERNATIVELY, provided that this notice is retained in full, this
# product may be distributed under the terms of the GNU General Public
# License (GPL), in which case the provisions of the GPL apply INSTEAD OF
# those given above.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# *** This file is auto-generated ***
#
.text	

.globl	sha256_block_data_order
.def	sha256_block_data_order;	.scl 2;	.type 32;	.endef
.p2align	4
sha256_block_data_order:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_sha256_block_data_order:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx
	movq	%r9,%rcx

	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	movq	%rsp,%r11
	shlq	$4,%rdx
	subq	$64+32,%rsp
	leaq	(%rsi,%rdx,4),%rdx
	andq	$-64,%rsp
	movq	%rdi,64+0(%rsp)
	movq	%rsi,64+8(%rsp)
	movq	%rdx,64+16(%rsp)
	movq	%r11,64+24(%rsp)
.Lprologue:

	leaq	K256(%rip),%rbp

	movl	0(%rdi),%eax
	movl	4(%rdi),%ebx
	movl	8(%rdi),%ecx
	movl	12(%rdi),%edx
	movl	16(%rdi),%r8d
	movl	20(%rdi),%r9d
	movl	24(%rdi),%r10d
	movl	28(%rdi),%r11d
	jmp	.Lloop

.p2align	4
.Lloop:
	xorq	%rdi,%rdi
	movl	0(%rsi),%r12d
	movl	%r8d,%r13d
	movl	%eax,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r9d,%r15d
	movl	%r12d,0(%rsp)

	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%eax,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r8d,%r15d
	movl	%ebx,%r11d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	xorl	%ecx,%r11d
	xorl	%eax,%r14d
	addl	%r15d,%r12d
	movl	%ebx,%r15d

	rorl	$6,%r13d
	andl	%eax,%r11d
	andl	%ecx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r11d

	addl	%r12d,%edx
	addl	%r12d,%r11d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r11d

	movl	4(%rsi),%r12d
	movl	%edx,%r13d
	movl	%r11d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r8d,%r15d
	movl	%r12d,4(%rsp)

	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r11d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%edx,%r15d
	movl	%eax,%r10d

	rorl	$11,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	xorl	%ebx,%r10d
	xorl	%r11d,%r14d
	addl	%r15d,%r12d
	movl	%eax,%r15d

	rorl	$6,%r13d
	andl	%r11d,%r10d
	andl	%ebx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r10d

	addl	%r12d,%ecx
	addl	%r12d,%r10d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r10d

	movl	8(%rsi),%r12d
	movl	%ecx,%r13d
	movl	%r10d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%edx,%r15d
	movl	%r12d,8(%rsp)

	rorl	$9,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r10d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ecx,%r15d
	movl	%r11d,%r9d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	xorl	%eax,%r9d
	xorl	%r10d,%r14d
	addl	%r15d,%r12d
	movl	%r11d,%r15d

	rorl	$6,%r13d
	andl	%r10d,%r9d
	andl	%eax,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r9d

	addl	%r12d,%ebx
	addl	%r12d,%r9d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r9d

	movl	12(%rsi),%r12d
	movl	%ebx,%r13d
	movl	%r9d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ecx,%r15d
	movl	%r12d,12(%rsp)

	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%r9d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ebx,%r15d
	movl	%r10d,%r8d

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	xorl	%r11d,%r8d
	xorl	%r9d,%r14d
	addl	%r15d,%r12d
	movl	%r10d,%r15d

	rorl	$6,%r13d
	andl	%r9d,%r8d
	andl	%r11d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r8d

	addl	%r12d,%eax
	addl	%r12d,%r8d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r8d

	movl	16(%rsi),%r12d
	movl	%eax,%r13d
	movl	%r8d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ebx,%r15d
	movl	%r12d,16(%rsp)

	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%r8d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%eax,%r15d
	movl	%r9d,%edx

	rorl	$11,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	xorl	%r10d,%edx
	xorl	%r8d,%r14d
	addl	%r15d,%r12d
	movl	%r9d,%r15d

	rorl	$6,%r13d
	andl	%r8d,%edx
	andl	%r10d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%edx

	addl	%r12d,%r11d
	addl	%r12d,%edx
	leaq	1(%rdi),%rdi
	addl	%r14d,%edx

	movl	20(%rsi),%r12d
	movl	%r11d,%r13d
	movl	%edx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%eax,%r15d
	movl	%r12d,20(%rsp)

	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%edx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r11d,%r15d
	movl	%r8d,%ecx

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	xorl	%r9d,%ecx
	xorl	%edx,%r14d
	addl	%r15d,%r12d
	movl	%r8d,%r15d

	rorl	$6,%r13d
	andl	%edx,%ecx
	andl	%r9d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ecx

	addl	%r12d,%r10d
	addl	%r12d,%ecx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ecx

	movl	24(%rsi),%r12d
	movl	%r10d,%r13d
	movl	%ecx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r11d,%r15d
	movl	%r12d,24(%rsp)

	rorl	$9,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%ecx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r10d,%r15d
	movl	%edx,%ebx

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	xorl	%r8d,%ebx
	xorl	%ecx,%r14d
	addl	%r15d,%r12d
	movl	%edx,%r15d

	rorl	$6,%r13d
	andl	%ecx,%ebx
	andl	%r8d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ebx

	addl	%r12d,%r9d
	addl	%r12d,%ebx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ebx

	movl	28(%rsi),%r12d
	movl	%r9d,%r13d
	movl	%ebx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r10d,%r15d
	movl	%r12d,28(%rsp)

	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%ebx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r9d,%r15d
	movl	%ecx,%eax

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	xorl	%edx,%eax
	xorl	%ebx,%r14d
	addl	%r15d,%r12d
	movl	%ecx,%r15d

	rorl	$6,%r13d
	andl	%ebx,%eax
	andl	%edx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%eax

	addl	%r12d,%r8d
	addl	%r12d,%eax
	leaq	1(%rdi),%rdi
	addl	%r14d,%eax

	movl	32(%rsi),%r12d
	movl	%r8d,%r13d
	movl	%eax,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r9d,%r15d
	movl	%r12d,32(%rsp)

	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%eax,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r8d,%r15d
	movl	%ebx,%r11d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	xorl	%ecx,%r11d
	xorl	%eax,%r14d
	addl	%r15d,%r12d
	movl	%ebx,%r15d

	rorl	$6,%r13d
	andl	%eax,%r11d
	andl	%ecx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r11d

	addl	%r12d,%edx
	addl	%r12d,%r11d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r11d

	movl	36(%rsi),%r12d
	movl	%edx,%r13d
	movl	%r11d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r8d,%r15d
	movl	%r12d,36(%rsp)

	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r11d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%edx,%r15d
	movl	%eax,%r10d

	rorl	$11,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	xorl	%ebx,%r10d
	xorl	%r11d,%r14d
	addl	%r15d,%r12d
	movl	%eax,%r15d

	rorl	$6,%r13d
	andl	%r11d,%r10d
	andl	%ebx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r10d

	addl	%r12d,%ecx
	addl	%r12d,%r10d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r10d

	movl	40(%rsi),%r12d
	movl	%ecx,%r13d
	movl	%r10d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%edx,%r15d
	movl	%r12d,40(%rsp)

	rorl	$9,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r10d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ecx,%r15d
	movl	%r11d,%r9d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	xorl	%eax,%r9d
	xorl	%r10d,%r14d
	addl	%r15d,%r12d
	movl	%r11d,%r15d

	rorl	$6,%r13d
	andl	%r10d,%r9d
	andl	%eax,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r9d

	addl	%r12d,%ebx
	addl	%r12d,%r9d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r9d

	movl	44(%rsi),%r12d
	movl	%ebx,%r13d
	movl	%r9d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ecx,%r15d
	movl	%r12d,44(%rsp)

	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%r9d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ebx,%r15d
	movl	%r10d,%r8d

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	xorl	%r11d,%r8d
	xorl	%r9d,%r14d
	addl	%r15d,%r12d
	movl	%r10d,%r15d

	rorl	$6,%r13d
	andl	%r9d,%r8d
	andl	%r11d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r8d

	addl	%r12d,%eax
	addl	%r12d,%r8d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r8d

	movl	48(%rsi),%r12d
	movl	%eax,%r13d
	movl	%r8d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ebx,%r15d
	movl	%r12d,48(%rsp)

	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%r8d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%eax,%r15d
	movl	%r9d,%edx

	rorl	$11,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	xorl	%r10d,%edx
	xorl	%r8d,%r14d
	addl	%r15d,%r12d
	movl	%r9d,%r15d

	rorl	$6,%r13d
	andl	%r8d,%edx
	andl	%r10d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%edx

	addl	%r12d,%r11d
	addl	%r12d,%edx
	leaq	1(%rdi),%rdi
	addl	%r14d,%edx

	movl	52(%rsi),%r12d
	movl	%r11d,%r13d
	movl	%edx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%eax,%r15d
	movl	%r12d,52(%rsp)

	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%edx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r11d,%r15d
	movl	%r8d,%ecx

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	xorl	%r9d,%ecx
	xorl	%edx,%r14d
	addl	%r15d,%r12d
	movl	%r8d,%r15d

	rorl	$6,%r13d
	andl	%edx,%ecx
	andl	%r9d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ecx

	addl	%r12d,%r10d
	addl	%r12d,%ecx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ecx

	movl	56(%rsi),%r12d
	movl	%r10d,%r13d
	movl	%ecx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r11d,%r15d
	movl	%r12d,56(%rsp)

	rorl	$9,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%ecx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r10d,%r15d
	movl	%edx,%ebx

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	xorl	%r8d,%ebx
	xorl	%ecx,%r14d
	addl	%r15d,%r12d
	movl	%edx,%r15d

	rorl	$6,%r13d
	andl	%ecx,%ebx
	andl	%r8d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ebx

	addl	%r12d,%r9d
	addl	%r12d,%ebx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ebx

	movl	60(%rsi),%r12d
	movl	%r9d,%r13d
	movl	%ebx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r10d,%r15d
	movl	%r12d,60(%rsp)

	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%ebx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r9d,%r15d
	movl	%ecx,%eax

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	xorl	%edx,%eax
	xorl	%ebx,%r14d
	addl	%r15d,%r12d
	movl	%ecx,%r15d

	rorl	$6,%r13d
	andl	%ebx,%eax
	andl	%edx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%eax

	addl	%r12d,%r8d
	addl	%r12d,%eax
	leaq	1(%rdi),%rdi
	addl	%r14d,%eax

	jmp	.Lrounds_16_xx
.p2align	4
.Lrounds_16_xx:
	movl	4(%rsp),%r13d
	movl	56(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	36(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	0(%rsp),%r12d
	movl	%r8d,%r13d
	addl	%r14d,%r12d
	movl	%eax,%r14d
	rorl	$14,%r13d
	movl	%r9d,%r15d
	movl	%r12d,0(%rsp)

	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%eax,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r8d,%r15d
	movl	%ebx,%r11d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	xorl	%ecx,%r11d
	xorl	%eax,%r14d
	addl	%r15d,%r12d
	movl	%ebx,%r15d

	rorl	$6,%r13d
	andl	%eax,%r11d
	andl	%ecx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r11d

	addl	%r12d,%edx
	addl	%r12d,%r11d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r11d

	movl	8(%rsp),%r13d
	movl	60(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	40(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	4(%rsp),%r12d
	movl	%edx,%r13d
	addl	%r14d,%r12d
	movl	%r11d,%r14d
	rorl	$14,%r13d
	movl	%r8d,%r15d
	movl	%r12d,4(%rsp)

	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r11d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%edx,%r15d
	movl	%eax,%r10d

	rorl	$11,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	xorl	%ebx,%r10d
	xorl	%r11d,%r14d
	addl	%r15d,%r12d
	movl	%eax,%r15d

	rorl	$6,%r13d
	andl	%r11d,%r10d
	andl	%ebx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r10d

	addl	%r12d,%ecx
	addl	%r12d,%r10d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r10d

	movl	12(%rsp),%r13d
	movl	0(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	44(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	8(%rsp),%r12d
	movl	%ecx,%r13d
	addl	%r14d,%r12d
	movl	%r10d,%r14d
	rorl	$14,%r13d
	movl	%edx,%r15d
	movl	%r12d,8(%rsp)

	rorl	$9,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r10d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ecx,%r15d
	movl	%r11d,%r9d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	xorl	%eax,%r9d
	xorl	%r10d,%r14d
	addl	%r15d,%r12d
	movl	%r11d,%r15d

	rorl	$6,%r13d
	andl	%r10d,%r9d
	andl	%eax,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r9d

	addl	%r12d,%ebx
	addl	%r12d,%r9d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r9d

	movl	16(%rsp),%r13d
	movl	4(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	48(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	12(%rsp),%r12d
	movl	%ebx,%r13d
	addl	%r14d,%r12d
	movl	%r9d,%r14d
	rorl	$14,%r13d
	movl	%ecx,%r15d
	movl	%r12d,12(%rsp)

	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%r9d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ebx,%r15d
	movl	%r10d,%r8d

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	xorl	%r11d,%r8d
	xorl	%r9d,%r14d
	addl	%r15d,%r12d
	movl	%r10d,%r15d

	rorl	$6,%r13d
	andl	%r9d,%r8d
	andl	%r11d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r8d

	addl	%r12d,%eax
	addl	%r12d,%r8d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r8d

	movl	20(%rsp),%r13d
	movl	8(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	52(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	16(%rsp),%r12d
	movl	%eax,%r13d
	addl	%r14d,%r12d
	movl	%r8d,%r14d
	rorl	$14,%r13d
	movl	%ebx,%r15d
	movl	%r12d,16(%rsp)

	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%r8d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%eax,%r15d
	movl	%r9d,%edx

	rorl	$11,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	xorl	%r10d,%edx
	xorl	%r8d,%r14d
	addl	%r15d,%r12d
	movl	%r9d,%r15d

	rorl	$6,%r13d
	andl	%r8d,%edx
	andl	%r10d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%edx

	addl	%r12d,%r11d
	addl	%r12d,%edx
	leaq	1(%rdi),%rdi
	addl	%r14d,%edx

	movl	24(%rsp),%r13d
	movl	12(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	56(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	20(%rsp),%r12d
	movl	%r11d,%r13d
	addl	%r14d,%r12d
	movl	%edx,%r14d
	rorl	$14,%r13d
	movl	%eax,%r15d
	movl	%r12d,20(%rsp)

	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%edx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r11d,%r15d
	movl	%r8d,%ecx

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	xorl	%r9d,%ecx
	xorl	%edx,%r14d
	addl	%r15d,%r12d
	movl	%r8d,%r15d

	rorl	$6,%r13d
	andl	%edx,%ecx
	andl	%r9d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ecx

	addl	%r12d,%r10d
	addl	%r12d,%ecx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ecx

	movl	28(%rsp),%r13d
	movl	16(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	60(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	24(%rsp),%r12d
	movl	%r10d,%r13d
	addl	%r14d,%r12d
	movl	%ecx,%r14d
	rorl	$14,%r13d
	movl	%r11d,%r15d
	movl	%r12d,24(%rsp)

	rorl	$9,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%ecx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r10d,%r15d
	movl	%edx,%ebx

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	xorl	%r8d,%ebx
	xorl	%ecx,%r14d
	addl	%r15d,%r12d
	movl	%edx,%r15d

	rorl	$6,%r13d
	andl	%ecx,%ebx
	andl	%r8d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ebx

	addl	%r12d,%r9d
	addl	%r12d,%ebx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ebx

	movl	32(%rsp),%r13d
	movl	20(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	0(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	28(%rsp),%r12d
	movl	%r9d,%r13d
	addl	%r14d,%r12d
	movl	%ebx,%r14d
	rorl	$14,%r13d
	movl	%r10d,%r15d
	movl	%r12d,28(%rsp)

	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%ebx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r9d,%r15d
	movl	%ecx,%eax

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	xorl	%edx,%eax
	xorl	%ebx,%r14d
	addl	%r15d,%r12d
	movl	%ecx,%r15d

	rorl	$6,%r13d
	andl	%ebx,%eax
	andl	%edx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%eax

	addl	%r12d,%r8d
	addl	%r12d,%eax
	leaq	1(%rdi),%rdi
	addl	%r14d,%eax

	movl	36(%rsp),%r13d
	movl	24(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	4(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	32(%rsp),%r12d
	movl	%r8d,%r13d
	addl	%r14d,%r12d
	movl	%eax,%r14d
	rorl	$14,%r13d
	movl	%r9d,%r15d
	movl	%r12d,32(%rsp)

	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%eax,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r8d,%r15d
	movl	%ebx,%r11d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r15d

	xorl	%ecx,%r11d
	xorl	%eax,%r14d
	addl	%r15d,%r12d
	movl	%ebx,%r15d

	rorl	$6,%r13d
	andl	%eax,%r11d
	andl	%ecx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r11d

	addl	%r12d,%edx
	addl	%r12d,%r11d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r11d

	movl	40(%rsp),%r13d
	movl	28(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	8(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	36(%rsp),%r12d
	movl	%edx,%r13d
	addl	%r14d,%r12d
	movl	%r11d,%r14d
	rorl	$14,%r13d
	movl	%r8d,%r15d
	movl	%r12d,36(%rsp)

	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r11d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%edx,%r15d
	movl	%eax,%r10d

	rorl	$11,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r15d

	xorl	%ebx,%r10d
	xorl	%r11d,%r14d
	addl	%r15d,%r12d
	movl	%eax,%r15d

	rorl	$6,%r13d
	andl	%r11d,%r10d
	andl	%ebx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r10d

	addl	%r12d,%ecx
	addl	%r12d,%r10d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r10d

	movl	44(%rsp),%r13d
	movl	32(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	12(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	40(%rsp),%r12d
	movl	%ecx,%r13d
	addl	%r14d,%r12d
	movl	%r10d,%r14d
	rorl	$14,%r13d
	movl	%edx,%r15d
	movl	%r12d,40(%rsp)

	rorl	$9,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r10d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ecx,%r15d
	movl	%r11d,%r9d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r15d

	xorl	%eax,%r9d
	xorl	%r10d,%r14d
	addl	%r15d,%r12d
	movl	%r11d,%r15d

	rorl	$6,%r13d
	andl	%r10d,%r9d
	andl	%eax,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r9d

	addl	%r12d,%ebx
	addl	%r12d,%r9d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r9d

	movl	48(%rsp),%r13d
	movl	36(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	16(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	44(%rsp),%r12d
	movl	%ebx,%r13d
	addl	%r14d,%r12d
	movl	%r9d,%r14d
	rorl	$14,%r13d
	movl	%ecx,%r15d
	movl	%r12d,44(%rsp)

	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%r9d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%ebx,%r15d
	movl	%r10d,%r8d

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r15d

	xorl	%r11d,%r8d
	xorl	%r9d,%r14d
	addl	%r15d,%r12d
	movl	%r10d,%r15d

	rorl	$6,%r13d
	andl	%r9d,%r8d
	andl	%r11d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%r8d

	addl	%r12d,%eax
	addl	%r12d,%r8d
	leaq	1(%rdi),%rdi
	addl	%r14d,%r8d

	movl	52(%rsp),%r13d
	movl	40(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	20(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	48(%rsp),%r12d
	movl	%eax,%r13d
	addl	%r14d,%r12d
	movl	%r8d,%r14d
	rorl	$14,%r13d
	movl	%ebx,%r15d
	movl	%r12d,48(%rsp)

	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%r8d,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%eax,%r15d
	movl	%r9d,%edx

	rorl	$11,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r15d

	xorl	%r10d,%edx
	xorl	%r8d,%r14d
	addl	%r15d,%r12d
	movl	%r9d,%r15d

	rorl	$6,%r13d
	andl	%r8d,%edx
	andl	%r10d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%edx

	addl	%r12d,%r11d
	addl	%r12d,%edx
	leaq	1(%rdi),%rdi
	addl	%r14d,%edx

	movl	56(%rsp),%r13d
	movl	44(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	24(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	52(%rsp),%r12d
	movl	%r11d,%r13d
	addl	%r14d,%r12d
	movl	%edx,%r14d
	rorl	$14,%r13d
	movl	%eax,%r15d
	movl	%r12d,52(%rsp)

	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%edx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r11d,%r15d
	movl	%r8d,%ecx

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r15d

	xorl	%r9d,%ecx
	xorl	%edx,%r14d
	addl	%r15d,%r12d
	movl	%r8d,%r15d

	rorl	$6,%r13d
	andl	%edx,%ecx
	andl	%r9d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ecx

	addl	%r12d,%r10d
	addl	%r12d,%ecx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ecx

	movl	60(%rsp),%r13d
	movl	48(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	28(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	56(%rsp),%r12d
	movl	%r10d,%r13d
	addl	%r14d,%r12d
	movl	%ecx,%r14d
	rorl	$14,%r13d
	movl	%r11d,%r15d
	movl	%r12d,56(%rsp)

	rorl	$9,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%ecx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r10d,%r15d
	movl	%edx,%ebx

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r15d

	xorl	%r8d,%ebx
	xorl	%ecx,%r14d
	addl	%r15d,%r12d
	movl	%edx,%r15d

	rorl	$6,%r13d
	andl	%ecx,%ebx
	andl	%r8d,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%ebx

	addl	%r12d,%r9d
	addl	%r12d,%ebx
	leaq	1(%rdi),%rdi
	addl	%r14d,%ebx

	movl	0(%rsp),%r13d
	movl	52(%rsp),%r14d
	movl	%r13d,%r12d
	movl	%r14d,%r15d

	rorl	$11,%r12d
	xorl	%r13d,%r12d
	shrl	$3,%r13d

	rorl	$7,%r12d
	xorl	%r12d,%r13d
	movl	32(%rsp),%r12d

	rorl	$2,%r15d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	addl	%r13d,%r12d
	xorl	%r15d,%r14d

	addl	60(%rsp),%r12d
	movl	%r9d,%r13d
	addl	%r14d,%r12d
	movl	%ebx,%r14d
	rorl	$14,%r13d
	movl	%r10d,%r15d
	movl	%r12d,60(%rsp)

	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%ebx,%r14d

	addl	(%rbp,%rdi,4),%r12d
	andl	%r9d,%r15d
	movl	%ecx,%eax

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r15d

	xorl	%edx,%eax
	xorl	%ebx,%r14d
	addl	%r15d,%r12d
	movl	%ecx,%r15d

	rorl	$6,%r13d
	andl	%ebx,%eax
	andl	%edx,%r15d

	rorl	$2,%r14d
	addl	%r13d,%r12d
	addl	%r15d,%eax

	addl	%r12d,%r8d
	addl	%r12d,%eax
	leaq	1(%rdi),%rdi
	addl	%r14d,%eax

	cmpq	$64,%rdi
	jb	.Lrounds_16_xx

	movq	64+0(%rsp),%rdi
	leaq	64(%rsi),%rsi

	addl	0(%rdi),%eax
	addl	4(%rdi),%ebx
	addl	8(%rdi),%ecx
	addl	12(%rdi),%edx
	addl	16(%rdi),%r8d
	addl	20(%rdi),%r9d
	addl	24(%rdi),%r10d
	addl	28(%rdi),%r11d

	cmpq	64+16(%rsp),%rsi

	movl	%eax,0(%rdi)
	movl	%ebx,4(%rdi)
	movl	%ecx,8(%rdi)
	movl	%edx,12(%rdi)
	movl	%r8d,16(%rdi)
	movl	%r9d,20(%rdi)
	movl	%r10d,24(%rdi)
	movl	%r11d,28(%rdi)
	jb	.Lloop

	movq	64+24(%rsp),%rsi
	movq	(%rsi),%r15
	movq	8(%rsi),%r14
	movq	16(%rsi),%r13
	movq	24(%rsi),%r12
	movq	32(%rsi),%rbp
	movq	40(%rsi),%rbx
	leaq	48(%rsi),%rsp
.Lepilogue:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3
.LSEH_end_sha256_block_data_order:
.p2align	6

K256:
.long	0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5
.long	0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5
.long	0xd807aa98,0x12835b01,0x243185be,0x550c7dc3
.long	0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174
.long	0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc
.long	0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da
.long	0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7
.long	0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967
.long	0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13
.long	0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85
.long	0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3
.long	0xd192e819,0xd6990624,0xf40e3585,0x106aa070
.long	0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5
.long	0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3
.long	0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208
.long	0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2

.def	se_handler;	.scl 3;	.type 32;	.endef
.p2align	4
se_handler:
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushfq
	subq	$64,%rsp

	movq	120(%r8),%rax
	movq	248(%r8),%rbx

	leaq	.Lprologue(%rip),%r10
	cmpq	%r10,%rbx
	jb	.Lin_prologue

	movq	152(%r8),%rax

	leaq	.Lepilogue(%rip),%r10
	cmpq	%r10,%rbx
	jae	.Lin_prologue

	movq	64+24(%rax),%rax
	leaq	48(%rax),%rax

	movq	-8(%rax),%rbx
	movq	-16(%rax),%rbp
	movq	-24(%rax),%r12
	movq	-32(%rax),%r13
	movq	-40(%rax),%r14
	movq	-48(%rax),%r15
	movq	%rbx,144(%r8)
	movq	%rbp,160(%r8)
	movq	%r12,216(%r8)
	movq	%r13,224(%r8)
	movq	%r14,232(%r8)
	movq	%r15,240(%r8)

.Lin_prologue:
	movq	8(%rax),%rdi
	movq	16(%rax),%rsi
	movq	%rax,152(%r8)
	movq	%rsi,168(%r8)
	movq	%rdi,176(%r8)

	movq	40(%r9),%rdi
	movq	%r8,%rsi
	movl	$154,%ecx
.long	0xa548f3fc		

	movq	%r9,%rsi
	xorq	%rcx,%rcx
	movq	8(%rsi),%rdx
	movq	0(%rsi),%r8
	movq	16(%rsi),%r9
	movq	40(%rsi),%r10
	leaq	56(%rsi),%r11
	leaq	24(%rsi),%r12
	movq	%r10,32(%rsp)
	movq	%r11,40(%rsp)
	movq	%r12,48(%rsp)
	movq	%rcx,56(%rsp)
	call	*__imp_RtlVirtualUnwind(%rip)

	movl	$1,%eax
	addq	$64,%rsp
	popfq
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	.byte	0xf3,0xc3


.section	.pdata
.p2align	2
.rva	.LSEH_begin_sha256_block_data_order
.rva	.LSEH_end_sha256_block_data_order
.rva	.LSEH_info_sha256_block_data_order

.section	.xdata
.p2align	3
.LSEH_info_sha256_block_data_order:
.byte	9,0,0,0
.rva	se_handler

