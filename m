Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9728A1ED
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100321; cv=none; b=llo1AwCPSJKBA7Bbd7fQ4uFa2q2Br7FBWJy24bsdFO5HfpXFyEzphtWo+nL56fbvgQiRmm39NNOWJEW6MiBIkbVXbsVn+FOTNkkIOKEdI+5Jj4uSvdXDSYeJJ8yNMuPb349e/vxgD6hzv9GeS5VYTHtBOM+XBsIX/61ox0to/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100321; c=relaxed/simple;
	bh=0wxJ8QAbItYkD8+pWNpbtPenwAg1ZsK9j90cqfhziK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTB921NHdJIXIn0TInWzJubViAQ5ZbdIDrmmtzfBF5x09Xy4CLuBbGLZaeOCNZI0SrE6IVy7P/HSUZlDjZaimgwGR4xFZf0dW+125sbLG8Ed98UJHsQcCd9EF6tpqymgG2XZFpKEQz5iNl81PvQcKqEAnaY1v129sqdro7spkuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DI/Pj+0C; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DI/Pj+0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750100310;
	bh=0wxJ8QAbItYkD8+pWNpbtPenwAg1ZsK9j90cqfhziK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DI/Pj+0Cj+owOhwmzMf/zhPhejBfgDdFN0l9nZSFFScSE5eS9wzmeQQKnM1qFTRKi
	 C7YSAx67D1GVdkl0J38nGqnOyc8nyxWZB4q/adRDa4+Yfgfssfbz8Z2iuq9BlfJLUA
	 IyRFdsd51sMzvevFCiWuEFzUKXsoZ+XS39xq+spg=
Date: Mon, 16 Jun 2025 20:58:29 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Oleg Nesterov <oleg@redhat.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Peter Zijlstra <peterz@infradead.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mul_u64_u64_div_u64: fix the division-by-zero behavior
Message-ID: <f256c2d1-6f35-447d-9f21-30d0c4a2419a@t-8ch.de>
References: <q2o7r916-5601-11pn-30pn-8n5ns6p079o7@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2o7r916-5601-11pn-30pn-8n5ns6p079o7@onlyvoer.pbz>

On 2025-06-16 14:48:44-0400, Nicolas Pitre wrote:
> The current implementation forces a compile-time 1/0 division, which
> generates an undefined instruction (ud2 on x86) rather than a proper 
> runtime division-by-zero exception.
> 
> Change to trigger an actual div-by-0 exception at runtime, consistent
> with other division operations. Use a non-1 dividend to prevent the
> compiler from optimizing the division into a comparison.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 5faa29208bdb..eaa0c7e8b974 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -212,12 +212,13 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
>  
>  #endif
>  
> -	/* make sure c is not zero, trigger exception otherwise */
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wdiv-by-zero"
> -	if (unlikely(c == 0))
> -		return 1/0;
> -#pragma GCC diagnostic pop
> +	/* make sure c is not zero, trigger runtime exception otherwise */
> +	if (unlikely(c == 0)) {
> +		unsigned long zero = 0;
> +
> +		asm ("" : "+r" (zero)); /* hide actual value from the compiler */

This is OPTIMIZER_HIDE_VAR().

> +		return ~0UL/zero;
> +	}
>  
>  	int shift = __builtin_ctzll(c);
>  
