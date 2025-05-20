Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910E1E492
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707096; cv=none; b=GGpsJlsT77L3cDY32SUTAUtZn5wIMBATHBb1bCWm20jW5GfHADsBb7vgvfZ9/2vgW/QUIoBdrX1oLoykFj5ErolfFjym8quzlKyaGK9AsODpesQJtTNh5/vlksQOj0/Z5Ug0NQ0pbU44bDv6hhizofydy17O1aVFZdHQrnck8+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707096; c=relaxed/simple;
	bh=xKaSOhsGSXDAGa3r7sE3mPOTtMXXMbbR203CF06xmZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D79FX9VFbY6ZuKCfA55CSpXnDFp2Ss4xt8b0M9uCjmsMvnT7M5AfxlYSpI0qrBpGkPGzmeseFMWhQRwmetvFUD7DjJvf3kioKBCcoXqVJ7Voaso/c5snXRnhgW+Qx/3UIJJsR9biv918SdOirjY34oWqRBviUF+q9A8YpERJXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=icaYo10B; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="icaYo10B"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476ac73c76fso73995551cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747707092; x=1748311892; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXjYEP/qIJJ3TSOcAb52OtiO9fu2bmjuD3wIW4txPjE=;
        b=icaYo10BkyJLh1RCDwWKL4ImQGA7uyXxzXzKGsbajiDsSfzsYTBBH8zPH2RczL0AQD
         Cd5NGLN+7oQu5g4TMv7jbfro2cLHuIyFGqjVxn2RUrwuK131WeCfP3E0ei4crBYS2Rld
         Ljb2e25yBou1Yls4DCThUach3X4e15QPcGIy03jmw275u5cZ0hY9dXX/oyNJ8BOOvXIJ
         4FlI0GGMcBeslYpTpq4EbvuNNLCuxmeV1ilfsOycUy256jk8z5VFYLwYTn+/QOxz0Ve9
         +2dq+Q2+dlfnVay/CP7e4GVK3XyAeu+vuFEB/Ce5HdVoTxyucREA8HCbJ2unpQ2x87I9
         IioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747707092; x=1748311892;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXjYEP/qIJJ3TSOcAb52OtiO9fu2bmjuD3wIW4txPjE=;
        b=S8QHoyCl3NznhTAWPVvNSQgNsDVlEpyoARmrrPGZFjOVgG3vfqx2sCIcEcKM3fPwFT
         mzRJeBmn24i0laz58LevsrUReMlwfquuGf7wcx994Olgn1mR2MMLVVvVVabLEPg0vuIY
         8wdHr9tOqKOr8PJ3Mg1uxd2EdP+zYQULOW1AtT1W6dIPds4URaNTm2rNesarbeaig7Ou
         XxZHXPfa+bhJucENmowOszMxANRWWNxd9trXf6WtE5h83pdmQxQUIGQuciciUA6L3V7d
         EBtxEhm9XVJhZIaC1MrY2pDX4/tWzvBiC70l0C87RGh2WRzqWhB6Wo9nYTySHnOakKKQ
         /hmw==
X-Forwarded-Encrypted: i=1; AJvYcCXfG5DKnFcEYyYrVJ9Osj9D1KRa74TqMrCKJSJXubhAQsIMifGvTlNkiev4JmOBubm7C+k/AyRsJP2obbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfb9L1IL3iM8LvpY57VMb90fjMq5Kc4qCj7qd/5AECgWHExa1S
	L16x16kJTo9rwcxcLJ6cjfw+0Eatkr8bjd4qQpAoRuxXLxPZtnTda3taLcRP7b/oLjg=
X-Gm-Gg: ASbGncs2V3NgjK5O4SAxCCweidwEGOslIoIveIsbCuzaccJpxTEVDpKlSeprXXk4T0+
	w3a+x2OMjZZCeFrOO7yCFbzJ4oJ3LBxxjNLvTRnK0jlMIPJKUjg0eS9WCi07Jn38z99rLubw4jW
	3ocaxuB4m4ulNxWk3o8mWyn8OcjpvSpnRAaX61kqfS1Os4tE6CW7bKA6XN3oS1OBqxmumSh4q2x
	h118m4T8y2rsJryilIaSUp1E7BIH7fzVThYlnE7EYvfoK17dLHkga3DpIH0/GBVjO+9L32rJtt+
	Xngz/Wp0FrCsuV8tcZQEUuzZ7aEZ6/9g+clYdYkBmTy6df6sW7Fdu0oLx/bkCjsUy5rYfz4n7xu
	7dBpWIKHZzx9W+g==
X-Google-Smtp-Source: AGHT+IEEn6yEdbICrqZHJsjrFWCTinRxUCiJyZ4Na7WzS9Vc4oxb2eAHaaYyqdOoTTzw5nKnonTCaQ==
X-Received: by 2002:a05:622a:1f91:b0:476:9017:bbf1 with SMTP id d75a77b69052e-494ae4ca815mr292466741cf.46.1747707091949;
        Mon, 19 May 2025 19:11:31 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f91c4sm64443811cf.25.2025.05.19.19.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:11:31 -0700 (PDT)
Date: Mon, 19 May 2025 22:11:30 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 1/4] lib: mul_u64_u64_div_u64() rename parameter
 'c' to 'd'
In-Reply-To: <20250518133848.5811-2-david.laight.linux@gmail.com>
Message-ID: <39r936n1-0p22-4438-23q7-q8on77583r8r@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-2-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 May 2025, David Laight wrote:

> Change to prototype from mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> to mul_u64_u64_div_u64(u64 a, u64 b, u64 d).
> Using 'd' for 'divisor' makes more sense.
> 
> Am upcoming change adds a 'c' parameter to calculate (a * b + c)/d.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
> 
> Note v1 of the patchset had mul_u64_add_u64_div_u64(a, b, add, c).
> 
>  lib/math/div64.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 5faa29208bdb..a5c966a36836 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -184,10 +184,10 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  EXPORT_SYMBOL(iter_div_u64_rem);
>  
>  #ifndef mul_u64_u64_div_u64
> -u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
> +u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  {
>  	if (ilog2(a) + ilog2(b) <= 62)
> -		return div64_u64(a * b, c);
> +		return div64_u64(a * b, d);
>  
>  #if defined(__SIZEOF_INT128__)
>  
> @@ -212,36 +212,36 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
>  
>  #endif
>  
> -	/* make sure c is not zero, trigger exception otherwise */
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
> @@ -256,8 +256,8 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
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
> -- 
> 2.39.5
> 
> 
