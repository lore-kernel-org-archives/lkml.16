Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8381ADC6E
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738278790; cv=none; b=UHefT/WJI/aOoJ9RIHRTIhStTtypy38x6ti8WL0HGCSq/K2TK9bkTNpMdQ8cTFHHY/N4zOa7WMZ5LmeOyTseeyhZZBw0fqSKRllKZ1Uf4FshqogdBslJ1k3Q67DyZk0lW3UoLqHn8Xnzh+uaDzfieD83hpBweFtBmgPEBxpsNtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738278790; c=relaxed/simple;
	bh=1okwMmcs2zAoK9EeLb2BJ9MMnJtIAP7Pi7ws+zLWMrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz3+WJNRPqJpM+gSsfZzj2V4VUcXewVZosUWqxDF9CyvcrU61VT8RPO3247huZwhgFlrGH8Ocd1NMyO4p0eltYIcq3LTP/XeURm3ycJ7iJBhZCuxKnK79E/u26mVeGdJMz8MoWzlYDUVD8kNc6hP939lfKxy0FNVi33MRLT9o78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gWmsK59h; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gWmsK59h"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2162c0f6a39so45436325ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738278788; x=1738883588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6dfakJZdLAgCLB5QxI47D4nLXvZUFbWeh8LMAiWIx8=;
        b=gWmsK59hWf+8CCi9pXtG5Xi5rW0wfz7K1Lx3/5u5MubG2e5FAgWLgojLH6Jqo8u727
         tkV4lxSyPZDeKn6CsQejO/5TlPHQoikXlGPV7/L8WWuGuyGvBu2V3E4bwsRZNehgnbOg
         VJ7HefbyEgIxh+E/WtkDhLzXnkzoLxUVZqMCQ/6x07nxDVHx3wPY6ubkI5Y+1qbnnSuU
         cw/W3oEanlOyl0/zXm9KvZZWwwAJ4KTDb4W+TB1uXxxM7wsEI+lTwDQvb2gwPWneykpR
         ZYaXLqNF6Vg0SFfV3n7VECfIQwt0DLa3gf1lZ9HLkofkgOGx8Wm6FbZIYXEUFPjdq4bV
         ZOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738278788; x=1738883588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6dfakJZdLAgCLB5QxI47D4nLXvZUFbWeh8LMAiWIx8=;
        b=I5YytvxpqAbwqzF2X6fQMC9o73CwHBH6+2qKeIq3D2S28ePJYo1+mklii673pZ8FRC
         t6G5Q17Pkb2Fn/fhgcCMgcJrzRPFhgQZ8qBUVJNUyerMCOMNWyGVFaUsjILN4O7ijKwK
         tV8pDOJ02Qn8gPCt9+SFKZgqItPdhXGZpgL1T3iyZ93rV+nECH2OymvFrk8bPMTadiDx
         0jGxH5DK1KMXeWQoRSzaY6Q/vzmg6G7KhMpNcLXsk18eoMwBXjW33t+BRbQs3E5e2Vb9
         ZfyNuLtYyVPcqZxR8B0vQkqFljsxPGW0tf0BwLhZA+j2VVqswOScd/pafEOAVT4ugEYO
         WDNg==
X-Forwarded-Encrypted: i=1; AJvYcCVFU+aqd7DNu2F6igTCX5IOapSodt0Az1pbmPGFBft3fSeDVQMijMMomrtzu7iX4FE8yqr4mfeGbg3y1jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFZo9SenRET1G7EaJFNarlKGL1Ppor2siyxHo2LHf+DmRlmRz
	zJNSb640LQy2UD9dNwVTeCtgwSz+z89v9eCbhIJQgwDRO6pyQYVhbkVCaNK/0nQ=
X-Gm-Gg: ASbGncvxPVfl5bV4fGZu+WJzIBzJ3fqk9Sja9gpNzdbE4M7JOlpzVv2Mo4+1LTcnpVF
	gEqLSFzxrtJ4dtdBYjo2FKZy2xdWekfMP3TgyW4FY6OAdQF9D0zKoLIG7aIvdurFbiXP97QHYEe
	yFENjz6u01wjGzU+yYgjhaJp0kt/szj1gtFrhD0/fZ6QuI9VUWy8hynm+OzDyMCvJnl/T3lxVeu
	haS1GRbXE3LVPWKR0+Bj/l4fpZpNSmnayLNQj5eCRpPizrjhSBa4sI4dRkAU5VqIVoNa4oR7HjF
	6wj26caYPQ==
X-Google-Smtp-Source: AGHT+IFR+xkUyuD9Idpx53cQ1xaBXJ7eENhvPjOTRC1EpcZkFaHTLVnV1MPZnMD4/mIj5d+OuSxDWw==
X-Received: by 2002:a05:6a20:7fa8:b0:1d8:c74d:1ca0 with SMTP id adf61e73a8af0-1ed96f566b8mr1641037637.11.1738278787833;
        Thu, 30 Jan 2025 15:13:07 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:b5f7:fece:b619:6703])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe384317sm1893526a12.19.2025.01.30.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 15:13:07 -0800 (PST)
Date: Thu, 30 Jan 2025 15:13:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Add runtime constant support
Message-ID: <Z5wHgRG6eZKFevUQ@ghost>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
 <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com>

On Wed, Jan 29, 2025 at 04:30:49AM -0500, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:
> > Implement the runtime constant infrastructure for riscv. Use this
> > infrastructure to generate constants to be used by the d_hash()
> > function.
> >
> > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > constant' support") and commit e3c92e81711d ("runtime constants: add
> > x86 architecture support").
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > Ard brought this to my attention in this patch [1].
> >
> > [1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
> > ---
> > Changes in v3:
> > - Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
> >   by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
> > - Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com
> >
> > Changes in v2:
> > - Treat instructions as __le32 and do proper conversions (Ben)
> > - Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
> > ---
> >  arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/vmlinux.lds.S        |   3 +
> >  2 files changed, 197 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/runtime-const.h
> > @@ -0,0 +1,194 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> > +#define _ASM_RISCV_RUNTIME_CONST_H
> > +
> > +#include <asm/alternative.h>
> > +#include <asm/cacheflush.h>
> > +#include <asm/text-patching.h>
> > +#include <linux/uaccess.h>
> > +
> > +#ifdef CONFIG_32BIT
> > +#define runtime_const_ptr(sym)					\
> > +({								\
> > +	typeof(sym) __ret, __tmp;				\
> > +	asm_inline("1:\t"					\
> > +		".option push"					\
> > +		".option norvc"					\
> > +		"lui	%[__ret],0x89abd\n\t"			\
> > +		"addi	%[__ret],-0x211\n\t"			\
> > +		".option pop"					\
> > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
> > +		".long 1b - .\n\t"				\
> > +		".popsection"					\
> > +		: [__ret] "=r" (__ret));			\
> > +	__ret;							\
> > +})
> > +#else
> > +/*
> > + * Loading 64-bit constants into a register from immediates is a non-trivial
> > + * task on riscv64. To get it somewhat performant, load 32 bits into two
> > + * different registers and then combine the results.
> > + *
> > + * If the processor supports the Zbkb extension, we can combine the final
> > + * "slli,slli,srli,add" into the single "pack" instruction. If the processor
> > + * doesn't support Zbkb but does support the Zbb extension, we can
> > + * combine the final "slli,srli,add" into one instruction "add.uw".
> > + */
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline("1:\t"						\
> > +		".option push\n\t"					\
> > +		".option norvc\n\t"					\
> > +		"lui	%[__ret],0x89abd\n\t"				\
> > +		"lui	%[__tmp],0x1234\n\t"				\
> > +		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> > +		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> > +		ALTERNATIVE_2(						\
> > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > +			"slli	%[__ret],%[__ret],32\n\t"		\
> > +			"srli	%[__ret],%[__ret],32\n\t"		\
> > +			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
> > +			".option push\n\t"				\
> > +			".option arch,+zba\n\t"				\
> > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > +			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
> > +			"nop\n\t"					\
> > +			"nop\n\t"					\
> > +			".option pop\n\t",				\
> > +			0, RISCV_ISA_EXT_ZBA, 1,			\
> > +			".option push\n\t"				\
> > +			".option arch,+zbkb\n\t"			\
> > +			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
> > +			"nop\n\t"					\
> > +			"nop\n\t"					\
> > +			"nop\n\t"					\
> > +			".option pop\n\t",				\
> > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > +		)							\
> > +		".option pop\n\t"					\
> > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> > +		".long 1b - .\n\t"					\
> > +		".popsection"						\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> > +#endif
> > +
> > +#ifdef CONFIG_32BIT
> > +#define SRLI "srli "
> > +#else
> > +#define SRLI "srliw "
> > +#endif
> > +
> > +#define runtime_const_shift_right_32(val, sym)			\
> > +({								\
> > +	u32 __ret;						\
> > +	asm_inline("1:\t"					\
> > +		".option push\n\t"				\
> > +		".option norvc\n\t"				\
> > +		SRLI "%[__ret],%[__val],12\n\t"			\
> > +		".option pop\n\t"				\
> > +		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
> > +		".long 1b - .\n\t"				\
> > +		".popsection"					\
> > +		: [__ret] "=r" (__ret)				\
> > +		: [__val] "r" (val));				\
> > +	__ret;							\
> > +})
> > +
> > +#define runtime_const_init(type, sym) do {			\
> > +	extern s32 __start_runtime_##type##_##sym[];		\
> > +	extern s32 __stop_runtime_##type##_##sym[];		\
> > +								\
> > +	runtime_const_fixup(__runtime_fixup_##type,		\
> > +			    (unsigned long)(sym),		\
> > +			    __start_runtime_##type##_##sym,	\
> > +			    __stop_runtime_##type##_##sym);	\
> > +} while (0)
> > +
> > +static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> > +{
> > +	/* On riscv there are currently only cache-wide flushes so va is ignored. */
> > +	__always_unused uintptr_t va = (uintptr_t)where;
> > +
> > +	flush_icache_range(va, va + 4*insns);
> > +}
> > +
> > +/*
> > + * The 32-bit immediate is stored in a lui+addi pairing.
> > + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> > + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> > + */
> > +static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
> > +{
> > +	unsigned int lower_immediate, upper_immediate;
> > +	u32 lui_insn = le32_to_cpu(*lui);
> > +	u32 addi_insn = le32_to_cpu(*addi);
> 
> Because of the compressed extensions RISC-V instructions are only aligned on
> 16bit boundaries, so is there another reason you know that these two
> instructions are 32bit aligned? Otherwise you're adding unaligned accesses
> here.

Great point, thank you. I will add a ".align 4" to the beginning of
these instructions to force the alignment.

- Charlie

> 
> /Emil
> 
> > +	__le32 addi_res, lui_res;
> > +
> > +	lower_immediate = sign_extend32(val, 11);
> > +	upper_immediate = (val - lower_immediate);
> > +
> > +	if (upper_immediate & 0xfffff000) {
> > +		/* replace upper 20 bits of lui with upper immediate */
> > +		lui_insn &= 0x00000fff;
> > +		lui_insn |= upper_immediate & 0xfffff000;
> > +	} else {
> > +		/* replace lui with nop if immediate is small enough to fit in addi */
> > +		lui_insn = 0x00000013;
> > +	}
> > +
> > +	if (lower_immediate & 0x00000fff) {
> > +		/* replace upper 12 bits of addi with lower 12 bits of val */
> > +		addi_insn &= 0x000fffff;
> > +		addi_insn |= (lower_immediate & 0x00000fff) << 20;
> > +	} else {
> > +		/* replace addi with nop if lower_immediate is empty */
> > +		addi_insn = 0x00000013;
> > +	}
> > +
> > +	addi_res = cpu_to_le32(addi_insn);
> > +	lui_res = cpu_to_le32(lui_insn);
> > +	patch_insn_write(addi, &addi_res, sizeof(addi_res));
> > +	patch_insn_write(lui, &lui_res, sizeof(lui_res));
> > +}
> > +
> > +static inline void __runtime_fixup_ptr(void *where, unsigned long val)
> > +{
> > +	if (IS_ENABLED(CONFIG_32BIT)) {
> > +		__runtime_fixup_32(where, where + 4, val);
> > +		__runtime_fixup_caches(where, 2);
> > +	} else {
> > +		__runtime_fixup_32(where, where + 8, val);
> > +		__runtime_fixup_32(where + 4, where + 12, val >> 32);
> > +		__runtime_fixup_caches(where, 4);
> > +	}
> > +}
> > +
> > +/*
> > + * Replace the least significant 5 bits of the srli/srliw immediate that is
> > + * located at bits 20-24
> > + */
> > +static inline void __runtime_fixup_shift(void *where, unsigned long val)
> > +{
> > +	u32 insn = le32_to_cpu(*(__le32 *)where);
> > +	__le32 res;
> > +
> > +	insn &= 0xfe0fffff;
> > +	insn |= (val & 0b11111) << 20;
> > +
> > +	res = cpu_to_le32(insn);
> > +	patch_text_nosync(where, &res, sizeof(insn));
> > +}
> > +
> > +static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
> > +				       unsigned long val, s32 *start, s32 *end)
> > +{
> > +	while (start < end) {
> > +		fn(*start + (void *)start, val);
> > +		start++;
> > +	}
> > +}
> > +
> > +#endif /* _ASM_RISCV_RUNTIME_CONST_H */
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index 002ca58dd998cb78b662837b5ebac988fb6c77bb..61bd5ba6680a786bf1db7dc37bf1acda0639b5c7 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -97,6 +97,9 @@ SECTIONS
> >  	{
> >  		EXIT_DATA
> >  	}
> > +
> > +	RUNTIME_CONST_VARIABLES
> > +
> >  	PERCPU_SECTION(L1_CACHE_BYTES)
> >
> >  	.rel.dyn : {
> >
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250123-runtime_const_riscv-6cd854ee2817
> > --
> > - Charlie
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
