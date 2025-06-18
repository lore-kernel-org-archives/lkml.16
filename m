Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FF2EA74B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269279; cv=none; b=Xl2/HqPAcpe3+6MJ2P5bhhacbQIXTd8x/uyuraLjGXUE5BlAj+fWLfC3uCfHhsILJYYuCzJcjoXznGTen0ONPw04z7TSKCQVDCzG3WovhrXDb1NG0Ra0UBg7DTnKeBGEaN/1SshZOvZ3miTpt0/bQQ88Yb4laSYnbKF16BZmK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269279; c=relaxed/simple;
	bh=5vt+nB/vKnnebiowY7PHvpMO8IkyzuFVFBx8CfeWJ/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHJjjI2xco7BJHxqBXYHPSG28q/faUdgUtkXm6pLyz7PMjjlB42P66znHB9k4KpPKUG7nCwfw4dMjmFyC6N627X+8IJTL5Bc8fR/vCACaR0kb+dm3pkblrSXYYPr0zGarcVBt03v3nzs+pumxRc5EPmJL8gXDVYalvb54YLY9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq8A2f79; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq8A2f79"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a510432236so5409904f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750269275; x=1750874075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc9+M9wzrWTgIksa1YhbolExiq7Zp9HlhaiDcBRiBHc=;
        b=Hq8A2f79b/U4zhjR57HlPPbwHJHSNe2qKcHESPgWQaQGZT9xatXLWVcHmzhRxMh/ff
         mYoOTvQjNd7yOZSzg2hd9Cxjlj3w44Trh0gYCaZgwKwnzGHjjBcqxu/KzgwlxlNRKcOs
         t0dF5i8NxXA/S1C71msP1t0KMTpScKLex1oapPPIeKlSLhoiyvvbp9PLYwB37Xukb3VE
         k3CqMO8GVZx2fJszk8FaCcBU7PbNozCWfqKC3C913HWTXhQLR8LhOmqnNNMZ+876FruB
         KHtOV1g5aL3/RYyNnNYMG7mrjXOoRy3oRa7xI/mGtjK5ezLrdoIhE9vTF/RWutsUwZHf
         Ssiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269275; x=1750874075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sc9+M9wzrWTgIksa1YhbolExiq7Zp9HlhaiDcBRiBHc=;
        b=UuDwnXYCoC9sca65JZo5liSeYciM4fxY69w+M8KRuzzwV/E6klnwM2MvGY8Wfvu5Ev
         qFLAgiRRwTyMFYoxKu4rAqSQtdFbxpTincijrDcDXLU83lV4/TldBSZoPnvhqJv18xsT
         3UywPc3ONgBg+Pv8ZJdXsfI4YBbDkE87uisk3wV5mIBZbJovEYz4fuGyx5pDBXCGCva7
         MemSXzM0Wp0DBXZWASVjDf2BDJr5uOPPotK+pBNM7+jWEGhHjDvBcB9uVKqsxreSb63T
         0j0FDVfwg+xxzvBv3PAI3VxVsFtCdC79FiyBLSTjWtf6b+FunvYXifw2duj2tPOmK1/Z
         h4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXglhOqGf/HwUC90Y9PYY60w1w6Jlb8k1vddcCZPETp5V3K9QPXyYY/UINFH5ZFM3ceqU2oU9gqOTjiI5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiFFcU6e0KJo7K2MID1kzEy7F98T2OIgXKDsvTBVbS+NMnabqI
	o9kM1fFDJI1aZymIBLw+YA52YNGRPjdC74/85iaYEr5ftyvAowJZ1MIC
X-Gm-Gg: ASbGncviVtzxyt+8FI1xq1c8XvUbbu7/zng33GlYrwFVhONpAZOA4NRvChS0im2g89i
	anfBuVmUi+hSXXtH1RMOLBvy4h7vegX8eKpUijQ/yN/YUkxkRwHOWEohCQF92YM404KVleCVOxH
	gaEuRed/Jt9GpvZch9Pix3Cs7HXZjY8OA35zhY/FHsLV4vPlBWIo/XkbHCyCGh+xNLc1OHY3+md
	TBZ/b0ZYSkj78qIUxBBbZ/KF8NKQOYVEmZiVxkKjbGntTdFpUtNJURhC9o2OttGpvaKh39c7Z4d
	mX4JSxJlZfSfCb1I7HM6jv3Bm/t4f0ZUjktQrIoO19sFUS3AEUbaR9AVMtVipiBU1h9se0uFyVe
	8jAxGGTw+KuwTA5y0irczQo4jeHKFv6XVROY=
X-Google-Smtp-Source: AGHT+IFuw+VZf/NWnkh/qVE1dIRMGnkDy4dgf09ZNTmNghkLzhU5O0/hlU+g8wqWOmSLgd2HxsYWpA==
X-Received: by 2002:a05:6000:4308:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3a572e6bc57mr15539088f8f.33.1750269274829;
        Wed, 18 Jun 2025 10:54:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm17334778f8f.45.2025.06.18.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:54:34 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:54:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
Message-ID: <20250618185432.5ce80e0d@pumpkin>
In-Reply-To: <s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
	<20250614095346.69130-10-david.laight.linux@gmail.com>
	<os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg>
	<7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg>
	<20250618101620.26533aca@pumpkin>
	<s919qno2-782s-ooqq-0p19-sr754osn8n02@syhkavp.arg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 11:39:20 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Wed, 18 Jun 2025, David Laight wrote:
> 
> > On Tue, 17 Jun 2025 21:33:23 -0400 (EDT)
> > Nicolas Pitre <nico@fluxnic.net> wrote:
> >   
> > > On Tue, 17 Jun 2025, Nicolas Pitre wrote:
> > >   
> > > > On Sat, 14 Jun 2025, David Laight wrote:
> > > >     
> > > > > Replace the bit by bit algorithm with one that generates 16 bits
> > > > > per iteration on 32bit architectures and 32 bits on 64bit ones.
> > > > > 
> > > > > On my zen 5 this reduces the time for the tests (using the generic
> > > > > code) from ~3350ns to ~1000ns.
> > > > > 
> > > > > Running the 32bit algorithm on 64bit x86 takes ~1500ns.
> > > > > It'll be slightly slower on a real 32bit system, mostly due
> > > > > to register pressure.
> > > > > 
> > > > > The savings for 32bit x86 are much higher (tested in userspace).
> > > > > The worst case (lots of bits in the quotient) drops from ~900 clocks
> > > > > to ~130 (pretty much independant of the arguments).
> > > > > Other 32bit architectures may see better savings.
> > > > > 
> > > > > It is possibly to optimise for divisors that span less than
> > > > > __LONG_WIDTH__/2 bits. However I suspect they don't happen that often
> > > > > and it doesn't remove any slow cpu divide instructions which dominate
> > > > > the result.
> > > > > 
> > > > > Signed-off-by: David Laight <david.laight.linux@gmail.com>    
> > > > 
> > > > Nice work. I had to be fully awake to review this one.
> > > > Some suggestions below.    
> > > 
> > > Here's a patch with my suggestions applied to make it easier to figure 
> > > them out. The added "inline" is necessary to fix compilation on ARM32. 
> > > The "likely()" makes for better assembly and this part is pretty much 
> > > likely anyway. I've explained the rest previously, although this is a 
> > > better implementation.
> > > 
> > > commit 99ea338401f03efe5dbebe57e62bd7c588409c5c
> > > Author: Nicolas Pitre <nico@fluxnic.net>
> > > Date:   Tue Jun 17 14:42:34 2025 -0400
> > > 
> > >     fixup! lib: mul_u64_u64_div_u64() Optimise the divide code
> > > 
> > > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > > index 3c9fe878ce68..740e59a58530 100644
> > > --- a/lib/math/div64.c
> > > +++ b/lib/math/div64.c
> > > @@ -188,7 +188,7 @@ EXPORT_SYMBOL(iter_div_u64_rem);
> > >  
> > >  #if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
> > >  
> > > -static u64 mul_add(u32 a, u32 b, u32 c)
> > > +static inline u64 mul_add(u32 a, u32 b, u32 c)
> > >  {
> > >  	return add_u64_u32(mul_u32_u32(a, b), c);
> > >  }
> > > @@ -246,7 +246,7 @@ static inline u32 mul_u64_long_add_u64(u64 *p_lo, u64 a, u32 b, u64 c)
> > >  
> > >  u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> > >  {
> > > -	unsigned long d_msig, q_digit;
> > > +	unsigned long n_long, d_msig, q_digit;
> > >  	unsigned int reps, d_z_hi;
> > >  	u64 quotient, n_lo, n_hi;
> > >  	u32 overflow;
> > > @@ -271,36 +271,21 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> > >  
> > >  	/* Left align the divisor, shifting the dividend to match */
> > >  	d_z_hi = __builtin_clzll(d);
> > > -	if (d_z_hi) {
> > > +	if (likely(d_z_hi)) {
> > >  		d <<= d_z_hi;
> > >  		n_hi = n_hi << d_z_hi | n_lo >> (64 - d_z_hi);
> > >  		n_lo <<= d_z_hi;
> > >  	}
> > >  
> > > -	reps = 64 / BITS_PER_ITER;
> > > -	/* Optimise loop count for small dividends */
> > > -	if (!(u32)(n_hi >> 32)) {
> > > -		reps -= 32 / BITS_PER_ITER;
> > > -		n_hi = n_hi << 32 | n_lo >> 32;
> > > -		n_lo <<= 32;
> > > -	}
> > > -#if BITS_PER_ITER == 16
> > > -	if (!(u32)(n_hi >> 48)) {
> > > -		reps--;
> > > -		n_hi = add_u64_u32(n_hi << 16, n_lo >> 48);
> > > -		n_lo <<= 16;
> > > -	}
> > > -#endif
> > > -
> > >  	/* Invert the dividend so we can use add instead of subtract. */
> > >  	n_lo = ~n_lo;
> > >  	n_hi = ~n_hi;
> > >  
> > >  	/*
> > > -	 * Get the most significant BITS_PER_ITER bits of the divisor.
> > > +	 * Get the rounded-up most significant BITS_PER_ITER bits of the divisor.
> > >  	 * This is used to get a low 'guestimate' of the quotient digit.
> > >  	 */
> > > -	d_msig = (d >> (64 - BITS_PER_ITER)) + 1;
> > > +	d_msig = (d >> (64 - BITS_PER_ITER)) + !!(d << BITS_PER_ITER);  
> > 
> > If the low divisor bits are zero an alternative simpler divide
> > can be used (you want to detect it before the left align).
> > I deleted that because it complicates things and probably doesn't
> > happen often enough outside the tests cases.  
> 
> Depends. On 32-bit systems that might be worth it. Something like:
> 
> 	if (unlikely(sizeof(long) == 4 && !(u32)d))
> 		return div_u64(n_hi, d >> 32);

You need a bigger divide than that (96 bits by 32).
It is also possible this code is better than div_u64() !

My initial version optimised for divisors with max 16 bits using:

        d_z_hi = __builtin_clzll(d);
        d_z_lo = __builtin_ffsll(d) - 1;
        if (d_z_hi + d_z_lo >= 48) {
                // Max 16 bits in divisor, shift right
                if (d_z_hi < 48) {
                        n_lo = n_lo >> d_z_lo | n_hi << (64 - d_z_lo);
                        n_hi >>= d_z_lo;
                        d >>= d_z_lo;
                }
                return div_me_16(n_hi, n_lo >> 32, n_lo, d);
        }
	// Followed by the 'align left' code

with the 80 by 16 divide:
static u64 div_me_16(u32 acc, u32 n1, u32 n0, u32 d)
{
        u64 q = 0;

        if (acc) {
                acc = acc << 16 | n1 >> 16;
                q = (acc / d) << 16;
                acc = (acc % d) << 16 | (n1 & 0xffff);
        } else {
                acc = n1;
                if (!acc)
                        return n0 / d;
        }
        q |= acc / d;
        q <<= 32;
        acc = (acc % d) << 16 | (n0 >> 16);
        q |= (acc / d) << 16;
        acc = (acc % d) << 16 | (n0 & 0xffff);
        q |= acc / d;

        return q;
}

In the end I decided the cost of the 64bit ffsll() on 32bit was too much.
(I could cut it down to 3 'cmov' instead of 4 - and remember they have to be
conditional jumps in the kernel.)

> 
> > >  	/*
> > >  	 * Now do a 'long division' with BITS_PER_ITER bit 'digits'.
> > > @@ -308,12 +293,17 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> > >  	 * The worst case is dividing ~0 by 0x8000 which requires two subtracts.
> > >  	 */
> > >  	quotient = 0;
> > > -	while (reps--) {
> > > -		q_digit = (unsigned long)(~n_hi >> (64 - 2 * BITS_PER_ITER)) / d_msig;
> > > +	for (reps = 64 / BITS_PER_ITER; reps; reps--) {
> > > +		quotient <<= BITS_PER_ITER;
> > > +		n_long = ~n_hi >> (64 - 2 * BITS_PER_ITER);
> > >  		/* Shift 'n' left to align with the product q_digit * d */
> > >  		overflow = n_hi >> (64 - BITS_PER_ITER);
> > >  		n_hi = add_u64_u32(n_hi << BITS_PER_ITER, n_lo >> (64 - BITS_PER_ITER));
> > >  		n_lo <<= BITS_PER_ITER;
> > > +		/* cut it short if q_digit would be 0 */
> > > +		if (n_long < d_msig)
> > > +			continue;  
> > 
> > I don't think that is right.
> > d_msig is an overestimate so you can only skip the divide and mul_add().  
> 
> That's what I thought initially. But `overflow` was always 0xffff in 
> that case. I'd like to prove it mathematically, but empirically this 
> seems to be true with all edge cases I could think of.

You are right :-(
It all gets 'saved' because the next q_digit can be 17 bits.

> I also have a test rig using random numbers validating against the 
> native x86 128/64 div and it has been running for an hour.

I doubt random values will hit many nasty edge cases.

...
> >   
> > > +		q_digit = n_long / d_msig;  
> > 
> > I think you want to do the divide right at the top - maybe even if the
> > result isn't used!
> > All the shifts then happen while the divide instruction is in progress
> > (even without out-of-order execution).  
> 
> Only if there is an actual divide instruction available. If it is a 
> library call then you're screwed.

The library call may well short circuit it anyway.

> And the compiler ought to be able to do that kind of shuffling on its 
> own when there's a benefit.

In my experience it doesn't do a very good job - best to give it help.
In this case I'd bet it even moves it later on (especially if you add
a conditional path that doesn't need it).

Try getting (a + b) + (c + d) compiled that way rather than as
(a + (b + (c + d))) which has a longer register dependency chain.

> 
> > It is also quite likely that any cpu divide instruction takes a lot
> > less clocks when the dividend or quotient is small.
> > So if the quotient would be zero there isn't a stall waiting for the
> > divide to complete.
> > 
> > As I said before it is a trade off between saving a few clocks for
> > specific cases against adding clocks to all the others.
> > Leading zero bits on the dividend are very likely, quotients with
> > the low 16bits zero much less so (except for test cases).  
> 
> Given what I said above wrt overflow I think this is a good tradeoff.
> We just need to measure it.

Can you do accurate timings for arm64 or arm32?

I've found a 2004 Arm book that includes several I-cache busting
divide algorithms.
But I'm sure this pi-5 has hardware divide.

My suspicion is that provided the cpu has reasonable multiply instructions
this code will be reasonable with a 32 by 32 software divide.

According to Agner's tables all AMD Zen cpu have fast 64bit divide.
The same isn't true for Intel though, Skylake is 26 clocks for r32 but 35-88 for r64.
You have to get to IceLake (xx-10) to get a fast r64 divide.
Probably not enough to avoid for the 128 by 64 case, but there may be cases
where it is worth it.

I need to get my test farm set up - and source a zen1/2 system.

	David

> 
> 
> Nicolas

