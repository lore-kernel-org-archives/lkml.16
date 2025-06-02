Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9221CA81
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748897609; cv=none; b=O3S7HReNK28WReAV0NIuwMDWQNluCUyLCauwNSnPd0HkgVAKqnK3QPDjGVld3MSmaWdZIVJoPdQxEwPHmi6s4hvTRzE3CvHFlpLJX07ZHJFrsPfbqwynEkkczDPk3Ix3Dbs+6PYa6ybDfYj+X8aE03Yz20jDqkEefSWm+riV2o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748897609; c=relaxed/simple;
	bh=WHSfALO68hIo7UNh96QnJWLNce5D3QREeid+0KOfuho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4J7xrbVKx8AOlI+aHWAjssdQ+SlFUmRDn+gpd9W1/iuDdWlfOTdEEsqu1qwtQYW761Yzc+kq1dYcxJ2RFnqRfFonLc+b5Jgkbu79zmJeO+C+QQuqixE5FB6X3Vbz/o8qUDRIvJ2vJYU2B1Irze1eVhzs5Uh5EYtE0efwTYdxUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uYSSzgHf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uYSSzgHf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso4013994a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748897606; x=1749502406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8Oifo5uoznBdtuBQvUtNDYzk1dV6O96AJ1vP+8aIuo=;
        b=uYSSzgHfo3/9+bh3zsknyi0UcXgp0ndP/2vwY7ahOX4Ta83sSSE5rNREGbGC7DiU2Y
         l6aK7KCj6hc3ZfTVRc2Ar5NUx9M96i7QkgZo+/bvYdopq81Z0s01/iud9O6jrTB2FijB
         9WK5OIsFslkQlbKNGUncFhISpFn+mF4QpAJ128+TD/0oEoh6xkxPSAZHQNGlz2eieskt
         tvo0Z3oBNFcVHTj3LjcWriX73L7UUn4VBed2WIwoeKmxMPrveBRRKo79piAOXs82qHzX
         wB9v7K1Df1oj9FMNQVSqHTgMHx45stLtPtoH2FQGsH5Wox4zysJkyGrE2unIIO4iV70D
         WvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748897606; x=1749502406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J8Oifo5uoznBdtuBQvUtNDYzk1dV6O96AJ1vP+8aIuo=;
        b=dEUwXtikzeVvoVwNszhNB+jTFop2eb/vCBC8xV90RH6esJrmlUXmF8dc2p9P6I1CQE
         5E1Ffih8+s3EE+KMs86n2UhdMxrDkzlGEgLj8P4tnI3FzFzza5xG29al7RMjVE7sHHHn
         XBeOdb0kyylEG5uf3topgdHY43X4AHpyFl9QPdEpsWy7ivRUTFTS323aDTl4vtBKeJxP
         H+Z5S+CpA6avxkAUu5C05DyqPh0AU6p4+sZFdOuGi3Gm2si00+67x9FZa7y4uUNibPiu
         it5sBUsYPADLAWXzF8jmNLY9TOON7WNaStGbqzKWPQTZ5xtXuLQqZnC3QJQt9Tm0pa/K
         6NpA==
X-Gm-Message-State: AOJu0YwgzrEbFh7On+ophB3HbBVJK/wuR0n8s+BUjmyq4auuzyeB82gw
	PMEhEXoBAsS+y6hG19iCw4Te9jcKJA+B179JIk4lFvtbkmUO/X3VSVpHKpifN6GZzQ4=
X-Gm-Gg: ASbGncsswcVbr7ab4RiSilvkzbleidM4ZtaUA9GGFCn4vP1ofKM1lxEbGLyBcFrtvQx
	j3QMJ028vXc7FsqJvnKfi/bjkD6IaRhDTmsaelbRxnp/iv4uwzr7kQiFkXRhSN4SBd5pv4JSdYW
	KESAQsskg7Vw3/V33Z1NV8F+oGBpIh+Irit7sN2reNGYxqAS+ashX97bgIDePyULvJe6lzDwGpm
	SbeyUys52zR4V2Je/N1YnewKGKI75QWgiYTQseB4Ks/LRZVkWlgB5VNO4ec3sAEA8dqpk6CIya4
	ibu5b7zYoYi+VpaXa1uruRlnF6lbbzk7r5BwR7/jFFZhtKI=
X-Google-Smtp-Source: AGHT+IFIJjhmBwa178/dCotBZ35b1slVkbgVHRM4LbxYZTo9hrFf7ItB80GSBzwbYo/zli3gqHeDOw==
X-Received: by 2002:a17:90b:1d49:b0:312:639:a062 with SMTP id 98e67ed59e1d1-31250413c17mr22247075a91.16.1748897605773;
        Mon, 02 Jun 2025 13:53:25 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:3831:e87c:eedb:3ff2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21df0sm75209015ad.229.2025.06.02.13.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 13:53:25 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:53:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu
 kernels
Message-ID: <aD4PQ5zU5QgI8KsI@ghost>
References: <20250530211422.784415-1-cmirabil@redhat.com>
 <20250530211422.784415-2-cmirabil@redhat.com>
 <aDpq7kqJUyAjad9F@ghost>
 <CABe3_aF0U5ej6ctQ0TQzecZ+ayaRSzJPTv5zf6kcD9U95rQXxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABe3_aF0U5ej6ctQ0TQzecZ+ayaRSzJPTv5zf6kcD9U95rQXxw@mail.gmail.com>

On Fri, May 30, 2025 at 10:54:23PM -0400, Charles Mirabile wrote:
> On Fri, May 30, 2025 at 10:35 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Fri, May 30, 2025 at 05:14:22PM -0400, Charles Mirabile wrote:
> > > the `__runtime_fixup_32` function does not handle the case where `val` is
> > > zero correctly (as might occur when patching a nommu kernel and referring
> > > to a physical address below the 4GiB boundary whose upper 32 bits are all
> > > zero) because nothing in the existing logic prevents the code from taking
> > > the `else` branch of both nop-checks and emitting two `nop` instructions.
> > >
> > > This leaves random garbage in the register that is supposed to receive the
> > > upper 32 bits of the pointer instead of zero that when combined with the
> > > value for the lower 32 bits yields an invalid pointer and causes a kernel
> > > panic when that pointer is eventually accessed.
> > >
> > > The author clearly considered the fact that if the `lui` is converted into
> > > a `nop` that the second instruction needs to be adjusted to become an `li`
> > > instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
> > > didn't follow that logic through fully to the case where the `else` branch
> > > executes. To fix it just adjust the logic to ensure that the second `else`
> > > branch is not taken if the first instruction will be patched to a `nop`.
> >
> > You have an accurate assesment here, I missed the zero case :/.
> > Thank you for fixing the issue!
> >
> > >
> > > Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> > >
> > > Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> > > ---
> > >  arch/riscv/include/asm/runtime-const.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > > index 451fd76b8811..d766e2b9e6df 100644
> > > --- a/arch/riscv/include/asm/runtime-const.h
> > > +++ b/arch/riscv/include/asm/runtime-const.h
> > > @@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
> > >               addi_insn_mask &= 0x07fff;
> > >       }
> > >
> > > -     if (lower_immediate & 0x00000fff) {
> > > +     if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {
> >
> > This comment is borderline too nitpicky so feel free to dismiss it :).
> > It's slightly wasteful to have this check right after the if-statement
> I agree. Your patch definitely works, but the complexity starts to get
> kind of hairy though to handle it correctly. Especially given this is
> the patching code that only runs once and is not in the hot path.

Yeah you are right it starts to become overkill...

> > that sets it. I am not sure what the most readable way of doing this is
> > though. What would you think about a patch like the following instead?
> >
> > From 1c56536c1e338735140c9090f06da49a3d245a61 Mon Sep 17 00:00:00 2001
> > From: Charlie Jenkins <charlie@rivosinc.com>
> > Date: Fri, 30 May 2025 19:25:13 -0700
> > Subject: [PATCH] alternate fix
> >
> > ---
> >  arch/riscv/include/asm/runtime-const.h | 23 +++++++++++------------
> >  1 file changed, 11 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > index 451fd76b8811..085a0bb26fbb 100644
> > --- a/arch/riscv/include/asm/runtime-const.h
> > +++ b/arch/riscv/include/asm/runtime-const.h
> > @@ -179,12 +179,9 @@ static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> >  static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
> >  {
> >         unsigned int lower_immediate, upper_immediate;
> > -       u32 lui_insn, addi_insn, addi_insn_mask;
> > +       u32 lui_insn, addi_insn;
> >         __le32 lui_res, addi_res;
> >
> > -       /* Mask out upper 12 bit of addi */
> > -       addi_insn_mask = 0x000fffff;
> > -
> >         lui_insn = (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(lui_parcel[1]) << 16;
> >         addi_insn = (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu(addi_parcel[1]) << 16;
> >
> > @@ -195,6 +192,15 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
> >                 /* replace upper 20 bits of lui with upper immediate */
> >                 lui_insn &= 0x00000fff;
> >                 lui_insn |= upper_immediate & 0xfffff000;
> > +
> > +               if (lower_immediate & 0x00000fff) {
> > +                       /* replace upper 12 bits of addi with lower 12 bits of val */
> > +                       addi_insn &= 0x000fffff;
> > +                       addi_insn |= (lower_immediate & 0x00000fff) << 20;
> > +               } else {
> > +                       /* replace addi with nop if lower_immediate is empty */
> > +                       addi_insn = RISCV_INSN_NOP4;
> > +               }
> >         } else {
> >                 /* replace lui with nop if immediate is small enough to fit in addi */
> >                 lui_insn = RISCV_INSN_NOP4;
> > @@ -203,16 +209,9 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
> >                  * is performed by adding with the x0 register. Setting rs to
> >                  * zero with the following mask will accomplish this goal.
> >                  */
> > -               addi_insn_mask &= 0x07fff;
> > -       }
> > -
> > -       if (lower_immediate & 0x00000fff) {
> > +               addi_insn &= 0x07fff;
> >                 /* replace upper 12 bits of addi with lower 12 bits of val */
> > -               addi_insn &= addi_insn_mask;
> >                 addi_insn |= (lower_immediate & 0x00000fff) << 20;
> > -       } else {
> > -               /* replace addi with nop if lower_immediate is empty */
> > -               addi_insn = RISCV_INSN_NOP4;
> >         }
> >
> >         addi_res = cpu_to_le32(addi_insn);
> > --
> > 2.43.0
> >
> > Let me know what you think!
> Frankly, I wonder whether this whole optimization of replacing `lui` or
> `addiw` with `nop` is even worth it. This isn't like linker relaxation
> where we can actually change the amount of code by eliding an instruction.
> Is `nop` actually that much faster to execute than `lui` or `addiw` to
> justify the complexity?

The complexity is pretty minimal (and already implemented) so there
doesn't seem to be enough justification to remove the optimization. Yes,
it will have minimal performance impact, but I don't have the numbers to
be able to confidently remove the nops. This code patching is happening
for code paths that get executed _very_ frequently so any optimization
can potentially have a large impact over the course of a long running
program.

Let's go forward with your original proposal for now, that will keep the
code the simplest but still have the optimization of using the nop.

- Charlie

> >
> > - Charlie
> >
> Best - Charlie
> 
