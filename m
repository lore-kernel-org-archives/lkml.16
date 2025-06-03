Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A213D531
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981344; cv=none; b=LR7SLIBwpiUo1cxAETC39FoScsYOwBPd0MR07xM9d+XXigOrL4yL5z+pyfw8w/u3SzthctpP22/rh/9WiB6gjQ8ed28cQZvnTNq+RMqOvQaaAqb88/AK9RSahxYOxNJATzVIxYVpJEFUxSfaHcK2Y1THeErub9t8Ww4ULta7Nrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981344; c=relaxed/simple;
	bh=muK6/P0WSTI5jidE92wO1tQc0TXSjB7N4U1U9esLr5o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ROUDy4WND7nuvndK17p1jE+B41T39Emr5YAb8EKPZnF0KlDFJS4hiXy98TinvF4O5TVXAnGRpQ9656QqzjpP9ZWP6HX0ZZDeCNoCNW9nwHGAX7mhKGXDfo0xiZf7b9OcxGk8r14i/UnqCd4VsgZ6U8M1c8H/x5KNHKqqBoyyD+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=ZcXjG0KD; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="ZcXjG0KD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=V0i6e9LPw7iBH4jD0X5pPM2azoxakouDkAG07q5MY6w=; b=ZcXjG0KDYbuAJo6rln+EtHv/FY
	qqT+SZMJsAXXuh27BBL8lJW3aywO+1efqjvO6pxPI2ggVDKWZZ3xi08IE98lCRYVkjhtDkRIWUKy9
	7Hk55WEfLI7gU8XaQP+oXtzZRC7tAlXWLdQJ3kC2kwgCdwtbIlI306/82tkkAAY1vB1uIikvP+Yqo
	I/Szw8JvTHH8jIVTKn87EOm09N4iYZJ7kDiG32PZ0jDPEvwCxJT5VRXf6w6LuwRavM0LwgrgeizXA
	xQB5ip56VpZGUMgwXsB/KgzoEoMlTNNq4EWhMUtxb91xJZz3hRob8gFwaoJTCOttzQsk+3Y3Yy0D8
	YmiJ7AVg==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uMXw5-000000001lz-2yLc;
	Tue, 03 Jun 2025 16:08:37 -0400
Message-ID: <513b0698bab160228c642598ba6cc7abdad1b694.camel@surriel.com>
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
From: Rik van Riel <riel@surriel.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	nadav.amit@gmail.com, Yu-cheng Yu <yu-cheng.yu@intel.com>
Date: Tue, 03 Jun 2025 16:08:37 -0400
In-Reply-To: <2385d4ed-48d5-4d50-ae95-dbeb23432b71@intel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
	 <20250520010350.1740223-8-riel@surriel.com>
	 <2385d4ed-48d5-4d50-ae95-dbeb23432b71@intel.com>
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

On Wed, 2025-05-21 at 09:38 -0700, Dave Hansen wrote:
>=20
> > +static void wait_for_done(unsigned long idx, int target_cpu)
> > +{
> > +	u8 status;
> > +	u8 *rar_actions =3D per_cpu(rar_action, target_cpu);
> > +
> > +	status =3D READ_ONCE(rar_actions[idx]);
> > +
> > +	while ((status !=3D RAR_ACTION_OK) && (status !=3D
> > RAR_ACTION_FAIL)) {
>=20
> Should this be:
>=20
> 	while (status =3D=3D RAR_ACTION_START) {
> 	...
>=20
> ? That would more clearly link it to set_action_entry() and would
> also
> be shorter.
>=20
That is a very good question. The old RAR code
suggests there might be some intermediate state
when the target CPU works on processing the
RAR entry, but the current documentation only
shows RAR_SUCCESS, RAR_PENDING, and RAR_FAILURE
as possible values.

Lets try with status =3D=3D RAR_ACTION_PENDING.

> >=20
> > +void rar_cpu_init(void)
> > +{
> > +	u64 r;
> > +	u8 *bitmap;
> > +	int this_cpu =3D smp_processor_id();
> > +
> > +	cpumask_clear(&per_cpu(rar_cpu_mask, this_cpu));
> > +
> > +	rdmsrl(MSR_IA32_RAR_INFO, r);
> > +	pr_info_once("RAR: support %lld payloads\n", r >> 32);
>=20
> Doesn't this need to get coordinated or checked against
> RAR_MAX_PAYLOADS?

I just added that in, and also applied all the cleanups
from your email.

>=20
> > +	// reserved bits!!! r |=3D (RAR_VECTOR & 0xff);
>=20
> Is this just some cruft from testing?
>=20
I'm kind of guessing the old code might have used this
value to specify which IRQ vector to use for RAR, but
modern microcode hardcodes the RAR_VECTOR value.

> > +	wrmsrl(MSR_IA32_RAR_CTRL, r);
> > +}
> > +
> > +/*
> > + * This is a modified version of smp_call_function_many() of
> > kernel/smp.c,
> > + * without a function pointer, because the RAR handler is the
> > ucode.
> > + */
>=20
> It doesn't look _that_ much like smp_call_function_many(). I don't
> see
> much that can be consolidated.

Agreed. It looks even less like it after some more
simplifications.

>=20
> > +	/* No online cpus?=C2=A0 We're done. */
> > +	if (cpu >=3D nr_cpu_ids)
> > +		return;
>=20
> This little idiom _is_ in smp_call_function_many_cond(). I wonder if
> it
> can be refactored out.

Removing the arch_send_rar_single_ipi fast path
gets rid of this code completely.

Once we cpumask_and with the cpu_online_mask,
the cpumask_weight should end up as 0 if no
online CPUs are in the mask.

Thank you for all the cleanup suggestions.
I've tried to address them all for v3.


--=20
All Rights Reversed.
