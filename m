Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54CD1F4275
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738526936; cv=none; b=YZcMvGizjYYvUQXVpi9eKjJU0PgKBUNPpSc/eGrrr6wowVUGj6S6rrIupbuN/IbWU4JuhGUuh9i/SPcRWXqwREw7VMVzWNEGhDTSQ1IDHgLsCUGu+kutdGQGPO0MivFyVN4EhdQ9WNV6hu7KoyQUy/A1Lv6OqsVbPHZsTMMnXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738526936; c=relaxed/simple;
	bh=yeKW1TvkVkfpknsDik1LLzm8yWAA26c1rZJESVKs2m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIpUP9LpgnWQOCNPJX4V//BJb4foCg2RDg3YzQ+IW+8vRGYhUGm/YKhemct9yMCBvcl7XQ5QUMrBLEkiYn2tYySAbnY53lNP+dl/1El5M/YyPanR9FXhW2jYsdxpb1nm8PXzzCaHJ6ONWVTyZ/YGveL3WRV06ONIYsmcQIguItQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbdAEcY6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbdAEcY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A916AC4CED1;
	Sun,  2 Feb 2025 20:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738526936;
	bh=yeKW1TvkVkfpknsDik1LLzm8yWAA26c1rZJESVKs2m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbdAEcY6wYhjKfUxzKvxTo5/VI/N8I64M38MuL25pLk4572mepZ529JDF7XYdrtVC
	 PVDEP1HqZ3ZYV1YRUmI9rhmZTe/wAL/Eaiu9cTa70neO1X93RlaqXcofx2gbl3a7gf
	 jH7kRDhSaSNMQQ5mmIE+wiqbCj6d/61Xn6XJpaj5gCAbnOZVh57zwEKKW1FJPGwOQr
	 vWSo6I6R0hSV8tTz2mSjbVWAOau/kdSoIiqBWNOW/UFV8GA0NXXIZY0oxfvYJhOctR
	 z7V0BqlGKaGvNISyuo+EiJeKti0OiSnoi6nY4Qy4h4hBUnP43ewAAsbV+nThcGdGxu
	 Nqj8T5ayKRafA==
Date: Sun, 2 Feb 2025 20:08:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
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
Message-ID: <20250202-clammy-skewed-eb0a0fce18f1@spud>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CtbRFhT9ZXLoO6od"
Content-Disposition: inline
In-Reply-To: <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>


--CtbRFhT9ZXLoO6od
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 01, 2025 at 01:04:25PM +0100, Aleksandar Rikalo wrote:
> On Fri, Jan 10, 2025 at 4:23=E2=80=AFAM Charlie Jenkins <charlie@rivosinc=
=2Ecom> wrote:
>=20
> > > From: Chao-ying Fu <cfu@mips.com>
> > >
> > > Use only LR/SC instructions to implement atomic functions.
> >
> > In the previous patch you mention that this is to support MIPS P8700. C=
an
> > you expand on why this change is required? The datasheet at [1] says:
> >
> > "The P8700 core is configured to support the RV64GCZba_Zbb (G =3D IMAFD)
> > Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic (A),
> > Single-Precision Floating Point (F), Double (D), Compressed (C) RISC-V
> > extensions, as well as the as well as the bit-manipulation extensions
> > (Zba) and (Zbb)"
> >
> > The "A" extension is a part of "G" which is mostly assumed to exist in
> > the kernel. Additionally, having this be a compilation flag will cause
> > traps on generic kernels. We generally try to push everything we can
> > into runtime feature detection since there are so many possible variants
> > of riscv.
> >
> > Expressing not being able to perform a feature like this is normally
> > better expressed as an errata. Then generic kernels will be able to
> > include this, and anybody who doesn't want to have the extra nops
> > introduced can disable the errata. A similar approach to what I pointed
> > out last time should work here too (but with more places to replace)
> > [2].
> >
> > [1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
> > [2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/
>=20
> So far we haven't found a way to do this using errata.

You mean using alternatives? Not implementing A, but instead
implementing Zalrsc, is not an erratum. It's a design decision.

> There's no way
> to patch one instruction with multiple ones,

Have you looked at how the alternatives work? There's no requirement
that the sequences have the same number of instructions, padding is
allowed.

> and we also need an extra
> (temporary) register.
>=20
> A CPU can implement the Zalrsc extension [1] instead of "complete A"
> (which P8700 does).
> >From "Zaamo and Zalrsc Extensions" spec:

Why does this statement differ from the P8700 datasheet linked above?

Cheers,
Conor.

>=20
> "The fetch-and-op style atomic primitives provided by the A extension
> support better scaling for highly parallel systems. Simpler
> implementations that do not have such scaling requirements may
> implement the Zalrsc subset of the A extension to support atomic
> primitives."
>=20
> Therefore, we believe this would be a useful option for wider use.
>=20
> [1] https://github.com/riscv/riscv-zaamo-zalrsc/releases/download/v1.0-rc=
2/riscv-zaamo-zalrsc.pdf
>=20
> > >
> > > Add config RISCV_AMO_USE_ZALRSC.
> > >
> > > Signed-off-by: Chao-ying Fu <cfu@mips.com>
> > > Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> > > ---
> > >  arch/riscv/Kconfig               | 11 +++++++
> > >  arch/riscv/include/asm/atomic.h  | 52 ++++++++++++++++++++++++++++++=
+-
> > >  arch/riscv/include/asm/bitops.h  | 45 +++++++++++++++++++++++++++
> > >  arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++
> > >  arch/riscv/include/asm/futex.h   | 46 ++++++++++++++++++++++++++++
> > >  5 files changed, 169 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index cc63aef41e94..9fb020b49408 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -715,6 +715,17 @@ config RISCV_ISA_ZACAS
> > >
> > >         If you don't know what to do here, say Y.
> > >
> > > +config RISCV_AMO_USE_ZALRSC
> > > +     bool "Use Zalrsc extension to implement atomic functions"
> > > +     help
> > > +        Kernel uses only LR/SC instructions to implement atomic func=
tions.
> > > +
> > > +        It makes sense to enable this option if your platform only
> > > +        implements the Zalrsc extension (a subset of the A extension=
),
> > > +        and not the complete A extension.
> > > +
> > > +        If you don't know what to do here, say N.
> > > +
> > >  config TOOLCHAIN_HAS_ZBB
> > >       bool
> > >       default y
> > > diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm=
/atomic.h
> > > index 5b96c2f61adb..88f62e33a545 100644
> > > --- a/arch/riscv/include/asm/atomic.h
> > > +++ b/arch/riscv/include/asm/atomic.h
> > > @@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomi=
c64_t *v, s64 i)
> > >   * have the AQ or RL bits set.  These don't return anything, so ther=
e's only
> > >   * one version to worry about.
> > >   */
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >  #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)          =
 \
> > >  static __always_inline                                              =
         \
> > >  void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)    =
 \
> > > @@ -59,7 +60,23 @@ void arch_atomic##prefix##_##op(c_type i, atomic##=
prefix##_t *v)   \
> > >               : "+A" (v->counter)                                    =
 \
> > >               : "r" (I)                                              =
 \
> > >               : "memory");                                           =
 \
> > > -}                                                                   =
 \
> > > +}
> > > +#else
> > > +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)          =
 \
> > > +static __always_inline                                              =
         \
> > > +void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)    =
 \
> > > +{                                                                   =
 \
> > > +     register c_type ret, temp;                                     =
 \
> > > +     __asm__ __volatile__ (                                         =
 \
> > > +             "1:     lr." #asm_type " %1, %0\n"                     =
 \
> > > +             "       " #asm_op " %2, %1, %3\n"                      =
 \
> > > +             "       sc." #asm_type " %2, %2, %0\n"                 =
 \
> > > +             "       bnez %2, 1b\n"                                 =
 \
> > > +             : "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)     =
     \
> > > +             : "r" (I)                                              =
 \
> > > +             : "memory");                                           =
 \
> > > +}
> > > +#endif
> > >
> > >  #ifdef CONFIG_GENERIC_ATOMIC64
> > >  #define ATOMIC_OPS(op, asm_op, I)                                   =
 \
> > > @@ -84,6 +101,7 @@ ATOMIC_OPS(xor, xor,  i)
> > >   * There's two flavors of these: the arithmatic ops have both fetch =
and return
> > >   * versions, while the logical ops only have fetch versions.
> > >   */
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >  #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)    =
 \
> > >  static __always_inline                                              =
         \
> > >  c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,         =
 \
> > > @@ -108,6 +126,38 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i=
, atomic##prefix##_t *v) \
> > >               : "memory");                                           =
 \
> > >       return ret;                                                    =
 \
> > >  }
> > > +#else
> > > +#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)    =
 \
> > > +static __always_inline                                              =
         \
> > > +c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,         =
 \
> > > +                                          atomic##prefix##_t *v)    =
 \
> > > +{                                                                   =
 \
> > > +     register c_type ret, temp;                                     =
 \
> > > +     __asm__ __volatile__ (                                         =
 \
> > > +             "1:     lr." #asm_type " %1, %0\n"                     =
 \
> > > +             "       " #asm_op " %2, %1, %3\n"                      =
 \
> > > +             "       sc." #asm_type " %2, %2, %0\n"                 =
 \
> > > +             "       bnez %2, 1b\n"                                 =
 \
> > > +             : "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)     =
     \
> > > +             : "r" (I)                                              =
 \
> > > +             : "memory");                                           =
 \
> > > +     return ret;                                                    =
 \
> > > +}                                                                   =
 \
> > > +static __always_inline                                              =
         \
> > > +c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t=
 *v)     \
> > > +{                                                                   =
 \
> > > +     register c_type ret, temp;                                     =
 \
> > > +     __asm__ __volatile__ (                                         =
 \
> > > +             "1:     lr." #asm_type ".aqrl %1, %0\n"                =
 \
> > > +             "       " #asm_op " %2, %1, %3\n"                      =
 \
> > > +             "       sc." #asm_type ".aqrl %2, %2, %0\n"            =
 \
> > > +             "       bnez %2, 1b\n"                                 =
 \
> > > +             : "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)     =
     \
> > > +             : "r" (I)                                              =
 \
> > > +             : "memory");                                           =
 \
> > > +     return ret;                                                    =
 \
> > > +}
> > > +#endif
> > >
> > >  #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, pref=
ix)      \
> > >  static __always_inline                                              =
         \
> > > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm=
/bitops.h
> > > index fae152ea0508..0051de1cf471 100644
> > > --- a/arch/riscv/include/asm/bitops.h
> > > +++ b/arch/riscv/include/asm/bitops.h
> > > @@ -187,12 +187,17 @@ static __always_inline int variable_fls(unsigne=
d int x)
> > >
> > >  #if (BITS_PER_LONG =3D=3D 64)
> > >  #define __AMO(op)    "amo" #op ".d"
> > > +#define __LR "lr.d"
> > > +#define __SC "sc.d"
> > >  #elif (BITS_PER_LONG =3D=3D 32)
> > >  #define __AMO(op)    "amo" #op ".w"
> > > +#define __LR "lr.w"
> > > +#define __SC "sc.w"
> > >  #else
> > >  #error "Unexpected BITS_PER_LONG"
> > >  #endif
> > >
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >  #define __test_and_op_bit_ord(op, mod, nr, addr, ord)               =
 \
> > >  ({                                                           \
> > >       unsigned long __res, __mask;                            \
> > > @@ -211,6 +216,33 @@ static __always_inline int variable_fls(unsigned=
 int x)
> > >               : "+A" (addr[BIT_WORD(nr)])                     \
> > >               : "r" (mod(BIT_MASK(nr)))                       \
> > >               : "memory");
> > > +#else
> > > +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)               =
 \
> > > +({                                                           \
> > > +     unsigned long __res, __mask, __temp;                    \
> > > +     __mask =3D BIT_MASK(nr);                                  \
> > > +     __asm__ __volatile__ (                                  \
> > > +             "1: " __LR #ord " %0, %1\n"                     \
> > > +             #op " %2, %0, %3\n"                             \
> > > +             __SC #ord " %2, %2, %1\n"                       \
> > > +             "bnez %2, 1b\n"                                 \
> > > +             : "=3D&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=3D&r" (=
__temp)      \
> > > +             : "r" (mod(__mask))                             \
> > > +             : "memory");                                    \
> > > +     ((__res & __mask) !=3D 0);                                \
> > > +})
> > > +
> > > +#define __op_bit_ord(op, mod, nr, addr, ord)                 \
> > > +     unsigned long __res, __temp;                            \
> > > +     __asm__ __volatile__ (                                  \
> > > +             "1: " __LR #ord " %0, %1\n"                     \
> > > +             #op " %2, %0, %3\n"                             \
> > > +             __SC #ord " %2, %2, %1\n"                       \
> > > +             "bnez %2, 1b\n"                                 \
> > > +             : "=3D&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=3D&r" (=
__temp)      \
> > > +             : "r" (mod(BIT_MASK(nr)))                       \
> > > +             : "memory")
> > > +#endif
> > >
> > >  #define __test_and_op_bit(op, mod, nr, addr)                        =
 \
> > >       __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> > > @@ -354,12 +386,25 @@ static inline void arch___clear_bit_unlock(
> > >  static inline bool arch_xor_unlock_is_negative_byte(unsigned long ma=
sk,
> > >               volatile unsigned long *addr)
> > >  {
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >       unsigned long res;
> > >       __asm__ __volatile__ (
> > >               __AMO(xor) ".rl %0, %2, %1"
> > >               : "=3Dr" (res), "+A" (*addr)
> > >               : "r" (__NOP(mask))
> > >               : "memory");
> > > +#else
> > > +     unsigned long res, temp;
> > > +
> > > +     __asm__ __volatile__ (
> > > +             "1: " __LR ".rl %0, %1\n"
> > > +             "xor %2, %0, %3\n"
> > > +             __SC ".rl %2, %2, %1\n"
> > > +             "bnez %2, 1b\n"
> > > +             : "=3D&r" (res), "+A" (*addr), "=3D&r" (temp)
> > > +             : "r" (__NOP(mask))
> > > +             : "memory");
> > > +#endif
> > >       return (res & BIT(7)) !=3D 0;
> > >  }
> > >
> > > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/as=
m/cmpxchg.h
> > > index 4cadc56220fe..aba60f427060 100644
> > > --- a/arch/riscv/include/asm/cmpxchg.h
> > > +++ b/arch/riscv/include/asm/cmpxchg.h
> > > @@ -51,6 +51,7 @@
> > >       }                                                              =
         \
> > >  })
> > >
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >  #define __arch_xchg(sfx, prepend, append, r, p, n)                  =
 \
> > >  ({                                                                  =
 \
> > >       __asm__ __volatile__ (                                         =
 \
> > > @@ -61,6 +62,21 @@
> > >               : "r" (n)                                              =
 \
> > >               : "memory");                                           =
 \
> > >  })
> > > +#else
> > > +#define __arch_xchg(sfx, prepend, append, r, p, n)                  =
 \
> > > +({                                                                  =
 \
> > > +     __typeof__(*(__ptr)) temp;                                     =
 \
> > > +     __asm__ __volatile__ (                                         =
 \
> > > +             prepend                                                =
 \
> > > +             "1:     lr" sfx " %0, %1\n"                            =
 \
> > > +             "       sc" sfx " %2, %3, %1\n"                        =
 \
> > > +             "       bnez %2, 1b\n"                                 =
 \
> > > +             append                                                 =
 \
> > > +             : "=3D&r" (r), "+A" (*(p)), "=3D&r" (temp)             =
     \
> > > +             : "r" (n)                                              =
 \
> > > +             : "memory");                                           =
 \
> > > +})
> > > +#endif
> > >
> > >  #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,             =
         \
> > >                  sc_append, swap_append)                             =
 \
> > > diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/=
futex.h
> > > index fc8130f995c1..dc63065e707e 100644
> > > --- a/arch/riscv/include/asm/futex.h
> > > +++ b/arch/riscv/include/asm/futex.h
> > > @@ -19,6 +19,7 @@
> > >  #define __disable_user_access()              do { } while (0)
> > >  #endif
> > >
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >  #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)   \
> > >  {                                                            \
> > >       __enable_user_access();                                 \
> > > @@ -32,16 +33,39 @@
> > >       : "memory");                                            \
> > >       __disable_user_access();                                \
> > >  }
> > > +#else
> > > +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)   \
> > > +{                                                            \
> > > +     __enable_user_access();                                 \
> > > +     __asm__ __volatile__ (                                  \
> > > +     "1:     lr.w.aqrl %[ov], %[u]\n"                        \
> > > +     "       " insn "\n"                                     \
> > > +     "       sc.w.aqrl %[t], %[t], %[u]\n"                   \
> > > +     "       bnez %[t], 1b\n"                                \
> > > +     "2:\n"                                                  \
> > > +     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r])                  \
> > > +     : [r] "+r" (ret), [ov] "=3D&r" (oldval),                  \
> > > +       [t] "=3D&r" (temp), [u] "+m" (*uaddr)                   \
> > > +     : [op] "Jr" (oparg)                                     \
> > > +     : "memory");                                            \
> > > +     __disable_user_access();                                \
> > > +}
> > > +#endif
> > >
> > >  static inline int
> > >  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user=
 *uaddr)
> > >  {
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >       int oldval =3D 0, ret =3D 0;
> > > +#else
> > > +     int oldval =3D 0, ret =3D 0, temp =3D 0;
> >
> > I think it's better to define this temp variable inside of
> > __futex_atomic_op() instead of requiring it to be defined in the scope
> > where the macro is called.
> >
> > - Charlie
> >
> > > +#endif
> > >
> > >       if (!access_ok(uaddr, sizeof(u32)))
> > >               return -EFAULT;
> > >
> > >       switch (op) {
> > > +#ifndef RISCV_AMO_USE_ZALRSC
> > >       case FUTEX_OP_SET:
> > >               __futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
> > >                                 ret, oldval, uaddr, oparg);
> > > @@ -62,6 +86,28 @@ arch_futex_atomic_op_inuser(int op, int oparg, int=
 *oval, u32 __user *uaddr)
> > >               __futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
> > >                                 ret, oldval, uaddr, oparg);
> > >               break;
> > > +#else
> > > +     case FUTEX_OP_SET:
> > > +             __futex_atomic_op("mv %[t], %z[op]",
> > > +                               ret, oldval, uaddr, oparg);
> > > +             break;
> > > +     case FUTEX_OP_ADD:
> > > +             __futex_atomic_op("add %[t], %[ov], %z[op]",
> > > +                               ret, oldval, uaddr, oparg);
> > > +             break;
> > > +     case FUTEX_OP_OR:
> > > +             __futex_atomic_op("or %[t], %[ov], %z[op]",
> > > +                               ret, oldval, uaddr, oparg);
> > > +             break;
> > > +     case FUTEX_OP_ANDN:
> > > +             __futex_atomic_op("and %[t], %[ov], %z[op]",
> > > +                               ret, oldval, uaddr, ~oparg);
> > > +             break;
> > > +     case FUTEX_OP_XOR:
> > > +             __futex_atomic_op("xor %[t], %[ov], %z[op]",
> > > +                               ret, oldval, uaddr, oparg);
> > > +             break;
> > > +#endif
> > >       default:
> > >               ret =3D -ENOSYS;
> > >       }
> > > --

--CtbRFhT9ZXLoO6od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5/QwAAKCRB4tDGHoIJi
0qyEAQCexIKwLAmhWkX4I4hvjMTyYCa+GAnkBPdhkOXa4AzDPAEA6zMVeoBruwvw
WU4hxdlyOUL55gRqpPc2d9qdWGgB9As=
=vu3q
-----END PGP SIGNATURE-----

--CtbRFhT9ZXLoO6od--
