Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C526BD9E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739243431; cv=none; b=iMHHVGVbyg2OwjLa7ewef9jkecxfIKUwQftPm10FAJcTu/+snNT3wp1featiwh6+cKnoKG+Zul9QcUKo76FLpSCpNlkFQ5V0R8eBFGcDrcsnOzH3oBafZ5L0Y034uRyKay1tnCnb6iwcXLZbz8wL2a4hDReJ7gZZ5KP6qq07SqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739243431; c=relaxed/simple;
	bh=ORjZ2/dz+75Ekxi41wKNjMt5Q8tHMQVLqmlaAaO9tIs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BfIZ/+9Azq1W3tTVnKXPVIWl0wq6vOdPZ9Pc9OortRdLOkXX8gShtpD1I8f95Abs9zeQGqNASKyEe7M6H9YHWRYqG7E10Naazh7BU/luw9SGhDgR3idTNOZcuirSmdJ6PetevCnY+fKhFC7/+1bTiSsx6vQfH72RiYIWlPo26Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1thgcE-000000001kS-1u3h;
	Mon, 10 Feb 2025 22:07:14 -0500
Message-ID: <c8068d0c8042e8f4e5de0e8af9cb3457ee795211.camel@surriel.com>
Subject: Re: [PATCH v9 09/12] x86/mm: enable broadcast TLB invalidation for
 multi-threaded processes
From: Rik van Riel <riel@surriel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com,
 zhengqi.arch@bytedance.com, 	nadav.amit@gmail.com, thomas.lendacky@amd.com,
 kernel-team@meta.com, 	linux-mm@kvack.org, akpm@linux-foundation.org,
 jannh@google.com, 	mhklinux@outlook.com, andrew.cooper3@citrix.com, Manali
 Shukla	 <Manali.Shukla@amd.com>
Date: Mon, 10 Feb 2025 22:07:14 -0500
In-Reply-To: <CA+i-1C37LM62cvM33rNCfejA4fSumh_OSVkuuDU91iur_ZxCtQ@mail.gmail.com>
References: <20250206044346.3810242-1-riel@surriel.com>
	 <20250206044346.3810242-10-riel@surriel.com>
	 <CA+i-1C37LM62cvM33rNCfejA4fSumh_OSVkuuDU91iur_ZxCtQ@mail.gmail.com>
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

On Mon, 2025-02-10 at 15:15 +0100, Brendan Jackman wrote:
> On Thu, 6 Feb 2025 at 05:47, Rik van Riel <riel@surriel.com> wrote:
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asid >=3D MAX_ASID_AVAILABLE)=
 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* This should never happen. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 VM_WARN_ONCE(1, "Unable to allocate global ASID
> > despite %d available\n", global_asid_available);
>=20
> If you'll forgive the nitpicking, please put the last arg on a new
> line or otherwise break this up, the rest of this file keeps below
> 100
> chars (this is 113).
>=20

Nitpicks are great! Chances are I'll have to look at
this code again several times over the coming years,
so getting it in the best possible shape is in my
interest as much as anybody else's ;)

> >=20
> > +static bool needs_global_asid_reload(struct mm_struct *next, u16
> > prev_asid)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 global_asid =3D mm_global_asi=
d(next);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (global_asid && prev_asid !=3D=
 global_asid)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return true;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!global_asid && is_global_asi=
d(prev_asid))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return true;
>=20
> I think this needs clarification around when switches from
> global->nonglobal happen. Maybe commentary or maybe there's a way to
> just express the code that makes it obvious. Here's what I currently
> understand, please correct me if I'm wrong:
>=20
> - Once a process gets a global ASID it keeps it forever. So within a
> process we never switch global->nonglobal.
>=20
> - In flush_tlb_func() we are just calling this to check if the
> process
> has just been given a global ASID - there's no way loaded_mm_asid can
> be global yet !mm_global_asid(loaded_mm).
>=20
> - When we call this from switch_mm_irqs_off() we are in the
> prev=3D=3Dnext
> case. Is there something about lazy TLB that can cause the case above
> to happen here?
>=20
In the current implementation, we never transition
from global->local ASID.

In a previous implementation, the code did do those
transitions, and they appeared to survive the testing
thrown at it.

If we implement more aggressive ASID reuse (which we
may need to), we may need to support that transition
again.

In short, while we do not need to support that
transition right now, I don't really want to remove
the two lines of code that make it work :)

I'll add comments.

> > +static bool meets_global_asid_threshold(struct mm_struct *mm)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!global_asid_available)
>=20
> I think we need READ_ONCE here.
>=20
> Also - this doesn't really make sense in this function as it's
> currently named.
>=20
> I think we could just inline this whole function into
> consider_global_asid(), it would still be nice and readable IMO.
>=20
Done and done.

> >=20
> > @@ -1058,9 +1375,12 @@ void flush_tlb_mm_range(struct mm_struct
> > *mm, unsigned long start,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * a local TLB flush is=
 needed. Optimize this use-case by
> > calling
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * flush_tlb_func_local=
() directly in this case.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpumask_any_but(mm_cpumask(mm=
), cpu) < nr_cpu_ids) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mm_global_asid(mm)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 broadcast_tlb_flush(info);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (cpumask_any_but(mm_cpu=
mask(mm), cpu) <
> > nr_cpu_ids) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 info->trim_cpumask =3D should_trim_cpumask(mm);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 flush_tlb_multi(mm_cpumask(mm), info);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 consider_global_asid(mm);
>=20
> Why do we do this here instead of when the CPU enters the mm? Is the
> idea that in combination with the jiffies thing in
> consider_global_asid() we get a probability of getting a global ASID
> (within some time period) that scales with the amount of TLB flushing
> the process does? So then we avoid using up ASID space on processes
> that are multithreaded but just sit around with stable VMAs etc?
>=20
You guessed right.

In the current x86 hardware, a global ASID is a scarce
resource, with about 4k available ASIDs (2k in a kernel
compiled with support for the KPTI mitigation), while
the largest available x86 systems have at least 8k CPUs.

We can either implement the much more aggressive ASID
reuse that ARM64 and RISC-V implement, though it is not
clear how to scale that to thousands of CPUs, or reserve
global ASIDs for the processes that are most likely to
benefit from them, continuing to use IPI-based flushing
for the processes that need it less.

I've added a comment to document that.

--=20
All Rights Reversed.
