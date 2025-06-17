Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE02BEFF5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750133802; cv=none; b=kgzznUkRRD/aOD9hrjD622i1jv91rpUaPk5O7TH9Tw4wlwmT2SoDBgqia7AHE4lppTcUeCt8FSc+jfa8mitkkhKENkd+bx53fSSGJUzqAsOM2CJ+6QtdsNe+6ezJQOUJ9zMU2F0I1yKicAp0SLuHq9WpkqWpdprMQaLXplRW1oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750133802; c=relaxed/simple;
	bh=3Bxo/ZOK6P7faSH0Ua9FrPZ29JOSuGuFEp7adOmSKTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fg6YV0Sf0x39Vgz+FnDElF6hsY6tXKJaLlqZkIAxLChY28j2ukg+G++kUJf1p+KBrr1cctL9rqYZP4bjC+dcmnOxOyN+GGSIIlwvOj34sJBybCa+zslBc1bhkiDlgJJFskgUVhtHkDyvmFDMQLlXYn+S4UFD6tFwQRNYvMNuAgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=hDGU2p2a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QHADQ8zl; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="hDGU2p2a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QHADQ8zl"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 9A9D61380353;
	Tue, 17 Jun 2025 00:16:36 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-06.internal (MEProxy); Tue, 17 Jun 2025 00:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750133796; x=1750220196; bh=6I5AYAtRKF
	OkqMX0ItME47j8WykjZdCKb8n6OgoJLL4=; b=hDGU2p2am3DThrTsJwBMBqg2dw
	1Hmp/ajRw4fZQczpuaRAs7DHbcgl4LGbR6qUtum4wrqpj8ZoumlZBeH4uf+YExjO
	tpgRUy7T4GQKjogtN5KDT+j6/VjTbivMRrVL3qjMckJ/m/ssEFrobHJ9wBh+YBi+
	aUCvnHnfLzAnyzR06OutHjODVFuWTZcloyxyCYkL3dREkgw1UOkbcS83Qu7Kn3cV
	LbMd5rSGjOrbFBnQYdO5lSCYEvyz/NRz7scSvPggadeTHFBsbESlMmbxGYxMnQKy
	RH9cYyuk65vltpX//MddCqDowWTq3W9ZrCIEoUOtONs+D9emy1BpB0ikrVbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750133796; x=1750220196; bh=6I5AYAtRKFOkqMX0ItME47j8WykjZdCKb8n
	6OgoJLL4=; b=QHADQ8zlYw8RrAyZVMeJeBr3pf5ltgFjziYjfSbDAfnKd9p1WP+
	8jgJmAgU+b+8/mCYagC3LGWEWk/RxdgJM9YLmFXFass39hzPsQ2ifXHbMPzoLHMn
	8Wd13l74PAN+XZFVw3WFT8vbTIxGcLA05ldu6F71fkqoQCjIQf/h/G6XIHxnN7Bw
	H9Xph8iJLJDFElWccUNSjrQ7rvd/p12fBiRw1Wqby1B/s+oLq2cSX/6xJwrlBVei
	9jjJS0+pN/ZNOVoobCh/BAz9zkB9v/vucB5Y+egNjNqt78eXY90scAPHTh/74rDX
	N+pDSrkcPMNttv4/4cSgAi+vI2PegtZurWA==
X-ME-Sender: <xms:I-xQaEimXpBLVevfd2mKF7B7i63W_aYTK87Nx2E-IDX1ndqN4TeQ4Q>
    <xme:I-xQaNCYB4TBvbTCicebPm-YSfGnQzNiiRqj9MS_OyZxYYWIRuKLbUGHcZOqUuri_
    ScixXnk87xVkmbIb28>
X-ME-Received: <xmr:I-xQaMFIp0G8J0f6OD3MWnQYJyZmVKA786Wfma_224Qui5hZf2QSRqvJX7XTpwsYV8qg_DoNdvf1qWGUYwmzxx4VBD_eePVoxn6QB7AXOT5sCfadSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkeegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomheppfhitgholhgrshcurfhithhrvgcuoehnihgtohesfhhluhignhhitgdrnh
    gvtheqnecuggftrfgrthhtvghrnhepgfevvdfhfeeujeeggffgfefhleffieeiuddvheff
    udehudffkeekhfegfffhfeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepnhhitghosehflhhugihnihgtrdhnvghtpdhnsggprhgtphhtthho
    peejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovg
    hnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegsihhjuhdruggrshdrjhii
    segsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegurghvihgurdhlrghighhhth
    drlhhinhhugiesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrth
    hiohhnrdhorhhgpdhrtghpthhtohepohhlvghgsehrvgguhhgrthdrtghomhdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:I-xQaFTMZvRAawLidsDjNbXgfrgZIpJs93T1waM2vKEDadjtLb5RPg>
    <xmx:I-xQaBw8DN0JcbwI-Bmeef8_DPU1-Tdq_5fp2Um_FvxKNxlh2Smgng>
    <xmx:I-xQaD5c7U5DufRyfrhu63fEt8nqeJkXm30VUYPyxGNhUbe7lZ69IA>
    <xmx:I-xQaOyLtRu3paDFJBhKF0GGK9kIZS2ybeBLYzJf_TDQGVN6BoxDqQ>
    <xmx:JOxQaMBiNQ-0F2EynC9EPj0GD5vC4I4z_zBzGOevx7TRRg0m0Vb3dU1F>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 00:16:35 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id CC4AA11F8434;
	Tue, 17 Jun 2025 00:16:34 -0400 (EDT)
Date: Tue, 17 Jun 2025 00:16:34 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
In-Reply-To: <20250614095346.69130-10-david.laight.linux@gmail.com>
Message-ID: <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-10-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> Replace the bit by bit algorithm with one that generates 16 bits
> per iteration on 32bit architectures and 32 bits on 64bit ones.
> 
> On my zen 5 this reduces the time for the tests (using the generic
> code) from ~3350ns to ~1000ns.
> 
> Running the 32bit algorithm on 64bit x86 takes ~1500ns.
> It'll be slightly slower on a real 32bit system, mostly due
> to register pressure.
> 
> The savings for 32bit x86 are much higher (tested in userspace).
> The worst case (lots of bits in the quotient) drops from ~900 clocks
> to ~130 (pretty much independant of the arguments).
> Other 32bit architectures may see better savings.
> 
> It is possibly to optimise for divisors that span less than
> __LONG_WIDTH__/2 bits. However I suspect they don't happen that often
> and it doesn't remove any slow cpu divide instructions which dominate
> the result.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Nice work. I had to be fully awake to review this one.
Some suggestions below.

> +	reps = 64 / BITS_PER_ITER;
> +	/* Optimise loop count for small dividends */
> +	if (!(u32)(n_hi >> 32)) {
> +		reps -= 32 / BITS_PER_ITER;
> +		n_hi = n_hi << 32 | n_lo >> 32;
> +		n_lo <<= 32;
> +	}
> +#if BITS_PER_ITER == 16
> +	if (!(u32)(n_hi >> 48)) {
> +		reps--;
> +		n_hi = add_u64_u32(n_hi << 16, n_lo >> 48);
> +		n_lo <<= 16;
> +	}
> +#endif

I think it would be more beneficial to integrate this within the loop 
itself instead. It is often the case that the dividend is initially big, 
and becomes zero or too small for the division in the middle of the 
loop.

Something like:

	unsigned long n;
	...

	reps = 64 / BITS_PER_ITER;
	while (reps--) {
		quotient <<= BITS_PER_ITER;
		n = ~n_hi >> (64 - 2 * BITS_PER_ITER);
		if (n < d_msig) {
			n_hi = (n_hi << BITS_PER_ITER | (n_lo >> (64 - BITS_PER_ITER)));
			n_lo <<= BITS_PER_ITER;
			continue;
		}
		q_digit = n / d_msig;
		...

This way small dividends are optimized as well as dividends with holes 
in them. And this allows for the number of loops to become constant 
which opens some unrolling optimization possibilities.

> +	/*
> +	 * Get the most significant BITS_PER_ITER bits of the divisor.
> +	 * This is used to get a low 'guestimate' of the quotient digit.
> +	 */
> +	d_msig = (d >> (64 - BITS_PER_ITER)) + 1;

Here the unconditional +1 is pessimizing d_msig too much. You should do 
this instead:

	d_msig = (d >> (64 - BITS_PER_ITER)) + !!(d << BITS_PER_ITER);

In other words, you want to round up the value, not an unconditional +1 
causing several unnecessary overflow fixup loops.


Nicolas
