Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0A2836B9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773266; cv=none; b=G5fvtVwMehgvO0dxOZe2la+XfEPSgplWxjLUcH0zoZekK4P8o4HC5CrnjzseskOnnXCmeMLl9w7aRp+AG0uPP4vizqfsNK0Ubzjmj4XCTF+YCl4TvBNBUTwZ/4tmF2CqYEsPU8V1+0id46gqOx7rHiMocCVANxFivugiy6p4+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773266; c=relaxed/simple;
	bh=ZAKqfEk5wNkSxchE2mlMppcXllbhtMFBGsoAzbBLQxA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jqmV85kikY+owCUPJd03sQ5si7qusPNkhqYaRc5yQmG91Bu4pqSSEXRPYPYrbSYEhKXWxKTP6iZDVO3UVBsp92SELIlhyamrJpLD7hpjGOs/Vc5tN8XoCJr9FKVRo8nbO3i3aaRf4EaxBwhd/jop30W1MwoTifAxHM/8gI9TCvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHTcK-000000007yU-3VQB;
	Tue, 20 May 2025 16:31:16 -0400
Message-ID: <1debe11314379cd767c5f75131e81eed70670b91.camel@surriel.com>
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
From: Rik van Riel <riel@surriel.com>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open
 list:MEMORY MANAGEMENT"	 <linux-mm@kvack.org>, the arch/x86 maintainers
 <x86@kernel.org>, 	kernel-team@meta.com, Dave Hansen
 <dave.hansen@linux.intel.com>, luto@kernel.org, 	peterz@infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar	 <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"	 <hpa@zytor.com>, Yu-cheng
 Yu <yu-cheng.yu@intel.com>
Date: Tue, 20 May 2025 16:31:16 -0400
In-Reply-To: <4009A0C6-CE5C-4197-9F48-3805059C214E@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
	 <20250520010350.1740223-8-riel@surriel.com>
	 <4A879001-E213-4239-9D25-CDA8EC3E2CD9@gmail.com>
	 <6a3290319031cd68a383e416f53aa7549bac9407.camel@surriel.com>
	 <4009A0C6-CE5C-4197-9F48-3805059C214E@gmail.com>
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

On Tue, 2025-05-20 at 23:26 +0300, Nadav Amit wrote:
>=20
> > On 20 May 2025, at 16:00, Rik van Riel <riel@surriel.com> wrote:
> >=20
> > > Putting aside the rest of the code, I see you don=E2=80=99t call
> > > should_flush_tlb().
> > > I think it is worth mentioning in commit log or comment the
> > > rationale
> > > behind
> > > it (and maybe benchmarks to justify it).
> > >=20
> > >=20
> > The long term plan here is to simply have the originating
> > CPU included in the cpumask, and have it send a RAR
> > request to itself.
>=20
> That=E2=80=99s unrelated. I was referring to considering supporting
> some sort of lazy TLB to eliminate sending RAR to cores that
> do not care about it. Is there a cost of RAR to more cores than
> needed? My guess is that there is one, and maybe in such cases
> you would want actual IPI and special handling.

For RAR, I suspect the big cost is waking up
CPUs in idle states, and waiting for them to
wake up.

One possibility may be to change leave_mm()
to have an argument to set some flag that
the RAR code can read to see whether or
not to send a RAR interrupt to that CPU,
even if it is in the cpumask.

I don't think we can use the exact same
should_flush_tlb() logic, because the
tlb_gen is not updated by a RAR flush,
and the should_flush_tlb() logic is
somewhat intertwined with the tlb_gen
logic.

--=20
All Rights Reversed.
