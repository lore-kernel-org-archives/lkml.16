Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AEB1D5CC4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738609959; cv=none; b=Ey77HGOkuTYaOEKZNqz/HjovskcpahBCggGLfSGetmKzqsykUQIPefEBbmrNbIiMnbsBgkpvQm+vFLtwefDQe5PT6cYoeUYTuAWZVEt69IKNZ78zUXpLIV+vQrelKIGI9jslGP8q+1WG6b4ByyFMBy943XYd1OHUrClqyIFqokQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738609959; c=relaxed/simple;
	bh=0YIx1PbgS3FF4tCyzyjCdDht5tGWuphem1k8UpXZvPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ny2WCPN5K1kcXYxZNQfHehrWn3Ts//bgd8L2NHr4w3xB5ek5dP6JIZa3OxQ9el+kMzH3c2ebQCTCgeQbs9VlvAmYGxASF2Ol6asaawbiP+ELWmbdyK/7cJVIj0+2s4cKLfyapSUELBAww7L9B2mpeNO01ZA0fRjtW16k8BLhXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=A+S/SN6Y; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="A+S/SN6Y"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2165cb60719so85979545ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738609956; x=1739214756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVc14ds/3vaHuIcp1SH+yhV8K9Dwrclk14FkpIfc60U=;
        b=A+S/SN6Y25P3z0LhVUkzjVBJdgr0NHiU+Z789wZ8ybTv9bfDPUxoh4PCQwsB2/MfGb
         GoUGtWctUOgoFp/OTkyXYSHWIilEkNboLbHetyjwwlkNiVjqS2JUMo5dGb23kR5WH1GL
         H/iulaq8hdBUSz7duEdGxqke9yMly5ylScjlnTE5A/prkoIpQ9vl9Z9p+v5WNSjZpglU
         qR67uYRTKUcTvpzcBTwHRgmT/5yzw+veTLkbypl5p04ERKYRWFA1wtK0Js0cp5HTmGcS
         8YRJ8kCIcfVJNoT4vcaVzk9Lnnlnr3l3o6LvpUZ1Xoeo7GmFaBfbR3hUbso37dJnnLCu
         H39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738609956; x=1739214756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVc14ds/3vaHuIcp1SH+yhV8K9Dwrclk14FkpIfc60U=;
        b=ufGuKHkWVli2BVoc5SYKl9+ZsB0nxsn8ZeGgtJwqFXl3LOvmtsBNiq+4XDYIFOrNqM
         Wb/NGBtCBBbzJbjmEcwK1wV1p5RO2I2jCf67OfGcR+4nQF+7zVBqkTbOwdzDF+aFewoP
         NSryEZVfvbwvPndcFkmRc/5nWLg80PJQ+WsMhNIRo07JNQgLok1zEOoL92acfWZWDWVf
         k4rsu7H2Mhefm20BkxbopZGtao6g2/PYeuCs6j6euCc/GAvuUE491Jw2DxTn4GY0Wzj1
         OPDlMHLC7IogqUbZ7cu6nZCVUXE8dcoiAYhVa7GZjhitP28VWfRG7DFsh1MhdDaVs3Uy
         NJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzgvNOvkxFq3oMJGXAw7dtN668A15N5/c3J1KzceUcz4ZeZAudLJklzVEH1eFLlLIhjQckfSazxgg3ve8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNk9pnZBtqpXyI9AOWWxQT7DQBV9g5cSxwrlr3oNzmPJ5gmWzI
	q6Ix4a6krIAZqqOpVy/pTgHmheMuHC9Huo0KlNG846vkKwqD1vjlo81Z/EU01OA=
X-Gm-Gg: ASbGncuq//ze+vscyEmjZxYcygER3R42EaJVyoprdp90nJQmQfOVQVdQV8HNhlDlmJ/
	VM5aWvaNBcEzuUkWqMeM/yxH1KyymkTLI59BbRzAlmm8RkDBPIKIJdwcFdKFqi/HZE2Zx4jR29f
	fQ6dahfCUus5Dj+Cxp0D8RlQMpPtuAIae4PULxORN4IRLtIMRbtkDm8BdvJStPMQ/FXGS5OJNrO
	TgfcNDRzTwrLQGwN4sPGCO1JDaBLtqBx7/xs/xrQlKahBJy9en7TrA/9pNSAwYuyXSSXse9ZjV0
	UUiB7wd7ph8=
X-Google-Smtp-Source: AGHT+IEW8VYVGX/g0scUPbicx0lQjpuuIy+guiEpo7CMV8fy/V1CEhg6ljnMr8yc4V2gECuckVXG0A==
X-Received: by 2002:a05:6a21:6da4:b0:1e1:b727:1801 with SMTP id adf61e73a8af0-1ed7a5ef9demr35727915637.27.1738609955803;
        Mon, 03 Feb 2025 11:12:35 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69bbb7esm9134416b3a.106.2025.02.03.11.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:12:35 -0800 (PST)
Date: Mon, 3 Feb 2025 11:12:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrea Parri <parri.andrea@gmail.com>,
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Eric Chan <ericchancf@google.com>, linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
Message-ID: <Z6EVIPc_t6zMU9qb@ghost>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250202-clammy-skewed-eb0a0fce18f1@spud>

On Sun, Feb 02, 2025 at 08:08:50PM +0000, Conor Dooley wrote:
> On Sat, Feb 01, 2025 at 01:04:25PM +0100, Aleksandar Rikalo wrote:
> > On Fri, Jan 10, 2025 at 4:23 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > > > From: Chao-ying Fu <cfu@mips.com>
> > > >
> > > > Use only LR/SC instructions to implement atomic functions.
> > >
> > > In the previous patch you mention that this is to support MIPS P8700. Can
> > > you expand on why this change is required? The datasheet at [1] says:
> > >
> > > "The P8700 core is configured to support the RV64GCZba_Zbb (G = IMAFD)
> > > Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic (A),
> > > Single-Precision Floating Point (F), Double (D), Compressed (C) RISC-V
> > > extensions, as well as the as well as the bit-manipulation extensions
> > > (Zba) and (Zbb)"
> > >
> > > The "A" extension is a part of "G" which is mostly assumed to exist in
> > > the kernel. Additionally, having this be a compilation flag will cause
> > > traps on generic kernels. We generally try to push everything we can
> > > into runtime feature detection since there are so many possible variants
> > > of riscv.
> > >
> > > Expressing not being able to perform a feature like this is normally
> > > better expressed as an errata. Then generic kernels will be able to
> > > include this, and anybody who doesn't want to have the extra nops
> > > introduced can disable the errata. A similar approach to what I pointed
> > > out last time should work here too (but with more places to replace)
> > > [2].
> > >
> > > [1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
> > > [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/
> > 
> > So far we haven't found a way to do this using errata.
> 
> You mean using alternatives? Not implementing A, but instead
> implementing Zalrsc, is not an erratum. It's a design decision.

We could do the same thing we do with misaligned access detection and
run some instructions to determine if these instructions are being
emulated.  If they are being emulated, patch all of the places to use
zalrsc.

- Charlie

> 
> > There's no way
> > to patch one instruction with multiple ones,
> 
> Have you looked at how the alternatives work? There's no requirement
> that the sequences have the same number of instructions, padding is
> allowed.
> 
> > and we also need an extra
> > (temporary) register.
> > 
> > A CPU can implement the Zalrsc extension [1] instead of "complete A"
> > (which P8700 does).
> > >From "Zaamo and Zalrsc Extensions" spec:
> 
> Why does this statement differ from the P8700 datasheet linked above?
> 
> Cheers,
> Conor.
> 
> > 
> > "The fetch-and-op style atomic primitives provided by the A extension
> > support better scaling for highly parallel systems. Simpler
> > implementations that do not have such scaling requirements may
> > implement the Zalrsc subset of the A extension to support atomic
> > primitives."
> > 
> > Therefore, we believe this would be a useful option for wider use.
> > 
> > [1] https://github.com/riscv/riscv-zaamo-zalrsc/releases/download/v1.0-rc2/riscv-zaamo-zalrsc.pdf
> > 
> > > >
> > > > Add config RISCV_AMO_USE_ZALRSC.
> > > >
> > > > Signed-off-by: Chao-ying Fu <cfu@mips.com>
> > > > Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> > > > ---
> > > >  arch/riscv/Kconfig               | 11 +++++++
> > > >  arch/riscv/include/asm/atomic.h  | 52 +++++++++++++++++++++++++++++++-
> > > >  arch/riscv/include/asm/bitops.h  | 45 +++++++++++++++++++++++++++
> > > >  arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++
> > > >  arch/riscv/include/asm/futex.h   | 46 ++++++++++++++++++++++++++++
> > > >  5 files changed, 169 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index cc63aef41e94..9fb020b49408 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -715,6 +715,17 @@ config RISCV_ISA_ZACAS
> > > >
> > > >         If you don't know what to do here, say Y.
> > > >
> > > > +config RISCV_AMO_USE_ZALRSC
> > > > +     bool "Use Zalrsc extension to implement atomic functions"
> > > > +     help
> > > > +        Kernel uses only LR/SC instructions to implement atomic functions.
> > > > +
> > > > +        It makes sense to enable this option if your platform only
> > > > +        implements the Zalrsc extension (a subset of the A extension),
> > > > +        and not the complete A extension.
> > > > +
> > > > +        If you don't know what to do here, say N.
> > > > +
> > > >  config TOOLCHAIN_HAS_ZBB
> > > >       bool
> > > >       default y
> > > > diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> > > > index 5b96c2f61adb..88f62e33a545 100644
> > > > --- a/arch/riscv/include/asm/atomic.h
> > > > +++ b/arch/riscv/include/asm/atomic.h
> > > > @@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
> > > >   * have the AQ or RL bits set.  These don't return anything, so there's only
> > > >   * one version to worry about.
> > > >   */
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >  #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)           \
> > > >  static __always_inline                                                       \
> > > >  void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)     \
> > > > @@ -59,7 +60,23 @@ void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)   \
> > > >               : "+A" (v->counter)                                     \
> > > >               : "r" (I)                                               \
> > > >               : "memory");                                            \
> > > > -}                                                                    \
> > > > +}
> > > > +#else
> > > > +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)           \
> > > > +static __always_inline                                                       \
> > > > +void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)     \
> > > > +{                                                                    \
> > > > +     register c_type ret, temp;                                      \
> > > > +     __asm__ __volatile__ (                                          \
> > > > +             "1:     lr." #asm_type " %1, %0\n"                      \
> > > > +             "       " #asm_op " %2, %1, %3\n"                       \
> > > > +             "       sc." #asm_type " %2, %2, %0\n"                  \
> > > > +             "       bnez %2, 1b\n"                                  \
> > > > +             : "+A" (v->counter), "=&r" (ret), "=&r" (temp)          \
> > > > +             : "r" (I)                                               \
> > > > +             : "memory");                                            \
> > > > +}
> > > > +#endif
> > > >
> > > >  #ifdef CONFIG_GENERIC_ATOMIC64
> > > >  #define ATOMIC_OPS(op, asm_op, I)                                    \
> > > > @@ -84,6 +101,7 @@ ATOMIC_OPS(xor, xor,  i)
> > > >   * There's two flavors of these: the arithmatic ops have both fetch and return
> > > >   * versions, while the logical ops only have fetch versions.
> > > >   */
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >  #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)     \
> > > >  static __always_inline                                                       \
> > > >  c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,          \
> > > > @@ -108,6 +126,38 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v) \
> > > >               : "memory");                                            \
> > > >       return ret;                                                     \
> > > >  }
> > > > +#else
> > > > +#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)     \
> > > > +static __always_inline                                                       \
> > > > +c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,          \
> > > > +                                          atomic##prefix##_t *v)     \
> > > > +{                                                                    \
> > > > +     register c_type ret, temp;                                      \
> > > > +     __asm__ __volatile__ (                                          \
> > > > +             "1:     lr." #asm_type " %1, %0\n"                      \
> > > > +             "       " #asm_op " %2, %1, %3\n"                       \
> > > > +             "       sc." #asm_type " %2, %2, %0\n"                  \
> > > > +             "       bnez %2, 1b\n"                                  \
> > > > +             : "+A" (v->counter), "=&r" (ret), "=&r" (temp)          \
> > > > +             : "r" (I)                                               \
> > > > +             : "memory");                                            \
> > > > +     return ret;                                                     \
> > > > +}                                                                    \
> > > > +static __always_inline                                                       \
> > > > +c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)     \
> > > > +{                                                                    \
> > > > +     register c_type ret, temp;                                      \
> > > > +     __asm__ __volatile__ (                                          \
> > > > +             "1:     lr." #asm_type ".aqrl %1, %0\n"                 \
> > > > +             "       " #asm_op " %2, %1, %3\n"                       \
> > > > +             "       sc." #asm_type ".aqrl %2, %2, %0\n"             \
> > > > +             "       bnez %2, 1b\n"                                  \
> > > > +             : "+A" (v->counter), "=&r" (ret), "=&r" (temp)          \
> > > > +             : "r" (I)                                               \
> > > > +             : "memory");                                            \
> > > > +     return ret;                                                     \
> > > > +}
> > > > +#endif
> > > >
> > > >  #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)      \
> > > >  static __always_inline                                                       \
> > > > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> > > > index fae152ea0508..0051de1cf471 100644
> > > > --- a/arch/riscv/include/asm/bitops.h
> > > > +++ b/arch/riscv/include/asm/bitops.h
> > > > @@ -187,12 +187,17 @@ static __always_inline int variable_fls(unsigned int x)
> > > >
> > > >  #if (BITS_PER_LONG == 64)
> > > >  #define __AMO(op)    "amo" #op ".d"
> > > > +#define __LR "lr.d"
> > > > +#define __SC "sc.d"
> > > >  #elif (BITS_PER_LONG == 32)
> > > >  #define __AMO(op)    "amo" #op ".w"
> > > > +#define __LR "lr.w"
> > > > +#define __SC "sc.w"
> > > >  #else
> > > >  #error "Unexpected BITS_PER_LONG"
> > > >  #endif
> > > >
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >  #define __test_and_op_bit_ord(op, mod, nr, addr, ord)                \
> > > >  ({                                                           \
> > > >       unsigned long __res, __mask;                            \
> > > > @@ -211,6 +216,33 @@ static __always_inline int variable_fls(unsigned int x)
> > > >               : "+A" (addr[BIT_WORD(nr)])                     \
> > > >               : "r" (mod(BIT_MASK(nr)))                       \
> > > >               : "memory");
> > > > +#else
> > > > +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)                \
> > > > +({                                                           \
> > > > +     unsigned long __res, __mask, __temp;                    \
> > > > +     __mask = BIT_MASK(nr);                                  \
> > > > +     __asm__ __volatile__ (                                  \
> > > > +             "1: " __LR #ord " %0, %1\n"                     \
> > > > +             #op " %2, %0, %3\n"                             \
> > > > +             __SC #ord " %2, %2, %1\n"                       \
> > > > +             "bnez %2, 1b\n"                                 \
> > > > +             : "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)      \
> > > > +             : "r" (mod(__mask))                             \
> > > > +             : "memory");                                    \
> > > > +     ((__res & __mask) != 0);                                \
> > > > +})
> > > > +
> > > > +#define __op_bit_ord(op, mod, nr, addr, ord)                 \
> > > > +     unsigned long __res, __temp;                            \
> > > > +     __asm__ __volatile__ (                                  \
> > > > +             "1: " __LR #ord " %0, %1\n"                     \
> > > > +             #op " %2, %0, %3\n"                             \
> > > > +             __SC #ord " %2, %2, %1\n"                       \
> > > > +             "bnez %2, 1b\n"                                 \
> > > > +             : "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)      \
> > > > +             : "r" (mod(BIT_MASK(nr)))                       \
> > > > +             : "memory")
> > > > +#endif
> > > >
> > > >  #define __test_and_op_bit(op, mod, nr, addr)                         \
> > > >       __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> > > > @@ -354,12 +386,25 @@ static inline void arch___clear_bit_unlock(
> > > >  static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
> > > >               volatile unsigned long *addr)
> > > >  {
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >       unsigned long res;
> > > >       __asm__ __volatile__ (
> > > >               __AMO(xor) ".rl %0, %2, %1"
> > > >               : "=r" (res), "+A" (*addr)
> > > >               : "r" (__NOP(mask))
> > > >               : "memory");
> > > > +#else
> > > > +     unsigned long res, temp;
> > > > +
> > > > +     __asm__ __volatile__ (
> > > > +             "1: " __LR ".rl %0, %1\n"
> > > > +             "xor %2, %0, %3\n"
> > > > +             __SC ".rl %2, %2, %1\n"
> > > > +             "bnez %2, 1b\n"
> > > > +             : "=&r" (res), "+A" (*addr), "=&r" (temp)
> > > > +             : "r" (__NOP(mask))
> > > > +             : "memory");
> > > > +#endif
> > > >       return (res & BIT(7)) != 0;
> > > >  }
> > > >
> > > > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > > > index 4cadc56220fe..aba60f427060 100644
> > > > --- a/arch/riscv/include/asm/cmpxchg.h
> > > > +++ b/arch/riscv/include/asm/cmpxchg.h
> > > > @@ -51,6 +51,7 @@
> > > >       }                                                                       \
> > > >  })
> > > >
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >  #define __arch_xchg(sfx, prepend, append, r, p, n)                   \
> > > >  ({                                                                   \
> > > >       __asm__ __volatile__ (                                          \
> > > > @@ -61,6 +62,21 @@
> > > >               : "r" (n)                                               \
> > > >               : "memory");                                            \
> > > >  })
> > > > +#else
> > > > +#define __arch_xchg(sfx, prepend, append, r, p, n)                   \
> > > > +({                                                                   \
> > > > +     __typeof__(*(__ptr)) temp;                                      \
> > > > +     __asm__ __volatile__ (                                          \
> > > > +             prepend                                                 \
> > > > +             "1:     lr" sfx " %0, %1\n"                             \
> > > > +             "       sc" sfx " %2, %3, %1\n"                         \
> > > > +             "       bnez %2, 1b\n"                                  \
> > > > +             append                                                  \
> > > > +             : "=&r" (r), "+A" (*(p)), "=&r" (temp)                  \
> > > > +             : "r" (n)                                               \
> > > > +             : "memory");                                            \
> > > > +})
> > > > +#endif
> > > >
> > > >  #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,                      \
> > > >                  sc_append, swap_append)                              \
> > > > diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> > > > index fc8130f995c1..dc63065e707e 100644
> > > > --- a/arch/riscv/include/asm/futex.h
> > > > +++ b/arch/riscv/include/asm/futex.h
> > > > @@ -19,6 +19,7 @@
> > > >  #define __disable_user_access()              do { } while (0)
> > > >  #endif
> > > >
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >  #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)   \
> > > >  {                                                            \
> > > >       __enable_user_access();                                 \
> > > > @@ -32,16 +33,39 @@
> > > >       : "memory");                                            \
> > > >       __disable_user_access();                                \
> > > >  }
> > > > +#else
> > > > +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)   \
> > > > +{                                                            \
> > > > +     __enable_user_access();                                 \
> > > > +     __asm__ __volatile__ (                                  \
> > > > +     "1:     lr.w.aqrl %[ov], %[u]\n"                        \
> > > > +     "       " insn "\n"                                     \
> > > > +     "       sc.w.aqrl %[t], %[t], %[u]\n"                   \
> > > > +     "       bnez %[t], 1b\n"                                \
> > > > +     "2:\n"                                                  \
> > > > +     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r])                  \
> > > > +     : [r] "+r" (ret), [ov] "=&r" (oldval),                  \
> > > > +       [t] "=&r" (temp), [u] "+m" (*uaddr)                   \
> > > > +     : [op] "Jr" (oparg)                                     \
> > > > +     : "memory");                                            \
> > > > +     __disable_user_access();                                \
> > > > +}
> > > > +#endif
> > > >
> > > >  static inline int
> > > >  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
> > > >  {
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >       int oldval = 0, ret = 0;
> > > > +#else
> > > > +     int oldval = 0, ret = 0, temp = 0;
> > >
> > > I think it's better to define this temp variable inside of
> > > __futex_atomic_op() instead of requiring it to be defined in the scope
> > > where the macro is called.
> > >
> > > - Charlie
> > >
> > > > +#endif
> > > >
> > > >       if (!access_ok(uaddr, sizeof(u32)))
> > > >               return -EFAULT;
> > > >
> > > >       switch (op) {
> > > > +#ifndef RISCV_AMO_USE_ZALRSC
> > > >       case FUTEX_OP_SET:
> > > >               __futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
> > > >                                 ret, oldval, uaddr, oparg);
> > > > @@ -62,6 +86,28 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
> > > >               __futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
> > > >                                 ret, oldval, uaddr, oparg);
> > > >               break;
> > > > +#else
> > > > +     case FUTEX_OP_SET:
> > > > +             __futex_atomic_op("mv %[t], %z[op]",
> > > > +                               ret, oldval, uaddr, oparg);
> > > > +             break;
> > > > +     case FUTEX_OP_ADD:
> > > > +             __futex_atomic_op("add %[t], %[ov], %z[op]",
> > > > +                               ret, oldval, uaddr, oparg);
> > > > +             break;
> > > > +     case FUTEX_OP_OR:
> > > > +             __futex_atomic_op("or %[t], %[ov], %z[op]",
> > > > +                               ret, oldval, uaddr, oparg);
> > > > +             break;
> > > > +     case FUTEX_OP_ANDN:
> > > > +             __futex_atomic_op("and %[t], %[ov], %z[op]",
> > > > +                               ret, oldval, uaddr, ~oparg);
> > > > +             break;
> > > > +     case FUTEX_OP_XOR:
> > > > +             __futex_atomic_op("xor %[t], %[ov], %z[op]",
> > > > +                               ret, oldval, uaddr, oparg);
> > > > +             break;
> > > > +#endif
> > > >       default:
> > > >               ret = -ENOSYS;
> > > >       }
> > > > --


