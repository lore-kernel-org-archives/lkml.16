Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E796184F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301033; cv=none; b=GZDZfU+VliJTvgIvT/f6EybFCHjjjPjf33ErqFZszSMjcbn+KGXBuZBjuFeUuQqr53a2pKTI7Ch6GYjNsbAMyquS0wYoiADU3Na/+hKeq3nku0RNZH2ocesZjIfO3jYcxNptDcVtd9+JbBPUbxag3fIfTgGb8pZ1Q0SyUSdtqTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301033; c=relaxed/simple;
	bh=5mVba2EnYiw1/VT1D8Y5FlgnAwhJLQZ6KDwHgonuDDo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZzBJD9cobwNBa0A7tdh9gDCMvSZOSYw8qA7vTABd708QUKasNQHIsi6cT2f1PHGbUibLFXK68GWQdd7h6rgFv84EmgbTQFyemo8zWU2zrWKdLW0TAllfu/di7oKeXga/6vy1c8XITw3pmw7MFHe4XZqza221RcRwsUltvRzw0ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=nI9UqFAJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cgIN2t7g; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="nI9UqFAJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cgIN2t7g"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 59D8F25400DF;
	Wed, 18 Jun 2025 22:43:49 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-01.internal (MEProxy); Wed, 18 Jun 2025 22:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750301029; x=1750387429; bh=LR3OCIK9bj
	72KuTnMdp2tO4tOmLVoRMNgG5nf89nE7U=; b=nI9UqFAJJtRJYwPejTFCwldmdA
	J7lCMorMgV6wv7Z3V8mHVq/U3dinjte7SdMLibhFFojsaxw/nYzmeQ2Ttf8I0QlF
	0mo1kyhhWPrBmW/ntZY67/athbHdk+QHA9BQMzSzJBooHjfrC1xyV2kzHqrjjd4/
	HJdCA+6PZE4HyI/rS4e4mO+yhQ0lzSvUv6bnf2CYFTeiM/mWVXVEFAkN3ft6IVwZ
	r2AiRPS95Z+ThBhTPeD0HJcSdUN/EDouhhIeCe84TBHJhT0quV8RDRnvWgNacLCE
	XgGEeN5GUX1uBnITeREJ4CBZo3ED5ff79Lwe5fTafZIlAPwT1/dvtTfkU2Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750301029; x=1750387429; bh=LR3OCIK9bj72KuTnMdp2tO4tOmLVoRMNgG5
	nf89nE7U=; b=cgIN2t7guMmYKPuvwZZGojucJXc1YEOtCMwbpbEUUgmZ8wI1USl
	qjJN2Pb+k8mdT498sN+0veuLrWv0XieaW9Ka3xuM0j6RUUJdtA3X7dEgHUeJwESt
	DlbDAQp8al0YDntymVo+XM2GX+/ypnv8iLmlTPMivRyvS/qiyGKZaIEeBpKYH4Zc
	5XuofhGsQBi3I/S+i+w6jS1WQvklE7WhayfWfyhYelzgimQjAzbnyGWFxOgEHvSf
	NtD6uI322Xgvd0N9q1OYR6BNcApvmyZU/i8wTxBWZ640sNa53ZtO+svrrQKU3YKS
	TwqscSv2+1PN4vGMQWETK192qYg53R7v2XQ==
X-ME-Sender: <xms:ZHlTaAqjWU1KL4Ial90eSB6d2HKqRb3Ti8Vsu8TlFktLAy9baLuTPg>
    <xme:ZHlTaGqD07jZbB7vJHV7Y-zW7Rbvd3dlsd3wvRyjfJykgdWs9cOAtXZt738L14jzV
    2b8YTSMe9iBQkzo1KM>
X-ME-Received: <xmr:ZHlTaFOIOMM1ROtBC7nrC-oD8JRfYDl5hk0jUXXid94c3zQfpKe2j1i6MlehyQQQiTH3H0jWU87sOHg2acG_xsjRiEmnyywB9rnPR5h1keIwKOcESQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefpihgtohhlrghsucfrihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvg
    htqeenucggtffrrghtthgvrhhnpefgvedvhfefueejgefggfefhfelffeiieduvdehffdu
    heduffekkefhgeffhfefveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehnihgtohesfhhluhignhhitgdrnhgvthdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnh
    highessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiies
    sghprdhrvghnvghsrghsrdgtohhmpdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrd
    hlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopeholhgvghesrhgvughhrghtrdgtohhmpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZHlTaH4J9NQmQaBeCZFNrFziVgA29gtGKdaeA1I08K5IFqPOD8rA6w>
    <xmx:ZHlTaP4C2yyRnUeatEiW9BH7KtWLEvomNHnaA8tbwV9IbuLii0YQgg>
    <xmx:ZHlTaHgW_2RefZ4n8dyaeLS-XYodDzJsqXIc_lpz0nuWZh4ZX7eS4Q>
    <xmx:ZHlTaJ7yCWi037Sn86_owdPQjKmKvN66ycKrNfnroFAXqBsubzjs7g>
    <xmx:ZXlTaPSaBxVbQCpuwy4ka67JhLR0oKK9PatKWkNWIxCxraBtTrY6d0Pb>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 22:43:47 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 43BFA11FC38B;
	Wed, 18 Jun 2025 22:43:47 -0400 (EDT)
Date: Wed, 18 Jun 2025 22:43:47 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
In-Reply-To: <20250618232648.0f58a27f@pumpkin>
Message-ID: <008r6n2s-0985-2507-5o66-67qs6nn199r6@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-10-david.laight.linux@gmail.com> <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg> <7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg> <20250618101620.26533aca@pumpkin>
 <s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg> <20250618185432.5ce80e0d@pumpkin> <0143891q-ssp6-83on-4o61-nrp2qn3678o1@syhkavp.arg> <20250618232648.0f58a27f@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2025, David Laight wrote:

> On Wed, 18 Jun 2025 16:12:49 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > On Wed, 18 Jun 2025, David Laight wrote:
> > 
> > > On Wed, 18 Jun 2025 11:39:20 -0400 (EDT)
> > > Nicolas Pitre <nico@fluxnic.net> wrote:
> > >   
> > > > > > +		q_digit = n_long / d_msig;    
> > > > > 
> > > > > I think you want to do the divide right at the top - maybe even if the
> > > > > result isn't used!
> > > > > All the shifts then happen while the divide instruction is in progress
> > > > > (even without out-of-order execution).    
> > 
> > Well.... testing on my old Intel Core i7-4770R doesn't show a gain.
> > 
> > With your proposed patch as is: ~34ns per call
> > 
> > With my proposed changes: ~31ns per call
> > 
> > With my changes but leaving the divide at the top of the loop: ~32ns per call
> 
> Wonders what makes the difference...
> Is that random 64bit values (where you don't expect zero digits)
> or values where there are likely to be small divisors and/or zero digits?

Those are values from the test module. I just copied it into a user 
space program.

> On x86 you can use the PERF_COUNT_HW_CPU_CYCLES counter to get pretty accurate
> counts for a single call.
> The 'trick' is to use syscall(___NR_perf_event_open,...) and pc = mmap() to get
> the register number pc->index - 1.

I'm not acquainted enough with x86 to fully make sense of the above.
This is more your territory than mine.  ;-)

> > > Can you do accurate timings for arm64 or arm32?  
> > 
> > On a Broadcom BCM2712 (ARM Cortex-A76):
> > 
> > With your proposed patch as is: ~20 ns per call
> > 
> > With my proposed changes: ~19 ns per call
> > 
> > With my changes but leaving the divide at the top of the loop: ~19 ns per call
> 
> Pretty much no difference.
> Is that 64bit or 32bit (or the 16 bits per iteration on 64bit) ?

64bit executable with 32 bits per iteration.

> Have you timed the original code?

The "your proposed patch as is" is the original code per the first email 
in this thread.

> > Both CPUs have the same max CPU clock rate (2.4 GHz). These are obtained 
> > with clock_gettime(CLOCK_MONOTONIC) over 56000 calls. There is some 
> > noise in the results over multiple runs though but still.
> 
> That many loops definitely trains the branch predictor and ignores
> any effects of loading the I-cache.
> As Linus keeps saying, the kernel tends to be 'cold cache', code size
> matters.

My proposed changes shrink the code especially on 32-bit systems due to 
the pre-loop special cases removal.

> That also means that branches are 50% likely to be mis-predicted.

We can tag it as unlikely. In practice this isn't taken very often.

> (Although working out what cpu actually do is hard.)
> 
> > 
> > I could get cycle measurements on the RPi5 but that requires a kernel 
> > recompile.
> 
> Or a loadable module - shame there isn't a sysctl.

Not sure. I've not investigated how the RPi kernel is configured yet.
I suspect this is about granting user space direct access to PMU regs.


Nicolas
