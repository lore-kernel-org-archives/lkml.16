Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538728FD
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 01:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751161347; cv=none; b=MZt0apkIqqISgyLLW/gtMHIW2x1pnp8bF9kNJB5dZlMYQY9P8DLha2pEXv1FLbb8aQwgFmkot/ErSWaC8ASCWExh+CMP4FNokMu0DxX44jCjpPoh3G2dPgCZrM+7pAwFKu4sWq6jyG0uWbaLDveE0ojs/aoqX01FY7jSWxzfnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751161347; c=relaxed/simple;
	bh=oguTD5d+SzfqkERduYUonzJQRVRzFufZIUOp/nVUstE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J2MyjkfxyZJOjIumRMHXg89EWap5MBJcqFagx8wVYkO/u4TOvUwHAalORrpbAYiwP1tGU83nVwYIzVzHBECDiXBnGBkrgwpxa9kdUrpFz5NsebPW6NC7J18drAvO0JiY2PfLdIDrjzpVo95vNHXFg2SQTO4M3B+VXdgKDcttkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=Ko+asv+J; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="Ko+asv+J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HwwWF9GbS2mUvKE0sfHwsiiGHB7p0vJM2njHQCOlwQo=; b=Ko+asv+JGufMfVbRy6LM5tIvHD
	9INHe4ikytGO7h57p/mXYrUbh+tNnc6l8MPCWbQ8KeDPGdRFHajMo3Wpt21ZvdM/QZI8XNNlMUp1R
	PQ0c6SiH147my56+7Aa+M3+LQeSGzOARDiJGkQ2/Xboioi0RyJA8a3KKK6mrg4ymoJ9AU4AdPF6Ie
	raWkUxIyVxBBen4N+ixxnj6zttqc7HarHON2aovuh+ncivHnL/nqcS57+KQCZ7RCG3MhGivcbkCn6
	Pk/z86cgxHIrzJ37LAYekU9xbhv9CdprvbNbw1RK7w+VhYdRwWHHMOb8+jeyViRMdDG1+6cwLPMBx
	uezreCjw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uVgsB-000000006dB-0ZRd;
	Sat, 28 Jun 2025 21:30:23 -0400
Message-ID: <7997802c151577c5e681813e121ded3e0d84d3ec.camel@surriel.com>
Subject: Re: [RFC PATCH v4 6/8] x86/mm: use RAR for kernel TLB flushes
From: Rik van Riel <riel@surriel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 bp@alien8.de, 	x86@kernel.org, nadav.amit@gmail.com, seanjc@google.com,
 tglx@linutronix.de, 	mingo@kernel.org, Rik van Riel <riel@fb.com>
Date: Sat, 28 Jun 2025 21:30:23 -0400
In-Reply-To: <um6emftj5lmto2ivddovvxl7lz4uvwduuwq725a3n7qykepmtc@cq6y4yez2hcv>
References: <20250619200442.1694583-1-riel@surriel.com>
	 <20250619200442.1694583-7-riel@surriel.com>
	 <um6emftj5lmto2ivddovvxl7lz4uvwduuwq725a3n7qykepmtc@cq6y4yez2hcv>
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

On Fri, 2025-06-27 at 16:27 +0300, Kirill A. Shutemov wrote:
> On Thu, Jun 19, 2025 at 04:03:58PM -0400, Rik van Riel wrote:
> > From: Rik van Riel <riel@fb.com>
> >=20
> > Use Intel RAR for kernel TLB flushes, when enabled.
> >=20
> > Pass in PCID 0 to smp_call_rar_many() to flush the specified
> > addresses,
> > regardless of which PCID they might be cached under in any
> > destination CPU.
> >=20
> > Signed-off-by: Rik van Riel <riel@surriel.com>
> > ---
> > =C2=A0arch/x86/mm/tlb.c | 38 ++++++++++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 38 insertions(+)
> >=20
> > diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> > index 39f80111e6f1..8931f7029d6c 100644
> > --- a/arch/x86/mm/tlb.c
> > +++ b/arch/x86/mm/tlb.c
> > @@ -21,6 +21,7 @@
> > =C2=A0#include <asm/apic.h>
> > =C2=A0#include <asm/msr.h>
> > =C2=A0#include <asm/perf_event.h>
> > +#include <asm/rar.h>
> > =C2=A0#include <asm/tlb.h>
> > =C2=A0
> > =C2=A0#include "mm_internal.h"
> > @@ -1468,6 +1469,18 @@ static void do_flush_tlb_all(void *info)
> > =C2=A0	__flush_tlb_all();
> > =C2=A0}
> > =C2=A0
> > +static void rar_full_flush(const cpumask_t *cpumask)
> > +{
> > +	guard(preempt)();
> > +	smp_call_rar_many(cpumask, 0, 0, TLB_FLUSH_ALL);
> > +	invpcid_flush_all();
>=20
> I don't follow why do we need to call invpcid_flush_all() here in
> addition
> to smp_call_rar_many(). Hm?
>=20
We shouldn't have to.

Once we figure out why the RAR flush isn't
working right (despite the RAR transitioning
from RAR_PENDING to RAR_SUCCESS) we should be
able to get rid of this call.


--=20
All Rights Reversed.
