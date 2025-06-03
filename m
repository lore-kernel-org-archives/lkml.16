Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E0E221FB8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748985673; cv=none; b=iEw4ab7qU8svKANWjPeM9mlG9QjKs9W1UWFkLyW6uNBqtV7cYmy9kFk/FgvbFdSvI4aBWYAzt8Wh1QHmzyElpzB2Yd0E55j+QdyPwxOIT8jO5MNkwGVci7dnmkKLzm0JF6P7qx4rJ1A8jHaCeEwLq5aZ8L4nfafsMk/s0f0OYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748985673; c=relaxed/simple;
	bh=LyeV54vpV4SlPfuND5DzwNX2+FspgFhM+LUndq/KNy8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sUwF8oefDB+EOUUQCtlxLFV8X4Iezn8fH2ygVrYvTwXPGGUJCS32zagOazt/bNaDXZhss0F0+kE3PIBA1ihq/OnsM9e/MPPlGctEmlDKVbMXscIB0NrDjK89asUw6DUbHwkPpT4R+ftjcAnClwEKiA0W937YJIDtvbxMJwnSCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=m9ie5QWD; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="m9ie5QWD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mXPdnENMs/KSEO1dsvQeTKZUbaZFwcjOKMVCR/26ZuU=; b=m9ie5QWDxk5FSOoTNYW1ZKluda
	DnKGY4fhtTufbWUT4NBEncpkcG6Bb98fwaT+Y+v01pZAsXw4VVtJl/NhKLd94HvSr6f7xlcw2bD2y
	Xt22aiR5t6jOruS1hqIPYA6njRntPejjB8t+5xMnlkmDSe8iT3fcR/00w+aoyssfQKySQqfm+T2z0
	FM3gI1iuSpZodfEfAcYHU+ZLZLL1SSBS+JkjX4Zf/U+mFohkkADc3F1u8U6fzShkyIZWRaKxmOn6z
	/iq0iGUtZ7diJJiLxdm2z2OojTroozVQwi+Lz1gqbSo7Le/4F3P++ehM4YuMHnx5JWJkoqLfYIv4E
	cL7KWQ6g==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uMZ44-000000002V9-1z6J;
	Tue, 03 Jun 2025 17:20:56 -0400
Message-ID: <5987ac95e4011c2b71d1c3cce13872571cff3ac7.camel@surriel.com>
Subject: Re: [PATCH 1/3] x86/mm: Fix potential overflow in
 user_pcid_flush_mask
From: Rik van Riel <riel@surriel.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, bp@alien8.de, x86@kernel.org, yu-cheng.yu@intel.com,
 Rik van Riel <riel@meta.com>, stable@kernel.org
Date: Tue, 03 Jun 2025 17:20:56 -0400
In-Reply-To: <83a671ed-4862-4a0f-b91d-d4598b4a82d7@intel.com>
References: <20250602133402.3385163-1-riel@surriel.com>
	 <20250602133402.3385163-2-riel@surriel.com>
	 <83a671ed-4862-4a0f-b91d-d4598b4a82d7@intel.com>
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

On Mon, 2025-06-02 at 09:55 -0700, Dave Hansen wrote:
> On 6/2/25 06:30, Rik van Riel wrote:
> >=20
> > @@ -149,6 +166,15 @@ struct tlb_state {
> > =C2=A0	 * context 0.
> > =C2=A0	 */
> > =C2=A0	struct tlb_context ctxs[TLB_NR_DYN_ASIDS];
> > +
> > +#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
> > +	/*
> > +	 * Mask that contains TLB_NR_DYN_ASIDS+1 bits to indicate
> > +	 * the corresponding user PCID needs a flush next time we
> > +	 * switch to it; see SWITCH_TO_USER_CR3.
> > +	 */
> > +	unsigned long user_pcid_flush_mask[CR3_AVAIL_PCID_LONGS];
> > +#endif
> > =C2=A0};
> > =C2=A0DECLARE_PER_CPU_ALIGNED(struct tlb_state, cpu_tlbstate);
>=20
> This adds an #ifdef. I guess it makes sense to do it for the now
> larger
> user_pcid_flush_mask[] while it didn't for a single long. But that's
> another logically separate bit that adds complexity to reading this
> whole mess.
>=20
> Honestly, I'd just leave this out for the bug fix. If someone really
> cares, we can come back and fix it up in mainline.

I added the #ifdef at Ingo's request.

I am happy to do the code in any way you two can
agree on, but we should probably avoid the back
and forth over many versions thing :)

>=20
> > diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-
> > offsets.c
> > index 6259b474073b..8c41a2e5a53e 100644
> > --- a/arch/x86/kernel/asm-offsets.c
> > +++ b/arch/x86/kernel/asm-offsets.c
> > @@ -103,8 +103,10 @@ static void __used common(void)
> > =C2=A0	BLANK();
> > =C2=A0	DEFINE(PTREGS_SIZE, sizeof(struct pt_regs));
> > =C2=A0
> > +#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
> > =C2=A0	/* TLB state for the entry code */
> > =C2=A0	OFFSET(TLB_STATE_user_pcid_flush_mask, tlb_state,
> > user_pcid_flush_mask);
> > +#endif
>=20
> Because it necessitates this hunk too...

I agree this isn't the prettiest, but then again
asm-offsets.c isn't code people will be reading
a lot?


--=20
All Rights Reversed.
