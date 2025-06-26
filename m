Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94940442C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974385; cv=none; b=EFF940nBXIvFnd2W6J3WVdYuuIaAWcmyL9D7x0xu76cf3Ra6RUSZEfWzfG8Y4ueNkkstP6leIkrjvxv3yv2CMbZWkErg/Vjqq8recwz7yLuOXQbjgnuZIy/TPQeSvM6fAYCb+SpHaX4grla1F+oWTe4e7Z8+YxWtcTmbB90JUTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974385; c=relaxed/simple;
	bh=SYggdW+Oj1ASw8OMt8WlVOU6zmWERR6Z4LKYAmO8i3s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rm7yYgT39XiWrieQUF6OeL92eOKyHSOx0QFALpSrKXosuVhmNFl5ApjIrU/80HGnEQunB/CdGsqR1zKwkzOLTqRAKCXe8NlpFkd45isiL2xMLvgrzVzsSLRUxMhFpwhPhKog9vNvQ8CM5DThH7OgrzImfN6HwyKw51v4aA1BWlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKc/7BBI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKc/7BBI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453643020bdso13346745e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750974382; x=1751579182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9dFcHJ5wVOHpS+CSaHTpOD6sWwHW0LqFeFqBoQDNw0=;
        b=mKc/7BBIzhBhuf5AP/9f/vUYXEZ9saF5bZvnWA+7gRtfgQH6i2PeTITuTxWxRYg/8F
         LaqQUgZ8FZTlsvpwUxJ4+/zXn0wmUJZEBBAc0C/Xck8OfV2W9e9A2lZNwt2r437DHvgM
         uNWyaHOYCQ+KNDSSVdIX4rYz7kwv/O2/tSpZCL5/j4X1PMiFt4eLNrY/PloMNiXpm4BB
         3O0pgrpyirCD+UE3IxuD0SKgPWckCEkEdxsSctLTHUpLy8OmUD65Sw9jBdAmglEZjTAu
         j20hDG1VI8x/QdzC3935wEZHG6nb5HpDup+p1bRQMmcTEg1WItXJEXAewKg0FaQJPKxB
         c9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974382; x=1751579182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9dFcHJ5wVOHpS+CSaHTpOD6sWwHW0LqFeFqBoQDNw0=;
        b=ujM/sG/4pXn3Jxv8QtwBMkuYddf9VhLfS51EblRxBF8KUAzl9/m85xF3mo+XOSqAf2
         s89GiOWyLmhWf59jdbbAjNZBCM8WkETFupY6xAyT6hKgHYwSanxPX7zC8Vlry446XzMb
         a71uqaR+TEyPdqmLdzwUZ/ktn/OoiwZHsq6MZpf/zI+P604Itgu2Fhdbimb3VhfAzPck
         D/XrkCAQ4KckwSF9hCTGxl21CRvqlUKp3n+GMG/NyM8TR2cr3Nf9+ZzBzdcmqhGE3yZf
         OtH0aEyDNxnWzeeCI7nO7tN6p7XwtF+0uI0qTp8BJYaRMIF2Jl2r2v1UKg2GVBXIjHV9
         lzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUDN8ejKjQLjl0/Rs7kUoF3zclY9jSGlyrrw1zUYujMq1QJg7AglXIEUTiEXgSo89aCeziHj/pQUQkEKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHjFrvH5bV+WXpxt5WmW11mAIlTCwo0kyNIQJ0tc94aSNWNQv
	hF/hZXaEi9xnM8aTF+lv8PVIUKsNAkNjFFOUwmn/wlmYKGF8/xoFw6cV
X-Gm-Gg: ASbGncsNHYHcihWShFOZOzRi1Ii4IXPk9QeoZPjaGwXQFkH+JkHXRe3PeQvWopHefyL
	CNYFOadCRj6gjzhZvXFjCIAcx2F7oLESMzDVGPDzF/ZTEqjIgtd5dxfHi/0j55ycJ07PpXSXGUF
	h+tVlvzj1tZyh6wPQQtXrtHMdI2CU/oP4uEgC45TEELNhOVdosOEKbv//i4F/jjBg5Pzcz3z35K
	PLU5QgXEiMTYvk86UelOo/oswELuGD1YfaYl1c8ACB1jLhGX51h1prJkCDKeXPdy0u6+KSzdRAn
	C6YPv2pyB47KMBdKc9a2y1xHdwPXSyQ9WluDrLBQjowbcVIKuPcm/+kgYb/HH/O2+C87VBbYxsH
	c4vycvZr5aP3B6sDowhOJL/nX
X-Google-Smtp-Source: AGHT+IGe4T0Kx3hD0mK8w2ivDGt+iTBk6RfAevX2l36+jyTqG3oeBQK3Hzfaa1JxC7CKI/iWUWyjhg==
X-Received: by 2002:a05:600c:529b:b0:453:8042:ba9a with SMTP id 5b1f17b1804b1-4538ee8590bmr7446965e9.28.1750974381515;
        Thu, 26 Jun 2025 14:46:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ca4sm918182f8f.58.2025.06.26.14.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:46:21 -0700 (PDT)
Date: Thu, 26 Jun 2025 22:46:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 09/10] lib: mul_u64_u64_div_u64() Optimise the
 divide code
Message-ID: <20250626224618.757dff9a@pumpkin>
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

I've been trying to find time to do some more performance measurements.
I did a few last night and managed to realise at least some of what
is happening.

I've dropped the responses in here since there is a copy of the code.

The 'TLDR' is that the full divide takes my zen5 about 80 clocks
(including some test red tape) provided the branch-predictor is
predicting correctly.
I get that consistently for repeats of the same division, and moving
onto the next one - provided they take the same path.
(eg for the last few 'random' value tests.)
However if I include something that takes a different path (eg divisor
doesn't have the top bit set, or the product has enough high zero bits
to take the 'optimised' path then the first two or three repeats of the
next division are at least 20 clocks slower.
In the kernel these calls aren't going to be common enough (and with
similar inputs) to train the branch predictor.
So the mispredicted branches really start to dominate.
This is similar to the issue that Linus keeps mentioning about kernel
code being mainly 'cold cache'.

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

If inline is needed, it need to be always_inline.

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

I don't think likely() helps much.
But for 64bit this can be unconditional...

>  		d <<= d_z_hi;
>  		n_hi = n_hi << d_z_hi | n_lo >> (64 - d_z_hi);

... replace 'n_lo >> (64 - d_z_hi)' with 'n_lo >> (63 - d_z_hi) >> 1'.
The extra shift probably costs too much on 32bit though.


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

You don't want the branch in the loop.
Once predicted correctly is makes little difference where you put
the test - but that won't be 'normal'
Unless it gets trained odd-even it'll get mispredicted at least once.
For 64bit (zen5) the test outside the loop was less bad
(IIRC dropped to 65 clocks - so probably worth it).
I need to check an older cpu (got a few Intel ones).


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

For 64bit x64 that is pretty much zero cost
(gcc manages to use the 'Z' flag from the '<< 32' in a 'setne' to get a 1
I didn't look hard enough to find where the zero register came from
since 'setne' of changes the low 8 bits).
But it is horrid for 32bit - added quite a few clocks.
I'm not at all sure it is worth it though.


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

As I said above that gets misprediced too often

> +		q_digit = n_long / d_msig;

I fiddled with the order of the lines of code - changes the way the object
code is laid out and change the clock count 'randomly' by one or two.
Noise compared to mispredicted branches.

I've not tested on an older system with a slower divide.
I suspect older (Haswell and Broadwell) may benefit from the divide
being scheduled earlier.

If anyone wants of copy of the test program I can send you a copy.

	David

>  		/* Add product to negated divisor */
>  		overflow += mul_u64_long_add_u64(&n_hi, d, q_digit, n_hi);
>  		/* Adjust for the q_digit 'guestimate' being low */
> @@ -322,7 +312,7 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  			n_hi += d;
>  			overflow += n_hi < d;
>  		}
> -		quotient = add_u64_long(quotient << BITS_PER_ITER, q_digit);
> +		quotient = add_u64_long(quotient, q_digit);
>  	}
>  
>  	/*

