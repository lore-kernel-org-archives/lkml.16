Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3013AA53
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738411480; cv=none; b=QFN28shhuqdnN6InU4r7r6NqKqHgOy6Emr3mDguJYQ8MZPHOhtbbpuyy7K0x5mcJ/uSKQb0DMdBqX2bkdtuPNapqJB3/FrbcGXlZ84qTmu/1GPFhhyOuV+ojVOuRIeyFqsBNvqaOKnKG/M4vg2eQQ1rZI8kZaZJiT7ST27t2GHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738411480; c=relaxed/simple;
	bh=JxPtj9vkTqIh9e6FeaTJYLGefZHJP6qXGQd7CaW2ol8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EV+CpIEcHAFMj8dEgBz2fd6+avlYHLuAOvzeIeu3e/u8lkdfzxLchZxiGVl0WBit/jMoMJZP7p9opbPCzjEHkqod0OUTRQr1ekgthqliuFy/3B4A9JkdyONLMr7qrGtWgGgVLgQIUZc3/spA4Z+8UZvkdV2KzB380E7tVWHaQbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlsR1YuI; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlsR1YuI"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467a6781bc8so23328081cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738411477; x=1739016277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRbYPKSBUnMk1OnyCRg92Vf3leu3blP60GgGgtpGjrQ=;
        b=VlsR1YuI2biQH0V4mODY9a2Tnr9RNfXXEkqEvCqyl8Kb8JGSdXe0kAlppxYU/A5Mm4
         6EZYQvL6Vql/KQWNmHrMHsJoP/7J9zyiuSiBu3/10mdckfMaCb6WQOlOnIiVKIyq9BRX
         QD/1Uaa+H1HDpe9PGCwJf7/BGwtgLXxSWk4TC0y+YFzuURQaile7oj+97QIh+SYd6sEp
         sCxC6Ber3ja1wDrlg459vxfuzDc0bRKHXX8U0jzqVyV+XHF0B3b/ZYsf0Fs7uUG4Xlkt
         JnA8hVq4/J6n+n1eAs4SaEioOB7m/DC545rdgTW1ocQZM0kpsQJsdZwU+54j+lt+vI2D
         u1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738411477; x=1739016277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRbYPKSBUnMk1OnyCRg92Vf3leu3blP60GgGgtpGjrQ=;
        b=FpgOP/lmnfDBtzAzp0P+7OhSt62/bHNs30HqJywvPYbeg2rVZarI6V45jWb9ZqcWI3
         LeViCr2sHyQWLtyatpIHkrhHa7jzSAzEM9V331UrALoamtpnhLbILtFp5zzCCzJ8ucOQ
         pEbL7EmMVoAWLR1f/ZemrnVwbLT9ud0q1QKS375SeCoNGUft+2aI3sMoofsSu9ZQ85QQ
         TqdgjycS3JMBdffPxbptctTukVuaDGE37sqaOQzPqYQSDAA6LvbNL8Ty6sqYVqicvGDr
         c3+H6Z9kJtPjqQtjTJmg0RHsrzp6QcqGkk9Udctialy49DuG664o49hvskDquzaQ9gW7
         T+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbjgyHk4R3yOv4gdrjV3NlyhfqfFvcDQlF/k3GrqHVTJG8Qd0rVG53DrZB43J0WhBb6DjiunXiEPr87J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvs9CRGNVSi9bl8nXyIiqrGyVpHMY2otu99gKunBAzUDECW5/q
	51BWX9gcs40SZgTnd2H+IJdbPtQmct7eUlCBONiEAzA8nMtk7gAe9617cMPKiGR1TEipqQ+MHyd
	KKf0rDH4E7ll10lXe4TbpPvCg8nk=
X-Gm-Gg: ASbGncsihD1YZaD7gby2tQ8Rn+y67VISjOFk6MhtmmQioYQduy4zvGOx7K15WMegfBt
	cLFyBouk6RBFPLMMkWFa3Zn/IaMyhCooyDoXdk6jBf9BRv4XyxiP2FHkijUI27txrt3hA5tM=
X-Google-Smtp-Source: AGHT+IFIAe7LK+bAUjERiCJWEodWTOZAPJWWhhwO+1fPF0wdNORv67zBbiyQ4V/xyArpmtKH+4CMo7rU3bfQYdR46UE=
X-Received: by 2002:ad4:5cac:0:b0:6d8:accb:5a3d with SMTP id
 6a1803df08f44-6e243c745d9mr239270956d6.34.1738411477298; Sat, 01 Feb 2025
 04:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225082412.36727-1-arikalo@gmail.com> <Z4CSpE9UKkJNM_g5@ghost>
In-Reply-To: <Z4CSpE9UKkJNM_g5@ghost>
From: Aleksandar Rikalo <arikalo@gmail.com>
Date: Sat, 1 Feb 2025 13:04:25 +0100
X-Gm-Features: AWEUYZn6RgBwKk7apC-XOIs5EnhDfdX-vkkLDQ3jEY3hzQ2HQnvtDqK2_hvR28Q
Message-ID: <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic functions
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrea Parri <parri.andrea@gmail.com>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Eric Chan <ericchancf@google.com>, 
	linux-kernel@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 4:23=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:

> > From: Chao-ying Fu <cfu@mips.com>
> >
> > Use only LR/SC instructions to implement atomic functions.
>
> In the previous patch you mention that this is to support MIPS P8700. Can
> you expand on why this change is required? The datasheet at [1] says:
>
> "The P8700 core is configured to support the RV64GCZba_Zbb (G =3D IMAFD)
> Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic (A),
> Single-Precision Floating Point (F), Double (D), Compressed (C) RISC-V
> extensions, as well as the as well as the bit-manipulation extensions
> (Zba) and (Zbb)"
>
> The "A" extension is a part of "G" which is mostly assumed to exist in
> the kernel. Additionally, having this be a compilation flag will cause
> traps on generic kernels. We generally try to push everything we can
> into runtime feature detection since there are so many possible variants
> of riscv.
>
> Expressing not being able to perform a feature like this is normally
> better expressed as an errata. Then generic kernels will be able to
> include this, and anybody who doesn't want to have the extra nops
> introduced can disable the errata. A similar approach to what I pointed
> out last time should work here too (but with more places to replace)
> [2].
>
> [1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
> [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/

So far we haven't found a way to do this using errata. There's no way
to patch one instruction with multiple ones, and we also need an extra
(temporary) register.

A CPU can implement the Zalrsc extension [1] instead of "complete A"
(which P8700 does).
From "Zaamo and Zalrsc Extensions" spec:

"The fetch-and-op style atomic primitives provided by the A extension
support better scaling for highly parallel systems. Simpler
implementations that do not have such scaling requirements may
implement the Zalrsc subset of the A extension to support atomic
primitives."

Therefore, we believe this would be a useful option for wider use.

[1] https://github.com/riscv/riscv-zaamo-zalrsc/releases/download/v1.0-rc2/=
riscv-zaamo-zalrsc.pdf

> >
> > Add config RISCV_AMO_USE_ZALRSC.
> >
> > Signed-off-by: Chao-ying Fu <cfu@mips.com>
> > Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> > ---
> >  arch/riscv/Kconfig               | 11 +++++++
> >  arch/riscv/include/asm/atomic.h  | 52 +++++++++++++++++++++++++++++++-
> >  arch/riscv/include/asm/bitops.h  | 45 +++++++++++++++++++++++++++
> >  arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++
> >  arch/riscv/include/asm/futex.h   | 46 ++++++++++++++++++++++++++++
> >  5 files changed, 169 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index cc63aef41e94..9fb020b49408 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -715,6 +715,17 @@ config RISCV_ISA_ZACAS
> >
> >         If you don't know what to do here, say Y.
> >
> > +config RISCV_AMO_USE_ZALRSC
> > +     bool "Use Zalrsc extension to implement atomic functions"
> > +     help
> > +        Kernel uses only LR/SC instructions to implement atomic functi=
ons.
> > +
> > +        It makes sense to enable this option if your platform only
> > +        implements the Zalrsc extension (a subset of the A extension),
> > +        and not the complete A extension.
> > +
> > +        If you don't know what to do here, say N.
> > +
> >  config TOOLCHAIN_HAS_ZBB
> >       bool
> >       default y
> > diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/a=
tomic.h
> > index 5b96c2f61adb..88f62e33a545 100644
> > --- a/arch/riscv/include/asm/atomic.h
> > +++ b/arch/riscv/include/asm/atomic.h
> > @@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic6=
4_t *v, s64 i)
> >   * have the AQ or RL bits set.  These don't return anything, so there'=
s only
> >   * one version to worry about.
> >   */
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >  #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)           \
> >  static __always_inline                                                =
       \
> >  void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)     \
> > @@ -59,7 +60,23 @@ void arch_atomic##prefix##_##op(c_type i, atomic##pr=
efix##_t *v)   \
> >               : "+A" (v->counter)                                     \
> >               : "r" (I)                                               \
> >               : "memory");                                            \
> > -}                                                                    \
> > +}
> > +#else
> > +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)           \
> > +static __always_inline                                                =
       \
> > +void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)     \
> > +{                                                                    \
> > +     register c_type ret, temp;                                      \
> > +     __asm__ __volatile__ (                                          \
> > +             "1:     lr." #asm_type " %1, %0\n"                      \
> > +             "       " #asm_op " %2, %1, %3\n"                       \
> > +             "       sc." #asm_type " %2, %2, %0\n"                  \
> > +             "       bnez %2, 1b\n"                                  \
> > +             : "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)       =
   \
> > +             : "r" (I)                                               \
> > +             : "memory");                                            \
> > +}
> > +#endif
> >
> >  #ifdef CONFIG_GENERIC_ATOMIC64
> >  #define ATOMIC_OPS(op, asm_op, I)                                    \
> > @@ -84,6 +101,7 @@ ATOMIC_OPS(xor, xor,  i)
> >   * There's two flavors of these: the arithmatic ops have both fetch an=
d return
> >   * versions, while the logical ops only have fetch versions.
> >   */
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >  #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)     \
> >  static __always_inline                                                =
       \
> >  c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,          \
> > @@ -108,6 +126,38 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i, =
atomic##prefix##_t *v) \
> >               : "memory");                                            \
> >       return ret;                                                     \
> >  }
> > +#else
> > +#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)     \
> > +static __always_inline                                                =
       \
> > +c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,          \
> > +                                          atomic##prefix##_t *v)     \
> > +{                                                                    \
> > +     register c_type ret, temp;                                      \
> > +     __asm__ __volatile__ (                                          \
> > +             "1:     lr." #asm_type " %1, %0\n"                      \
> > +             "       " #asm_op " %2, %1, %3\n"                       \
> > +             "       sc." #asm_type " %2, %2, %0\n"                  \
> > +             "       bnez %2, 1b\n"                                  \
> > +             : "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)       =
   \
> > +             : "r" (I)                                               \
> > +             : "memory");                                            \
> > +     return ret;                                                     \
> > +}                                                                    \
> > +static __always_inline                                                =
       \
> > +c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *=
v)     \
> > +{                                                                    \
> > +     register c_type ret, temp;                                      \
> > +     __asm__ __volatile__ (                                          \
> > +             "1:     lr." #asm_type ".aqrl %1, %0\n"                 \
> > +             "       " #asm_op " %2, %1, %3\n"                       \
> > +             "       sc." #asm_type ".aqrl %2, %2, %0\n"             \
> > +             "       bnez %2, 1b\n"                                  \
> > +             : "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)       =
   \
> > +             : "r" (I)                                               \
> > +             : "memory");                                            \
> > +     return ret;                                                     \
> > +}
> > +#endif
> >
> >  #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix=
)      \
> >  static __always_inline                                                =
       \
> > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/b=
itops.h
> > index fae152ea0508..0051de1cf471 100644
> > --- a/arch/riscv/include/asm/bitops.h
> > +++ b/arch/riscv/include/asm/bitops.h
> > @@ -187,12 +187,17 @@ static __always_inline int variable_fls(unsigned =
int x)
> >
> >  #if (BITS_PER_LONG =3D=3D 64)
> >  #define __AMO(op)    "amo" #op ".d"
> > +#define __LR "lr.d"
> > +#define __SC "sc.d"
> >  #elif (BITS_PER_LONG =3D=3D 32)
> >  #define __AMO(op)    "amo" #op ".w"
> > +#define __LR "lr.w"
> > +#define __SC "sc.w"
> >  #else
> >  #error "Unexpected BITS_PER_LONG"
> >  #endif
> >
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >  #define __test_and_op_bit_ord(op, mod, nr, addr, ord)                \
> >  ({                                                           \
> >       unsigned long __res, __mask;                            \
> > @@ -211,6 +216,33 @@ static __always_inline int variable_fls(unsigned i=
nt x)
> >               : "+A" (addr[BIT_WORD(nr)])                     \
> >               : "r" (mod(BIT_MASK(nr)))                       \
> >               : "memory");
> > +#else
> > +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)                \
> > +({                                                           \
> > +     unsigned long __res, __mask, __temp;                    \
> > +     __mask =3D BIT_MASK(nr);                                  \
> > +     __asm__ __volatile__ (                                  \
> > +             "1: " __LR #ord " %0, %1\n"                     \
> > +             #op " %2, %0, %3\n"                             \
> > +             __SC #ord " %2, %2, %1\n"                       \
> > +             "bnez %2, 1b\n"                                 \
> > +             : "=3D&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=3D&r" (__=
temp)      \
> > +             : "r" (mod(__mask))                             \
> > +             : "memory");                                    \
> > +     ((__res & __mask) !=3D 0);                                \
> > +})
> > +
> > +#define __op_bit_ord(op, mod, nr, addr, ord)                 \
> > +     unsigned long __res, __temp;                            \
> > +     __asm__ __volatile__ (                                  \
> > +             "1: " __LR #ord " %0, %1\n"                     \
> > +             #op " %2, %0, %3\n"                             \
> > +             __SC #ord " %2, %2, %1\n"                       \
> > +             "bnez %2, 1b\n"                                 \
> > +             : "=3D&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=3D&r" (__=
temp)      \
> > +             : "r" (mod(BIT_MASK(nr)))                       \
> > +             : "memory")
> > +#endif
> >
> >  #define __test_and_op_bit(op, mod, nr, addr)                         \
> >       __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> > @@ -354,12 +386,25 @@ static inline void arch___clear_bit_unlock(
> >  static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask=
,
> >               volatile unsigned long *addr)
> >  {
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >       unsigned long res;
> >       __asm__ __volatile__ (
> >               __AMO(xor) ".rl %0, %2, %1"
> >               : "=3Dr" (res), "+A" (*addr)
> >               : "r" (__NOP(mask))
> >               : "memory");
> > +#else
> > +     unsigned long res, temp;
> > +
> > +     __asm__ __volatile__ (
> > +             "1: " __LR ".rl %0, %1\n"
> > +             "xor %2, %0, %3\n"
> > +             __SC ".rl %2, %2, %1\n"
> > +             "bnez %2, 1b\n"
> > +             : "=3D&r" (res), "+A" (*addr), "=3D&r" (temp)
> > +             : "r" (__NOP(mask))
> > +             : "memory");
> > +#endif
> >       return (res & BIT(7)) !=3D 0;
> >  }
> >
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/=
cmpxchg.h
> > index 4cadc56220fe..aba60f427060 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -51,6 +51,7 @@
> >       }                                                                =
       \
> >  })
> >
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >  #define __arch_xchg(sfx, prepend, append, r, p, n)                   \
> >  ({                                                                   \
> >       __asm__ __volatile__ (                                          \
> > @@ -61,6 +62,21 @@
> >               : "r" (n)                                               \
> >               : "memory");                                            \
> >  })
> > +#else
> > +#define __arch_xchg(sfx, prepend, append, r, p, n)                   \
> > +({                                                                   \
> > +     __typeof__(*(__ptr)) temp;                                      \
> > +     __asm__ __volatile__ (                                          \
> > +             prepend                                                 \
> > +             "1:     lr" sfx " %0, %1\n"                             \
> > +             "       sc" sfx " %2, %3, %1\n"                         \
> > +             "       bnez %2, 1b\n"                                  \
> > +             append                                                  \
> > +             : "=3D&r" (r), "+A" (*(p)), "=3D&r" (temp)               =
   \
> > +             : "r" (n)                                               \
> > +             : "memory");                                            \
> > +})
> > +#endif
> >
> >  #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,               =
       \
> >                  sc_append, swap_append)                              \
> > diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/fu=
tex.h
> > index fc8130f995c1..dc63065e707e 100644
> > --- a/arch/riscv/include/asm/futex.h
> > +++ b/arch/riscv/include/asm/futex.h
> > @@ -19,6 +19,7 @@
> >  #define __disable_user_access()              do { } while (0)
> >  #endif
> >
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >  #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)   \
> >  {                                                            \
> >       __enable_user_access();                                 \
> > @@ -32,16 +33,39 @@
> >       : "memory");                                            \
> >       __disable_user_access();                                \
> >  }
> > +#else
> > +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)   \
> > +{                                                            \
> > +     __enable_user_access();                                 \
> > +     __asm__ __volatile__ (                                  \
> > +     "1:     lr.w.aqrl %[ov], %[u]\n"                        \
> > +     "       " insn "\n"                                     \
> > +     "       sc.w.aqrl %[t], %[t], %[u]\n"                   \
> > +     "       bnez %[t], 1b\n"                                \
> > +     "2:\n"                                                  \
> > +     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r])                  \
> > +     : [r] "+r" (ret), [ov] "=3D&r" (oldval),                  \
> > +       [t] "=3D&r" (temp), [u] "+m" (*uaddr)                   \
> > +     : [op] "Jr" (oparg)                                     \
> > +     : "memory");                                            \
> > +     __disable_user_access();                                \
> > +}
> > +#endif
> >
> >  static inline int
> >  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *=
uaddr)
> >  {
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >       int oldval =3D 0, ret =3D 0;
> > +#else
> > +     int oldval =3D 0, ret =3D 0, temp =3D 0;
>
> I think it's better to define this temp variable inside of
> __futex_atomic_op() instead of requiring it to be defined in the scope
> where the macro is called.
>
> - Charlie
>
> > +#endif
> >
> >       if (!access_ok(uaddr, sizeof(u32)))
> >               return -EFAULT;
> >
> >       switch (op) {
> > +#ifndef RISCV_AMO_USE_ZALRSC
> >       case FUTEX_OP_SET:
> >               __futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
> >                                 ret, oldval, uaddr, oparg);
> > @@ -62,6 +86,28 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *=
oval, u32 __user *uaddr)
> >               __futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
> >                                 ret, oldval, uaddr, oparg);
> >               break;
> > +#else
> > +     case FUTEX_OP_SET:
> > +             __futex_atomic_op("mv %[t], %z[op]",
> > +                               ret, oldval, uaddr, oparg);
> > +             break;
> > +     case FUTEX_OP_ADD:
> > +             __futex_atomic_op("add %[t], %[ov], %z[op]",
> > +                               ret, oldval, uaddr, oparg);
> > +             break;
> > +     case FUTEX_OP_OR:
> > +             __futex_atomic_op("or %[t], %[ov], %z[op]",
> > +                               ret, oldval, uaddr, oparg);
> > +             break;
> > +     case FUTEX_OP_ANDN:
> > +             __futex_atomic_op("and %[t], %[ov], %z[op]",
> > +                               ret, oldval, uaddr, ~oparg);
> > +             break;
> > +     case FUTEX_OP_XOR:
> > +             __futex_atomic_op("xor %[t], %[ov], %z[op]",
> > +                               ret, oldval, uaddr, oparg);
> > +             break;
> > +#endif
> >       default:
> >               ret =3D -ENOSYS;
> >       }
> > --
