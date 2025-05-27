Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE83219ED
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748317651; cv=none; b=hcU8pjphoSp0a2srLEPS+8BBgzPySuQm7lNTxixj/UwkTgAW/ZFNYqbACtWzBcJBh0DsHUBeilrlzQTeyr5nnIbbC9XxO24GvwrRi01H7tHS78PD4dvS01i/XAUX/08qj08zVNrlivnR1J3nIOwhExERWROokR9BETsGtXT31gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748317651; c=relaxed/simple;
	bh=i8fK/UC7IwSbdmIBJIreMCZdiD3Bh2aW1zCYzj4Y994=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CjGFTNGl3qPBcNxwa574Pzp5t+iB65EpoXOMl2WhluYF6xj+ncHNXgpAUckm9b1uAbDMBZsxHxc5dp+Rwn+P2VsrgFkR3t4tWKsQfIWJ/nvVfclx0kRzg2UKKdeTYjB43fk2ARbU5N+RZNVqyfo+igNRfXko7ZbDd8MXtC8Yokc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=ZBflUHSv; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="ZBflUHSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1748317642;
	bh=i8fK/UC7IwSbdmIBJIreMCZdiD3Bh2aW1zCYzj4Y994=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZBflUHSvUt5M6O2sV4BqFvg07K3qf5H19DTMmwSHOCb+eAQrURkBBq+z/ye+Zk+6G
	 o8y/EqMMUYBkxL/AaUXo6j1pOAhJ70UbIBxcXgHmG39dGXx3QpP79fG7heafYwqDYv
	 E2iGL2K9AvHhmFRgK9QTyV4PhJfV+9a0VWl5T/BM=
Received: from [192.168.124.38] (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 2B27F65F62;
	Mon, 26 May 2025 23:47:21 -0400 (EDT)
Message-ID: <19f4722d5cdb90a207129ee675c7278423cd328c.camel@xry111.site>
Subject: Re: [RFC PATCH] LoongArch: Do not include larchintrin.h
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 27 May 2025 11:47:19 +0800
In-Reply-To: <a918b221-b7f3-9994-9a7a-d10345aa30df@loongson.cn>
References: <20250520064936.32291-1-yangtiezhu@loongson.cn>
	 <e005dd551aec8bea185b3d37295876bd75d7b3e4.camel@xry111.site>
	 <a918b221-b7f3-9994-9a7a-d10345aa30df@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-27 at 11:17 +0800, Tiezhu Yang wrote:
> On 2025/5/21 =E4=B8=8B=E5=8D=881:41, Xi Ruoyao wrote:
> > On Tue, 2025-05-20 at 14:49 +0800, Tiezhu Yang wrote:
> > > larchintrin.h is a system header of compiler, include it in the
> > > kernel header may lead to the fatal error "'larchintrin.h' file
> > > not found".
> > >=20
> > > There are two related cases so far:
> > >=20
> > > (1) When compiling samples/bpf, it has been fixed in the latest
> > > kernel [1].
> > >=20
> > > (2) When running bcc script, it has been fixed in the latest
> > > bcc [2] [3], like this:
> > >=20
> > > $ /usr/share/bcc/tools/filetop
> > > In file included from <built-in>:4:
> > > In file included from /virtual/include/bcc/helpers.h:54:
> > > In file included from arch/loongarch/include/asm/page.h:7:
> > > In file included from arch/loongarch/include/asm/addrspace.h:9:
> > > arch/loongarch/include/asm/loongarch.h:11:10: fatal error:
> > > 'larchintrin.h' file not found
> > > =C2=A0=C2=A0=C2=A0 11 | #include <larchintrin.h>
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~
> > > 1 error generated.
> > >=20
> > > Maybe there are same errors for the other unknown projects, it is
> > > annoyance to add the include path each time. In order to avoid
> > > such
> > > errors once and for all, do not include larchintrin.h, just use
> > > the
> > > builtin functions directly.
> >=20
> > Sorry, but in GCC those builtin functions are not documented and may
> > subject to change in the future.=C2=A0 Only the larchintrin.h interface
> > is
> > documented.
>=20
> AFAICT, the LoongArch Base Built-in Functions are listed in the GCC
> documentation [1], they will not be changed easily and frequently in
> my opinion.
>=20
> __builtin_loongarch_cpucfg()
> __builtin_loongarch_csrrd_w()
> __builtin_loongarch_csrrd_d()
> __builtin_loongarch_csrwr_w()
> __builtin_loongarch_csrwr_d()
> __builtin_loongarch_csrxchg_w()
> __builtin_loongarch_csrxchg_d()
> __builtin_loongarch_iocsrrd_w()
> __builtin_loongarch_iocsrrd_d()
> __builtin_loongarch_iocsrwr_w()
> __builtin_loongarch_iocsrwr_d()
>=20
> > Thus if you don't want to rely on GCC for those operations, you may
> > need
> > to write inline asm...
>=20
> so these builtin functions can be used directly and safely.

Oops, I mistakenly believed they were like __builtin_lsx_* which are not
documented.

So yes they can be used directly.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
