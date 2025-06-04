Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB410E9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 00:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748995908; cv=none; b=jQV4buC6a5Ky6yuIOCEa/g6gpfxLN7oeeDwGPt89QB6dj9mvtbsJEMaf2XLs1nYPnO/uzWSrLHSL+4Za1yYUEKdbEvqTQCYrSNHt1ybG7NpHcZzF1fqk/1Lxmu6tZbFlxKgmuuUnRG8NZM93UwZvZeIT60fhKhzBtPEycpO7hfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748995908; c=relaxed/simple;
	bh=PwtRU18+V0AMOnnu7zBWMggFnyasEek36PdlzdcVEWQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sthHkSYrGunwn3xH8gyb5Nv+FO8RnA0TW7wXLX2X6R7/QkRjVmaEK1p10J6lITnihkI8ynFFAOavl1PP0zZAby2+gYFU7/0R+JWRhUctLdIpsEz75cbUhd7cHkY0NV2NwaDSexfxcAHPphKi7XBfTpRLzVqCnaeoLtbTLofii3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=k8Gq2AD7; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="k8Gq2AD7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Z208cSI/cwaM01sldKAqiWUvCVyk4JHIQDzn/4gRm2c=; b=k8Gq2AD7i3dR8TA/kMfJJ5eW4U
	3lO+g7KpZ+TDEUC4TR/kXTTmNZcrWVJNAxs9Dh6R0WpEa9GexUwj2g6XVALepAVkYElI6m31nd9Be
	tSlJhjjh7POjkkm9Ba6J4XKY2yKl2VKf6D8obpyjNRa4qJh/zIDgCQah5s6iBFw11F2ALXB6jqYKb
	BMVssTz0yHSPtLV5ETDk8XLBmC0PSHQ+REJ7E/oSrrnDcX0I5e/B7exnXnMZCBa0KFuFfwohx2VZZ
	O+dDGbodWy8FieV+GdzfGOg80ajR/DGQdNBZnePIWtFCdXE5WrdE6rVDOmt/VM/vthho2Sn+MjY5A
	qiq+40gQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uMbj4-000000004AB-32z5;
	Tue, 03 Jun 2025 20:11:26 -0400
Message-ID: <75fc457e8c4cf40b83743bd590f03ca22acd9e8e.camel@surriel.com>
Subject: Re: [RFC v2 6/9] x86/apic: Introduce Remote Action Request
 Operations
From: Rik van Riel <riel@surriel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	hpa@zytor.com, nadav.amit@gmail.com, Rik van Riel <riel@fb.com>, Yu-cheng
 Yu	 <yu-cheng.yu@intel.com>
Date: Tue, 03 Jun 2025 20:11:26 -0400
In-Reply-To: <aCxIeJZjdSEMi__f@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
	 <20250520010350.1740223-7-riel@surriel.com> <aCxIeJZjdSEMi__f@gmail.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-20 at 11:16 +0200, Ingo Molnar wrote:
>=20
> * Rik van Riel <riel@surriel.com> wrote:
>=20
> > diff --git a/arch/x86/include/asm/irq_vectors.h
> > b/arch/x86/include/asm/irq_vectors.h
> > index 47051871b436..c417b0015304 100644
> > --- a/arch/x86/include/asm/irq_vectors.h
> > +++ b/arch/x86/include/asm/irq_vectors.h
> > @@ -103,6 +103,11 @@
> > =C2=A0 */
> > =C2=A0#define POSTED_MSI_NOTIFICATION_VECTOR	0xeb
> > =C2=A0
> > +/*
> > + * RAR (remote action request) TLB flush
> > + */
> > +#define RAR_VECTOR			0xe0
> > +
> > =C2=A0#define NR_VECTORS			 256
>=20
> This subtly breaks x86 IRQ vector allocation AFAICS.
>=20
> Right now device IRQ vectors are allocated from 0x81 to=20
> FIRST_SYSTEM_VECTOR (POSTED_MSI_NOTIFICATION_VECTOR) or 0xeb.
>=20
> But RAR_VECTOR is within that range, the the IRQ allocator will
> overlap=20
> it and result in what I guess will be misbehaving RAR code and=20
> misbehaving device IRQ handling once it hands out 0xeb as well.

Sure enough! After fixing this issue, the nearly instant
segfaults for programs using RAR are no longer happening.

I'll let it run tests overnight, and will hopefully be able
to post a reliable v3 tomorrow.

Thank you!

--=20
All Rights Reversed.
