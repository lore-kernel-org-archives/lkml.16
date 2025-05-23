Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F467198E9B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987308; cv=none; b=OjOG2dbr8FT5/I1CRHaBN+7vYhZ7xzKnHR7E1P9KSgs4cqCY6THcjlYyQGM3tSuU67DYc7fNN5rZo0TFr1K/bHTE+pTctliV+pVKTKUno4NeLpkTJKYDI63f0sn1yxHxf7C4BY/KxjGR/1ySngDvar6x0FOWO3haiNutsCrR204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987308; c=relaxed/simple;
	bh=XtsfPySZmsPYhLCa7u2NOLD1PI4C8l4MHHOG5o5rSnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbBh0HVQJqXNBU974+xVyS6OJ06najCKGeKRx4dkfcAFA2I9ynGSX84XjxTLXTd16Z/aRKI1/EoNckQe4YY0MpkWkqYpaw2iFhTa2AAWbovhjtKhUQR9I+wFB+jNgaOVNJa6SInT5YlADFJmnziSWy77U2qW9B+QFB6Xw7SnBcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AD2641B5F;
	Fri, 23 May 2025 08:01:35 +0000 (UTC)
Message-ID: <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
Date: Fri, 23 May 2025 10:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Xi Ruoyao <xry111@xry111.site>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250411024600.16045-1-xry111@xry111.site>
 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekfedvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtudeuhfetffegveehledujedvleeftdeuleegleegiefgleekleevkeelveekueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhlughsrdhssgdpvhhgvghtrhgrnhguohhmqdgthhgrtghhrgdrshgspdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepthhhohhmrghsrdifvghis
 hhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopeigrhihudduudesgihrhiduuddurdhsihhtvgdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplfgrshhonhesiiigvdgtgedrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehguhhorhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Xi,

On 4/11/25 10:04, Thomas Weißschuh wrote:
> On Fri, Apr 11, 2025 at 10:46:00AM +0800, Xi Ruoyao wrote:
>> Hook up the generic vDSO implementation to the generic vDSO getrandom
>> implementation by providing the required __arch_chacha20_blocks_nostack
>> and getrandom_syscall implementations. Also wire up the selftests.
>>
>> The benchmark result:
>>
>> 	vdso: 25000000 times in 2.466341333 seconds
>> 	libc: 25000000 times in 41.447720005 seconds
>> 	syscall: 25000000 times in 41.043926672 seconds
>>
>> 	vdso: 25000000 x 256 times in 162.286219353 seconds
>> 	libc: 25000000 x 256 times in 2953.855018685 seconds
>> 	syscall: 25000000 x 256 times in 2796.268546000 seconds
>>
>> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
>> ---
>>
>> [v1]->v2:
>> - Fix the commit message.
>> - Only build the vDSO getrandom code if CONFIG_VDSO_GETRANDOM, to
>>    unbreak RV32 build.
>> - Likewise, only enable the selftest if __riscv_xlen == 64.
>>
>> [v1]: https://lore.kernel.org/all/20250224122541.65045-1-xry111@xry111.site/
>>
>>   arch/riscv/Kconfig                            |   1 +
>>   arch/riscv/include/asm/vdso/getrandom.h       |  30 +++
>>   arch/riscv/kernel/vdso/Makefile               |  12 +
>>   arch/riscv/kernel/vdso/getrandom.c            |  10 +
>>   arch/riscv/kernel/vdso/vdso.lds.S             |   1 +
>>   arch/riscv/kernel/vdso/vgetrandom-chacha.S    | 244 ++++++++++++++++++
>>   .../selftests/vDSO/vgetrandom-chacha.S        |   2 +
>>   7 files changed, 300 insertions(+)
>>   create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
>>   create mode 100644 arch/riscv/kernel/vdso/getrandom.c
>>   create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S
> <snip>
>
>> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
>> index 8e86965a8aae..abc69cda0445 100644
>> --- a/arch/riscv/kernel/vdso/vdso.lds.S
>> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
>> @@ -80,6 +80,7 @@ VERSION
>>   #ifndef COMPAT_VDSO
>>   		__vdso_riscv_hwprobe;
>>   #endif
>> +		__vdso_getrandom;
> For consistency this could be gated behind CONFIG_VDSO_GETRANDOM.


Nathan sent a fix for this here:

https://lore.kernel.org/all/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org/


>
>>   	local: *;
>>   	};
>>   }
>> diff --git a/arch/riscv/kernel/vdso/vgetrandom-chacha.S b/arch/riscv/kernel/vdso/vgetrandom-chacha.S
>> new file mode 100644
>> index 000000000000..d793cadc78a6
>> --- /dev/null
>> +++ b/arch/riscv/kernel/vdso/vgetrandom-chacha.S
>> @@ -0,0 +1,244 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2025 Xi Ruoyao <xry111@xry111.site>. All Rights Reserved.
>> + *
>> + * Based on arch/loongarch/vdso/vgetrandom-chacha.S.
>> + */
>> +
>> +#include <asm/asm.h>
>> +#include <linux/linkage.h>
>> +
>> +.text
>> +
>> +.macro	ROTRI	rd rs imm
>> +	slliw	t0, \rs, 32 - \imm
>> +	srliw	\rd, \rs, \imm
>> +	or	\rd, \rd, t0
>> +.endm
>> +
>> +.macro	OP_4REG	op d0 d1 d2 d3 s0 s1 s2 s3
>> +	\op	\d0, \d0, \s0
>> +	\op	\d1, \d1, \s1
>> +	\op	\d2, \d2, \s2
>> +	\op	\d3, \d3, \s3
>> +.endm
>> +
>> +/*
>> + *	a0: output bytes
>> + * 	a1: 32-byte key input
>> + *	a2: 8-byte counter input/output
>> + *	a3: number of 64-byte blocks to write to output
>> + */
>> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
>> +
>> +#define output		a0
>> +#define key		a1
>> +#define counter		a2
>> +#define nblocks		a3
>> +#define i		a4
>> +#define state0		s0
>> +#define state1		s1
>> +#define state2		s2
>> +#define state3		s3
>> +#define state4		s4
>> +#define state5		s5
>> +#define state6		s6
>> +#define state7		s7
>> +#define state8		s8
>> +#define state9		s9
>> +#define state10		s10
>> +#define state11		s11
>> +#define state12		a5
>> +#define state13		a6
>> +#define state14		a7
>> +#define state15		t1
>> +#define cnt		t2
>> +#define copy0		t3
>> +#define copy1		t4
>> +#define copy2		t5
>> +#define copy3		t6
>> +
>> +/* Packs to be used with OP_4REG */
>> +#define line0		state0, state1, state2, state3
>> +#define line1		state4, state5, state6, state7
>> +#define line2		state8, state9, state10, state11
>> +#define line3		state12, state13, state14, state15
>> +
>> +#define line1_perm	state5, state6, state7, state4
>> +#define line2_perm	state10, state11, state8, state9
>> +#define line3_perm	state15, state12, state13, state14
>> +
>> +#define copy		copy0, copy1, copy2, copy3
>> +
>> +#define _16		16, 16, 16, 16
>> +#define _20		20, 20, 20, 20
>> +#define _24		24, 24, 24, 24
>> +#define _25		25, 25, 25, 25
>> +
>> +	addi		sp, sp, -12*SZREG
>> +	REG_S		s0,         (sp)
>> +	REG_S		s1,    SZREG(sp)
>> +	REG_S		s2,  2*SZREG(sp)
>> +	REG_S		s3,  3*SZREG(sp)
>> +	REG_S		s4,  4*SZREG(sp)
>> +	REG_S		s5,  5*SZREG(sp)
>> +	REG_S		s6,  6*SZREG(sp)
>> +	REG_S		s7,  7*SZREG(sp)
>> +	REG_S		s8,  8*SZREG(sp)
>> +	REG_S		s9,  9*SZREG(sp)
>> +	REG_S		s10, 10*SZREG(sp)
>> +	REG_S		s11, 11*SZREG(sp)
> This should have the same comment as the loongarch implementation that it is
> fine to store to the stack here. Contrary to the general claim of the
> documentation for __arch_chacha20_blocks_nostack() in include/linux/getrandom.h.


I agree, let's add the same comment.

In addition, I had to fix the presence of dynamic relocations (_mcount) 
with the following diff:

diff --git a/arch/riscv/kernel/vdso/Makefile 
b/arch/riscv/kernel/vdso/Makefile
index 7575ef088adc5..dca888852d93b 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -50,6 +50,7 @@ endif

  # Disable -pg to prevent insert call site
  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
+CFLAGS_REMOVE_getrandom.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
  CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)

  # Force dependency

I squashed all those changes into your patch before merging it, so no 
need to resend a new version.

vdso_test_chacha passes on my end so:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>
> <snip>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
