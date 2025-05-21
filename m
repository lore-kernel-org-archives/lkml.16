Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3726AE4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835909; cv=none; b=W6AIVmr09TrshStiBqFIUGpQwmW0sO5V9+5MP6NvEriOVunEpFGkKxxg3xFrRMirkV70/q6XKdFJEiup6yHQj6zDEqFhcLNOQSQlm43aBiLtxbVXmdfNIQvLGctEqIpuS2KT8toyhL6uyR1N5sUl+9Vl9ZZLfEllbjhEfx6lLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835909; c=relaxed/simple;
	bh=uW9wgugdRaKgW7y55mEAnWqEGwNvDrKOKUgyTrcxlN0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LzL18IOCoYXK8jqaQbwrytwYaZZWBpUzxnBe4cWTyDPTeo0nVc9pa2HE2gvvP1iXPitIC+r7SiW6e9e7BbSeE93+4BujmoKQspVmR/WcMQXMKacdtL+ObmdklStSg8drjKOaDhZQvZ5S9zljNjf2eDPW/CPgMbCPZFvmNOT1GQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHjxA-000000005r3-0HFy;
	Wed, 21 May 2025 09:57:52 -0400
Message-ID: <cb657cabbc3c87e0a821c7c3fcc16e62b7d854f4.camel@surriel.com>
Subject: Re: [RFC v2 4/9] x86/mm: Introduce X86_FEATURE_RAR
From: Rik van Riel <riel@surriel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, 
	nadav.amit@gmail.com, Rik van Riel <riel@fb.com>, Yu-cheng Yu
	 <yu-cheng.yu@intel.com>
Date: Wed, 21 May 2025 09:57:52 -0400
In-Reply-To: <20250521115343.GCaC2-x8LsmMApUkjQ@fat_crate.local>
References: <20250520010350.1740223-1-riel@surriel.com>
	 <20250520010350.1740223-5-riel@surriel.com>
	 <20250521115343.GCaC2-x8LsmMApUkjQ@fat_crate.local>
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
Sender: riel@surriel.com

On Wed, 2025-05-21 at 13:53 +0200, Borislav Petkov wrote:
> On Mon, May 19, 2025 at 09:02:29PM -0400, Rik van Riel wrote:
> > From: Rik van Riel <riel@fb.com>
> >=20
> > Introduce X86_FEATURE_RAR and enumeration of the feature.
> >=20
> > [riel: moved initialization to intel.c and disabling to
> > Kconfig.cpufeatures]
> >=20
> > Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
>=20
> I'm guessing Yu-cheng is the original author - that's expressed
> differently.

I will fix that up!

>=20
> > @@ -1771,6 +1783,7 @@ static void __init early_identify_cpu(struct
> > cpuinfo_x86 *c)
> > =C2=A0		setup_clear_cpu_cap(X86_FEATURE_LA57);
> > =C2=A0
> > =C2=A0	detect_nopl();
> > +	detect_rar(c);
> > =C2=A0}
>=20
> Move all this gunk into early_init_intel().
>=20
I had the same thought, and tried that already.

It didn't work.

--=20
All Rights Reversed.
