Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB467DA8C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747710208; cv=none; b=TIUGwv17p7/QC1vReuHVz5N/5Qg/Xx4S0P3fHTlgUddp1SSPFiVAJFnj76h3gXawCiZfeODbRWVoFKsBFcM+JFa+xupZqE5+MDjKnVe9tSVmAIgaNlhaGunbJGR/nyIkLdQe9tyGwOY/VqP18mDidpytn1kzfD6+pAYVz+funcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747710208; c=relaxed/simple;
	bh=3Sn5hp4ycxsKFgzAek1wub+Qwuq4xwSpecIF+oQYqaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ofm2279fOHPJHSUO0zim2aDmqvjwhg6Y+NZWIpgXyD0oSTPXytUbeaXLfc3DT+v8G06fEqh+aELd7I+pg/mor4iyLZpYSORsse30o2SLKzYSfFTTsMfU3FQJq2AEivqZ3S2Az5OQ+1/BTeE1n1mtWvXjb/wYxUGKgdAAgVv6Jrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xiz05MBJ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xiz05MBJ"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e1b40f68so625974385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747710203; x=1748315003; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=STLbVutaw71jjWq21blFRaH9SZZvKIXOXCSWUxZPZqk=;
        b=xiz05MBJ5Ks/kE65+80C9ukEhC6vm+hjTAoEE+2LoLP52Fj2MfIZfzU/o5KqXW0ljw
         EjvuXwOnswTBDeRqgS2nAcS7T1kcVubHUCFjxfm7f/GLlEUI+C8KY/W+m+e8H40sThyW
         l4jzicw1hNcGNADKEJgglhoYy0isbsQu4MjG3ZxkEBWv2kZscetmHGEzsm28Hv77LPqr
         onefIZlEFnQQ9Wj2lWX/MZ9IuFm9JdAXCyCF+caklVP8W9nDx7EgOdXokRU+xswVur43
         68vmPQmntSFWJsiREHnIQreXcZpuUMoQ/3HnVbq/8gdnyKjbov07nmLTLO8LFWz7hBuL
         oyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747710203; x=1748315003;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STLbVutaw71jjWq21blFRaH9SZZvKIXOXCSWUxZPZqk=;
        b=nq2ygeqqCwGlvdjjT1zXMwGNcUsN6h4UnbmYRPiuTtJxHnN61mfwUQt2RDpA3Nefad
         29Ov5TPYbNKKDRf0+ES+rGjtXIw9Ds09GIwEk4G3f0uDl7hClMMlx+YGR7/EF/gVL3bb
         MiX9vLoDgv1ulDoqs/Nb0HmTGmPHgH6aHcrfW7bDS++RdAUWokPqEV+Y5nHqGJEOXJxB
         ACG4WIuBDqC3Jc5+/LVSo11g7zZU3b0J1w67YB5/vqyDEFMaZT1SCpq2tIjo8+5OMSP8
         GwSi2d21NyuKxyKneIyAh1GwJxDPX/3Tp6dcS5VXoKM7VDYUsQCKdpNQnvkcA/jn0M0y
         9g9A==
X-Forwarded-Encrypted: i=1; AJvYcCU9BJA0dU1p03tLLGzArArSl+e/y5bJoSU5ZiX39NSYR5ju5TeaRAeqlYGoQxCGTQ/L4mZWv8wbiTby4Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+01opKd7kJT9c1XLfKPjtKzRnzBMhnPSABVNA2a+ygAPBsA4/
	1i5LotnpSXBCgG5ZEys+sYRCHwqxwOoQvb9bq1SEslHRf74tPayDnKlEuo6znx2bDAo=
X-Gm-Gg: ASbGnctWLtQ44BfUeoRzwzdyKbJjZCvT/xM00wI7g052zzG20hDIOh09g5+Bs4NrMFq
	aIl/FreMZwxf6LIkIQxxYgFFoUXW6v7tRoaNVxQHZH/Y8WAQYs05NOM+WsPZuaz+YYTOz7fQbb+
	1jeK/ftUHlSqpt47Fh24HELLdp1YhRHOxopJfdOpsHquGFECzbEeD3IkX0By+UJXcePuCf9lMsF
	xEBKyfsvJfpudlUpK3eLHaiKau+rfpoteOyoFy48eyYxxnMbaUkA8lPlu3xWEWcKDt5jBZ8utvD
	WZR2DudW6tN3XHPhObPyN4utyrqX2UKXh0t00sMlEGIZrtuxkpny5zD9dfNfnWr1QTt416pwSge
	yO/mnTDTaIz8pFg==
X-Google-Smtp-Source: AGHT+IFveKoecqxyrrMr/sMzRAl3GyCZtOQj7VchCGFb9GY9bqLhqSYM+1FfWvXsNMd9tgPEknnRHA==
X-Received: by 2002:a05:620a:3942:b0:7ce:be04:f838 with SMTP id af79cd13be357-7cebe04f87emr875915385a.18.1747710203088;
        Mon, 19 May 2025 20:03:23 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bc2dbsm676742585a.15.2025.05.19.20.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 20:03:22 -0700 (PDT)
Date: Mon, 19 May 2025 23:03:21 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 3/4] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250518133848.5811-4-david.laight.linux@gmail.com>
Message-ID: <321rs9r7-8858-p195-263n-49q78q8rn25o@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-4-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 May 2025, David Laight wrote:

> The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
> variant needs 'divisor - 1' adding in between the multiply and
> divide so cannot easily be done by a caller.
> 
> Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
> and implement the 'round down' and 'round up' using it.
> 
> Update the x86-64 asm to optimise for 'c' being a constant zero.
> 
> For architectures that support u128 check for a 64bit product after
> the multiply (will be cheap).
> Leave in the early check for other architectures (mostly 32bit) when
> 'c' is zero to avoid the multi-part multiply.

I agree with this, except for the "'c' is zero" part. More below.

> Note that the cost of the 128bit divide will dwarf the rest of the code.
> This function is very slow on everything except x86-64 (very very slow
> on 32bit).
> 
> Add kerndoc definitions for all three functions.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
> Changes for v2 (formally patch 1/3):
> - Reinstate the early call to div64_u64() on 32bit when 'c' is zero.
>   Although I'm not convinced the path is common enough to be worth
>   the two ilog2() calls.
> 
>  arch/x86/include/asm/div64.h | 19 ++++++++++-----
>  include/linux/math64.h       | 45 +++++++++++++++++++++++++++++++++++-
>  lib/math/div64.c             | 21 ++++++++++-------
>  3 files changed, 70 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
> index 9931e4c7d73f..7a0a916a2d7d 100644
> --- a/arch/x86/include/asm/div64.h
> +++ b/arch/x86/include/asm/div64.h
> @@ -84,21 +84,28 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
>   * Will generate an #DE when the result doesn't fit u64, could fix with an
>   * __ex_table[] entry when it becomes an issue.
>   */
> -static inline u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div)
> +static inline u64 mul_u64_add_u64_div_u64(u64 a, u64 mul, u64 add, u64 div)
>  {
>  	u64 q;
>  
> -	asm ("mulq %2; divq %3" : "=a" (q)
> -				: "a" (a), "rm" (mul), "rm" (div)
> -				: "rdx");
> +	if (statically_true(!add)) {
> +		asm ("mulq %2; divq %3" : "=a" (q)
> +					: "a" (a), "rm" (mul), "rm" (div)
> +					: "rdx");
> +	} else {
> +		asm ("mulq %2; addq %3, %%rax; adcq $0, %%rdx; divq %4"
> +			: "=a" (q)
> +			: "a" (a), "rm" (mul), "rm" (add), "rm" (div)
> +			: "rdx");
> +	}
>  
>  	return q;
>  }
> -#define mul_u64_u64_div_u64 mul_u64_u64_div_u64
> +#define mul_u64_add_u64_div_u64 mul_u64_add_u64_div_u64
>  
>  static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 div)
>  {
> -	return mul_u64_u64_div_u64(a, mul, div);
> +	return mul_u64_add_u64_div_u64(a, mul, 0, div);
>  }
>  #define mul_u64_u32_div	mul_u64_u32_div
>  
> diff --git a/include/linux/math64.h b/include/linux/math64.h
> index 6aaccc1626ab..e1c2e3642cec 100644
> --- a/include/linux/math64.h
> +++ b/include/linux/math64.h
> @@ -282,7 +282,50 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
>  }
>  #endif /* mul_u64_u32_div */
>  
> -u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
> +/**
> + * mul_u64_add_u64_div_u64 - unsigned 64bit multiply, add, and divide
> + * @a: first unsigned 64bit multiplicand
> + * @b: second unsigned 64bit multiplicand
> + * @c: unsigned 64bit addend
> + * @d: unsigned 64bit divisor
> + *
> + * Multiply two 64bit values together to generate a 128bit product
> + * add a third value and then divide by a fourth.
> + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
> + *
> + * Return: (@a * @b + @c) / @d
> + */
> +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d);
> +
> +/**
> + * mul_u64_u64_div_u64 - unsigned 64bit multiply and divide
> + * @a: first unsigned 64bit multiplicand
> + * @b: second unsigned 64bit multiplicand
> + * @d: unsigned 64bit divisor
> + *
> + * Multiply two 64bit values together to generate a 128bit product
> + * and then divide by a third value.
> + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.

If the quotient exceeds 64 bits, the optimized x86 version truncates the 
value to the low 64 bits. The C version returns a saturated value i.e. 
UINT64_MAX (implemented with a -1). Nothing actually traps in that case.

> + *
> + * Return: @a * @b / @d
> + */
> +#define mul_u64_u64_div_u64(a, b, d) mul_u64_add_u64_div_u64(a, b, 0, d)
> +
> +/**
> + * mul_u64_u64_div_u64_roundup - unsigned 64bit multiply and divide rounded up
> + * @a: first unsigned 64bit multiplicand
> + * @b: second unsigned 64bit multiplicand
> + * @d: unsigned 64bit divisor
> + *
> + * Multiply two 64bit values together to generate a 128bit product
> + * and then divide and round up.
> + * May BUG()/trap if @d is zero or the quotient exceeds 64 bits.
> + *
> + * Return: (@a * @b + @d - 1) / @d
> + */
> +#define mul_u64_u64_div_u64_roundup(a, b, d) \
> +	({ u64 _tmp = (d); mul_u64_add_u64_div_u64(a, b, _tmp - 1, _tmp); })
> +
>  
>  /**
>   * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rounded up
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index c426fa0660bc..66bfb6159f02 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -183,29 +183,31 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  }
>  EXPORT_SYMBOL(iter_div_u64_rem);
>  
> -#ifndef mul_u64_u64_div_u64
> -u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> +#ifndef mul_u64_add_u64_div_u64
> +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  {
>  	/* Trigger exception if divisor is zero */
>  	BUG_ON(!d);
>  
> -	if (ilog2(a) + ilog2(b) <= 62)
> -		return div64_u64(a * b, d);
> -
>  #if defined(__SIZEOF_INT128__)
>  
>  	/* native 64x64=128 bits multiplication */
> -	u128 prod = (u128)a * b;
> +	u128 prod = (u128)a * b + c;
>  	u64 n_lo = prod, n_hi = prod >> 64;
>  
>  #else
>  
> +	if (!c && ilog2(a) + ilog2(b) <= 62)
> +		return div64_u64(a * b, d);
> +

Here you should do:

	if (ilog2(a) + ilog2(b) <= 62) {
		u64 ab = a * b;
		u64 abc = ab + c;
		if (ab <= abc)
			return div64_u64(abc, d);
	}

This is cheap and won't unconditionally discard the faster path when c != 0;

>  	/* perform a 64x64=128 bits multiplication manually */
>  	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
>  	u64 x, y, z;
>  
> -	x = (u64)a_lo * b_lo;
> +	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
> +	x = (u64)a_lo * b_lo + (u32)c;
>  	y = (u64)a_lo * b_hi + (u32)(x >> 32);
> +	y += (u32)(c >> 32);
>  	z = (u64)a_hi * b_hi + (u32)(y >> 32);
>  	y = (u64)a_hi * b_lo + (u32)y;
>  	z += (u32)(y >> 32);
> @@ -215,6 +217,9 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  
>  #endif
>  
> +	if (!n_hi)
> +		return div64_u64(n_lo, d);
> +
>  	int shift = __builtin_ctzll(d);
>  
>  	/* try reducing the fraction in case the dividend becomes <= 64 bits */
> @@ -261,5 +266,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  
>  	return res;
>  }
> -EXPORT_SYMBOL(mul_u64_u64_div_u64);
> +EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
>  #endif
> -- 
> 2.39.5
> 
> 
