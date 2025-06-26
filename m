Received: from out0-194.mail.aliyun.com (out0-194.mail.aliyun.com [140.205.0.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1032F1FC6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750905902; cv=none; b=E2M7B/bPAHbtzgD+WOVpx5GgOXBgj0vOuBvuj2+bPIReVPZlmTyin0bgcmqFC4xKW9aXt4D/m8XC+3EKiXbdeq+Qy4/gRF+rSKwkaqmFAkhu7KqrQ0U361AJuJWMOWNGLKatyRP39UNrrv1xIhZ1l0z1LX6LGn3xMbOhEa49W/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750905902; c=relaxed/simple;
	bh=eXHLJ9xBi7VZsQtaHzVK9xg/Ouxds6gjfeBFJAekPLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZIjwJ+xkaCFAyMMyPdyu7fepcDRRyU6UbBhmFvcd6rc5SCKArRNmkNrtP0yft4CwAnlL1ssB6S+LGPZcMd73nP6A05LguSeI70582AtxVVVN3JvAb9XdAlLrnSJXk95kepmVS8//oot2leYCLJjswAlvqxZZcVIQ5GK6zmbDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=VUydF/8Y; arc=none smtp.client-ip=140.205.0.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="VUydF/8Y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1750905889; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7UPnXPOsKjZ5D5zwf0F2OFekl8t3GTKb3x0lbpqe5PQ=;
	b=VUydF/8YLidC2JDR4S5uN/z9yU8aryfVtmZg6LWbanwwPbCUCs9Ces6QdNu96Dif9LfcEBcFSfv166uz9n7SCuhKv4CFoXIemGEcPv6EiW8aNeFYTLgQwBYgBadJG/pDC+bHwwPkec6QFaR7aadGJKwdvvgTD7MrDVI6lhY7Pj8=
Received: from 30.174.116.235(mailfrom:tiwei.btw@antgroup.com fp:SMTPD_---.dWuvC4m_1750905882 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Jun 2025 10:44:49 +0800
Message-ID: <0d630dec-41fe-4968-8d6a-7faae8a554a1@antgroup.com>
Date: Thu, 26 Jun 2025 10:44:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] uml-for-6.16-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
References: <20250625121529.42911-3-johannes@sipsolutions.net>
 <CAHk-=wjTCAzaw4AXXpxcYc7v7ZjAeyaOOJw7FWXO+gV7v7Cp0g@mail.gmail.com>
Content-Language: en-US
From: "Tiwei Bie" <tiwei.btw@antgroup.com>
In-Reply-To: <CAHk-=wjTCAzaw4AXXpxcYc7v7ZjAeyaOOJw7FWXO+gV7v7Cp0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/6/26 02:17, Linus Torvalds wrote:
> On Wed, 25 Jun 2025 at 05:15, Johannes Berg <johannes@sipsolutions.net> wrote:
>>
>>  - reduce stack use with clang 19
> 
> Interesting. The patch looks fine, I'm wondering if people made a
> clang bug report about this behavior with structure assignments?
> 
> Even if most other projects likely don't have issues with stack size,
> it looks very non-optimal from a performance standpoint too to create
> a pointless temporary copy on the stack.
> 
> I assume - but didn't check - that gcc didn't do the same stupid thing
> for that code?

The behavior of gcc and clang differs. Clang's behavior appears to be
related to the volatile qualifier in arch_spinlock_t:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/spinlock_types_up.h?id=b555cb66583e99158cfef8e91c025252cefae55b#n18

It can be reproduced with this code snippet:

```c
struct foo {
	char a;
	volatile char b;
	char c[512];
};

char bar(void);
void baz(struct foo *p);

void baz(struct foo *p)
{
	*p = (struct foo) { .a = bar() };
}
```

$ clang-19 --version
Ubuntu clang version 19.1.7 (++20250114103320+cd708029e0b2-1~exp1~20250114103432.75)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-19/bin
$ clang-19 -O2 -c test.c
$ objdump -dr ./test.o

./test.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <baz>:
   0:	41 56                	push   %r14
   2:	53                   	push   %rbx
   3:	48 81 ec 18 02 00 00 	sub    $0x218,%rsp
   a:	48 89 fb             	mov    %rdi,%rbx
   d:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
  12:	ba 01 02 00 00       	mov    $0x201,%edx
  17:	4c 89 f7             	mov    %r14,%rdi
  1a:	31 f6                	xor    %esi,%esi
  1c:	e8 00 00 00 00       	call   21 <baz+0x21>
			1d: R_X86_64_PLT32	memset-0x4
  21:	e8 00 00 00 00       	call   26 <baz+0x26>
			22: R_X86_64_PLT32	bar-0x4
  26:	88 44 24 0f          	mov    %al,0xf(%rsp)
  2a:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  2f:	88 03                	mov    %al,(%rbx)
  31:	48 ff c3             	inc    %rbx
  34:	ba 01 02 00 00       	mov    $0x201,%edx
  39:	48 89 df             	mov    %rbx,%rdi
  3c:	4c 89 f6             	mov    %r14,%rsi
  3f:	e8 00 00 00 00       	call   44 <baz+0x44>
			40: R_X86_64_PLT32	memcpy-0x4
  44:	48 81 c4 18 02 00 00 	add    $0x218,%rsp
  4b:	5b                   	pop    %rbx
  4c:	41 5e                	pop    %r14
  4e:	c3                   	ret    


$ clang --version
Ubuntu clang version 14.0.0-1ubuntu1.1
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
$ clang -O2 -c test.c
$ objdump -dr ./test.o

./test.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <baz>:
   0:	41 56                	push   %r14
   2:	53                   	push   %rbx
   3:	48 81 ec 18 02 00 00 	sub    $0x218,%rsp
   a:	48 89 fb             	mov    %rdi,%rbx
   d:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
  12:	ba 01 02 00 00       	mov    $0x201,%edx
  17:	4c 89 f7             	mov    %r14,%rdi
  1a:	31 f6                	xor    %esi,%esi
  1c:	e8 00 00 00 00       	call   21 <baz+0x21>
			1d: R_X86_64_PLT32	memset-0x4
  21:	e8 00 00 00 00       	call   26 <baz+0x26>
			22: R_X86_64_PLT32	bar-0x4
  26:	88 44 24 0f          	mov    %al,0xf(%rsp)
  2a:	8a 44 24 0f          	mov    0xf(%rsp),%al
  2e:	88 03                	mov    %al,(%rbx)
  30:	48 83 c3 01          	add    $0x1,%rbx
  34:	ba 01 02 00 00       	mov    $0x201,%edx
  39:	48 89 df             	mov    %rbx,%rdi
  3c:	4c 89 f6             	mov    %r14,%rsi
  3f:	e8 00 00 00 00       	call   44 <baz+0x44>
			40: R_X86_64_PLT32	memcpy-0x4
  44:	48 81 c4 18 02 00 00 	add    $0x218,%rsp
  4b:	5b                   	pop    %rbx
  4c:	41 5e                	pop    %r14
  4e:	c3                   	ret    


$ gcc --version
gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
$ gcc -O2 -c test.c
$ objdump -dr ./test.o

./test.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <baz>:
   0:	f3 0f 1e fa          	endbr64 
   4:	53                   	push   %rbx
   5:	48 89 fb             	mov    %rdi,%rbx
   8:	e8 00 00 00 00       	call   d <baz+0xd>
			9: R_X86_64_PLT32	bar-0x4
   d:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
  11:	48 89 d9             	mov    %rbx,%rcx
  14:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  1b:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  1f:	41 89 c0             	mov    %eax,%r8d
  22:	31 c0                	xor    %eax,%eax
  24:	48 c7 83 fa 01 00 00 	movq   $0x0,0x1fa(%rbx)
  2b:	00 00 00 00 
  2f:	48 29 f9             	sub    %rdi,%rcx
  32:	81 c1 02 02 00 00    	add    $0x202,%ecx
  38:	c1 e9 03             	shr    $0x3,%ecx
  3b:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  3e:	44 88 03             	mov    %r8b,(%rbx)
  41:	5b                   	pop    %rbx
  42:	c3                   	ret    


After 's/volatile char b;/char b;/', clang-19 produces:

./test.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <baz>:
   0:	53                   	push   %rbx
   1:	48 89 fb             	mov    %rdi,%rbx
   4:	e8 00 00 00 00       	call   9 <baz+0x9>
			5: R_X86_64_PLT32	bar-0x4
   9:	88 03                	mov    %al,(%rbx)
   b:	48 ff c3             	inc    %rbx
   e:	ba 01 02 00 00       	mov    $0x201,%edx
  13:	48 89 df             	mov    %rbx,%rdi
  16:	31 f6                	xor    %esi,%esi
  18:	5b                   	pop    %rbx
  19:	e9 00 00 00 00       	jmp    1e <baz+0x1e>
			1a: R_X86_64_PLT32	memset-0x4

Regards,
Tiwei
