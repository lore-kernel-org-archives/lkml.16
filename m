Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625D139E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738358589; cv=none; b=kpggeu3cT7ymqmofO72VLtOtSBf69Bzvei2Zh7BIZxdfEV+JEZo9WqPnb+yi3MYIZEJO5Ub62JL+LvDbwMkBHTq5a2TY/xAv59Lqh8ILUjM8/Gs/TCw9aBDmJLrW8mzADSOtfrkIFJJMS5vpUc+hBdfnPNYXQpQtxBVJ3Qj/Q+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738358589; c=relaxed/simple;
	bh=cAgcRCHIoXW6gNZyv8mep46BFnxnQM1FyOezVRtFFDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbNXay4kwkmtV+eZhNpOuZa3fDXt/YiDY3HiMPnOkECBxY5KZ2DOHu6pKVsfHneR+8SuSrI+rS5EMlDk+BRSZIF5ex2sjWVQZrBHNMvYuQUnYoVJmrwDcInAAiPFdVgZ/deQUDDBbEo7svuHAIZ5PaDXrtsj5emQs5LBbPfLBO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=f0v+5ToN; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="f0v+5ToN"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2161eb95317so43989095ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738358587; x=1738963387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmxkcSFmr3z7bCHHmaNbUyAfDn1/vDB3FZnNFx07Z1k=;
        b=f0v+5ToN82w5K+UlvwGRguKQDTok5nFbVgiwPlEIT/OY3LuBG9PB7Yzn3s0qwH68Zv
         JsWrRdLzIrkFP6hGRO7pbqx2P30lmIKxHHZ/ryJt0HOgGADRA4CFYXWFgYH+7yqIwkoN
         W2PuUHNE04P7vM95tWo+3FY1VNhOFV6x/PCz15BzWMD1Pk754U49Cc9ZFSSQ48gP6Ogg
         V+lsKIyjnfDKhdDNmHRi1WwckB85OCNo1ttAVRJxVM4GQDEz8kw3zSzCPijA7Cr37hgj
         sIVx8OfY+gTO+DYxVqLu0FC1kbOOzOY3nzN2SwVHAVbJ7KtQXReYvyW6b55BARVM8rXm
         jztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738358587; x=1738963387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmxkcSFmr3z7bCHHmaNbUyAfDn1/vDB3FZnNFx07Z1k=;
        b=Eqg20x+WLb6M6em8BANg034UZ3v2XyuzkGChZKFrbFQ3btrpXa40v6uDuT/Wfb3s/v
         hAuUp11AEMKQp1KVdrxiTJCjYz9U1NhuVngGarx3YjAFcKfzkQfaSNZgdUTWqf24bZFN
         mcFFXsFe56bLccakcjYdDV2VPwkcYhy28k5PsYy81It25lDDv2qW9cPliss8s7bRbw9s
         3M0cri/Pj5fJ2jAQdVAIENn/LCl6zqxdevUUUKplN0h+LfpRf5hLk4s0aN+PyOQOeTaI
         fhUUb3pvc4x9yYtfZYCrzMMrdiNqKcvmzufMarQ2ZTilAYNyFvdU6LHVXdVhwA6pWZSV
         Q2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3E8mbm1T70A/FrhtwHFDPLlwXS+zwN5Q51EbosRgnNnoy/UCKfi394MfrRa6u7TmDaH+Vrp6AXaJrXW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxZVwYl2FXCrpdYg/ePXiUTN3ULdgTKdyYjUp1bkUiVgqOYxUp
	kQEtS21bgENIdoD8SWnEsOEzr14faCKnj3eJRqqFRWtQEOcKshTJPgwl4xfjTn6Hs8DJ1dFUXf2
	HzuDMLSon
X-Gm-Gg: ASbGncti4YE6HMhHKl+L1ej6kU6b5NGS+ef9+zX2Jjddb2XODrdOMO0AKbjSPLwYmzb
	NKsbTKjKgVTB1kIlT45zvl2seURqWHV2ybDUexXmMs7ZZ2rlUtWmUBjWFzlo8XFu5IRjhhJqkQm
	NggDjDYV8E7K/9Q8ZblM5AqplJlM7f0tUPazgQ65T8lsoV0h43jpK6JFZEauBIx1iubnJGSKUly
	vxnfRA+ZYI7aVMx0Fhl0IuEgXs9L3Khay15BP/lJ2a1SFn8AADqebk/BmNi1uq39gSobwoazB/M
	OzeGnM0r3A==
X-Google-Smtp-Source: AGHT+IHoAJHJmwdnqQn+ngdCzehp27BBh7mbd1t47saQAFMmleUTSGAfcl7vki69eEPKVt+KvIquPg==
X-Received: by 2002:a17:902:dac6:b0:215:ae3d:1dd7 with SMTP id d9443c01a7336-21dd7d80afcmr200579215ad.19.1738358585296;
        Fri, 31 Jan 2025 13:23:05 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:b67e:25c1:3d0b:392b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd09cb1sm6488071a91.21.2025.01.31.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 13:23:04 -0800 (PST)
Date: Fri, 31 Jan 2025 13:23:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Add runtime constant support
Message-ID: <Z50_NsMX731u5JBh@ghost>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
 <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com>
 <Z5wHgRG6eZKFevUQ@ghost>
 <CAJM55Z-9-WHY+31=6j-wAiaZdaPv_aH_=P6LEi16twgYH0FL6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z-9-WHY+31=6j-wAiaZdaPv_aH_=P6LEi16twgYH0FL6g@mail.gmail.com>

On Fri, Jan 31, 2025 at 06:46:23AM -0800, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:
> > On Wed, Jan 29, 2025 at 04:30:49AM -0500, Emil Renner Berthing wrote:
> > > Charlie Jenkins wrote:
> > > > Implement the runtime constant infrastructure for riscv. Use this
> > > > infrastructure to generate constants to be used by the d_hash()
> > > > function.
> > > >
> > > > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > > > constant' support") and commit e3c92e81711d ("runtime constants: add
> > > > x86 architecture support").
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > > Ard brought this to my attention in this patch [1].
> > > >
> > > > [1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
> > > > ---
> > > > Changes in v3:
> > > > - Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
> > > >   by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
> > > > - Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com
> > > >
> > > > Changes in v2:
> > > > - Treat instructions as __le32 and do proper conversions (Ben)
> > > > - Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
> > > > ---
> > > >  arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
> > > >  arch/riscv/kernel/vmlinux.lds.S        |   3 +
> > > >  2 files changed, 197 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
> > > > --- /dev/null
> > > > +++ b/arch/riscv/include/asm/runtime-const.h
> > > > @@ -0,0 +1,194 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> > > > +#define _ASM_RISCV_RUNTIME_CONST_H
> > > > +
> > > > +#include <asm/alternative.h>
> > > > +#include <asm/cacheflush.h>
> > > > +#include <asm/text-patching.h>
> > > > +#include <linux/uaccess.h>
> > > > +
> > > > +#ifdef CONFIG_32BIT
> > > > +#define runtime_const_ptr(sym)					\
> > > > +({								\
> > > > +	typeof(sym) __ret, __tmp;				\
> > > > +	asm_inline("1:\t"					\
> > > > +		".option push"					\
> > > > +		".option norvc"					\
> > > > +		"lui	%[__ret],0x89abd\n\t"			\
> > > > +		"addi	%[__ret],-0x211\n\t"			\
> > > > +		".option pop"					\
> > > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
> > > > +		".long 1b - .\n\t"				\
> > > > +		".popsection"					\
> > > > +		: [__ret] "=r" (__ret));			\
> > > > +	__ret;							\
> > > > +})
> > > > +#else
> > > > +/*
> > > > + * Loading 64-bit constants into a register from immediates is a non-trivial
> > > > + * task on riscv64. To get it somewhat performant, load 32 bits into two
> > > > + * different registers and then combine the results.
> > > > + *
> > > > + * If the processor supports the Zbkb extension, we can combine the final
> > > > + * "slli,slli,srli,add" into the single "pack" instruction. If the processor
> > > > + * doesn't support Zbkb but does support the Zbb extension, we can
> > > > + * combine the final "slli,srli,add" into one instruction "add.uw".
> > > > + */
> > > > +#define runtime_const_ptr(sym)						\
> > > > +({									\
> > > > +	typeof(sym) __ret, __tmp;					\
> > > > +	asm_inline("1:\t"						\
> > > > +		".option push\n\t"					\
> > > > +		".option norvc\n\t"					\
> > > > +		"lui	%[__ret],0x89abd\n\t"				\
> > > > +		"lui	%[__tmp],0x1234\n\t"				\
> > > > +		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> > > > +		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> > > > +		ALTERNATIVE_2(						\
> > > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > > +			"slli	%[__ret],%[__ret],32\n\t"		\
> > > > +			"srli	%[__ret],%[__ret],32\n\t"		\
> > > > +			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
> > > > +			".option push\n\t"				\
> > > > +			".option arch,+zba\n\t"				\
> > > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > > +			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
> > > > +			"nop\n\t"					\
> > > > +			"nop\n\t"					\
> > > > +			".option pop\n\t",				\
> > > > +			0, RISCV_ISA_EXT_ZBA, 1,			\
> > > > +			".option push\n\t"				\
> > > > +			".option arch,+zbkb\n\t"			\
> > > > +			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
> > > > +			"nop\n\t"					\
> > > > +			"nop\n\t"					\
> > > > +			"nop\n\t"					\
> > > > +			".option pop\n\t",				\
> > > > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > > > +		)							\
> > > > +		".option pop\n\t"					\
> > > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> > > > +		".long 1b - .\n\t"					\
> > > > +		".popsection"						\
> > > > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > > > +	__ret;								\
> > > > +})
> > > > +#endif
> > > > +
> > > > +#ifdef CONFIG_32BIT
> > > > +#define SRLI "srli "
> > > > +#else
> > > > +#define SRLI "srliw "
> > > > +#endif
> > > > +
> > > > +#define runtime_const_shift_right_32(val, sym)			\
> > > > +({								\
> > > > +	u32 __ret;						\
> > > > +	asm_inline("1:\t"					\
> > > > +		".option push\n\t"				\
> > > > +		".option norvc\n\t"				\
> > > > +		SRLI "%[__ret],%[__val],12\n\t"			\
> > > > +		".option pop\n\t"				\
> > > > +		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
> > > > +		".long 1b - .\n\t"				\
> > > > +		".popsection"					\
> > > > +		: [__ret] "=r" (__ret)				\
> > > > +		: [__val] "r" (val));				\
> > > > +	__ret;							\
> > > > +})
> > > > +
> > > > +#define runtime_const_init(type, sym) do {			\
> > > > +	extern s32 __start_runtime_##type##_##sym[];		\
> > > > +	extern s32 __stop_runtime_##type##_##sym[];		\
> > > > +								\
> > > > +	runtime_const_fixup(__runtime_fixup_##type,		\
> > > > +			    (unsigned long)(sym),		\
> > > > +			    __start_runtime_##type##_##sym,	\
> > > > +			    __stop_runtime_##type##_##sym);	\
> > > > +} while (0)
> > > > +
> > > > +static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> > > > +{
> > > > +	/* On riscv there are currently only cache-wide flushes so va is ignored. */
> > > > +	__always_unused uintptr_t va = (uintptr_t)where;
> > > > +
> > > > +	flush_icache_range(va, va + 4*insns);
> > > > +}
> > > > +
> > > > +/*
> > > > + * The 32-bit immediate is stored in a lui+addi pairing.
> > > > + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> > > > + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> > > > + */
> > > > +static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
> > > > +{
> > > > +	unsigned int lower_immediate, upper_immediate;
> > > > +	u32 lui_insn = le32_to_cpu(*lui);
> > > > +	u32 addi_insn = le32_to_cpu(*addi);
> > >
> > > Because of the compressed extensions RISC-V instructions are only aligned on
> > > 16bit boundaries, so is there another reason you know that these two
> > > instructions are 32bit aligned? Otherwise you're adding unaligned accesses
> > > here.
> >
> > Great point, thank you. I will add a ".align 4" to the beginning of
> > these instructions to force the alignment.
> 
> Unless there is a specific reason to do the alignment in this case, I'd much
> rather we just do two 16bit reads like riscv/kernel/module.c already does.

I have no strong preference here. That does seem like a better solution
though.

- Charlie

> 
> /Emil
