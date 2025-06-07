Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1F7EEDE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305808; cv=none; b=Hpm8K+bbKQeYPtiHGBqOy+ySJs1lwXLlf/cX10csGVVWmN2myUXGOzAGF5aLGloex5izQGDLzS/oRKN9GTcHSEe+GuHxiApRAWuZD+Zr59Rd2jNUnjIh6RKgsDd8HFpGnW0sUPVeluuUF+l+lVgjfL+3rWSjQC5CQeXqcOR4eI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305808; c=relaxed/simple;
	bh=74oBZmO8xDsWk8MCIOfUtTekYbilRrVe3hnnEo6zFWo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AoXnyoFCrKiQLAjWfFg02ZgJO2FJemRYWvr1ze3p40yqff7hVOk8Hu3uXwwvX5iNUmouuAuLgo38e/eojRFY+jiJnWZs7KNka8RvdliZRE6rOcyeEjRpRjUAUSJPSM/i+ZYSPoofBzjpTM7m1mSxlv8ORAgZI4KqRTfgruTRcgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=PeG+dtO+; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="PeG+dtO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1749305799;
	bh=JWEOaaLt4BDnVdW8Y37Y6nzHvOr5CYTYqnL4sURAwu8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PeG+dtO+FStFd8BBtOFfJzSwzCx2XDnw5DNnQaeg2A/I3tfjzfW41TSAxLB0IG6Mv
	 fJy/nRJ53oIWpjPaIa2aeT1yKyXhiJmP9sA5fMx2239cDgeFtaEOVl2Mf5s3pllC/S
	 b/7+oAQ33E9CG+EaEap0pOSaxfSBeGE2I/kZlHqw=
Received: from [192.168.124.38] (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 7913065F62;
	Sat,  7 Jun 2025 10:16:37 -0400 (EDT)
Message-ID: <6163d55a1e7910f89dda114a2ee52c9df5235dad.camel@xry111.site>
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
From: Xi Ruoyao <xry111@xry111.site>
To: Vineet Gupta <vineetg@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 07 Jun 2025 22:16:34 +0800
In-Reply-To: <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
References: 
	<20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
	 <20250606092443.73650-2-xry111@xry111.site>
	 <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-06 at 15:01 -0700, Vineet Gupta wrote:
> On 6/6/25 02:24, Xi Ruoyao wrote:
> > As recently pointed out by Thomas, if a register is forced for two
> > different register variables, among them one is used as "+" (both input
> > and output) and another is only used as input, Clang would treat the
> > conflicting input parameters as undefined behaviour and optimize away
> > the argument assignment.
> >=20
> > Per an example in the GCC documentation, for this purpose we can use "=
=3D"
> > (only output) for the output, and "0" for the input for that we must
> > reuse the same register as the output.=C2=A0 And GCC developers have
> > confirmed using a simple "r" (that we use for most vDSO implementations=
)
> > instead of "0" is also fine.
> >=20
> > Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-=
6d12d6dfbdd0@linutronix.de/
> > Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Vari=
ables.html
> > Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
> > Cc: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > ---
> >=20
> > v1 -> v2: Keep using "r" for buffer to follow the existing convention
> > (that the GCC developers have confirmed fine).
> >=20
> > =C2=A0arch/riscv/include/asm/vdso/getrandom.h | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/inclu=
de/asm/vdso/getrandom.h
> > index 8dc92441702a..c6d66895c1f5 100644
> > --- a/arch/riscv/include/asm/vdso/getrandom.h
> > +++ b/arch/riscv/include/asm/vdso/getrandom.h
> > @@ -18,7 +18,7 @@ static __always_inline ssize_t getrandom_syscall(void=
 *_buffer, size_t _len, uns
> > =C2=A0	register unsigned int flags asm("a2") =3D _flags;
> > =C2=A0
> > =C2=A0	asm volatile ("ecall\n"
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (ret)
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (ret)
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (nr), "r" (buffer), "r" (l=
en), "r" (flags)
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>=20
> My 2 cents as I've dabbled into this for ARC glibc syscall macros [1] whe=
re r0
> is both the first syscall/function arg and also the function/syscall retu=
rn.
>=20
> The v2 approach still keeps 2 different variables in same local reg which=
 has
> potential for any future compiler shenanigans.
> Segher's example avoided specifying the same reg.
> What about something like the following: seems to generate the right code=
 (with
> gcc 15)
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register long ret asm("a0");

Then it would be better to rename this variable to just "a0".  And I
guess Thomas doesn't want a new convention different from all other
syscall wrappers in vDSO...

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register long nr asm("a7") =3D __NR_=
getrandom;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register size_t len asm("a1") =3D _l=
en;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned int flags asm("a2"=
) =3D _flags;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D (unsigned long) _buffer;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("ecall\n"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "+r" (ret)=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // keep "+r"
> for input _buffer / output ret
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (nr), "r" (len), "r"=
 (flags)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory");
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>=20
> Thx,
> -Vineet
>=20
> [1] https://github.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/a=
rc/sysdep.h

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
