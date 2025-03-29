Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608917548
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743269393; cv=none; b=kEFF4Xw1MaL6c1bp6AcG+c3iGO2FaYfUmtujo0EmxuwvAP7VpC4nMsVtieb+Ei4ftaI9pevOYdQJkPO1OhUc2J4br0O5MADgoS6oi7tMYdflZVRbulz3amZWZWBaBmy7fTo6iO3acoOSpLofL3LNJd0u/URgRWbWJH3CXNhjfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743269393; c=relaxed/simple;
	bh=imUYZ/W/GVleMNjiWv15mGu860oaVQw7PlgELqcSTqw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dfDVq7/3tM8NgS7/06YcJvzuDpazJLc9zptuCkTdFI1XhoaS6GtZxmRsjEl6esysBG8B+y2osTEOZWHb9rDW0vlePr3EyPgBXtxwuuxCEo5ocuzUu5xZVO99J8WnDj3c7y6HLIA3BMDiS2vx8PjS8BXKf5yvOqFEN386TtkmUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tyZzp-000000006vT-45Ph;
	Sat, 29 Mar 2025 13:29:25 -0400
Message-ID: <a84047c77c1a5f16b0d25f0cee6fe86487d14a5b.camel@surriel.com>
Subject: Re: [PATCH 1/3] x86/mm: Correct the actual count of available
 global ASIDs
From: Rik van Riel <riel@surriel.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>,  Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,  Borislav Petkov	
 <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Date: Sat, 29 Mar 2025 13:29:25 -0400
In-Reply-To: <0954cb7ec766d6d1e0b66a93876762b516ae9bae.1743250122.git.houwenlong.hwl@antgroup.com>
References: <cover.1743250122.git.houwenlong.hwl@antgroup.com>
	 <0954cb7ec766d6d1e0b66a93876762b516ae9bae.1743250122.git.houwenlong.hwl@antgroup.com>
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

On Sat, 2025-03-29 at 21:05 +0800, Hou Wenlong wrote:
>=20
> +++ b/arch/x86/mm/tlb.c
> @@ -279,7 +279,7 @@ static DEFINE_RAW_SPINLOCK(global_asid_lock);
> =C2=A0static u16 last_global_asid =3D MAX_ASID_AVAILABLE;
> =C2=A0static DECLARE_BITMAP(global_asid_used, MAX_ASID_AVAILABLE);
> =C2=A0static DECLARE_BITMAP(global_asid_freed, MAX_ASID_AVAILABLE);
> -static int global_asid_available =3D MAX_ASID_AVAILABLE -
> TLB_NR_DYN_ASIDS - 1;
> +static int global_asid_available =3D MAX_ASID_AVAILABLE -
> TLB_NR_DYN_ASIDS;

Unfortunately we are limited by the PCID space.

A process with ASID N will get PCID N+1.

The PCID space has the same size (and maximum value)
as the ASID space.

That means we cannot use the top ASID value.

Alternatively, I suppose we could have ASID and PCID
line up, and always exclude ASID 0 from being used.

That might (maybe) be prettier code, but it isn't what
we have today.


--=20
All Rights Reversed.
