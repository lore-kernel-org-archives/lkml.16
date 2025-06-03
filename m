Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91711CAF
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748954903; cv=none; b=ZmupJ2OrF/IUv39qoq3wewyK5VsA0W3JphJS+UKgf2JPGF5bdzTU78sXijwyBHHUF6n5au4lktQgZmtzTyqCryS4tKkiDOCJH2GEOtlWHtXzF9AYBF+WHNrQum0OHiMUu6HwnyzSRPFIiX0mNvcrzygUJRmmkdqVcnu/6rLVmbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748954903; c=relaxed/simple;
	bh=k3VF4HiD/2i620zOkBGzXVfjwNAJs9pzu3fWxBJ9q9M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SGxN09HWxaHqqt4nrmI59P4gUMvt9kxiTPf4N44egKY1UhBXB9MwDJCRuAkZNSGcIZzvyHjicdQv7uldsv2nAT6uXotAgUzvD4uZWk+/Fi0/679eSJG2XaKQCi0+C6EVYa1Mf7fkuUcHUmP3x34HLrU5Jv5B6W4Un4yCuLEcAj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=YNndBMrG; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="YNndBMrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1748954899;
	bh=be0lML8aTZW4E4Ing1VFrv8AHF+jgbhUUfX0JPhKOXM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YNndBMrG6qOvSbDqbcdZXRiRtkqmMq4ebR6guSj1GLDHCHcU4hCF+rVkD+dPQRM27
	 ACqHA7lI0HUDPgXI007V4fDUlIEvOgxvn+eSzij8KaRzCsFq2tUPXD8a2JBtyoMBxx
	 x407JtrMTJnJIbSJLisUQPCoF9QZR8a6FvBA9KI4=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A07E565F62;
	Tue,  3 Jun 2025 08:48:16 -0400 (EDT)
Message-ID: <0f0eb024d7ed062141a8aa048017e6f7ef7c1fd4.camel@xry111.site>
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 03 Jun 2025 20:48:15 +0800
In-Reply-To: <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
References: <20250411024600.16045-1-xry111@xry111.site>
	 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
	 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
	 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
	 <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-23 at 12:06 +0200, Alexandre Ghiti wrote:
> On 5/23/25 10:02, Xi Ruoyao wrote:
> > On Fri, 2025-05-23 at 10:01 +0200, Alexandre Ghiti wrote:
> > > Hi Xi,
> > >=20
> > > On 4/11/25 10:04, Thomas Wei=C3=9Fschuh wrote:
> > > > On Fri, Apr 11, 2025 at 10:46:00AM +0800, Xi Ruoyao wrote:
> > > > > Hook up the generic vDSO implementation to the generic vDSO
> > > > > getrandom
> > > > > implementation by providing the required
> > > > > __arch_chacha20_blocks_nostack
> > > > > and getrandom_syscall implementations. Also wire up the selftests=
.
> > > > >=20
> > > > > The benchmark result:
> > > > >=20
> > > > > 	vdso: 25000000 times in 2.466341333 seconds
> > > > > 	libc: 25000000 times in 41.447720005 seconds
> > > > > 	syscall: 25000000 times in 41.043926672 seconds
> > > > >=20
> > > > > 	vdso: 25000000 x 256 times in 162.286219353 seconds
> > > > > 	libc: 25000000 x 256 times in 2953.855018685 seconds
> > > > > 	syscall: 25000000 x 256 times in 2796.268546000 seconds
> > > > >=20
> > > > > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > > > > ---
> > > > >=20
> > > > > [v1]->v2:
> > > > > - Fix the commit message.
> > > > > - Only build the vDSO getrandom code if CONFIG_VDSO_GETRANDOM, to
> > > > > =C2=A0=C2=A0=C2=A0 unbreak RV32 build.
> > > > > - Likewise, only enable the selftest if __riscv_xlen =3D=3D 64.
> > > > >=20
> > > > > [v1]:
> > > > > https://lore.kernel.org/all/20250224122541.65045-1-xry111@xry111.=
site/
> > > > >=20
> > > > > =C2=A0=C2=A0 arch/riscv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > > =C2=A0=C2=A0 arch/riscv/include/asm/vdso/getrandom.h=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 +++
> > > > > =C2=A0=C2=A0 arch/riscv/kernel/vdso/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 =
+
> > > > > =C2=A0=C2=A0 arch/riscv/kernel/vdso/getrandom.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +
> > > > > =C2=A0=C2=A0 arch/riscv/kernel/vdso/vdso.lds.S=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > > =C2=A0=C2=A0 arch/riscv/kernel/vdso/vgetrandom-chacha.S=C2=A0=C2=
=A0=C2=A0 | 244
> > > > > ++++++++++++++++++
> > > > > =C2=A0=C2=A0 .../selftests/vDSO/vgetrandom-chacha.S=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > > =C2=A0=C2=A0 7 files changed, 300 insertions(+)
> > > > > =C2=A0=C2=A0 create mode 100644 arch/riscv/include/asm/vdso/getra=
ndom.h
> > > > > =C2=A0=C2=A0 create mode 100644 arch/riscv/kernel/vdso/getrandom.=
c
> > > > > =C2=A0=C2=A0 create mode 100644 arch/riscv/kernel/vdso/vgetrandom=
-chacha.S
> > > > <snip>
> > > >=20
> > > > > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S
> > > > > b/arch/riscv/kernel/vdso/vdso.lds.S
> > > > > index 8e86965a8aae..abc69cda0445 100644
> > > > > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > > > > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > > > > @@ -80,6 +80,7 @@ VERSION
> > > > > =C2=A0=C2=A0 #ifndef COMPAT_VDSO
> > > > > =C2=A0=C2=A0=C2=A0		__vdso_riscv_hwprobe;
> > > > > =C2=A0=C2=A0 #endif
> > > > > +		__vdso_getrandom;
> > > > For consistency this could be gated behind CONFIG_VDSO_GETRANDOM.
> > >=20
> > > Nathan sent a fix for this here:
> > >=20
> > > https://lore.kernel.org/all/20250423-riscv-fix-compat_vdso-lld-v2-1-b=
7bbbc244501@kernel.org/
> > I've given it an R-b.=C2=A0 Do you prefer me to squash the patches and =
keep
> > the SoB of both I and Nathan?
>=20
> Hmm I was about to send a new PR today after the CI passes, I mentioned=
=20
> Nathan's patch in the squash so he keeps credit for the fix. Unless you=
=20
> can send something today, I'll keep my squashed patch.

Palmer has reverted this in for-next and Thomas just informed me another
mistake in the code at https://lore.kernel.org/all/20250603-loongarch-
vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de/.

I'll try to sort things up and send v3 in the week.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
