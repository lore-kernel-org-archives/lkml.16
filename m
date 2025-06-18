Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26027EC98
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238187; cv=none; b=FytwqVs/7Qz+6key6S9xVQdwwfH0yB7usMrSpM1ubTQ/nIMWohCKK0+i2eMP1EVAuDEke3wTVYno+1uP0RNY/4P6f6vp/wIzaa7wjTdIrXgjsU6B4EvQwtHkwWQN+V8D8FP3vIPLjVyIlVJyLV6NO+KxdNIwfrpsAj4uX2INhGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238187; c=relaxed/simple;
	bh=RyV6owYhVXsTw8CuM/zcBqPbEK++ilJXeen2o0N6uys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=huaKf/SOEkAdcqp/M/QZmHHPidG5FQkyt1WiuMJ2E0q/PBKwbSVcMgt9dU9oOOTsDt5TtO0S/7Iat50axvgc8kfWMDyRoXfeMt+wKY2e7n4tB3OPwIJTbg567JEAhjFwjRx+UM9sZBGmAfWfRrJtapypxCKsKKnk+yc65NF0U3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfUFzGEY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfUFzGEY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so62799645e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750238184; x=1750842984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtB3MrGG5Z6/q4lkRB/z2qB2MecW5jefF/nUUV39+rc=;
        b=PfUFzGEYnU9MQPWHy6yuD6WWAgSQ2/RN5oyodr78aUTkQrErUUJD5oo8/L3dFsuyir
         QmRDkxZVVodzy3bxYGeZLnd/TmW6hDOvndkFzYt9o9VxSdS6Chu/F5aIO11N6y2H9Wrc
         KMoPMBkc7eMoMZ5K6KlrXSt4/97TStMaHlDUbFFs9GqaHa3Ipy+TdbVVvF1WsrxagXLo
         Ubdo3HWjdhYwLTd/2VZi623F8rFo+nNdj0CHmjXERtWcACQPS130V8dNyUNzjrzJEQdt
         FrE7Mwy0GuCNCYjq6eVxi4BHqk5k019o4grh7H8fGivAnP76yYlZjZOV80k9eoiF3QQU
         7iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238184; x=1750842984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtB3MrGG5Z6/q4lkRB/z2qB2MecW5jefF/nUUV39+rc=;
        b=B7RHvPxQ4+mffTppuZK1CMXMZnwBP03BdR1xD0rn21A6MfG3TlV00g457nm4xc94I6
         bftk+UohLpS7uaijRHIHBraF6tskhlGruwnQTBXWxgi9jkB5tG1hV1ofUV4d5DGJF+Ew
         MAap9M9tHY+IZRXsS5IVo9LXnynGhM25WR8dRJpw9M37YCfuFFpsYbVfxDWPcV+aRoU4
         kYyI079+2oznyc8ITR9oZNLi8K1bDuE5z+jysqX6GcBEYFNk9AeZnBy7tytk7glCOKDs
         1s711oxdH4Cqjh+RxBEvHwwzEcxZkyhvQRQmt7cFnYYK8PYeG1uJ96RbY1NeuViQxUSl
         NSWw==
X-Forwarded-Encrypted: i=1; AJvYcCWGFn2tM7v8lDKkIrVGuLfjP+Cz9ER46tvuZldfDC57pEe730TOvmiLfa/l8hAehiJp08yq1rDoRvcdCAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkP5fsdfrSZs466Aqn7sIwH3Yrqyxf2QFQQD8Jcz8NWGKaPnci
	mvFCcVl4zQIE4X1gnS5KCLbiGgxkVqPZI7txdArpvJgJgIN1BPyKyZka
X-Gm-Gg: ASbGnctPSCFJrR8Q8X3+E5ofFrKAdNyMH5o03or4hOp8mJ9564QXXZ6Bz4QwgSz1EDe
	sAY4I7Iy4NkVTjmkmQ4V4EnffAFG8/LnL7YQDySzQVPrCfH/gWSGKAov44vtklMc3/qm2HcbJaq
	zdXUXUgxczdqTD4zdb+Ei1OZcoMcfdWjBGW3zwxtaooATaJv2XIXlBJciIKuhseJdcZ38KpaeNy
	E0Jq0Hj+YO/JY17amGnMe7kaY+bVnlVvsAbgQQkndbeaScoOZzTVFzwFpEONL2tM6W8BK9wbF2V
	DnoGCTaedv5hjukRq6D9Hj2xDeNUaNlEPdDAPQUjyRqPDN8ThTtqs8YtYsy0oyRdWE1dAnnqkEB
	q0r+Az8H9zzxb+2fbhDPWJo9x
X-Google-Smtp-Source: AGHT+IFyAcdxquh0KTurPKL2DmMhOTLxDYI90tOVco4pPbm6RXg02CBvqqjdMw3rR4lNF3PPCT/EMA==
X-Received: by 2002:a05:600c:1c8c:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-4533cac2319mr127383875e9.28.1750238183489;
        Wed, 18 Jun 2025 02:16:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224956sm203243265e9.4.2025.06.18.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:16:23 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:16:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
Message-ID: <20250618101620.26533aca@pumpkin>
In-Reply-To: <7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
	<20250614095346.69130-10-david.laight.linux@gmail.com>
	<os452n92-2p25-2q4r-453r-0ps224s90r98@syhkavp.arg>
	<7r88r006-o704-7q1q-21o2-6n62o864oo79@syhkavp.arg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 21:33:23 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Tue, 17 Jun 2025, Nicolas Pitre wrote:
> 
> > On Sat, 14 Jun 2025, David Laight wrote:
> >   
> > > Replace the bit by bit algorithm with one that generates 16 bits
> > > per iteration on 32bit architectures and 32 bits on 64bit ones.
> > > 
> > > On my zen 5 this reduces the time for the tests (using the generic
> > > code) from ~3350ns to ~1000ns.
> > > 
> > > Running the 32bit algorithm on 64bit x86 takes ~1500ns.
> > > It'll be slightly slower on a real 32bit system, mostly due
> > > to register pressure.
> > > 
> > > The savings for 32bit x86 are much higher (tested in userspace).
> > > The worst case (lots of bits in the quotient) drops from ~900 clocks
> > > to ~130 (pretty much independant of the arguments).
> > > Other 32bit architectures may see better savings.
> > > 
> > > It is possibly to optimise for divisors that span less than
> > > __LONG_WIDTH__/2 bits. However I suspect they don't happen that often
> > > and it doesn't remove any slow cpu divide instructions which dominate
> > > the result.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> > 
> > Nice work. I had to be fully awake to review this one.
> > Some suggestions below.  
> 
> Here's a patch with my suggestions applied to make it easier to figure 
> them out. The added "inline" is necessary to fix compilation on ARM32. 
> The "likely()" makes for better assembly and this part is pretty much 
> likely anyway. I've explained the rest previously, although this is a 
> better implementation.
> 
> commit 99ea338401f03efe5dbebe57e62bd7c588409c5c
> Author: Nicolas Pitre <nico@fluxnic.net>
> Date:   Tue Jun 17 14:42:34 2025 -0400
> 
>     fixup! lib: mul_u64_u64_div_u64() Optimise the divide code
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 3c9fe878ce68..740e59a58530 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -188,7 +188,7 @@ EXPORT_SYMBOL(iter_div_u64_rem);
>  
>  #if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
>  
> -static u64 mul_add(u32 a, u32 b, u32 c)
> +static inline u64 mul_add(u32 a, u32 b, u32 c)
>  {
>  	return add_u64_u32(mul_u32_u32(a, b), c);
>  }
> @@ -246,7 +246,7 @@ static inline u32 mul_u64_long_add_u64(u64 *p_lo, u64 a, u32 b, u64 c)
>  
>  u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  {
> -	unsigned long d_msig, q_digit;
> +	unsigned long n_long, d_msig, q_digit;
>  	unsigned int reps, d_z_hi;
>  	u64 quotient, n_lo, n_hi;
>  	u32 overflow;
> @@ -271,36 +271,21 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  
>  	/* Left align the divisor, shifting the dividend to match */
>  	d_z_hi = __builtin_clzll(d);
> -	if (d_z_hi) {
> +	if (likely(d_z_hi)) {
>  		d <<= d_z_hi;
>  		n_hi = n_hi << d_z_hi | n_lo >> (64 - d_z_hi);
>  		n_lo <<= d_z_hi;
>  	}
>  
> -	reps = 64 / BITS_PER_ITER;
> -	/* Optimise loop count for small dividends */
> -	if (!(u32)(n_hi >> 32)) {
> -		reps -= 32 / BITS_PER_ITER;
> -		n_hi = n_hi << 32 | n_lo >> 32;
> -		n_lo <<= 32;
> -	}
> -#if BITS_PER_ITER == 16
> -	if (!(u32)(n_hi >> 48)) {
> -		reps--;
> -		n_hi = add_u64_u32(n_hi << 16, n_lo >> 48);
> -		n_lo <<= 16;
> -	}
> -#endif
> -
>  	/* Invert the dividend so we can use add instead of subtract. */
>  	n_lo = ~n_lo;
>  	n_hi = ~n_hi;
>  
>  	/*
> -	 * Get the most significant BITS_PER_ITER bits of the divisor.
> +	 * Get the rounded-up most significant BITS_PER_ITER bits of the divisor.
>  	 * This is used to get a low 'guestimate' of the quotient digit.
>  	 */
> -	d_msig = (d >> (64 - BITS_PER_ITER)) + 1;
> +	d_msig = (d >> (64 - BITS_PER_ITER)) + !!(d << BITS_PER_ITER);

If the low divisor bits are zero an alternative simpler divide
can be used (you want to detect it before the left align).
I deleted that because it complicates things and probably doesn't
happen often enough outside the tests cases.

>  
>  	/*
>  	 * Now do a 'long division' with BITS_PER_ITER bit 'digits'.
> @@ -308,12 +293,17 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  	 * The worst case is dividing ~0 by 0x8000 which requires two subtracts.
>  	 */
>  	quotient = 0;
> -	while (reps--) {
> -		q_digit = (unsigned long)(~n_hi >> (64 - 2 * BITS_PER_ITER)) / d_msig;
> +	for (reps = 64 / BITS_PER_ITER; reps; reps--) {
> +		quotient <<= BITS_PER_ITER;
> +		n_long = ~n_hi >> (64 - 2 * BITS_PER_ITER);
>  		/* Shift 'n' left to align with the product q_digit * d */
>  		overflow = n_hi >> (64 - BITS_PER_ITER);
>  		n_hi = add_u64_u32(n_hi << BITS_PER_ITER, n_lo >> (64 - BITS_PER_ITER));
>  		n_lo <<= BITS_PER_ITER;
> +		/* cut it short if q_digit would be 0 */
> +		if (n_long < d_msig)
> +			continue;

I don't think that is right.
d_msig is an overestimate so you can only skip the divide and mul_add().
Could be something like:
		if (n_long < d_msig) {
			if (!n_long)
				continue;
			q_digit = 0;
		} else {
			q_digit = n_long / d_msig;
	  		/* Add product to negated divisor */
	  		overflow += mul_u64_long_add_u64(&n_hi, d, q_digit, n_hi);		
		}
but that starts looking like branch prediction hell.

> +		q_digit = n_long / d_msig;

I think you want to do the divide right at the top - maybe even if the
result isn't used!
All the shifts then happen while the divide instruction is in progress
(even without out-of-order execution).

It is also quite likely that any cpu divide instruction takes a lot
less clocks when the dividend or quotient is small.
So if the quotient would be zero there isn't a stall waiting for the
divide to complete.

As I said before it is a trade off between saving a few clocks for
specific cases against adding clocks to all the others.
Leading zero bits on the dividend are very likely, quotients with
the low 16bits zero much less so (except for test cases).

>  		/* Add product to negated divisor */
>  		overflow += mul_u64_long_add_u64(&n_hi, d, q_digit, n_hi);
>  		/* Adjust for the q_digit 'guestimate' being low */
> @@ -322,7 +312,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  			n_hi += d;
>  			overflow += n_hi < d;
>  		}
> -		quotient = add_u64_long(quotient << BITS_PER_ITER, q_digit);
> +		quotient = add_u64_long(quotient, q_digit);

Moving the shift to the top (after the divide) may help instruction
scheduling (esp. without aggressive out-of-order execution).

	David

>  	}
>  
>  	/*

