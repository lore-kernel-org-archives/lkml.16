Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709822AD2D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996109; cv=none; b=N8AdlPGJeR0Y1E708526DlPWfsBX6EaOWN1CZyY43OnuFJuttOFTLA1ZGlRIToAeeaE/Oqqgpfas8w2YRdRQNCSXDPLQSod+ThTzQ3qEle54PKIdZHTKFQSavknYcFb7QMOKXW5AWU0Uko6UQAwc0gIJVwjpo67vvmakWhORphA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996109; c=relaxed/simple;
	bh=GGAkcolMP49ige7LYkeVqkN6AD+Hlq/QDhXW8dBZ72c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oj2YxjNmq2AJQo37eoKc9YJcbKBxi7+dTApqD4NmiTQIRh+XwQh3qAqX1ygkWWHemyB+4HpIFs7IzqPYBaYAVyOLVVAcqUZ8oGbia7b0GJd73DvTEo5bAIbyXcO3rqJZJgKaUgZgKHIGnuiI7+WgQhwFiTTYs1FWf+SUCrgmke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=a862vnOS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m7MZDuO3; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="a862vnOS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m7MZDuO3"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 9C7B8EC019D;
	Thu, 26 Jun 2025 23:48:25 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 23:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1750996105; x=1751082505; bh=SLQ3hSoxHT
	PvT1cQmLSd7RVZNZNhqvEZVvuKzN+KNL8=; b=a862vnOSOLvl8A7oE1aVCJlYfs
	lA/0292Z8rmxVp+xkWyFPHz6lFluDxTM8p8awaTU7aJxUOdV0EZbuwi/AzVHOblz
	OXkrYncSVNHwX64qIWtZuRbkXBsivy8PJ/34luQUohUsL8ITKuyX6zgFspOf9w7D
	iMvq7wyP9B8tVRzfa0CZLchSffVtM84eWUSDq+oTI84YzUscYeCjW4v1bw3uv1p8
	qSJTRImfx1xbG0HY9hY5UWIOpTca1EE/Cd12E5XHjU9s606EZCBfyCzF/FtdEy7r
	/jRP6MUlhCQCquTPq3lBvjQoc8VLKmqaCff5nZOCLb/Rfxpju0foWQ+GlVyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750996105; x=1751082505; bh=SLQ3hSoxHTPvT1cQmLSd7RVZNZNhqvEZVvu
	KzN+KNL8=; b=m7MZDuO3QGBI1GCaHIYm276qrP7AZAZfatorO87TxWTZ8mDP4Rd
	ru5DHa2g2gJo8Z2k90jJia8zu/qmBQFOuBe6/9AFP3VfVCeZAWW+qjvteguS+DiE
	R+XlaYnz22a8uBpj1Z6wiYuRH1b2baZBE3HNdV5UsVodD/NIkhsYQXZC6U84mGHm
	tWTs55Ul132aWH1eo01w3m3DlkA0CXVpwkcHPINcUaGT5Si7k2z6fnMxhfo93gGJ
	njtF2mxDHCD5B1d6i7ck80rEngPnW+UJuG/f/5A5gKO4kfD5EGi8LCloNRCbsOKi
	iXyC79g2i+a7CUqzucSI6V3tBMNc6rQ8H3g==
X-ME-Sender: <xms:iBReaDAsTWpPS-uhYj0UY-0qheiENrDKmipYcOfINydPdh_A0KSBeg>
    <xme:iBReaJgMxTyZNlfAwmpbsc9nhUDJYoR2NWehvmexsjA9pvzqIWPZuAX2xAgP3Up5W
    IdJdAI3Svf7vLHlaEo>
X-ME-Received: <xmr:iBReaOlEt0ycNZ2tMf61Z1j6TAmNuonOxCK5Doj0L9AzdHoYpSOnhU0DPYkkPtjOzR__EzUIgCMV1h8llEB3CyOrYYcjiFcDJv5CHlpnhNYtR23qzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefpihgtohhlrghsucfr
    ihhtrhgvuceonhhitghosehflhhugihnihgtrdhnvghtqeenucggtffrrghtthgvrhhnpe
    fgvedvhfefueejgefggfefhfelffeiieduvdehffduheduffekkefhgeffhfefveenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihgtohesfh
    hluhignhhitgdrnhgvthdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtoh
    hmpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhrvghnvghsrghsrdgtohhm
    pdhrtghpthhtohepuggrvhhiugdrlhgrihhghhhtrdhlihhnuhigsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    holhgvghesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iBReaFwZoSsIctd9ZNhrA6LJeJ2cDI_1ucT_VBg6zmN5HF_e801Osw>
    <xmx:iBReaIQ4dLXOPVE_BPgzRgzXj0EYdh2E0MmrOpadxpOSCz3ZYAWdlw>
    <xmx:iBReaIZE2b8Pz4RAfABH3MF_JHqDxgfzfKIP3jjRBSsuZ58jtfpCow>
    <xmx:iBReaJQiOLXZLNm0sSU9tz7RxqP78J7hqskq2Vis6W0HGGK-qGJYdA>
    <xmx:iRReaAhgTgYnJd9RpbftNCdv-zUqyD22BNFlPHoMesf_8X1fxBpP7Lm1>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 23:48:24 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 5789C120F41C;
	Thu, 26 Jun 2025 23:48:23 -0400 (EDT)
Date: Thu, 26 Jun 2025 23:48:23 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
In-Reply-To: <20250626224618.757dff9a@pumpkin>
Message-ID: <os833s47-15so-979n-1o8s-22n20q096182@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-10-david.laight.linux@gmail.com> <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg> <7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg> <20250626224618.757dff9a@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Jun 2025, David Laight wrote:

> On Tue, 17 Jun 2025 21:33:23 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > On Tue, 17 Jun 2025, Nicolas Pitre wrote:
> > 
> > > On Sat, 14 Jun 2025, David Laight wrote:
> > >   
> > > > Replace the bit by bit algorithm with one that generates 16 bits
> > > > per iteration on 32bit architectures and 32 bits on 64bit ones.
> > > > 
> > > > On my zen 5 this reduces the time for the tests (using the generic
> > > > code) from ~3350ns to ~1000ns.
> > > > 
> > > > Running the 32bit algorithm on 64bit x86 takes ~1500ns.
> > > > It'll be slightly slower on a real 32bit system, mostly due
> > > > to register pressure.
> > > > 
> > > > The savings for 32bit x86 are much higher (tested in userspace).
> > > > The worst case (lots of bits in the quotient) drops from ~900 clocks
> > > > to ~130 (pretty much independant of the arguments).
> > > > Other 32bit architectures may see better savings.
> > > > 
> > > > It is possibly to optimise for divisors that span less than
> > > > __LONG_WIDTH__/2 bits. However I suspect they don't happen that often
> > > > and it doesn't remove any slow cpu divide instructions which dominate
> > > > the result.
> > > > 
> > > > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> > > 
> > > Nice work. I had to be fully awake to review this one.
> > > Some suggestions below.  
> > 
> > Here's a patch with my suggestions applied to make it easier to figure 
> > them out. The added "inline" is necessary to fix compilation on ARM32. 
> > The "likely()" makes for better assembly and this part is pretty much 
> > likely anyway. I've explained the rest previously, although this is a 
> > better implementation.
> 
> I've been trying to find time to do some more performance measurements.
> I did a few last night and managed to realise at least some of what
> is happening.
> 
> I've dropped the responses in here since there is a copy of the code.
> 
> The 'TLDR' is that the full divide takes my zen5 about 80 clocks
> (including some test red tape) provided the branch-predictor is
> predicting correctly.
> I get that consistently for repeats of the same division, and moving
> onto the next one - provided they take the same path.
> (eg for the last few 'random' value tests.)
> However if I include something that takes a different path (eg divisor
> doesn't have the top bit set, or the product has enough high zero bits
> to take the 'optimised' path then the first two or three repeats of the
> next division are at least 20 clocks slower.
> In the kernel these calls aren't going to be common enough (and with
> similar inputs) to train the branch predictor.
> So the mispredicted branches really start to dominate.
> This is similar to the issue that Linus keeps mentioning about kernel
> code being mainly 'cold cache'.
> 
> > 
> > commit 99ea338401f03efe5dbebe57e62bd7c588409c5c
> > Author: Nicolas Pitre <nico@fluxnic.net>
> > Date:   Tue Jun 17 14:42:34 2025 -0400
> > 
> >     fixup! lib: mul_u64_u64_div_u64() Optimise the divide code
> > 
> > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > index 3c9fe878ce68..740e59a58530 100644
> > --- a/lib/math/div64.c
> > +++ b/lib/math/div64.c
> > @@ -188,7 +188,7 @@ EXPORT_SYMBOL(iter_div_u64_rem);
> >  
> >  #if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
> >  
> > -static u64 mul_add(u32 a, u32 b, u32 c)
> > +static inline u64 mul_add(u32 a, u32 b, u32 c)
> 
> If inline is needed, it need to be always_inline.

Here "inline" was needed only because I got a "defined but unused" 
complaint from the compiler in some cases. The "always_inline" is not 
absolutely necessary.

> >  {
> >  	return add_u64_u32(mul_u32_u32(a, b), c);
> >  }
> > @@ -246,7 +246,7 @@ static inline u32 mul_u64_long_add_u64(u64 *p_lo, u64 a, u32 b, u64 c)
> >  
> >  u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> >  {
> > -	unsigned long d_msig, q_digit;
> > +	unsigned long n_long, d_msig, q_digit;
> >  	unsigned int reps, d_z_hi;
> >  	u64 quotient, n_lo, n_hi;
> >  	u32 overflow;
> > @@ -271,36 +271,21 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> >  
> >  	/* Left align the divisor, shifting the dividend to match */
> >  	d_z_hi = __builtin_clzll(d);
> > -	if (d_z_hi) {
> > +	if (likely(d_z_hi)) {
> 
> I don't think likely() helps much.
> But for 64bit this can be unconditional...

It helps if you look at how gcc orders the code. Without the likely, the 
normalization code is moved out of line and a conditional forward branch 
(predicted untaken by default) is used to reach it even though this code 
is quite likely. With likely() gcc inserts the normalization 
code in line and a conditional forward branch (predicted untaken by 
default) is used to skip over that code. Clearly we want the later.

> >  		d <<= d_z_hi;
> >  		n_hi = n_hi << d_z_hi | n_lo >> (64 - d_z_hi);
> 
> ... replace 'n_lo >> (64 - d_z_hi)' with 'n_lo >> (63 - d_z_hi) >> 1'.

Why? I don't see the point.

> The extra shift probably costs too much on 32bit though.
> 
> 
> >  		n_lo <<= d_z_hi;
> >  	}
> >  
> > -	reps = 64 / BITS_PER_ITER;
> > -	/* Optimise loop count for small dividends */
> > -	if (!(u32)(n_hi >> 32)) {
> > -		reps -= 32 / BITS_PER_ITER;
> > -		n_hi = n_hi << 32 | n_lo >> 32;
> > -		n_lo <<= 32;
> > -	}
> > -#if BITS_PER_ITER == 16
> > -	if (!(u32)(n_hi >> 48)) {
> > -		reps--;
> > -		n_hi = add_u64_u32(n_hi << 16, n_lo >> 48);
> > -		n_lo <<= 16;
> > -	}
> > -#endif
> 
> You don't want the branch in the loop.
> Once predicted correctly is makes little difference where you put
> the test - but that won't be 'normal'
> Unless it gets trained odd-even it'll get mispredicted at least once.
> For 64bit (zen5) the test outside the loop was less bad
> (IIRC dropped to 65 clocks - so probably worth it).
> I need to check an older cpu (got a few Intel ones).
> 
> 
> > -
> >  	/* Invert the dividend so we can use add instead of subtract. */
> >  	n_lo = ~n_lo;
> >  	n_hi = ~n_hi;
> >  
> >  	/*
> > -	 * Get the most significant BITS_PER_ITER bits of the divisor.
> > +	 * Get the rounded-up most significant BITS_PER_ITER bits of the divisor.
> >  	 * This is used to get a low 'guestimate' of the quotient digit.
> >  	 */
> > -	d_msig = (d >> (64 - BITS_PER_ITER)) + 1;
> > +	d_msig = (d >> (64 - BITS_PER_ITER)) + !!(d << BITS_PER_ITER);
> 
> For 64bit x64 that is pretty much zero cost
> (gcc manages to use the 'Z' flag from the '<< 32' in a 'setne' to get a 1
> I didn't look hard enough to find where the zero register came from
> since 'setne' of changes the low 8 bits).
> But it is horrid for 32bit - added quite a few clocks.
> I'm not at all sure it is worth it though.

If you do an hardcoded +1 when it is not necessary, in most of those 
cases you end up with one or two extra overflow adjustment loops. Those 
loops are unnecessary when d_msig is not increased by 1.

> >  
> >  	/*
> >  	 * Now do a 'long division' with BITS_PER_ITER bit 'digits'.
> > @@ -308,12 +293,17 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> >  	 * The worst case is dividing ~0 by 0x8000 which requires two subtracts.
> >  	 */
> >  	quotient = 0;
> > -	while (reps--) {
> > -		q_digit = (unsigned long)(~n_hi >> (64 - 2 * BITS_PER_ITER)) / d_msig;
> > +	for (reps = 64 / BITS_PER_ITER; reps; reps--) {
> > +		quotient <<= BITS_PER_ITER;
> > +		n_long = ~n_hi >> (64 - 2 * BITS_PER_ITER);
> >  		/* Shift 'n' left to align with the product q_digit * d */
> >  		overflow = n_hi >> (64 - BITS_PER_ITER);
> >  		n_hi = add_u64_u32(n_hi << BITS_PER_ITER, n_lo >> (64 - BITS_PER_ITER));
> >  		n_lo <<= BITS_PER_ITER;
> > +		/* cut it short if q_digit would be 0 */
> > +		if (n_long < d_msig)
> > +			continue;
> 
> As I said above that gets misprediced too often
> 
> > +		q_digit = n_long / d_msig;
> 
> I fiddled with the order of the lines of code - changes the way the object
> code is laid out and change the clock count 'randomly' by one or two.
> Noise compared to mispredicted branches.
> 
> I've not tested on an older system with a slower divide.
> I suspect older (Haswell and Broadwell) may benefit from the divide
> being scheduled earlier.
> 
> If anyone wants of copy of the test program I can send you a copy.
> 
> 	David
> 
> >  		/* Add product to negated divisor */
> >  		overflow += mul_u64_long_add_u64(&n_hi, d, q_digit, n_hi);
> >  		/* Adjust for the q_digit 'guestimate' being low */
> > @@ -322,7 +312,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> >  			n_hi += d;
> >  			overflow += n_hi < d;
> >  		}
> > -		quotient = add_u64_long(quotient << BITS_PER_ITER, q_digit);
> > +		quotient = add_u64_long(quotient, q_digit);
> >  	}
> >  
> >  	/*
> 
> 
