Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4B3214
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245817; cv=none; b=DIUvXU7oilTcTVHhVWfHLuigbdPTukyKzM3a+yCvCotQotgknCh67cCtaZeVKTyg4j/02hTB37R2VBw96Spu0OGyQ5D2i1x8wQuCvCnKdQknICQxzLQwgBRosyM+mIHtPz8KKYrFW9maBg1nrr/UqCSs8TBLtJLAE/oniXM0XTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245817; c=relaxed/simple;
	bh=P8kYaq4v52Rvu8UsFnpKQqjfLGeDgXZIwdUK9B6Mz1A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GzthZU9Q8vzWE0pVvQ7kEDY/UcyV4fFrQ+Ue06Fmv/Bgmyh1arUJ/3345/fTnI6lWymJEPcYYZjloCbbPXmLy+YigjZnk0O0k8ED9k6lAazH0dSROZlBHH75h8sN9nN9gVicTW67ipqKKBuHHjOdwD2+YZEPNeA0S6nqiqEwLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1thhDA-000000002VE-1hXi;
	Mon, 10 Feb 2025 22:45:24 -0500
Message-ID: <2d20c333400b890f4983cf799576435abf1d8824.camel@surriel.com>
Subject: Re: [PATCH v9 10/12] x86/mm: do targeted broadcast flushing from
 tlbbatch code
From: Rik van Riel <riel@surriel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com,
 zhengqi.arch@bytedance.com, 	nadav.amit@gmail.com, thomas.lendacky@amd.com,
 kernel-team@meta.com, 	linux-mm@kvack.org, akpm@linux-foundation.org,
 jannh@google.com, 	mhklinux@outlook.com, andrew.cooper3@citrix.com, Manali
 Shukla	 <Manali.Shukla@amd.com>
Date: Mon, 10 Feb 2025 22:45:24 -0500
In-Reply-To: <CA+i-1C2zuctxx6oPVVu0zBJ=Q=Hs73mgrWs5jsp8obARNcUS9g@mail.gmail.com>
References: <20250206044346.3810242-1-riel@surriel.com>
	 <20250206044346.3810242-11-riel@surriel.com>
	 <CA+i-1C2zuctxx6oPVVu0zBJ=Q=Hs73mgrWs5jsp8obARNcUS9g@mail.gmail.com>
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

On Mon, 2025-02-10 at 16:27 +0100, Brendan Jackman wrote:
> On Thu, 6 Feb 2025 at 05:46, Rik van Riel <riel@surriel.com> wrote:
> > =C2=A0/* Wait for INVLPGB originated by this CPU to complete. */
> > -static inline void tlbsync(void)
> > +static inline void __tlbsync(void)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cant_migrate();
>=20
> Why does this have to go away?

I'm not sure the current task in sched_init() has
all the correct bits set to prevent the warning
from firing, but on the flip side it won't have
called INVLPGB yet at that point, so the call to
enter_lazy_tlb() won't actually end up here.

I'll put it back.

>=20
> > diff --git a/arch/x86/include/asm/tlbflush.h
> > b/arch/x86/include/asm/tlbflush.h
> > index 234277a5ef89..bf167e215e8e 100644
> > --- a/arch/x86/include/asm/tlbflush.h
> > +++ b/arch/x86/include/asm/tlbflush.h
> > @@ -106,6 +106,7 @@ struct tlb_state {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * need to be invalidat=
ed.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool invalidate_other;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool need_tlbsync;
>=20
> The ifdeffery is missing here.

Added.

>=20
> > @@ -794,6 +825,8 @@ void switch_mm_irqs_off(struct mm_struct
> > *unused, struct mm_struct *next,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ENABLED(CONFIG_PROVE_=
LOCKING))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(!irqs_disabled());
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlbsync();
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Verify that CR3 is w=
hat we think it is.=C2=A0 This will catch
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * hypothetical buggy c=
ode that directly switches to
> > swapper_pg_dir
> > @@ -973,6 +1006,8 @@ void switch_mm_irqs_off(struct mm_struct
> > *unused, struct mm_struct *next,
> > =C2=A0 */
> > =C2=A0void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk=
)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlbsync();
> > +
>=20
> I have a feeling I'll look stupid for asking this, but why do we need
> this and the one in switch_mm_irqs_off()?

This is an architectural thing: TLBSYNC waits for
the INVLPGB flushes to finish that were issued
from the same CPU.

That means if we have pending flushes (from the
pageout code), we need to wait for them at context
switch time, before the task could potentially be
migrated to another CPU.

>=20
> > @@ -1661,12 +1694,53 @@ void arch_tlbbatch_flush(struct
> > arch_tlbflush_unmap_batch *batch)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 local_irq_enable();
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If we issued (asynchronou=
s) INVLPGB flushes, wait for
> > them here.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The cpumask above contain=
s only CPUs that were running
> > tasks
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * not using broadcast TLB f=
lushing.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpu_feature_enabled(X86_FEATU=
RE_INVLPGB))
>=20
> It feels wrong that we check the cpufeature here but not in e.g.
> enter_lazy_tlb().
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 tlbsync();
> > +
We no longer need to check it here, with the change
to tlbsync. Good catch.

--=20
All Rights Reversed.
