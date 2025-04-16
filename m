Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B8192D68
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813292; cv=none; b=oxbF8Pi3tdSG+jf97Vd2297iP55H8Jb7DvAQnxZcW5LFWdnC6LDkyLrjAJfBUOS5Ohv1kcnPGjv/JkPTTtbHoWlqhY7hC4lmCzEwPOAbQxlKhv096A6rQhDv1wKu/mLpbS8AxKgg9im/LNGVPHbF+jSVi6DKU8K/JDgmrMYu4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813292; c=relaxed/simple;
	bh=kwl1ptkCJXWD3ZmvhhxrdXUzTXTVymEdchqvj4VsObE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gxwx+HZECWzpOf++P374UCe16BsvHx9JGHB1NYsy1ZtZG9tcgjugfQ4YikFWjD4CPRAiVBSeAi8mCzHPoWNWu6v35NVCO2tue+CWFM0y7l/+dSbNfUfISfD+dr11m31a95LUn8ohqtpkS83BYx2/Cr77ug+N9i5JeYwY0aRXnCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1u53c6-000000006y0-3OJb;
	Wed, 16 Apr 2025 10:19:42 -0400
Message-ID: <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
From: Rik van Riel <riel@surriel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, Pat Cody <pat@patcody.io>, mingo@redhat.com,
 	juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	linux-kernel@vger.kernel.org,
 patcody@meta.com, kernel-team@meta.com, Breno Leitao	 <leitao@debian.org>
Date: Wed, 16 Apr 2025 10:19:42 -0400
In-Reply-To: <20250416124442.GC6580@noisy.programming.kicks-ass.net>
References: <20250320205310.779888-1-pat@patcody.io>
	 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
	 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
	 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
	 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
	 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
	 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
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

On Wed, 2025-04-16 at 14:44 +0200, Peter Zijlstra wrote:
> On Tue, Apr 15, 2025 at 10:02:35AM +0200, Peter Zijlstra wrote:
> > On Mon, Apr 14, 2025 at 03:57:42PM -0400, Rik van Riel wrote:
> > > On Wed, 2025-04-02 at 10:22 +0200, Peter Zijlstra wrote:
> > > >=20
> > > > Please confirm what the reason for overflow is.
> > > >=20
> > > Running a large enough sample size has its benefits.
> > >=20
> > > We have hit 3 out of the 4 warnings below.
> > >=20
> > > The only one we did not hit is the cfs_rq->avg_load !=3D avg_load
> > > warning.
> >=20
> > Fair enough, that one really isn't hard.
> >=20
> > > Most of the time we seem to hit the warnings from the
> > > code that removes tasks from the runqueue,=20
> >=20
> > *blink*..
>=20
> Which warning is getting hit on removal? The avg_vruntime mismatch?
>=20
> Also, which removal path? schedule()'s block path, or migration like?

The most common warning by far, hitting
about 90% of the time we hit anything
in avg_vruntime_validate is the
WARN_ON_ONCE(cfs_rq->avg_vruntime !=3D vruntime)

The most common code path to getting there,
covering about 85% of the cases:

avg_vruntime_validate
avg_vruntime_sub
__dequeue_entity
set_next_entity
pick_task_fair
pick_next_task_fair
__pick_next_task
pick_next_task
__schedule
schedule


--=20
All Rights Reversed.
