Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154092BB13
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749915480; cv=none; b=gsbixMzXAXGkIAisyZa0M7mEjakupGf7085LMDMcAh1ifB+lA756GYvCgMt6kHVUycK6CWmy48YcsuxwrbBUvGY9D4yhP0JN+no5c2Km3RHmfPJh9MiTF3RKnBKlEp1dVDwjzxrhXGxhQrqQEJi9Z872HRPzIQHhxPZKr/kj5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749915480; c=relaxed/simple;
	bh=IF3sdpNAvm13OXHhsCeFTvS3RRPxExum3RfP79UrgHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AjfEfA5PFc2QT7o9dt0AIzAgvbawJ1wU7IsOft1yz3ufnT26C+CLPQUQDIcKW/vZYA05Qng6dMlE+yw68uylArJVLhWwDzhbUehT7GU53rjdsyyhRrEwbnyX6B6ne9m97ElOqOFbtQvZuZqzWW/Jm3BzbHYMVGVUt83Ko+YhLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GmDyXd/J; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GmDyXd/J"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fafb6899c2so37558956d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749915476; x=1750520276; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dM6MGdI/Cu6BmiAAnMDXynLQyb+kVA2s8KSzJhvRprs=;
        b=GmDyXd/Jzwy+elq0qR28mgPZQOl8N3zDBq0izggL9g1gXdmCpI8ouSxojOFcvoS7V3
         uU42kpve6TX67wjY/DVTpCH/uBRPXedDsBzpehNctYaudTy5eyv5yzH0WO/dCRSBfBXX
         ftGSghQchC6Y6YpRAcn8Hcv0Equ7FtylVOnG9LdpeIv43wgUFzgfei/o/o3JjCDsuW+1
         jLJMa4XHZeqt6fCiVt7ZSzxLCwV58t35TKUvi+7eP9DfaTQMCszD5MuiooHqPyI/75vM
         anKAVXo8EWy8W2+kYp7Qy1ekak4gq1ow1hDfTP5Bitvg/uzwOQVMRA9/b/NRz6Qcel+l
         2cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749915476; x=1750520276;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dM6MGdI/Cu6BmiAAnMDXynLQyb+kVA2s8KSzJhvRprs=;
        b=mhL4JNhgDJVp+lgaZTWxyEcGUJ6/10Hh+WY1dw5dYHt3lBIFLg28Bs1BXxpDabZmDQ
         qy38EIOuTZE4viMinTYCmWVf4ymiQHNoSFi9i9qn+G3PNJU/eu+sImijJXVVSQEB5Eho
         HHTD2gIhMrhglY3y6oxn2kDzMLjFYMU4rcmWyquTutPnGxXDzzuSWi6dP2RjRQfOQ41v
         bf5AVWRWrMdIHJAAHU0KM4Jg4YiqpBPdzanUUJZdLamWNiOyHAr3SIitCO6qc07PGhQ5
         mtxOztrvkduIOXrZ5XcI7KmNJLhzSvzfleu8b08ea/9r/u9dIqfhfpjmcc2xF7yWKrFZ
         b+yA==
X-Forwarded-Encrypted: i=1; AJvYcCWYuShxbPfmPyRP5LRWRXd6vKIBB6tSw94iZV1LejbqATw7U9SBejqN+v7zG6p1SqUE6EVYwdMQiNHPOvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/A+XRatoAtOEuAXVYwwyi0oReDh0zEJNewLezsZU34fDeZVgm
	WS8kRFIfV7Q/4FPpyqZuFkKy9rw3BVied+rPJOf0B69JFppz3f8Cth6auAarTasalOg=
X-Gm-Gg: ASbGncuO//itoN5PpdYNqly2Lyvczr5dXDC8mevN6CX7vtZ5eQJmThZOv/+O0aloLK7
	eC19hB57wzeFhe7ff/wvqk5sb8LP2bv/1UVOaWUqr9gMCWHo1qlJqBIrCkJO7LSfODQoMzCBaeb
	XHAhZXJTzshVXOfbaR0ED3co7g7VYNeDkaDtB/wqNB625s5dY7ep/f+WVJgR4b3cjLLj9/rcRa3
	6mxieeRoBVMtRkYPP+QlT5uQm2R/AjL7kWrSCsV51xw1mVbeGKzS2sj14FqfNCsF0BSiQzhrPez
	tg2egNmYd2cngLFmYVz40xpj6WaZ3PMlp8XPbd3od3TJze882/sfjp7et9P2lomGwzZbXxLyKXP
	4jc+uosGVkCsQUbTtqFZKddWsLQ==
X-Google-Smtp-Source: AGHT+IHZ1Tv9eCXzH9c+bRpLufpmkVwHobMNBPQ0eQgw0xj8wp36TiVM27diht1dJubTVpp/Tdgo2A==
X-Received: by 2002:a05:6214:f2e:b0:6fa:c5f8:67eb with SMTP id 6a1803df08f44-6fb45b192edmr82734616d6.7.1749915475889;
        Sat, 14 Jun 2025 08:37:55 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c836a4sm32337176d6.107.2025.06.14.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:37:55 -0700 (PDT)
Date: Sat, 14 Jun 2025 11:37:54 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 08/10] lib: mul_u64_u64_div_u64() Separate multiply
 to a helper for clarity
In-Reply-To: <20250614095346.69130-9-david.laight.linux@gmail.com>
Message-ID: <58porr76-92os-7019-nr00-n68r74202pps@onlyvoer.pbz>
References: <20250614095346.69130-1-david.laight.linux@gmail.com> <20250614095346.69130-9-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Jun 2025, David Laight wrote:

> Move the 64x64 => 128 multiply into a static inline helper function
> for code clarity.
> No need for the a/b_hi/lo variables, the implicit casts on the function
> calls do the work for us.
> Should have minimal effect on the generated code.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
> 
> new patch for v3.
> 
>  lib/math/div64.c | 54 +++++++++++++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 2ac7e25039a1..fb77fd9d999d 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -193,42 +193,48 @@ static u64 mul_add(u32 a, u32 b, u32 c)
>  	return add_u64_u32(mul_u32_u32(a, b), c);
>  }
>  
> -u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> -{
> -	if (WARN_ONCE(!d, "%s: division of (%#llx * %#llx + %#llx) by zero, returning 0",
> -		      __func__, a, b, c)) {
> -		/*
> -		 * Return 0 (rather than ~(u64)0) because it is less likely to
> -		 * have unexpected side effects.
> -		 */
> -		return 0;
> -	}
> -
>  #if defined(__SIZEOF_INT128__) && !defined(test_mul_u64_add_u64_div_u64)
> -
> +static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)

Why not move the #if inside the function body and have only one function 
definition?



> +{
>  	/* native 64x64=128 bits multiplication */
>  	u128 prod = (u128)a * b + c;
> -	u64 n_lo = prod, n_hi = prod >> 64;
>  
> -#else
> +	*p_lo = prod;
> +	return prod >> 64;
> +}
>  
> -	/* perform a 64x64=128 bits multiplication manually */
> -	u32 a_lo = a, a_hi = a >> 32, b_lo = b, b_hi = b >> 32;
> +#else
> +static inline u64 mul_u64_u64_add_u64(u64 *p_lo, u64 a, u64 b, u64 c)
> +{
> +	/* perform a 64x64=128 bits multiplication in 32bit chunks */
>  	u64 x, y, z;
>  
>  	/* Since (x-1)(x-1) + 2(x-1) == x.x - 1 two u32 can be added to a u64 */
> -	x = mul_add(a_lo, b_lo, c);
> -	y = mul_add(a_lo, b_hi, c >> 32);
> +	x = mul_add(a, b, c);
> +	y = mul_add(a, b >> 32, c >> 32);
>  	y = add_u64_u32(y, x >> 32);
> -	z = mul_add(a_hi, b_hi, y >> 32);
> -	y = mul_add(a_hi, b_lo, y);
> -	z = add_u64_u32(z, y >> 32);
> -	x = (y << 32) + (u32)x;
> -
> -	u64 n_lo = x, n_hi = z;
> +	z = mul_add(a >> 32, b >> 32, y >> 32);
> +	y = mul_add(a >> 32, b, y);
> +	*p_lo = (y << 32) + (u32)x;
> +	return add_u64_u32(z, y >> 32);
> +}
>  
>  #endif
>  
> +u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> +{
> +	u64 n_lo, n_hi;
> +
> +	if (WARN_ONCE(!d, "%s: division of (%llx * %llx + %llx) by zero, returning 0",
> +		      __func__, a, b, c )) {
> +		/*
> +		 * Return 0 (rather than ~(u64)0) because it is less likely to
> +		 * have unexpected side effects.
> +		 */
> +		return 0;
> +	}
> +
> +	n_hi = mul_u64_u64_add_u64(&n_lo, a, b, c);
>  	if (!n_hi)
>  		return div64_u64(n_lo, d);
>  
> -- 
> 2.39.5
> 
> 
