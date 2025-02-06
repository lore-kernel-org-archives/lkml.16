Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F1C23644D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853322; cv=none; b=cHXyh+4YKfsChSpUhGo/zfH9AcRe/frQJ+Qrvy4UFzhoL6XSY3RdGeee2InQn/eABKOZsh/Q2G42UNf906KjIzvmDGK/DrMEoUKsnpHs7KVpOX9Ml+K3EdpxAwxUKhhRCcwU+f4gQGeC465oC8MBCQX2dKylLgyDpICPd9kCZy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853322; c=relaxed/simple;
	bh=xrH0paTmsFd5HwpEjBzpYmO4A56hHyosbYf/jpVupXs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gt6526bLQMWEHXPNNvt3k0TTnvRrfJvrlj4xGBlzTJXS3qS0Vyq6uMki4o1LkEIW0XAYlxe7oI1d/gWu7kpladv2C3darRlsoFpyxD3ewTrjaLLo4LBT5+pgGbW5pAPtYl+EV+J2HSC9D0iyLJbmF7fHvZKrd6uQDLX+EvCd3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tg3B3-000000003yX-18DO;
	Thu, 06 Feb 2025 09:48:25 -0500
Message-ID: <ad7bc8809b8501e157a6e6da3a5b5863ca56c995.camel@surriel.com>
Subject: Re: [PATCH v9 00/12] AMD broadcast TLB invalidation
From: Rik van Riel <riel@surriel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	zhengqi.arch@bytedance.com, nadav.amit@gmail.com, thomas.lendacky@amd.com, 
	kernel-team@meta.com, linux-mm@kvack.org, akpm@linux-foundation.org, 
	jannh@google.com, mhklinux@outlook.com, andrew.cooper3@citrix.com
Date: Thu, 06 Feb 2025 09:48:25 -0500
In-Reply-To: <20250206142308.GR7145@noisy.programming.kicks-ass.net>
References: <20250206044346.3810242-1-riel@surriel.com>
	 <12602226.O9o76ZdvQC@natalenko.name>
	 <8111558b52cec1152746b05a9c1d657d18df0fe2.camel@surriel.com>
	 <20250206142308.GR7145@noisy.programming.kicks-ass.net>
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

On Thu, 2025-02-06 at 15:23 +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 09:16:35AM -0500, Rik van Riel wrote:
>=20
> > This can result in flush_tlb_mm_range being called
> > with a stride_shift for 2MB pages, but a range ending
> > on a 4kB aligned (not 2MB aligned) boundary.
> >=20
> > Peter, how should we solve this one?
>=20
> I don't think that's wrong per-se, since all we really need is for
> end
> to be past the end, one byte, one page, or one stride don't matter
> much.
>=20
> Anyway, I'm in desperate need of a break, so I'm not quite sure what
> the
> best way forward is.
>=20
Given that the tlb_flush() code is used only for
page table freeing, we can just round up the
end address to the nearest stride boundary
there, with a comment explaining why?

Alternatively, we could just change the page
sizes used in pmd_free_tlb, pud_free_tlb,
and p4d_free_tlb, given that the functions
called now have parameters they didn't seem
to have back in 2014, when the linked email
in the comment was written?

Either way, no big hurry. The rounding up
is already being done in get_flush_tlb_info,
so all we have is a noisy WARN_ONCE :)

--=20
All Rights Reversed.
