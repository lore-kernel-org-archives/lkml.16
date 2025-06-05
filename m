Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AA275842
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152448; cv=none; b=CLGW3nel7hxh3lbxL0Q0OB7UBgiwkUkwNSwhP9LorO9x2iU2GGfPpx0iJHXqpU04hz3CHm9zDvcaJo/AFnqySG6ChzpZslU+HQGyIAzwSKmJx74SqYX/7l0jvGE2+Bh1BkIRb01oNRQ7pQyYnuaUdBRueKR8PSG78Wcv5+5gPh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152448; c=relaxed/simple;
	bh=inRgr52GjZfFrKDVU9fieFtTTun76Wq3lzUBEq+MZ0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jEQox1qz5Tz+aAIx6eZ8Krf2Q3VhxBM0BVBJyWwbYSffFNuOuaOlfISSLZj7+y/pyZIjsLSm796DVMVpogPemtxCE/XCL60WqgMTUpDq5gkI6jxBqegKRiB+r6CZcb0jtmCXOLSN8/mpwQgPVW9FFm9Is8/U2NjkbCUeaR18e44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=lUsiyOJ8; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="lUsiyOJ8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lGLDQ1mU4DPm7FkayXjh2cfSy1FXbI8/RPDPA0tLNw4=; b=lUsiyOJ8i33WV1kvz8Q0B3oEIQ
	5NAcIudxH9G0oCbhM40pdUQ41FLfNcqBkPpyAT31Kwbd+czUdS0s8dc72rJeOkEZhM3cIvJFShaWV
	PV92kYPuqx+N2DVlyVuNonBxRp2xDMl5wQUY9t9Bv73zpGwjl5YwNIfy87a8PcxSEsQKHsaH1CND6
	AL5qamRpb04IE3Y7POTjLx1bfSHQfyLcrL4J5VVyCpId/8g6gCELsvjR0/TYl9FujIxdbhtK6Q40K
	4Lql0drJl6BYijikJM3bQ2XOZ/SSwevW7TY8ZFVf5O1gHIRPxxwm4UIXQv70mIIw5QK6gPQBLnTNM
	X9bNQXsg==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNGRx-000000004p5-3fXo;
	Thu, 05 Jun 2025 15:40:29 -0400
Message-ID: <2666b165d262a3bad73a3a4d886fa6d16bced03c.camel@surriel.com>
Subject: Re: [RFC PATCH v3 5/7] x86/mm: Introduce Remote Action Request
From: Rik van Riel <riel@surriel.com>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	kernel-team@meta.com, Dave Hansen <dave.hansen@linux.intel.com>,
 luto@kernel.org, 	peterz@infradead.org, Borislav Petkov <bp@alien8.de>, the
 arch/x86 maintainers	 <x86@kernel.org>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner	 <tglx@linutronix.de>, Yu-cheng Yu
 <yu-cheng.yu@intel.com>
Date: Thu, 05 Jun 2025 15:40:27 -0400
In-Reply-To: <9290E368-A0E1-4429-B14C-9AEF8DC71672@gmail.com>
References: <20250605163544.3852565-1-riel@surriel.com>
	 <20250605163544.3852565-6-riel@surriel.com>
	 <9290E368-A0E1-4429-B14C-9AEF8DC71672@gmail.com>
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

On Thu, 2025-06-05 at 21:54 +0300, Nadav Amit wrote:
> Just few small things that jump out=E2=80=A6
>=20
> > On 5 Jun 2025, at 19:35, Rik van Riel <riel@surriel.com> wrote:
> >=20
> > +void rar_cpu_init(void)
> > +{
> > +	u64 r;
> > +	u8 *bitmap;
> > +	int max_payloads;
> > +	int this_cpu =3D smp_processor_id();
> > +
> > +	cpumask_clear(&per_cpu(rar_cpu_mask, this_cpu));
> > +
> > +	/* The MSR contains N defining the max [0-N] rar payload
> > slots. */
> > +	rdmsrl(MSR_IA32_RAR_INFO, r);
> > +	max_payloads =3D (r >> 32) + 1;
> > +
> > +	/* If this CPU supports less than RAR_MAX_PAYLOADS, lower
> > our limit. */
> > +	if (max_payloads < rar_max_payloads)
> > +		rar_max_payloads =3D max_payloads;
>=20
> Unless I am missing something, this looks very racy.
>=20
All the CPUs in the system should support the same
number rar_max_payloads, since they share the same
rar_action table.

> BTW: should rar_max_payloads be ro_after_init?
>=20
> > +	pr_info_once("RAR: support %d payloads\n", max_payloads);
> > +
> > +	bitmap =3D (u8 *)per_cpu(rar_action, this_cpu);
>=20
> this_cpu_ptr() would be cleaner (here and when using rar_cpu_mask).

A CPU cannot start using the rar_action table until
the wrmsl below.

That should ensure there is no race here.

Thank you for the cleanup ideas. I'll apply those for v4.

> > +	/*
> > +	 * Allow RAR events to be processed while interrupts are
> > disabled on
> > +	 * a target CPU. This prevents "pileups" where many CPUs
> > are waiting
> > +	 * on one CPU that has IRQs blocked for too long, and
> > should reduce
> > +	 * contention on the rar_payload table.
> > +	 */
> > +	r =3D RAR_CTRL_ENABLE | RAR_CTRL_IGNORE_IF;
>=20
> Do we really need r ?

I suppose not. The original code added another
value into r, but that hangs hard with today's
microcode :)

>=20
> > +	wrmsrl(MSR_IA32_RAR_CTRL, r);
> > +}
>=20
>=20

--=20
All Rights Reversed.
