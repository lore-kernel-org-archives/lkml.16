Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE2F198E9B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987373; cv=none; b=FN91VGty6dbX2ZeBRmiHOYw59xdCUGcke6oeXaMc4coXcVSwHY8K7xmD61cJb6IzBWsIBP1TknOakXCTgn13OXeaMZ4TKFO3PFzrJWHSuM8CQSCMtZs+Q1hlc1hjT02Co71+CebvpYR6GAOlfaC6aP4gGXKN765pD5b7E0Ga4RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987373; c=relaxed/simple;
	bh=CQL7DpWnzM1aFBVZDvvR5dPUfgMIzIzgOgXLOPyKDXY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XP9jcaGVSS8EKP2GuABNmO69/IhhLIt86tDf/qfS99cTZAonCNbXAPOohczOt4Bvv0k0pxGibPf75dipCLW/cZMRNqePQUP5dYj3b9x2CtbyQ8VzNGx+QJULUZw7aAujRlqFzr3U+3C5GUZ5exDJxyg3Acz/pUoztrQit0rkt20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=EPN1M9O2; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="EPN1M9O2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1747987370;
	bh=clz6wJ7sb6+JOhnOE0ZhUZDPqWZbJDul6DzGmRHvYpA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EPN1M9O2RLCkr4x8a/DfjCUeWRza9CNfeIO0S0FSvZoGRHrwva5hX54LksT4h9+vi
	 ymSjC1uoseQrnEXiLd8vkMVZbuvMGXR4vEF9+VBYnkaGnHyDEa7qsV53Pd8Atz2jAI
	 HXodIxRG8kAb+67KM3Za/Ik/Qj9XjCIH//0N1E4E=
Received: from [192.168.124.38] (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 8DB0A65997;
	Fri, 23 May 2025 04:02:48 -0400 (EDT)
Message-ID: <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 23 May 2025 16:02:45 +0800
In-Reply-To: <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
References: <20250411024600.16045-1-xry111@xry111.site>
	 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
	 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-23 at 10:01 +0200, Alexandre Ghiti wrote:
> Hi Xi,
>=20
> On 4/11/25 10:04, Thomas Wei=C3=9Fschuh wrote:
> > On Fri, Apr 11, 2025 at 10:46:00AM +0800, Xi Ruoyao wrote:
> > > Hook up the generic vDSO implementation to the generic vDSO
> > > getrandom
> > > implementation by providing the required
> > > __arch_chacha20_blocks_nostack
> > > and getrandom_syscall implementations. Also wire up the selftests.
> > >=20
> > > The benchmark result:
> > >=20
> > > 	vdso: 25000000 times in 2.466341333 seconds
> > > 	libc: 25000000 times in 41.447720005 seconds
> > > 	syscall: 25000000 times in 41.043926672 seconds
> > >=20
> > > 	vdso: 25000000 x 256 times in 162.286219353 seconds
> > > 	libc: 25000000 x 256 times in 2953.855018685 seconds
> > > 	syscall: 25000000 x 256 times in 2796.268546000 seconds
> > >=20
> > > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > > ---
> > >=20
> > > [v1]->v2:
> > > - Fix the commit message.
> > > - Only build the vDSO getrandom code if CONFIG_VDSO_GETRANDOM, to
> > > =C2=A0=C2=A0 unbreak RV32 build.
> > > - Likewise, only enable the selftest if __riscv_xlen =3D=3D 64.
> > >=20
> > > [v1]:
> > > https://lore.kernel.org/all/20250224122541.65045-1-xry111@xry111.site=
/
> > >=20
> > > =C2=A0 arch/riscv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0 arch/riscv/include/asm/vdso/getrandom.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 30 +++
> > > =C2=A0 arch/riscv/kernel/vdso/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +
> > > =C2=A0 arch/riscv/kernel/vdso/getrandom.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +
> > > =C2=A0 arch/riscv/kernel/vdso/vdso.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0 arch/riscv/kernel/vdso/vgetrandom-chacha.S=C2=A0=C2=A0=C2=A0 |=
 244
> > > ++++++++++++++++++
> > > =C2=A0 .../selftests/vDSO/vgetrandom-chacha.S=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0 7 files changed, 300 insertions(+)
> > > =C2=A0 create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
> > > =C2=A0 create mode 100644 arch/riscv/kernel/vdso/getrandom.c
> > > =C2=A0 create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S
> > <snip>
> >=20
> > > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S
> > > b/arch/riscv/kernel/vdso/vdso.lds.S
> > > index 8e86965a8aae..abc69cda0445 100644
> > > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > > @@ -80,6 +80,7 @@ VERSION
> > > =C2=A0 #ifndef COMPAT_VDSO
> > > =C2=A0=C2=A0		__vdso_riscv_hwprobe;
> > > =C2=A0 #endif
> > > +		__vdso_getrandom;
> > For consistency this could be gated behind CONFIG_VDSO_GETRANDOM.
>=20
>=20
> Nathan sent a fix for this here:
>=20
> https://lore.kernel.org/all/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbb=
c244501@kernel.org/

I've given it an R-b.  Do you prefer me to squash the patches and keep
the SoB of both I and Nathan?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
