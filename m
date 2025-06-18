Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A32EFD94
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261166; cv=none; b=SgV4vjvRVbMOove2OLpl2hRMb1wwNuOxKkkdcUXaYuaegV6IBj0cFtsBc7N9k8XpxOTsqPbAZ/UnOmtsK44OxL31HW+3aWEOm+5AUO8DCg0gXUJAMozTnXX9qeiThahAP3/xzoWrXVg+LSywvqY60Qz+/tloKWSG68TGmoaX94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261166; c=relaxed/simple;
	bh=+UzWFv/amBd0mJp4NxhLr3Ooq/Utg9NnK0p9JDzGF90=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VUlK8dlUxJzu4HfnuWDwVYZOBoZpnLtF/XQaM3CGVazyvVozpXG0kwyh6EUlF86uKvdoht8hKuke0ShzlQkhaMQyeisJoakK8aAYFQFxNeEeaOvaAfvMrUOBeA29fP3eUTFRH92WY8s/FVOMeylZVZ/o7FO39M4eO+HMUU3gMzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net; spf=pass smtp.mailfrom=fluxnic.net; dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b=tBR6mgXJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GIiKcDdq; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="tBR6mgXJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GIiKcDdq"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 508A2114011B;
	Wed, 18 Jun 2025 11:39:23 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-05.internal (MEProxy); Wed, 18 Jun 2025 11:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750261163; x=1750347563; bh=DRBImzuc9d
	Exg1G4Ug2N7cCw9Jt4HpQZz9+ybxuJOho=; b=tBR6mgXJ7B19gaZ+CdGjCwJHP9
	o0FTDJDYPA0peHWuvtTvjC33qpTDtopfbGH7V3ewmN/4rJFOCCd+LD9Nhl2zE72m
	11a6DuUuumOvogmlx+nf1Sqpsf3niVY44cSjvBftwEZ+Im6wXYdyNzLGIoCBwx2d
	fOCf4kGOfoJWVwcA10rYn0TWuHYYlCfpmUKRaHdTI7Ftvq8tKGoihnhh9OQaKOvv
	pMU7YUahWs0Z8BQMZFdclCJvwf5hniw38j3ANwE9xQ1fqm252D5LpsMkXGe35ZGA
	t2nU9Nt6ArSdPWGX/L7+IJ/fBoQoOfZM3YZcuA5t/rUDFPcLlmczcidgbAAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750261163; x=1750347563; bh=DRBImzuc9dExg1G4Ug2N7cCw9Jt4HpQZz9+
	ybxuJOho=; b=GIiKcDdqZ1UMf+FOhQ04NXX2I9w7DrDvuXcqtioE7J39Wzcq2ut
	DrYvp8fHZGWeZYil4fk+y7KwIqbxbtmq9DS9F7XeDy/iIuS/N5DyiIJrMgpCdebi
	Sl6lwocvJXQGfOmbKOGIHeqHzN+MzQR0/WC+bjOWvjSzmr5IBanngrn5bYUwWsJc
	kPj/S4t6jnwo/B0aH2ukc+4SQzItMDjGXoRIhcoupFiC+hgIBaV1eEvb/VAmA/ol
	RsGCZi+gIZiw+jHkunCxxAF47M5MnDjt8IT+sFexs3j4IFPkb4OKFHjfrwPF3DUl
	CrguL+nQ9qfX+u/9UF9S/xTEJF2WcndIaZg==
X-ME-Sender: <xms:qt1SaHG-sxjm4IFB0u_zMt2itF6xf1JvQkrw90Yb0780IP68vvMxtw>
    <xme:qt1SaEW4w9dcymbLZYMphpRVCxWlKrDDpInb2Jq0OSRBPY4-E0M04l_0OHPq-gqKn
    zdlMq_Lg6yRoBrzuCM>
X-ME-Received: <xmr:qt1SaJLL32K-rBKw1LH9qPFa5b95fDwIMiAGM7_Te03LYzI_G96HRbLzYV_lsSRQlgLaWaV-wb2N3AZpF10_00v4ah4ytQEWtBd2Hd0tVUyZxCMX5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeftddvucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:qt1SaFFFqrWDV3SiLSFvMLmVJKtuJsYNxuRfJecqOwHDDOf3YFg-Jw>
    <xmx:qt1SaNUNtrRoL1bi1h9BGQld-o3TRNgZGAKND1merilYkwkrThlgqA>
    <xmx:qt1SaAPeM3mANpaQq5iRGn1Y1VgZiHCACIO3Q35snCmD2v7QXiVIAw>
    <xmx:qt1SaM3K7euT2GO0phBQx_j9FnJwaf7OOSGok_8nhRWwSLNRjyrl0w>
    <xmx:q91SaKXouFvPqUsLNDbbt4XznJP4js0l1VtaMgidxQD8CGms7QhbHSGe>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 11:39:21 -0400 (EDT)
Received: from xanadu (xanadu.lan [192.168.1.120])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 11A1511FB457;
	Wed, 18 Jun 2025 11:39:21 -0400 (EDT)
Date: Wed, 18 Jun 2025 11:39:20 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
In-Reply-To: <20250618101620.26533aca@pumpkin>
Message-ID: <s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-10-david.laight.linux@gmail.com> <os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg> <7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg> <20250618101620.26533aca@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2025, David Laight wrote:

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
> >  		d <<= d_z_hi;
> >  		n_hi = n_hi << d_z_hi | n_lo >> (64 - d_z_hi);
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
> If the low divisor bits are zero an alternative simpler divide
> can be used (you want to detect it before the left align).
> I deleted that because it complicates things and probably doesn't
> happen often enough outside the tests cases.

Depends. On 32-bit systems that might be worth it. Something like:

	if (unlikely(sizeof(long) == 4 && !(u32)d))
		return div_u64(n_hi, d >> 32);

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
> I don't think that is right.
> d_msig is an overestimate so you can only skip the divide and mul_add().

That's what I thought initially. But `overflow` was always 0xffff in 
that case. I'd like to prove it mathematically, but empirically this 
seems to be true with all edge cases I could think of.

I also have a test rig using random numbers validating against the 
native x86 128/64 div and it has been running for an hour.

> Could be something like:
> 		if (n_long < d_msig) {
> 			if (!n_long)
> 				continue;
> 			q_digit = 0;
> 		} else {
> 			q_digit = n_long / d_msig;
> 	  		/* Add product to negated divisor */
> 	  		overflow += mul_u64_long_add_u64(&n_hi, d, q_digit, n_hi);		
> 		}
> but that starts looking like branch prediction hell.

... and so far unnecessary (see above).


> 
> > +		q_digit = n_long / d_msig;
> 
> I think you want to do the divide right at the top - maybe even if the
> result isn't used!
> All the shifts then happen while the divide instruction is in progress
> (even without out-of-order execution).

Only if there is an actual divide instruction available. If it is a 
library call then you're screwed.

And the compiler ought to be able to do that kind of shuffling on its 
own when there's a benefit.

> It is also quite likely that any cpu divide instruction takes a lot
> less clocks when the dividend or quotient is small.
> So if the quotient would be zero there isn't a stall waiting for the
> divide to complete.
> 
> As I said before it is a trade off between saving a few clocks for
> specific cases against adding clocks to all the others.
> Leading zero bits on the dividend are very likely, quotients with
> the low 16bits zero much less so (except for test cases).

Given what I said above wrt overflow I think this is a good tradeoff.
We just need to measure it.


Nicolas
