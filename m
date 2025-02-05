Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CCFB640
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763750; cv=none; b=X1PzQqcF5viZCCzHtCqKVY2S2wIq5unaWKxwXO5uUR4n3QvVE5AYTtir/LJtRabD+QPyihn3cJ5CEEydBxikyC6eaSsiJzPRipwq0rolwdFlw4m2spivoJF5fxvEPn+acHq9qXoDVPKwfpdzT0/q9vZggnj2WRRzMLs3hEUlFf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763750; c=relaxed/simple;
	bh=+x5VY334RCDtpvnDk3vEdWlK+bpOTjcAaGFVjINDmmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ssd315LjDxQRCKSmzU3hZCIFlYaWAcx7MzDvj4586lMXx6GzrvZHg1n00TeqjuTq0CDUK/0wTHhsdIdS9QHmsetpr/Gtjgp28SEjzrELiJPkW3CbGYnRefCgFAbtS29O1hMWMKii9wPlZAysfD5qH+tYyg5NurtpuRkLDsWHdYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tffpn-000000001m1-0KaS;
	Wed, 05 Feb 2025 08:52:55 -0500
Message-ID: <e238facf89e853445c11a43809ed5976046ce8f9.camel@surriel.com>
Subject: Re: [PATCH v8 03/12] x86/mm: consolidate full flush threshold
 decision
From: Rik van Riel <riel@surriel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
 nadav.amit@gmail.com, 	thomas.lendacky@amd.com, kernel-team@meta.com,
 linux-mm@kvack.org, 	akpm@linux-foundation.org, jannh@google.com,
 mhklinux@outlook.com, 	andrew.cooper3@citrix.com, Dave Hansen
 <dave.hansen@intel.com>
Date: Wed, 05 Feb 2025 08:52:55 -0500
In-Reply-To: <20250205122007.GH14028@noisy.programming.kicks-ass.net>
References: <20250205014033.3626204-1-riel@surriel.com>
	 <20250205014033.3626204-4-riel@surriel.com>
	 <20250205122007.GH14028@noisy.programming.kicks-ass.net>
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
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: riel@surriel.com

On Wed, 2025-02-05 at 13:20 +0100, Peter Zijlstra wrote:
> On Tue, Feb 04, 2025 at 08:39:52PM -0500, Rik van Riel wrote:
>=20
> > diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> > index 6cf881a942bb..02e1f5c5bca3 100644
> > --- a/arch/x86/mm/tlb.c
> > +++ b/arch/x86/mm/tlb.c
> > @@ -1000,8 +1000,13 @@ static struct flush_tlb_info
> > *get_flush_tlb_info(struct mm_struct *mm,
> > =C2=A0	BUG_ON(this_cpu_inc_return(flush_tlb_info_idx) !=3D 1);
> > =C2=A0#endif
> > =C2=A0
> > -	info->start		=3D start;
> > -	info->end		=3D end;
> > +	/*
> > +	 * Round the start and end addresses to the page size
> > specified
> > +	 * by the stride shift. This ensures partial pages at the
> > end of
> > +	 * a range get fully invalidated.
> > +	 */
> > +	info->start		=3D round_down(start, 1 <<
> > stride_shift);
> > +	info->end		=3D round_up(end, 1 <<
> > stride_shift);
> > =C2=A0	info->mm		=3D mm;
> > =C2=A0	info->stride_shift	=3D stride_shift;
> > =C2=A0	info->freed_tables	=3D freed_tables;
>=20
> Rather than doing this; should we not fix whatever dodgy users are
> feeding us non-page-aligned addresses for invalidation?
>=20

The best way to do that would probably be by adding
a WARN_ON_ONCE here if the value of either start or
end changed, not by merging code that will trigger
kernel crashes - even if the bug is elsewhere.

I would be happy to add a WARN_ON_ONCE either in a
next version, or in a follow-up patch, whichever is
more convenient for you.

--=20
All Rights Reversed.
