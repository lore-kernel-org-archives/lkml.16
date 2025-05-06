Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE92853E2
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547215; cv=none; b=YgJPt9ooM9qCt2VGm+Fsn9kSNdoozQCFMJ/7QYJ5K4W7xQ4EXW2ItI+1uJV5x5q1s/Goib560E1wHumN+uXBSk69MA/6VlAtF9Tf30fZNDc++pCk1Tvm4thgPWObrZhn9COEpkF46DbAJ98YLQsX074niyb2/FlZqrT0Iiuu44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547215; c=relaxed/simple;
	bh=INfxscuPtoUCTKcRpuCQfQ3DIdVXITaXhwrWbdfcPiE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CL1R2mRnULYxHb9pa/5IoNtSbp8T5k6d14Poe7ST/a0D0yuIrXBMqGvDvExTuL7FnRIJ6184j1n0bypv+/rQC8LgDpQFzS/EII76jWdC7mrKxslz9ZTHbZUG7z3hBqk/K18h7Z+wMvqQtUYIgeZuEOXNPxhwAbEESqnhKE2QaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uCKiC-000000007cB-2gam;
	Tue, 06 May 2025 12:00:04 -0400
Message-ID: <29b154c679adeab912f8f5770344126264a698b9.camel@surriel.com>
Subject: Re: [RFC PATCH 7/9] x86/mm: Introduce Remote Action Request
From: Rik van Riel <riel@surriel.com>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open
 list:MEMORY MANAGEMENT"	 <linux-mm@kvack.org>, the arch/x86 maintainers
 <x86@kernel.org>, 	kernel-team@meta.com, Dave Hansen
 <dave.hansen@linux.intel.com>, luto@kernel.org, 	peterz@infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar	 <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"	 <hpa@zytor.com>, Yu-cheng
 Yu <yu-cheng.yu@intel.com>
Date: Tue, 06 May 2025 12:00:04 -0400
In-Reply-To: <B4BBD0D6-8EF4-41F3-9D00-D448658F2C4C@gmail.com>
References: <20250506003811.92405-1-riel@surriel.com>
	 <20250506003811.92405-8-riel@surriel.com>
	 <03E5F4D7-3E3F-4809-87FE-6BD0B792E90F@gmail.com>
	 <09b6eb12ede47b2e2be69bdd68a8732104b26eb0.camel@surriel.com>
	 <B4BBD0D6-8EF4-41F3-9D00-D448658F2C4C@gmail.com>
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

On Tue, 2025-05-06 at 18:50 +0300, Nadav Amit wrote:
>=20
>=20
> > On 6 May 2025, at 18:16, Rik van Riel <riel@surriel.com> wrote:
> >=20
> > It gets better. Page 8 of the RAR whitepaper tells
> > us that we can simply use RAR to have a CPU send
> > itself TLB flush instructions, and the microcode
> > will do the flush at the same time the other CPUs
> > handle theirs.
> >=20
> > "At this point, the ILP may invalidate its own TLB by=20
> > signaling RAR to itself in order to invoke the RAR handler
> > locally as well"
> >=20
> > I tried this, but things blew up very early in
> > boot, presumably due to the CPU trying to send
> > itself a RAR before it was fully configured to
> > handle them.
> >=20
> > The code may need a better decision point than
> > cpu_feature_enabled(X86_FEATURE_RAR) to decide
> > whether or not to use RAR.
> >=20
> > Probably something that indicates RAR is actually
> > ready to use on all CPUs.
> >=20
>=20
> Once you get something working (perhaps with a branch for
> now) you can take the static-key/static-call path, presumably.
> I would first try to get something working properly.
>=20
The static-key code is implemented with alternatives,
which call flush_tlb_mm_range.

I've not spent the time digging into whether that
creates any chicken-egg scenarios yet :)

> > I think we have 3 cases here:
> >=20
> > 1) Only the local TLB needs to be flushed.
> > =C2=A0 In this case we can INVPCID locally, and skip any
> > =C2=A0 potential contention on the RAR payload table.
>=20
> More like INVLPG (and INVPCID to the user PTI). AFAIK, Andy said
> INVLPG performs better than INVPCID for a single entry. But yes,
> this is a simple and hot scenario that should have a separate
> code-path.

I think this can probably be handled in flush_tlb_mm_range(),
so the RAR code is only called for cases (2) and (3) to
begin with.

>=20
> >=20
> > 2) Only one remote CPU needs to be flushed (no local).
> > =C2=A0 This can use the arch_rar_send_single_ipi() thing.
> >=20
> > 3) Multiple CPUs need to be flushed. This could include
> > =C2=A0 the local CPU, or be only multiple remote CPUs.
> > =C2=A0 For this case we could just use arch_send_rar_ipi_mask(),
> > =C2=A0 including sending a RAR request to the local CPU, which
> > =C2=A0 should handle it concurrently with the other CPUs.
> >=20
> > Does that seem like a reasonable way to handle things?
>=20
> It it. It is just that code-wise, I think the 2nd and 3rd cases
> are similar, and it can be better to distinguish the differences
> between them without creating two completely separate code-paths.
> This makes maintenance and reasoning more simple, I think.
>=20
> Consider having a look at smp_call_function_many_cond(). I think
> it handles the 2nd and 3rd cases nicely in the manner I just
> described. Admittedly, I am a bit biased=E2=80=A6

I need to use smp_call_function_many_cond() anyway,
to prevent sending RARs to CPUs that are in lazy
TLB mode (and possibly in a power saving idle state).

IPI TLB flushing and RAR can probably both use the
same should_flush_tlb() helper function.

--=20
All Rights Reversed.
