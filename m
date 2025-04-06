Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16B2E62A3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 01:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743903992; cv=none; b=vCj0+drN9jFKYEnGfak6kwgrnay221937tGfEpTQTqC//e2XRglJAK2j5XeufCl65O6izCQargj9upWO+xxWTY+Rv/UYZLRjtHREB1sL8vlTVK3OYWcipIzd6qnS/iwRWxX1i1cS95DN/YiQuUKJyUquZnpoe9U9MzbUt3XNQtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743903992; c=relaxed/simple;
	bh=ss2E5ohHokOkjAnW3n8o0T+Sp3KO4h6xoaRqDFhfRn8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AbG6HCWdJoMEN6Z9qW+A6qJ/MYwmiyXZHwdQmwULZNYKr2NUfBDcH8h/rMB89L0wkbbBVOG4xC2LILhb66L8oE5RiZTTj+3T242BLVFnndVfxwowPd+ds6eHqMQFAFuNh0G1qxCR0gTkhYFH3ByfXzWqixBAQ7fOV40HPZrxY4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=B+QCjqjv; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="B+QCjqjv"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47664364628so34505951cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 18:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743903986; x=1744508786; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItM7Z2vLiedj8/lFKlaerXBmCJ0giuCBfs6pLICKwRY=;
        b=B+QCjqjvu7xYeR4SAvYCLnrdvBOPa7CLGwDM2v8autLU7tTEFpYhG4ewVdj1Y2+Cok
         OQ5u7Gay6XkZ05WpMm9cEZEhRv2UyXvS2LJcYJlFSxjWyC+eMaNF3gqwD5CiBadqbwLw
         3dnJYIT25bgdLRm5I4KKXn+AANpu+g6gRIlH6NuQKrhYdnc+Z2z3ARTag5KNP/anpACc
         pKULntvFTsdAuE3l3cGGvb3wx0fwpqX62DkkWVqYNYbMZDnFnnLYDlk7xfmSlSWVhNWG
         D9qluz22OXDC1Z9eD8FhUQkm9cNco+R/5fTJECLpaRd9H/pqX4rgbeXEKtxKHzEV/Hkf
         IwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743903986; x=1744508786;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItM7Z2vLiedj8/lFKlaerXBmCJ0giuCBfs6pLICKwRY=;
        b=hqqK56JdnZd4chcmJzdSctBEUGeYRx2d9v7ktYF0di1AHgRUHIb9HgBtPkbUfLz6+Y
         jJdqqzZZVa8eW6Pw6uvuKPsXDh59KBQSHEE6WjU7h9hTgpGxhdHmhsCkhxr2MPw0/zKo
         0Tyolu1cZCpBDc4zoqHp+s9BCqpDnCQ1HDoZh8zT3EbUVtxacAR74ltyc2EahtyBr0YT
         LHTHFFbPt+LhRc4Np9vkPnonqRPOkHvcQZbuPGLv4K22F5AczBVIzxCM3mvT3JUJ7PA+
         dNO46LCrmRCoIX/b7PUK5NSl3vHr7pJY4M9L9l27z63YhSoQraYDmuc2ZWINbtd2Kc9h
         VtHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+MBeQdKXsYaJuiWNYKY5ri2O+0vGLtlT0sr1ZACsrgfj8EQOuQ4ndwwKF0De0ACZ4vnLGQhs8gKkQFQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtbQ7/kBXSejSCIZH7DZe3sXQHksZIQW4pLPJYCsEtrw6NNF55
	wH2ch/x0XqZilMksgP88PkGBl1zGizOqSeQ4x8GOYWUMJ3u7q09GDupElddiT14=
X-Gm-Gg: ASbGncvn0mMzERC+Q13AxAbEubs2gEM8wxo92LZg2WIX/bX65euupNbboHRygBUUTsn
	6qZnOM+qcocIUGnD1DemWj/MIPj7LKQ1CJLWcW13T13BCddwdhTlsG1EMNvv/PjXikkQ30fEtpG
	qJNRjNG3kbRZvYZVqbKUBqBZB62XfGl4RKWXVmGFCE5sZ6mZvFOsZZk5KLntzgm7HhHe/kZ0Rkv
	UCLBOwj5DeDJ3la+APrMfmO83OPEbRHd7p+tO09nwEDB5R4xwJbyhMsWL4dn6O2cW4kkgJVouAK
	agSc1l7789unR/l23Iu5W0y3StJmja/SiuDF+jp98opNSpXmiGBrLk12nJ7YsvfW5Lnv64SLFC6
	4TzRwWk8=
X-Google-Smtp-Source: AGHT+IG0Oa/ge+ytH3/rxCJn8xYOpc+VOnBYsr80ahgwUtAMuKIsAvmdzpzfhXpAz5Kmp6/x9yxxrg==
X-Received: by 2002:a05:622a:348:b0:477:51c:d853 with SMTP id d75a77b69052e-47924c84e35mr103518891cf.9.1743903986603;
        Sat, 05 Apr 2025 18:46:26 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b0883e6sm42212991cf.37.2025.04.05.18.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 18:46:26 -0700 (PDT)
Date: Sat, 5 Apr 2025 21:46:25 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250405204530.186242-2-david.laight.linux@gmail.com>
Message-ID: <43q1qr20-9q83-74n7-no7p-n178p6s6p279@onlyvoer.pbz>
References: <20250405204530.186242-1-david.laight.linux@gmail.com> <20250405204530.186242-2-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Apr 2025, David Laight wrote:

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
> 
> Note that the cost of the 128bit divide will dwarf the rest of the code.
> This function is very slow on everything except x86-64 (very very slow
> on 32bit).
> 
> Add kerndoc definitions for all three functions.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

Sidenote: The 128-bits division cost is proportional to the number of 
bits in the final result. So if the result is 0x0080000000000000 then 
the loop will execute only once and exit early.

> ---
>  arch/x86/include/asm/div64.h | 19 +++++++++++-----
>  include/linux/math64.h       | 44 +++++++++++++++++++++++++++++++++++-
>  lib/math/div64.c             | 41 ++++++++++++++++++---------------
>  3 files changed, 79 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
> index 9931e4c7d73f..9322a35f6a39 100644
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
> +		asm ("mulq %2; addq %4,%%rax; adcq $0,%%rdx; divq %3"
> +			: "=a" (q)
> +			: "a" (a), "rm" (mul), "rm" (div), "rm" (add)
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
> index 6aaccc1626ab..e958170e64ab 100644
> --- a/include/linux/math64.h
> +++ b/include/linux/math64.h
> @@ -282,7 +282,49 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
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
>  
>  /**
>   * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rounded up
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 5faa29208bdb..50e025174495 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -183,26 +183,28 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  }
>  EXPORT_SYMBOL(iter_div_u64_rem);
>  
> -#ifndef mul_u64_u64_div_u64
> -u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> +#if !defined(mul_u64_add_u64_div_u64)
> +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  {
> -	if (ilog2(a) + ilog2(b) <= 62)
> -		return div64_u64(a * b, c);
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
> @@ -212,36 +214,39 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
>  
>  #endif
>  
> -	/* make sure c is not zero, trigger exception otherwise */
> +	if (!n_hi)
> +		return div64_u64(n_lo, d);
> +
> +	/* make sure d is not zero, trigger exception otherwise */
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wdiv-by-zero"
> -	if (unlikely(c == 0))
> +	if (unlikely(d == 0))
>  		return 1/0;
>  #pragma GCC diagnostic pop
>  
> -	int shift = __builtin_ctzll(c);
> +	int shift = __builtin_ctzll(d);
>  
>  	/* try reducing the fraction in case the dividend becomes <= 64 bits */
>  	if ((n_hi >> shift) == 0) {
>  		u64 n = shift ? (n_lo >> shift) | (n_hi << (64 - shift)) : n_lo;
>  
> -		return div64_u64(n, c >> shift);
> +		return div64_u64(n, d >> shift);
>  		/*
>  		 * The remainder value if needed would be:
> -		 *   res = div64_u64_rem(n, c >> shift, &rem);
> +		 *   res = div64_u64_rem(n, d >> shift, &rem);
>  		 *   rem = (rem << shift) + (n_lo - (n << shift));
>  		 */
>  	}
>  
> -	if (n_hi >= c) {
> +	if (n_hi >= d) {
>  		/* overflow: result is unrepresentable in a u64 */
>  		return -1;
>  	}
>  
>  	/* Do the full 128 by 64 bits division */
>  
> -	shift = __builtin_clzll(c);
> -	c <<= shift;
> +	shift = __builtin_clzll(d);
> +	d <<= shift;
>  
>  	int p = 64 + shift;
>  	u64 res = 0;
> @@ -256,8 +261,8 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
>  		n_hi <<= shift;
>  		n_hi |= n_lo >> (64 - shift);
>  		n_lo <<= shift;
> -		if (carry || (n_hi >= c)) {
> -			n_hi -= c;
> +		if (carry || (n_hi >= d)) {
> +			n_hi -= d;
>  			res |= 1ULL << p;
>  		}
>  	} while (n_hi);
> @@ -265,5 +270,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
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
