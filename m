Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14B83234
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 00:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168240; cv=none; b=V5BDYlnly1BELUEFn0PsGQmQgYN28o6xGLuZ/CsPPSMZCOZVnSaWGCx28gBNIYeOUCTeodSHw1MuRve7O2RYsGFDIVjmW+gtFNxsHYHpL7hG0mmGT2yYXxBt986qiu5pclh5lF5IXv2I9/BWJeyRiU9AcISW9TQc+J+2YxOWYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168240; c=relaxed/simple;
	bh=Mik/qGA4U9bKOimWFqUcZS5PeUh+9xaP/KyviI4ft/k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XXetKY5ZRKEYcS+KfSQdsmJn+Y+ohQIoaeLEAxtdWE5qmIip+x7MGt4/XYwX5NVZ3MIni0brMATtlVBUXUpTmbmQSDG7wPN39rcHyilNkJy8KaLpRsuwfYX+iA/+lgML3TbXqePZeOYUvgieCaxGnU8kh73q4P32/7gFqjOOQ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=iSiWOrWi; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="iSiWOrWi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Mik/qGA4U9bKOimWFqUcZS5PeUh+9xaP/KyviI4ft/k=; b=iSiWOrWi6euhPnuC7hoak4DyEi
	D7fZ9ejQm2uThnoqAbhIaM+JLO3cE74Dp79rQUBzLihgKndCPJeGNejl4ug0IuEwKkqJ8UnTaHDRw
	5/gD+bhdcTOEJ8rCftrFsOVukjfeKdZ3GgpneadIsdmtmvGZp2eHErWBQy+kOdP1971/Fx/9GELMx
	0TGgnFNH/IxIe9p5W/UpCjR9t0PEuDRijZZNQapAQOuBDkhyYxNneLK1vTdgj7w7pApsoyBlSJfRq
	xI+oZJDVQu4hxU0ug7Xz2qNiOhFZUUd0+P7K/HNT0vCev7JZzcfNDVKF7mwG3HXOgveVkSUgWSYBT
	KXsaEd+g==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNKYb-000000006pS-3eA3;
	Thu, 05 Jun 2025 20:03:37 -0400
Message-ID: <842d430e0df97933914c8f743e7ee226eccb3d3a.camel@surriel.com>
Subject: Re: [RFC PATCH v3 5/7] x86/mm: Introduce Remote Action Request
From: Rik van Riel <riel@surriel.com>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	kernel-team@meta.com, Dave Hansen <dave.hansen@linux.intel.com>,
 luto@kernel.org, 	peterz@infradead.org, Borislav Petkov <bp@alien8.de>, the
 arch/x86 maintainers	 <x86@kernel.org>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner	 <tglx@linutronix.de>, Yu-cheng Yu
 <yu-cheng.yu@intel.com>
Date: Thu, 05 Jun 2025 20:03:37 -0400
In-Reply-To: <51570690-D1B2-48EE-96EE-5C90B93C7067@gmail.com>
References: <20250605163544.3852565-1-riel@surriel.com>
	 <20250605163544.3852565-6-riel@surriel.com>
	 <9290E368-A0E1-4429-B14C-9AEF8DC71672@gmail.com>
	 <2666b165d262a3bad73a3a4d886fa6d16bced03c.camel@surriel.com>
	 <51570690-D1B2-48EE-96EE-5C90B93C7067@gmail.com>
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

On Fri, 2025-06-06 at 01:45 +0300, Nadav Amit wrote:
>=20
> However, I think perhaps the bigger issue is that you want to assume
> all cores have the same RAR settings, and right now it might be a bit
> inconsistent.

The documentation strongly suggests that RAR_INFO.TableMaxIndex
is architecturally determined, and always 64 on Sapphire Rapids.

I'm not sure we want code to handle a case the Intel documentation
seems to suggest cannot exist. Maybe somebody from Intel has
some firmer ideas here?

>=20
> So you may want to do some initial checks on the BSP as for
> whether RAR is supported and what rar_max_payloads is (e.g., in
> bsp_init_intel() ). And then on each AP, in something like=20
> init_intel() you=E2=80=99d call setup_clear_cpu_cap() to disable RAR if a=
ny
> CPU's max_payloads is different than the BSP.

Grabbing the value of rar_max_payloads from early_init_intel()
might make sense, since it is supposed to be a system-wide
value, and not a per CPU thing.

That seems like it would solve data race issues?

>=20
> [ BTW: further regarding patch 4, it seems cleaner to call
> =C2=A0 rar_cpu_init() from Intel specific code like init_intel() ? ]
>=20
Good idea, I'll move the call there.

> Just sharing my thoughts (and further clarifying them),
>=20
I appreciate the comments and suggestions!

Now that the code seems to (finally) work reliably,
I should have a faster turnaround time incorporating
people's suggestions, too.

--=20
All Rights Reversed.
