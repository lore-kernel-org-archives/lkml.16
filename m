Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDED1D63CD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476661; cv=none; b=iLKFVdDAcRtvnmoRUk8jM7EDWltYmAHQ0u7bAHt9Qk+biG64ejweo6KaU2Pcy4OyuyXQYmOnYbAfLDErqmcE6TFwH1bYsU4QV/fPInkTY9EvFj840uLcaQlnrh+nxeTOp5a0N4Txv+7783HB6vYeIgTAOPbgi3u0KRVD7xuEbr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476661; c=relaxed/simple;
	bh=JuILf2t5Lj67QUYAWuV8nzpSXojcfdjsSzuHWCuFoa4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FZx30Pw1vQBh4zKmIX4rdT+pQ6OJ2bWUIszTVKTKXK9k5A7yW0ZTD8sGJ/uvEXR2m/HddvuMPvaSlr7MhRmF6+uMcOnW2WR7YlLsr10gnPTHuRzt/6XntQ07xWKl2waJMML2d044kV5zDFp4G3opsOcqUpPSppA0WBX25jbwNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=A9MZSMYY; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="A9MZSMYY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JuILf2t5Lj67QUYAWuV8nzpSXojcfdjsSzuHWCuFoa4=; b=A9MZSMYYh6JqxgKw76SnfQryti
	KKq8xvyKdtK8smrGizLYv4d7yQWxFq+OyhLEc9qSTojqAsusJuwt9iJFy5hJ+3XbfmYiSB7ciaTYV
	J7vjqZ9IK+kXU8iHFBRQtNH2CttOuTcdUeSNhD9RdE6LPoACvwfWtPGKMnksnGdmd73jMByw3ofl8
	P1cewnXnWek8V1ZFpxPyDh6iY9t08J7CYFblpd3LnAKBwW/8BtZ8MjxeILaNayGBmSRnALCSLvhFM
	em+Aq4BqawmLbL5hEOm5lUvlgglldeWAbsQ37C+acYn+BLsaRIhSKp+cnWsKGFOtIl/RDisVNjtMg
	5ZUvhiQg==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uX0xC-0000000059R-3cwE;
	Wed, 02 Jul 2025 13:09:02 -0400
Message-ID: <f73e23f363b780a0e33e8b0ab7171a2128e16df6.camel@surriel.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in
 flush_tlb_func
From: Rik van Riel <riel@surriel.com>
To: Jann Horn <jannh@google.com>
Cc: syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	neeraj.upadhyay@kernel.org, paulmck@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org, 
	yury.norov@gmail.com, kernel-team <kernel-team@meta.com>, David Hildenbrand
	 <david@redhat.com>
Date: Wed, 02 Jul 2025 13:09:02 -0400
In-Reply-To: <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
	 <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
	 <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
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

On Wed, 2025-07-02 at 18:53 +0200, Jann Horn wrote:
>=20

> TLB flushes via IPIs on x86 are always synchronous, right?
> flush_tlb_func is only referenced from native_flush_tlb_multi() in
> calls to on_each_cpu_mask() (with wait=3Dtrue) or
> on_each_cpu_cond_mask() (with wait=3D1).
> So I think this is not an issue, unless you're claiming that we call
> native_flush_tlb_multi() with an already-freed info->mm?
>=20
It looks like there are a least some cases where
try_to_unmap() can call flush_tlb_range() with
an mm that belongs to some other process.

I don't know whether that is an issue.

> And I think the bisected commit really is the buggy one: It looks at
> "nr_cpus", which tracks *how many CPUs we have to IPI*, but assumes
> that "nr_cpus" tracks *how many CPUs we posted work to*. Those
> numbers
> are not the same: If we post work to a CPU that already had IPI work
> pending, we just add a list entry without sending another IPI.
>=20
Good point, we do need to wait when we enqueue
work, even if we do not send an IPI anywhere!

You are right that the bisected commit is buggy
and should be reverted.

--=20
All Rights Reversed.
