Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4A219FC
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334791; cv=none; b=BvwOnrXqSWE3MRmoyeuS9lEqJJJHTiUrnxbTRZjVCY3jP/wBkQ5rfusEyk8/jLEu1fyzjKC1Jp8exMOiW5Mf2oFaQ/ykdE0iI8jABmgsO/6L1+3Ou8fgjl+LOnIIx7XhkB9Y9s5FNPx34G3MP/FBTftyH5avJRDiOUXqGZAvpno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334791; c=relaxed/simple;
	bh=4bQWAMoKRlrIwbEK+mE6o5LwCwr9DNdfvHwZqOw9gM4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeO7Zy/0gsLIGkrf7H/hB+6XwKtOknxq+1ROlfiTylV5i80hFSny9j2xCr6a9Go8wht/dMbcVWIrV+dbGZOJqwz8uwTFVITmgD9/IAGpJn12Y5ZpVYUfTZLPJp1tvY9zkSg1en9rm/+tv4vZYHw8/k+4PLiyzFIrrFZfgaMdI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=F9+hhaZX; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="F9+hhaZX"
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AE82A3F887
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738334785;
	bh=dywRc+w6ungfZW0YZ3G7arI+8S//8XTXJSb7hsNnVZc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=F9+hhaZXymSVXz51n9MZJ8mCsHS4Dj0QCHmPm6YS0VYdBq0X1u0CPcAgXmGXxSmAf
	 PaIn9zVu591hB0gjD88jZSu+8YFxtYiYkK54j7jhIF9pLX8+gvGkPGEPfBhF00sGw0
	 nYhRKUzlXDiFkFpzP9q2BBeWk/FQmsxiPF4x7B4CU+Ru8c30DPyd6hr0NaODUUSHS3
	 a0hjU/raMdLzJeuImWN+WiFdhNZpLgf0ZgEcJVtGjK7upEKE6RmlgOMyQdGu2PwWRW
	 7wKpX7OKeVKIGhaW6ej5ThvfiwzeCiCMAhNfqzdmceKte3S58nY4sWNouaS+t15M9Q
	 8NxgwlQRFMyDw==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-29fec25e14cso644111fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334784; x=1738939584;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dywRc+w6ungfZW0YZ3G7arI+8S//8XTXJSb7hsNnVZc=;
        b=OJ1F180cBAcmjpNmdn4R1KtAst3w1WTlGu0wikpxteNWh2A9AZXlmuSXXTSIQ/OKTV
         8qC03S6KJq9mOXMJ2lJirYGeeg3yFdIGJFmSUAN5tWw5pftOLSZTtA6P1vonwBz0T7Or
         xXZrhalzjP0OYWCrdtKEmnSx/jVyN2Ii95s6nFqisOtwxsBGRbIC/BJGEilPSMP5D9Qq
         VKMZCn5WxsfR5SfLNysU9QTuM0w41FjaG2/UQVRmgE1AHjyPAvYslB/lyQrJTaX8YC17
         8Z4KZXtgGoV9WK3TbP9/iHfDf+1Ok7av6Z/wAEz5ghMBxvgz0T8lm9eOksbK7MWHEX2g
         TKqA==
X-Forwarded-Encrypted: i=1; AJvYcCUcc1NGbEZqDLTPbob41TCgtUDEO2Ino7tPP2mAMkGe/eQbgoQ/eIkUuqF+mqKl3TeMBm/u5BhlnCg0fSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoM3qhFb95q1rdUYVYvhVRFUidQniya0RZc3YPIsS5Eu/lmG27
	6zU06zGFIMBcS6PJMt6CIjBqrzKGwZPdRH8q9D+VofraHFYXSpv8YGJfgEZaXTTxJ0ujJTUu4VK
	VW0v4pySRoO1AY/oj4UIc4f8Om08l2gMYrWpJdxIU/y2YIuuYSUxGDp7bmAOheoX9CrwB/3ltBK
	QBFGDkwaw72tOp8trp3WGE3YWiq+DEgCH3kJnNlZ1H5Kc35pQUy4ZQ
X-Gm-Gg: ASbGncsAfeDoTxBqz39RUC5KKJy0V4wquk3YMHmHP9/X8FM/Zn0j2PUkJrSpaJl9d0a
	XPDdelL8+6PWkRRRYvLMulyk8cwP1FMujK8ZbLL6mYWsSGmj4QYWSjkV2cYp1
X-Received: by 2002:a05:6870:1594:b0:29d:c624:7cad with SMTP id 586e51a60fabf-2b32ef5de6fmr6786553fac.3.1738334783982;
        Fri, 31 Jan 2025 06:46:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEk0Mm8kCCRu1JZ2u85IGHR2JJAo4akW8JtTSMAgqE2qPAqAaSfJ/Jh8m9xwiOfe7gW/AMktmc6ShR8XOgPlg=
X-Received: by 2002:a05:6870:1594:b0:29d:c624:7cad with SMTP id
 586e51a60fabf-2b32ef5de6fmr6786537fac.3.1738334783696; Fri, 31 Jan 2025
 06:46:23 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jan 2025 06:46:23 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jan 2025 06:46:23 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <Z5wHgRG6eZKFevUQ@ghost>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
 <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com> <Z5wHgRG6eZKFevUQ@ghost>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 31 Jan 2025 06:46:23 -0800
X-Gm-Features: AWEUYZksa4XSPdbmNSDJbnQ0sYft5p5YH7tqYEotYpDJYI8gigcAowye6m9V_5E
Message-ID: <CAJM55Z-9-WHY+31=6j-wAiaZdaPv_aH_=P6LEi16twgYH0FL6g@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Add runtime constant support
To: Charlie Jenkins <charlie@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Pasha Bouzarjomehri <pasha@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Charlie Jenkins wrote:
> On Wed, Jan 29, 2025 at 04:30:49AM -0500, Emil Renner Berthing wrote:
> > Charlie Jenkins wrote:
> > > Implement the runtime constant infrastructure for riscv. Use this
> > > infrastructure to generate constants to be used by the d_hash()
> > > function.
> > >
> > > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > > constant' support") and commit e3c92e81711d ("runtime constants: add
> > > x86 architecture support").
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > > Ard brought this to my attention in this patch [1].
> > >
> > > [1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
> > > ---
> > > Changes in v3:
> > > - Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
> > >   by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
> > > - Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com
> > >
> > > Changes in v2:
> > > - Treat instructions as __le32 and do proper conversions (Ben)
> > > - Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
> > > ---
> > >  arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
> > >  arch/riscv/kernel/vmlinux.lds.S        |   3 +
> > >  2 files changed, 197 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/runtime-const.h
> > > @@ -0,0 +1,194 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> > > +#define _ASM_RISCV_RUNTIME_CONST_H
> > > +
> > > +#include <asm/alternative.h>
> > > +#include <asm/cacheflush.h>
> > > +#include <asm/text-patching.h>
> > > +#include <linux/uaccess.h>
> > > +
> > > +#ifdef CONFIG_32BIT
> > > +#define runtime_const_ptr(sym)					\
> > > +({								\
> > > +	typeof(sym) __ret, __tmp;				\
> > > +	asm_inline("1:\t"					\
> > > +		".option push"					\
> > > +		".option norvc"					\
> > > +		"lui	%[__ret],0x89abd\n\t"			\
> > > +		"addi	%[__ret],-0x211\n\t"			\
> > > +		".option pop"					\
> > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
> > > +		".long 1b - .\n\t"				\
> > > +		".popsection"					\
> > > +		: [__ret] "=r" (__ret));			\
> > > +	__ret;							\
> > > +})
> > > +#else
> > > +/*
> > > + * Loading 64-bit constants into a register from immediates is a non-trivial
> > > + * task on riscv64. To get it somewhat performant, load 32 bits into two
> > > + * different registers and then combine the results.
> > > + *
> > > + * If the processor supports the Zbkb extension, we can combine the final
> > > + * "slli,slli,srli,add" into the single "pack" instruction. If the processor
> > > + * doesn't support Zbkb but does support the Zbb extension, we can
> > > + * combine the final "slli,srli,add" into one instruction "add.uw".
> > > + */
> > > +#define runtime_const_ptr(sym)						\
> > > +({									\
> > > +	typeof(sym) __ret, __tmp;					\
> > > +	asm_inline("1:\t"						\
> > > +		".option push\n\t"					\
> > > +		".option norvc\n\t"					\
> > > +		"lui	%[__ret],0x89abd\n\t"				\
> > > +		"lui	%[__tmp],0x1234\n\t"				\
> > > +		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> > > +		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> > > +		ALTERNATIVE_2(						\
> > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > +			"slli	%[__ret],%[__ret],32\n\t"		\
> > > +			"srli	%[__ret],%[__ret],32\n\t"		\
> > > +			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
> > > +			".option push\n\t"				\
> > > +			".option arch,+zba\n\t"				\
> > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > +			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
> > > +			"nop\n\t"					\
> > > +			"nop\n\t"					\
> > > +			".option pop\n\t",				\
> > > +			0, RISCV_ISA_EXT_ZBA, 1,			\
> > > +			".option push\n\t"				\
> > > +			".option arch,+zbkb\n\t"			\
> > > +			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
> > > +			"nop\n\t"					\
> > > +			"nop\n\t"					\
> > > +			"nop\n\t"					\
> > > +			".option pop\n\t",				\
> > > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > > +		)							\
> > > +		".option pop\n\t"					\
> > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> > > +		".long 1b - .\n\t"					\
> > > +		".popsection"						\
> > > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > > +	__ret;								\
> > > +})
> > > +#endif
> > > +
> > > +#ifdef CONFIG_32BIT
> > > +#define SRLI "srli "
> > > +#else
> > > +#define SRLI "srliw "
> > > +#endif
> > > +
> > > +#define runtime_const_shift_right_32(val, sym)			\
> > > +({								\
> > > +	u32 __ret;						\
> > > +	asm_inline("1:\t"					\
> > > +		".option push\n\t"				\
> > > +		".option norvc\n\t"				\
> > > +		SRLI "%[__ret],%[__val],12\n\t"			\
> > > +		".option pop\n\t"				\
> > > +		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
> > > +		".long 1b - .\n\t"				\
> > > +		".popsection"					\
> > > +		: [__ret] "=r" (__ret)				\
> > > +		: [__val] "r" (val));				\
> > > +	__ret;							\
> > > +})
> > > +
> > > +#define runtime_const_init(type, sym) do {			\
> > > +	extern s32 __start_runtime_##type##_##sym[];		\
> > > +	extern s32 __stop_runtime_##type##_##sym[];		\
> > > +								\
> > > +	runtime_const_fixup(__runtime_fixup_##type,		\
> > > +			    (unsigned long)(sym),		\
> > > +			    __start_runtime_##type##_##sym,	\
> > > +			    __stop_runtime_##type##_##sym);	\
> > > +} while (0)
> > > +
> > > +static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> > > +{
> > > +	/* On riscv there are currently only cache-wide flushes so va is ignored. */
> > > +	__always_unused uintptr_t va = (uintptr_t)where;
> > > +
> > > +	flush_icache_range(va, va + 4*insns);
> > > +}
> > > +
> > > +/*
> > > + * The 32-bit immediate is stored in a lui+addi pairing.
> > > + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> > > + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> > > + */
> > > +static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
> > > +{
> > > +	unsigned int lower_immediate, upper_immediate;
> > > +	u32 lui_insn = le32_to_cpu(*lui);
> > > +	u32 addi_insn = le32_to_cpu(*addi);
> >
> > Because of the compressed extensions RISC-V instructions are only aligned on
> > 16bit boundaries, so is there another reason you know that these two
> > instructions are 32bit aligned? Otherwise you're adding unaligned accesses
> > here.
>
> Great point, thank you. I will add a ".align 4" to the beginning of
> these instructions to force the alignment.

Unless there is a specific reason to do the alignment in this case, I'd much
rather we just do two 16bit reads like riscv/kernel/module.c already does.

/Emil
