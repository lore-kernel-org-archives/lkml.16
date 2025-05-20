Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7BC48CFC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777028; cv=none; b=El88qcpdBevt2GLwhzutCPpC536WKxE/B3dGCSIjejSwA3nLdCJjVi6EXHHXnxALWkl/gPtw6TXxxzfN2II2GjYVjV++sh+JNJu8AUC3xZhVyXLbiey6quUTTgMNMQ6lkMrPqBzt0wBKAvmc/BxJEP1o6nT/FNMWWg74pETkoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777028; c=relaxed/simple;
	bh=da7A3uupWOR7mdjDMhyAiKUAfxED6sgWtC/cudr4hTU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgseeiHIcK1X7H1YX33BUZoRR/EuFTGWyjKgBr5nqo8BNafy9uvseBClC9AzBAcj1LO4WvGtLo3ygwbidT2595LypqHl1i8Off6DRVGSRgl11Llc9P/J/OQWo1cxKPJXszv1UwJYrHfV5gGAe2BGZVyJEtNYAZArCrDWyKM6C+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VybdZvlj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VybdZvlj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a36748920cso3415878f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747777023; x=1748381823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP2+FDrttIRhHfkFOIKt8htcfG0QXjA4m800+Y18hWw=;
        b=VybdZvlj3IAR4DZJXGyjrYG5BWOA+0QzCEu1o6bUVJxo1UZ3njKZJxDXZvGF+8AnxQ
         mScijJZNJJ4g80nCtiQnVGGh8Bga2+6CXHnqQ6ci8R1OKtQLES5aGJab1SjaBK4hrnlO
         D8Tl+hRIi8ZUGZ+GcUPzxiyn8lS3eyobBr7y9xOc/paow69zn+ePEeaDkrzDORnmAvQZ
         HB2Z1bprstnjYrdM4TUhhzkVnVWc1/7qhgsAvfgL5cZGaANlwpipn2siGGhlxvWeguWn
         KBAnDYCSachRxri9WlVNJzunEpPAhc4zR3PUcHNo8+2k6LSMXOPl4IwAarfsclzNaszh
         h2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777023; x=1748381823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZP2+FDrttIRhHfkFOIKt8htcfG0QXjA4m800+Y18hWw=;
        b=aZK845L9Zr2NrlEoI0cWcSt9eQAvTBwU4d3Gn16D0bTPErgW05NKIl/q7VdDnMXXrP
         lJtoki9amI25uF1FKQ6RiDcmmmnLBgPVQkjaJ4Rcro3S8r7QjVPc7ceoxOtI5Qzos5f1
         GvmRihJ31YiJEJUEkbVxTRjfDR8gWcADxf+Zlq16asNiVty6xAmwvIjtmD7Vwv7afav8
         u7OVbvJb/oRO9FKbhe5iuw79/r6gkgrd/xatOGMo7pVsuMIrzX99N9whkMGAqnNEhVwy
         P0P4eGuQfxqhNu56UG8crKcJqqYoJySiJPc2GiTsWUEnEGtT4wi9vEzYDeyj9XH10wJC
         raTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWJqi9lYewcl38UswkYiaaLv33cSPbf7XwHOYDUKcyR5FKzOmVX5r5hX/heTRiff97F/cjobeh9z0xuoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNCvq2wfUzuqvWdgbKAOu32B8SwgeRwKoakyiuQvcQksnZb4tj
	gjjKW/cKuIZjljyjYTQFp/Isqu6oNRq1ojq26mdAlLFqNR8cxDXf/nYd6hjbbg==
X-Gm-Gg: ASbGncv00JNaR3jPy/6bo4Wldb4B0t7rQhFKVTTdbR1AAGKqZO88zYbQKHmcPfT3/Mf
	qdNomqinpxsWhx43aB1uHQvOYE8txJ1hspCAkxY/v7KiawPm0YCc08HOKetSWzxGO7Dog89IyIv
	zmBgR4GluZWHsuPZS9fWKkKYLaTQRGEHXwzoT6e4WwfSAGwkSYqaSa+kUZFGW0P+wZ6I2f5HA+q
	MtXH0sDs5Y1yVrjjObwKbzKbx+V3OfqO8Dx7wV/edfkE2IfjAw1r3Z/kWD7miI8nYiN4pogJufX
	5Inmexm7/YvyJYc1wo7CokMKM248Z1T0AwvCpGQObMvjfSBTQyqgy0bIflcNlNL3L67nYa0KeHB
	wUndaoixAm1oJlw==
X-Google-Smtp-Source: AGHT+IHRkDCI5OXh3kZEGu13ZTAzdCPIj1t5iPfTmdFb3bLcj/Te2tcVh9VsSaFnzYqqAzH2bO4nCA==
X-Received: by 2002:a05:6000:420d:b0:3a3:779b:5b41 with SMTP id ffacd0b85a97d-3a3779b5b4fmr5370417f8f.28.1747777023133;
        Tue, 20 May 2025 14:37:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3674fed67sm13438383f8f.89.2025.05.20.14.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:37:02 -0700 (PDT)
Date: Tue, 20 May 2025 22:37:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 3/4] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
Message-ID: <20250520223700.2ec735fd@pumpkin>
In-Reply-To: <321rs9r7-8858-p195-263n-49q78q8rn25o@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com>
	<20250518133848.5811-4-david.laight.linux@gmail.com>
	<321rs9r7-8858-p195-263n-49q78q8rn25o@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 May 2025 23:03:21 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> On Sun, 18 May 2025, David Laight wrote:
> 
> > The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
> > variant needs 'divisor - 1' adding in between the multiply and
> > divide so cannot easily be done by a caller.
> > 
> > Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
> > and implement the 'round down' and 'round up' using it.
> > 
> > Update the x86-64 asm to optimise for 'c' being a constant zero.
> > 
> > For architectures that support u128 check for a 64bit product after
> > the multiply (will be cheap).
> > Leave in the early check for other architectures (mostly 32bit) when
> > 'c' is zero to avoid the multi-part multiply.  
> 
> I agree with this, except for the "'c' is zero" part. More below.
> 
> > Note that the cost of the 128bit divide will dwarf the rest of the code.
> > This function is very slow on everything except x86-64 (very very slow
> > on 32bit).
> > 
> > Add kerndoc definitions for all three functions.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> > Changes for v2 (formally patch 1/3):
> > - Reinstate the early call to div64_u64() on 32bit when 'c' is zero.
> >   Although I'm not convinced the path is common enough to be worth
> >   the two ilog2() calls.
> > 
> >  arch/x86/include/asm/div64.h | 19 ++++++++++-----
> >  include/linux/math64.h       | 45 +++++++++++++++++++++++++++++++++++-
> >  lib/math/div64.c             | 21 ++++++++++-------
> >  3 files changed, 70 insertions(+), 15 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
> > index 9931e4c7d73f..7a0a916a2d7d 100644
> > --- a/arch/x86/include/asm/div64.h
> > +++ b/arch/x86/include/asm/div64.h
> > @@ -84,21 +84,28 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
> >   * Will generate an #DE when the result doesn't fit u64, could fix with an
> >   * __ex_table[] entry when it becomes an issue.
> >   */
> > -static inline u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div)
> > +static inline u64 mul_u64_add_u64_div_u64(u64 a, u64 mul, u64 add, u64 div)
> >  {
> >  	u64 q;
> >  
> > -	asm ("mulq %2; divq %3" : "=a" (q)
> > -				: "a" (a), "rm" (mul), "rm" (div)
> > -				: "rdx");
> > +	if (statically_true(!add)) {
> > +		asm ("mulq %2; divq %3" : "=a" (q)
> > +					: "a" (a), "rm" (mul), "rm" (div)
> > +					: "rdx");
> > +	} else {
> > +		asm ("mulq %2; addq %3, %%rax; adcq $0, %%rdx; divq %4"
> > +			: "=a" (q)
> > +			: "a" (a), "rm" (mul), "rm" (add), "rm" (div)
> > +			: "rdx");
> > +	}
> >  
> >  	return q;
> >  }
> > -#define mul_u64_u64_div_u64 mul_u64_u64_div_u64
> > +#define mul_u64_add_u64_div_u64 mul_u64_add_u64_div_u64
> >  
> >  static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 div)
> >  {
> > -	return mul_u64_u64_div_u64(a, mul, div);
> > +	return mul_u64_add_u64_div_u64(a, mul, 0, div);
> >  }
> >  #define mul_u64_u32_div	mul_u64_u32_div
> >  
> > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > index 6aaccc1626ab..e1c2e3642cec 100644
> > --- a/include/linux/math64.h
> > +++ b/include/linux/math64.h
> > @@ -282,7 +282,50 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
> >  }
> >  #endif /* mul_u64_u32_div */
> >  
> > -u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
> > +/**
> > + * mul_u64_add_u64_div_u64 - unsigned 64bit multiply, add, and divide
> > + * @a: first unsigned 64bit multiplicand
> > + * @b: second unsigned 64bit multiplicand
> > + * @c: unsigned 64bit addend
> > + * @d: unsigned 64bit divisor
> > + *
> > + * Multiply two 64bit values together to generate a 128bit product
> > + * add a third value and then divide by a fourth.
> > + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
> > + *
> > + * Return: (@a * @b + @c) / @d
> > + */
> > +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d);
> > +
> > +/**
> > + * mul_u64_u64_div_u64 - unsigned 64bit multiply and divide
> > + * @a: first unsigned 64bit multiplicand
> > + * @b: second unsigned 64bit multiplicand
> > + * @d: unsigned 64bit divisor
> > + *
> > + * Multiply two 64bit values together to generate a 128bit product
> > + * and then divide by a third value.
> > + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.  
> 
> If the quotient exceeds 64 bits, the optimized x86 version truncates the 
> value to the low 64 bits. The C version returns a saturated value i.e. 
> UINT64_MAX (implemented with a -1). Nothing actually traps in that case.

Nope. I've only got the iAPX 286 and 80386 reference manuals to hand.
Both say that 'interrupt 0' happens on overflow.
I don't expect the later documentation is any different.

If the kernel code is going to have an explicit instruction to trap
(rather then the code 'just trapping') it really is best to use BUG().
If nothing else it guarantees a trap regardless of the architecture
and compiler.

> 
> > + *
> > + * Return: @a * @b / @d
> > + */
> > +#define mul_u64_u64_div_u64(a, b, d) mul_u64_add_u64_div_u64(a, b, 0, d)
> > +
> > +/**
> > + * mul_u64_u64_div_u64_roundup - unsigned 64bit multiply and divide rounded up
> > + * @a: first unsigned 64bit multiplicand
> > + * @b: second unsigned 64bit multiplicand
> > + * @d: unsigned 64bit divisor
> > + *
> > + * Multiply two 64bit values together to generate a 128bit product
> > + * and then divide and round up.
> > + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
> > + *
> > + * Return: (@a * @b + @d - 1) / @d
> > + */
> > +#define mul_u64_u64_div_u64_roundup(a, b, d) \
> > +	({ u64 _tmp = (d); mul_u64_add_u64_div_u64(a, b, _tmp - 1, _tmp); })
> > +
> >  
> >  /**
> >   * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rounded up
> > diff --git a/lib/math/div64.c b/lib/math/div64.c
> > index c426fa0660bc..66bfb6159f02 100644
> > --- a/lib/math/div64.c
> > +++ b/lib/math/div64.c
> > @@ -183,29 +183,31 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
> >  }
> >  EXPORT_SYMBOL(iter_div_u64_rem);
> >  
> > -#ifndef mul_u64_u64_div_u64
> > -u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> > +#ifndef mul_u64_add_u64_div_u64
> > +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> >  {
> >  	/* Trigger exception if divisor is zero */
> >  	BUG_ON(!d);
> >  
> > -	if (ilog2(a) + ilog2(b) <= 62)
> > -		return div64_u64(a * b, d);
> > -
> >  #if defined(__SIZEOF_INT128__)
> >  
> >  	/* native 64x64=128 bits multiplication */
> > -	u128 prod = (u128)a * b;
> > +	u128 prod = (u128)a * b + c;
> >  	u64 n_lo = prod, n_hi = prod >> 64;
> >  
> >  #else
> >  
> > +	if (!c && ilog2(a) + ilog2(b) <= 62)
> > +		return div64_u64(a * b, d);
> > +  
> 
> Here you should do:
> 
> 	if (ilog2(a) + ilog2(b) <= 62) {
> 		u64 ab = a * b;
> 		u64 abc = ab + c;
> 		if (ab <= abc)
> 			return div64_u64(abc, d);
> 	}
> 
> This is cheap and won't unconditionally discard the faster path when c != 0;

That isn't really cheap.
ilog2() is likely to be a similar cost to a multiply
(my brain remembers them both as 'latency 3' on x86).
My actual preference is to completely delete that test and rely
on the post-multiply check.

The 64 by 64 multiply code is actually fairly cheap.
On x86-64 it is only a few clocks slower than the u128 version
(and that is (much) the same code that should be generated for 32bit).

> 
> >  	/* perform a 64x64=128 bits multiplication manually */
> >  	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
> >  	u64 x, y, z;
> >  
> > -	x = (u64)a_lo * b_lo;
> > +	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
> > +	x = (u64)a_lo * b_lo + (u32)c;
> >  	y = (u64)a_lo * b_hi + (u32)(x >> 32);
> > +	y += (u32)(c >> 32);

Those two adds to y should be swapped - I need to do a v3 and will swap them.
It might save one clock - my timing code is accurate, but not THAT accurate.

> >  	z = (u64)a_hi * b_hi + (u32)(y >> 32);
> >  	y = (u64)a_hi * b_lo + (u32)y;
> >  	z += (u32)(y >> 32);
> > @@ -215,6 +217,9 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)

If we assume the compiler is sane (gcc isn't), a/b_hi/lo are in registers
and mul has a latency of 3 (and add 1) the code above can execute as:
clock 0: x_h/x_lo = a_lo * b_lo
clock 1: y_h/y_lo = a_lo * b_hi
clock 2: y1_ho/y1_lo = a_hi * b_lo
clock 3: z_hi/z_lo = a_hi + b_hi; x_lo += c_lo
clock 4: x_hi += carry; y_lo += c_hi
clock 5: y_hi += carry; y_lo += x_hi
clock 6: y_hi += carry; y1_lo += y_lo
clock 7: y1_hi += carry; z_lo += y_hi
clock 8: z_hi += carry; z_lo += y1_hi
clock 9: z_hi += carry
I don't think any more instructions can run in parallel.
But it really isn't that long an all.
Your 'fast path' test will be nearly that long even ignoring
mis-predicted branches.

For my updated version I've managed to stop gcc spilling zero words
to stack!

	David

> >  
> >  #endif
> >  
> > +	if (!n_hi)
> > +		return div64_u64(n_lo, d);
> > +
> >  	int shift = __builtin_ctzll(d);
> >  
> >  	/* try reducing the fraction in case the dividend becomes <= 64 bits */
> > @@ -261,5 +266,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> >  
> >  	return res;
> >  }
> > -EXPORT_SYMBOL(mul_u64_u64_div_u64);
> > +EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
> >  #endif
> > -- 
> > 2.39.5
> > 
> >   

