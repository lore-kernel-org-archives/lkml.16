Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA14282E1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910020; cv=none; b=IEAsodvsG5XIQcyQOguK1ykrwaDlxKlJHpuizg3yx8B7kvqQ/4zlVLvgKEjIpfB3LG1xURliNBBJLh/ne7QpE2Uj+Brp7qsmyeWfghs7Pgji5Lx4y43ybtfirudMpswAW82aZj9sWMLbdov3e7PI1PA0scYyEy5IcIdPEKbRhUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910020; c=relaxed/simple;
	bh=VODE5RPApHA1r2FXbXVWpkw98TYEzObhooLa6REwpYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Qr72uPbH5IXzlw2Hh9ZID5QtcfAUNEzEXqL5oP0ecGwwtOPKzY01zXiv33OlYySVyqsjWACNJKwm0T+B7/w5K3Rx7ngZFF//yHt6pwZkXKi7xHKZFfRm99X/8Kh7uUVms1q6TCu/we1rVppM3qpQ5Ac4AZ1lvnhez7Q3kgz+amA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0YMon9vP; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0YMon9vP"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a5a196f057so64038341cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749910016; x=1750514816; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HBBRPVejgdNSogN/x86haNbKsehyzACWXVAw3aQC50k=;
        b=0YMon9vPxAmv7oR5k68kD4qpP+AgEr7XxIWLDKL5UxRA1PWt2G9WAf9zTYUTyLjBXd
         eAB3k0iI06MXVidkIOwTMaEZzc3hX/W0zUnG2RFT3/1d5Tu/FOj1U9y++XoSTAkGG+3l
         A2lRVdrzgF4Zjb5wzB+yjz4A37uL9tpeC5vhb34TwQqaMRaGZMWuLkia4ZzIL23PO9vl
         BgV4faSmAEuRM0qrwgoHloXNM04ZDK2YYHsK7vXLXMvdWFpceMoDVUGiAYktfwLi2G2M
         FiDvLQjp9h+HVg07mRFyHlUvFPB2gS+jCI8l6rFEbU29rQ7yCabFqD4G/Y5ZLfz1MDfx
         50uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749910016; x=1750514816;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBBRPVejgdNSogN/x86haNbKsehyzACWXVAw3aQC50k=;
        b=dnHR6CwnCmicUEysKF4/i/FdovK8YD5y2NiGmQteNWsDybVlvedz5WyvYfjEgDj9jV
         Mdu+HMZxrMJS7W4clVmjMoYa32zxGOZpWPVeSin3Bevt5xbt0EhKV6WnK1lJqMqNo92I
         W9csF1GE2uKxwAzFUdZPrMYJNIF67oST9dygHbqg3jmYT1KvDXk8DndMph4Jcy53QL0c
         NzF1u7pmmxPXsHlP2X8qKXirTZl1zYcjuqHb3T1F6kG+4/e4ahAL0uhSbNnl5WUpVzSz
         vUMBkdkxfGF2ZHVKjkxHHe2yoLVVnF44cNTWHZTyELufDsZgPY6mdVrMc5V6WIigB14J
         6jtg==
X-Forwarded-Encrypted: i=1; AJvYcCUAngx/90pngGLMPD89DPOCPar+xuU2ZGyEKD47Fc7fz9S8LukBI+bIhX88xV/CzE2LDnU1xwgdvVgIhUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBDsM6hA+18WKxLH+/h1vocxGava09G35ziFev/4NRhcEvm4BW
	ehLEwOrHqGG9kg5BxysXsQ4W+xgFlTd61+LDoj0nhxguLMnfG2MOGObudvNIIuIlLaY=
X-Gm-Gg: ASbGnctim/IXOM2CCg8ABd0HflqpDp79Y6EnzU5/ie73Slz3odLxbULu0s6q2RizpPy
	Ev70OT0L387mlyEVPaS5TkPmngTMWAlpFkZSYq/QpeQLVX6VBCNzfxyB4o8htgCNOvE6ovEq+ls
	CBd/uBvLMi9hM4WlwtBgvZm84177v8piXt3l+KDH2wEJAYYXrcv0LeonBsQnSVePJphOtv7aQj7
	2gEumTfjW4tXypBzTtFdKOURTquJ1bWLtkVrFbehq/IypRmwz916PuF6Nlb5a1IquX2WR62mkmy
	VQM3iiO8geRT8spMnr4BBfgfINfNdibhBlLVLaxiEATGB/HLL+bi7RoQun+BBH/MjBZtG6xBYFM
	l2K74ToEjU1l9ULHgLlKQj5Vk/w==
X-Google-Smtp-Source: AGHT+IEsQ3DqCEEU70fMiwTPWSIm4XFFvOPnlmOKIxIEP5NMNsb5V4x+uFpgU6OJt88MgLrYScxQbA==
X-Received: by 2002:a05:622a:1102:b0:4a7:22fd:682f with SMTP id d75a77b69052e-4a73c496da0mr52174981cf.3.1749910015757;
        Sat, 14 Jun 2025 07:06:55 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dc92c3sm297537085a.22.2025.06.14.07.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 07:06:55 -0700 (PDT)
Date: Sat, 14 Jun 2025 10:06:54 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 04/10] lib: Add mul_u64_add_u64_div_u64() and
 mul_u64_u64_div_u64_roundup()
In-Reply-To: <20250614095346.69130-5-david.laight.linux@gmail.com>
Message-ID: <r7078s37-894n-1o80-7p9o-78o648q05poq@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-5-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> The existing mul_u64_u64_div_u64() rounds down, a 'rounding up'
> variant needs 'divisor - 1' adding in between the multiply and
> divide so cannot easily be done by a caller.
> 
> Add mul_u64_add_u64_div_u64(a, b, c, d) that calculates (a * b + c)/d
> and implement the 'round down' and 'round up' using it.
> 
> Update the x86-64 asm to optimise for 'c' being a constant zero.
> 
> Add kerndoc definitions for all three functions.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>


> 
> Changes for v2 (formally patch 1/3):
> - Reinstate the early call to div64_u64() on 32bit when 'c' is zero.
>   Although I'm not convinced the path is common enough to be worth
>   the two ilog2() calls.
> 
> Changes for v3 (formally patch 3/4):
> - The early call to div64_u64() has been removed by patch 3.
>   Pretty much guaranteed to be a pessimisation.

Might get rid of the above in the log. Justification is in the previous 
patch.

> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Double signoff.

> ---
>  arch/x86/include/asm/div64.h | 19 ++++++++++-----
>  include/linux/math64.h       | 45 +++++++++++++++++++++++++++++++++++-
>  lib/math/div64.c             | 22 ++++++++++--------
>  3 files changed, 69 insertions(+), 17 deletions(-)
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
> @@ -282,7 +282,53 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 divisor)
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
> + * Generic code returns 0 if @d is zero and ~0 if the quotient exceeds 64 bits.
> + * Architecture specific code may trap on zero or overflow.
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
> + * Generic code returns 0 if @d is zero and ~0 if the quotient exceeds 64 bits.
> + * Architecture specific code may trap on zero or overflow.
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
> + * Generic code returns 0 if @d is zero and ~0 if the quotient exceeds 64 bits.
> + * Architecture specific code may trap on zero or overflow.
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
> index ed9475b9e1ef..7850cc0a7596 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -184,11 +184,11 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  }
>  EXPORT_SYMBOL(iter_div_u64_rem);
>  
> -#ifndef mul_u64_u64_div_u64
> -u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
> +#ifndef mul_u64_add_u64_div_u64
> +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
>  {
> -	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx) by zero, returning 0",
> -		      __func__, a, b)) {
> +	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
> +		      __func__, a, b, c)) {
>  		/*
>  		 * Return 0 (rather than ~(u64)0) because it is less likely to
>  		 * have unexpected side effects.
> @@ -199,7 +199,7 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  #if defined(__SIZEOF_INT128__)
>  
>  	/* native 64x64=128 bits multiplication */
> -	u128 prod = (u128)a * b;
> +	u128 prod = (u128)a * b + c;
>  	u64 n_lo = prod, n_hi = prod >> 64;
>  
>  #else
> @@ -208,8 +208,10 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
>  	u64 x, y, z;
>  
> -	x = (u64)a_lo * b_lo;
> -	y = (u64)a_lo * b_hi + (u32)(x >> 32);
> +	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
> +	x = (u64)a_lo * b_lo + (u32)c;
> +	y = (u64)a_lo * b_hi + (u32)(c >> 32);
> +	y += (u32)(x >> 32);
>  	z = (u64)a_hi * b_hi + (u32)(y >> 32);
>  	y = (u64)a_hi * b_lo + (u32)y;
>  	z += (u32)(y >> 32);
> @@ -223,8 +225,8 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  		return div64_u64(n_lo, d);
>  
>  	if (WARN_ONCE(n_hi >= d,
> -		      "%s: division of (%#llx * %#llx = %#llx%016llx) by %#llx overflows, returning ~0",
> -		      __func__, a, b, n_hi, n_lo, d))
> +		      "%s: division of (%#llx * %#llx + %#llx = %#llx%016llx) by %#llx overflows, returning ~0",
> +		      __func__, a, b, c, n_hi, n_lo, d))
>  		return ~(u64)0;
>  
>  	int shift = __builtin_ctzll(d);
> @@ -268,5 +270,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
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
