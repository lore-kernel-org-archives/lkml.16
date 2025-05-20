Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1550C2563
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747746052; cv=none; b=oJAW2YJ4+fk6H9KHdzpyS+PqfugQAeIRafXnRbe1KecebcO9dRE/PYXVjb4tF49CDJcaw0sMcoDG5KXAro0YFSdsgKpfWN3Ct1D5Yjjb1dqaYlLcriYedOPWm14YrtabIDlBkFkRTX3SH+7Hw4zY6pNjCOObORJmOQhzaq9FxgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747746052; c=relaxed/simple;
	bh=xg1Y6oA45KrHl9Oogbu+myCMASgiVQYhWFcXBaXSe2U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p12b9G1FD4Gbh0+GQaTSYGJ8hoXAkETFpDhRsOJIyW1FmbN0w6Jpq8KY1AUph5lD9u5abnmap838RhnTCcgelQWqHmOXNBkXMuEpF2pGa/uZHDS/nmQAEOxdl3oIeY8hSk21/d0nlWYQ8Ge1NiGUu2g6qnns5CQnyysGG7XoL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHMa9-00000000119-2u1g;
	Tue, 20 May 2025 09:00:33 -0400
Message-ID: <6a3290319031cd68a383e416f53aa7549bac9407.camel@surriel.com>
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
Date: Tue, 20 May 2025 09:00:33 -0400
In-Reply-To: <4A879001-E213-4239-9D25-CDA8EC3E2CD9@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
	 <20250520010350.1740223-8-riel@surriel.com>
	 <4A879001-E213-4239-9D25-CDA8EC3E2CD9@gmail.com>
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

On Tue, 2025-05-20 at 14:29 +0300, Nadav Amit wrote:
> Not a full review, but..
>=20
> > On 20 May 2025, at 4:02, Rik van Riel <riel@surriel.com> wrote:
> >=20
> > +/*
> > + * This is a modified version of smp_call_function_many() of
> > kernel/smp.c,
>=20
> The updated function names is smp_call_function_many_cond() and it is
> not aligned with smp_call_rar_many. I think the new version is
> (suprisingly)
> better, so it=E2=80=99d be beneficial to bring smp_call_rar_many() to be =
like
> the
> updated one in smp.c.
>=20
Agreed, it will be good to conditionally not send=20
the RAR vector to some CPUs, especially ones that
are in deeper idle states.

That means structuring the code more like
smp_call_function_many_cond()

> > +	/*
> > +	 * Can deadlock when called with interrupts disabled.
> > +	 * We allow cpu's that are not yet online though, as no
> > one else can
> > +	 * send smp call function interrupt to this cpu and as
> > such deadlocks
> > +	 * can't happen.
> > +	 */
> > +	WARN_ON_ONCE(cpu_online(this_cpu) && irqs_disabled()
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 && !oops_in_progress &&
> > !early_boot_irqs_disabled);
>=20
> I thought you agreed to change it to make it use lockdep instead (so
> it will
> be compiled out without LOCKDEP), like done in
> smp_call_function_many_cond()
>=20
I thought I had made that change in my tree.

I guess I lost it in a rebase :(

> > +
> > +	/* Try to fastpath.=C2=A0 So, what's a CPU they want?=C2=A0 Ignoring
> > this one. */
> > +	cpu =3D cpumask_first_and(mask, cpu_online_mask);
> > +	if (cpu =3D=3D this_cpu)
> > +		cpu =3D cpumask_next_and(cpu, mask,
> > cpu_online_mask);
> > +
>=20
> Putting aside the rest of the code, I see you don=E2=80=99t call
> should_flush_tlb().
> I think it is worth mentioning in commit log or comment the rationale
> behind
> it (and maybe benchmarks to justify it).
>=20
>=20
The long term plan here is to simply have the originating
CPU included in the cpumask, and have it send a RAR
request to itself.

That way all the CPUs can invalidate their entries in
parallel, without any extra code.

--=20
All Rights Reversed.
