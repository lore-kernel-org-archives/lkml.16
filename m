Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3269A6D17
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749915118; cv=none; b=L+LpBLzJn8Z7nC7hWdQhRjdlMXVIEFVS1jW8PvO5BivfxAH+liep58teGqiJaCsP5HcJTnB7eB4XWwNbE83Ufx2xl6GSe0Y0ykmmJn3Wgeag6ZaNPIbLVFTdCWxZXpoTiPiKbXXH9jiIG94n9MGr0RWZ5iAIdUK2ATJCEDJx5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749915118; c=relaxed/simple;
	bh=5s3PbTmMFmBEqC0tp5Ogls2Sp2GfnQKPirfD9Xe+flU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BITGHEAFc6gwsAVuAD83zMYY6SVoSp2vjGbd9KhPDdA6klzxolggiLgq/UcHg6uUXz2H4j7YW2fvzv0En07tP0smySmbuLMRpizTFsyvSzyDLsZ1RpqIQvO/3g9sbuKgLclZF4ZbgO/6d0ljnCZlkfp4S6cXx1yu7CNDvi7Ily0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vOrYxsOS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vOrYxsOS"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d20f79a00dso431955285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749915114; x=1750519914; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffW3H0bnnHkzNpApn+Q0DtoWGwSGMCBvGEREk/RINPU=;
        b=vOrYxsOS8x68NEDhGMXeGyLIZTvYnHI6J1qRCUXG0hAmhHqlNgFVyxd5eryfyjiq2e
         p67j4miHbzdD/VkTlhCQaGvGvfZw/74KzhTtYvgeT8+bSDEGDCR3riKXAEI5lNP8i26d
         yOJHc1nMURjmbI9XZqEqn/iVWlzoUOT7zhm7f+e2WSbJULPlfS4nu+Pn0b6bfeakIPWk
         vorDdMm0XV0b+gQ+/32Xqy66XzVYC+QLeKmqxjVvrtXXnBNpaqO9WhNIfEvJ7WinNbTu
         T4rFcMHmRv0hZI5pZSBwHhQKI48ks87KZ3j9KHy0kJM21cLqGK6YGZng2KjzycnwZ15f
         HI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749915114; x=1750519914;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffW3H0bnnHkzNpApn+Q0DtoWGwSGMCBvGEREk/RINPU=;
        b=B4HB5pdN6TSDfeIm1meeUuse7lGpRBVxqj+XPBZuQxAxi46cZX85lsRUKCXAea6f46
         2976VqA8fTgfCO4qmzSBUODrPTg/BWkLPFN5MTvfzkQbaJBx1JHk4PiOSJBX2rLkVAaV
         v0lqMSL2w+FGLPHF3B4FZHJDtP5Atq/hIlBIfLsyIHF2g93tc/6vtpjD8YOTTwk2efFS
         wsz0L/32uYXJLzdxVXfD14nSt3lweWy3VK3SSoEs5CdrL9lq5pi1h7MsRknpOvYnKv/F
         jOB3a9HN3hHCDE1C6tVhVus+gdX8ZmASbiGZg2R15cUgBsHBKcVWjsLDMkQ3ikqOUhWJ
         zxRw==
X-Forwarded-Encrypted: i=1; AJvYcCWH3jPsLQ8kZRb5ZGwx9mwabxmwUentDCm3EErh9OWAEdJYQmLXpNFLSZczibuzSMEDGvfgcikSimuKPA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4a8K0rZNcU5fYQPjLFE1XAIOQpKjKgds9uYwQEqOsVBF9t0jC
	wBxJkoDoImcKO1o65qLba7qeeVYaOd1A7a/EvCcdbjDadgh546C2dH2Dn5eBl9/dR3w=
X-Gm-Gg: ASbGnctnyN+QenbJm/Z0RS48a3EnxWxA6D97hXk0NOkbreBhCWrArVYFasvTJLbjUxw
	mCW6PMPwAFoKYh9o8QSc2ra63++mzdAyHpjTy+sJaGZNhet9Ik1eZF5/nW07iRB11h/WNMpwjop
	Tux145Uq25MraAfwH7DY2XIk8X35rZ+pqoWeF0CVgZpJrPrKWtNE12QtxEtWEG1Gx7/Y8fjd7y2
	FNw7aa6u7vijroXPoiZxojrRXDOlbp3L2GIbdTq4YwaDJwYdNB+461ohJVrmQP8X+Dj8aQ1/89P
	HOlWDBhLCbZ1wO1tHTLBzDwrMcqZ6iRHikda1d8qQreQLH6iPQEpzCxM93Kq31Fsj7mSQoJoXvE
	88TYlowP2eolV8XzOMUNh424lQA==
X-Google-Smtp-Source: AGHT+IFP52JgzSOjbmFpXqOBBvaFl6D5bJuOsTvSEnFixRA2Tu6XMQLw43LfhVyuyogbFjoxorIvyg==
X-Received: by 2002:a05:620a:430f:b0:7ce:bd8b:2d08 with SMTP id af79cd13be357-7d3c6c094e3mr481017085a.10.1749915114067;
        Sat, 14 Jun 2025 08:31:54 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f272a8sm303506585a.115.2025.06.14.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:31:53 -0700 (PDT)
Date: Sat, 14 Jun 2025 11:31:52 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 07/10] lib: mul_u64_u64_div_u64() optimise multiply
 on 32bit x86
In-Reply-To: <20250614095346.69130-8-david.laight.linux@gmail.com>
Message-ID: <rs908qr0-747n-9q5o-4soo-rr09o26o9qr3@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-8-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> gcc generates horrid code for both ((u64)u32_a * u32_b) and (u64_a + u32_b).
> As well as the extra instructions it can generate a lot of spills to stack
> (including spills of constant zeros and even multiplies by constant zero).
> 
> mul_u32_u32() already exists to optimise the multiply.
> Add a similar add_u64_32() for the addition.
> Disable both for clang - it generates better code without them.
> 
> Use mul_u32_u32() and add_u64_u32() in the 64x64 => 128 multiply
> in mul_u64_add_u64_div_u64().
> 
> Tested by forcing the amd64 build of test_mul_u64_u64_div_u64.ko
> to use the 32bit asm code.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
> 
> New patch for v3.
> 
>  arch/x86/include/asm/div64.h | 14 ++++++++++++++
>  include/linux/math64.h       | 11 +++++++++++
>  lib/math/div64.c             | 18 ++++++++++++------
>  3 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
> index 7a0a916a2d7d..4a4c29e8602d 100644
> --- a/arch/x86/include/asm/div64.h
> +++ b/arch/x86/include/asm/div64.h
> @@ -60,6 +60,7 @@ static inline u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
>  }
>  #define div_u64_rem	div_u64_rem
>  
> +#ifndef __clang__

Might be worth adding a comment here justifying why clang is excluded.

>  static inline u64 mul_u32_u32(u32 a, u32 b)
>  {
>  	u32 high, low;
> @@ -71,6 +72,19 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
>  }
>  #define mul_u32_u32 mul_u32_u32
>  
> +static inline u64 add_u64_u32(u64 a, u32 b)
> +{
> +	u32 high = a >> 32, low = a;
> +
> +	asm ("addl %[b], %[low]; adcl $0, %[high]"
> +		: [low] "+r" (low), [high] "+r" (high)
> +		: [b] "rm" (b) );
> +
> +	return low | (u64)high << 32;
> +}
> +#define add_u64_u32 add_u64_u32
> +#endif
> +
>  /*
>   * __div64_32() is never called on x86, so prevent the
>   * generic definition from getting built.
> diff --git a/include/linux/math64.h b/include/linux/math64.h
> index e1c2e3642cec..5e497836e975 100644
> --- a/include/linux/math64.h
> +++ b/include/linux/math64.h
> @@ -158,6 +158,17 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
>  }
>  #endif
>  
> +#ifndef add_u64_u32
> +/*
> + * Many a GCC version also messes this up.
> + * Zero extending b and then spilling everything to stack.
> + */
> +static inline u64 add_u64_u32(u64 a, u32 b)
> +{
> +	return a + b;
> +}
> +#endif
> +
>  #if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
>  
>  #ifndef mul_u64_u32_shr
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 22433e5565c4..2ac7e25039a1 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -187,6 +187,12 @@ EXPORT_SYMBOL(iter_div_u64_rem);
>  #endif
>  
>  #if !defined(mul_u64_add_u64_div_u64) || defined(test_mul_u64_add_u64_div_u64)
> +
> +static u64 mul_add(u32 a, u32 b, u32 c)
> +{
> +	return add_u64_u32(mul_u32_u32(a, b), c);
> +}
> +
>  u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  {
>  	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
> @@ -211,12 +217,12 @@ u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  	u64 x, y, z;
>  
>  	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
> -	x = (u64)a_lo * b_lo + (u32)c;
> -	y = (u64)a_lo * b_hi + (u32)(c >> 32);
> -	y += (u32)(x >> 32);
> -	z = (u64)a_hi * b_hi + (u32)(y >> 32);
> -	y = (u64)a_hi * b_lo + (u32)y;
> -	z += (u32)(y >> 32);
> +	x = mul_add(a_lo, b_lo, c);
> +	y = mul_add(a_lo, b_hi, c >> 32);
> +	y = add_u64_u32(y, x >> 32);
> +	z = mul_add(a_hi, b_hi, y >> 32);
> +	y = mul_add(a_hi, b_lo, y);
> +	z = add_u64_u32(z, y >> 32);
>  	x = (y << 32) + (u32)x;
>  
>  	u64 n_lo = x, n_hi = z;
> -- 
> 2.39.5
> 
> 
