Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6932283137
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544677; cv=none; b=Tb9J6LT+C/+L0bf1C8QRb3oKaThZ/BVvvPxmh/ieuQvjFOwGbS2C7ZYuC8gzhA+IZtFOFdoyP8MHDk45PrRm1y2DKH0waUXnq5PcU+IQbn2+li0lBuhnyzE9UQcoCcPu8UqrgCSZoanj4FVnQ6zvTS55UzDDZ1bsOvP81yDPIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544677; c=relaxed/simple;
	bh=TRLHS5DHdkXVLGYsZY/+Ck3dcrPceACBq41I7wF89gE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eAuTIIWrJYoFlKBGhUwLu21rk7f0bMKbJqPCwg4YGmdsmdSYzB5/6h2XPkQrxvxwLa85t/k88jsEpAVa1RZv2Alxnpa2XAFLjbp5FuqNGdsRXuJJSVOMDgkOyHFk1l7sqbK/T3Iwk+TNkh7EMEG/3K6JSW2h4yfPnDfxPZhP9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uCK1p-000000003cL-1EgT;
	Tue, 06 May 2025 11:16:17 -0400
Message-ID: <09b6eb12ede47b2e2be69bdd68a8732104b26eb0.camel@surriel.com>
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
Date: Tue, 06 May 2025 11:16:17 -0400
In-Reply-To: <03E5F4D7-3E3F-4809-87FE-6BD0B792E90F@gmail.com>
References: <20250506003811.92405-1-riel@surriel.com>
	 <20250506003811.92405-8-riel@surriel.com>
	 <03E5F4D7-3E3F-4809-87FE-6BD0B792E90F@gmail.com>
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

On Tue, 2025-05-06 at 09:59 +0300, Nadav Amit wrote:
>=20
>=20
> > On 6 May 2025, at 3:37, Rik van Riel <riel@surriel.com> wrote:
> >=20
> > +void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long start, unsigned l=
ong end)
> > +{
> > +	unsigned long pages =3D (end - start + PAGE_SIZE) /
> > PAGE_SIZE;
> > +	int cpu, next_cpu, this_cpu =3D smp_processor_id();
> > +	cpumask_t *dest_mask;
> > +	unsigned long idx;
> > +
> > +	if (pages > RAR_INVLPG_MAX_PAGES || end =3D=3D TLB_FLUSH_ALL)
> > +		pages =3D RAR_INVLPG_MAX_PAGES;
> > +
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
> To ease it for the reader, consider using the updated version from
> smp.c
> (or - even better - refactor into common inline function):
>=20
> 	if (cpu_online(this_cpu) && !oops_in_progress &&
> 	=C2=A0=C2=A0=C2=A0 !early_boot_irqs_disabled)
> 		lockdep_assert_irqs_enabled();

Nice cleanup. I will change this. Thank you.

>=20
>=20
> > +
> > +	/* Try to fastpath.=C2=A0 So, what's a CPU they want?=C2=A0 Ignoring
> > this one. */
> > +	cpu =3D cpumask_first_and(mask, cpu_online_mask);
> > +	if (cpu =3D=3D this_cpu)
> > +		cpu =3D cpumask_next_and(cpu, mask,
> > cpu_online_mask);
> > +
> > +	/* No online cpus?=C2=A0 We're done. */
> > +	if (cpu >=3D nr_cpu_ids)
> > +		return;
> > +
> > +	/* Do we have another CPU which isn't us? */
> > +	next_cpu =3D cpumask_next_and(cpu, mask, cpu_online_mask);
> > +	if (next_cpu =3D=3D this_cpu)
> > +		next_cpu =3D cpumask_next_and(next_cpu, mask,
> > cpu_online_mask);
> > +
> > +	/* Fastpath: do that cpu by itself. */
>=20
> If you follow my comment (suggestion) about the concurrent flushes,
> then=20
> this part should be moved to be in the same was as done in the
> updated
> smp_call_function_many_cond().
>=20
> IOW, the main difference between this path and the =E2=80=9Cslow path=E2=
=80=9D is=20
> arch_send_rar_ipi_mask() vs arch_send_rar_single_ipi() (and maybe
> =E2=80=9Cand=E2=80=9D with cpu_online_mask).

It gets better. Page 8 of the RAR whitepaper tells
us that we can simply use RAR to have a CPU send
itself TLB flush instructions, and the microcode
will do the flush at the same time the other CPUs
handle theirs.

"At this point, the ILP may invalidate its own TLB by=C2=A0
 signaling RAR to itself in order to invoke the RAR handler
 locally as well"

I tried this, but things blew up very early in
boot, presumably due to the CPU trying to send
itself a RAR before it was fully configured to
handle them.

The code may need a better decision point than
cpu_feature_enabled(X86_FEATURE_RAR) to decide
whether or not to use RAR.

Probably something that indicates RAR is actually
ready to use on all CPUs.

>=20
> Since 2019 we have move into =E2=80=9Cmulti=E2=80=9D TLB flush instead of=
 =E2=80=9Cmany=E2=80=9D.
>=20
> This means that try to take advantage of the time between sending the
> IPI
> and the indication it was completed to do the local TLB flush.=20

I think we have 3 cases here:

1) Only the local TLB needs to be flushed.
   In this case we can INVPCID locally, and skip any
   potential contention on the RAR payload table.

2) Only one remote CPU needs to be flushed (no local).
   This can use the arch_rar_send_single_ipi() thing.

3) Multiple CPUs need to be flushed. This could include
   the local CPU, or be only multiple remote CPUs.
   For this case we could just use arch_send_rar_ipi_mask(),
   including sending a RAR request to the local CPU, which
   should handle it concurrently with the other CPUs.

Does that seem like a reasonable way to handle things?

> > +
> > +	for_each_cpu(cpu, dest_mask)
> > +		wait_for_done(idx, cpu);
> > +
> > +	free_payload(idx);
> > +	unlock(this_cpu_ptr(&rar_lock));
>=20
> We don=E2=80=99t do lock/unlock on kernel/smp.c . So I would expect at le=
ast
> a
> comment as for why it is required.
>=20
That is a very good question!

It is locking a per-cpu lock, which no other code
path takes.

It looks like it could protect against preemption,
on a kernel with full preemption enabled, but that
should not be needed since the code in arch/x86/mm/tlb.c
disables preemption around every call to the RAR code.

I suspect that lock is no longer needed, but maybe
somebody at Intel has a reason why we still do?

--=20
All Rights Reversed.
