Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98653136349
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109194; cv=none; b=Em0HgPXX8AiWrrfEd00JDbkvTRsQheDkU34T4J4k37+puHy7vIN4fUbHsTXd+I/6GGoUPt5dNMiG0NUmn/x4OaFkMdOf7eVAkU5n0xxgfTMBT+pt0hs+8Tw4ADQRcKza1WIFi70gGpWd6gfWvRG1f2Kfy142mt5E0lb0M61lDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109194; c=relaxed/simple;
	bh=Qx3RgIciF8FScrA3fp7NDvcLUeQpT4dfJxakDbrgEX4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3vq4ypaowbtznW8vu32UwiAoNZlasJ31TBYyPFjBj9rWMY5huCvgFKA6KVJZGKW8Iq5GSRp8AMcasESRjZUIMU/aBaLnFOui+ROYjJ80tceiA/NaFa5j9ej/Pbni2WnxS3eEsTNWTY+8R9A9UBVwAoAdWXnIvAAO8Q2PXwLAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiBkq26w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiBkq26w"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453066fad06so37731955e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109191; x=1750713991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K/Whje5bbq5X82a9GV6t7IagAg7RVEk9VXUfZi6KFw=;
        b=UiBkq26w/cOv5ZqQCAOm2+Q59gE0zVOte60MkmszrphRyqjcN7tFb7duPzsDJfiqfb
         5q6vHyW4UZZCMFEOq0d9MpVuC8GGKy6Mti1zVkJwSAJ6gNxZnn2xsRT8cylg6wIQpP53
         ew3WOKTm1cSSkyP2OlYuQ8L4x02NKnTQ/W+wzAGz5eKOtVU4vW2HQFTHpk0VLgZ9aVfr
         Cjzp7roEVEhTFMmxURkK8DA+43q7IpBJJl8zB0AUeNBKyg5txg/RixehDLhdC14kuTOt
         RBNSvQiKsFS4ivkFQ9dX6r6tRvEYl5eoBRBdzd9XF7bhICbbA0a5A2dOQZqKf5vReKWn
         CDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109191; x=1750713991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K/Whje5bbq5X82a9GV6t7IagAg7RVEk9VXUfZi6KFw=;
        b=W57WhEYwaEAKzXw3omzHubVBT98dIqPa0VlLr1y2q7BARi1VapX/L0KN/DqI/d5OJ1
         pQbErzqYV20dNOja0CkQjHbnOfOlgAtBSfLqN9CxLUav+1CdPFnFJcO69s+2RcbUD0lb
         8Ku1pq+H6pI2ICtIYHzEXblm6G82W6UiwDZdAlQ5UXLw4oIovbW1jEmu82xMe/XlvGR3
         sT7lVd/KQGhtwvtqpJtfRMk++m8qz4SXN/eenStJe5dPxdLAnanfpa05blPycAUa5iAC
         bmZS/+yobVQ7dNZ76lRvmjh3ghUPPDeSzzHN6hIEcvpkbbYtE1Jn0EP7QRuhm9WMnpOn
         9A5g==
X-Forwarded-Encrypted: i=1; AJvYcCVKemRVSzsR5vjXGhPBTWIF349HPQtxhMv05nKUd8DG3bLWxUFk/gkxtICGt1Syy2ui/jEddrdQpxFE/eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZgvwsgd6bdWGaclizGgcuYvAM1UQwRRKdIPzFlhzlhuctp77
	4PA52KiKl9ojvBjdsvUU5oq3dJdSH1DrBZT6NngftuAMUN49IlgWe20O
X-Gm-Gg: ASbGncsrbl3rDiEC0IovaQVg3XlI5cHwjfSo9Gev1uy7QssCAgkgqaD0XBgaFHvSQhY
	rpGwOkuY6At1ZYRham+S+FNR/247nL0BK0OlIc+I8weLgv+JB83DIux2LLcPj+MqCkGxvmzvGfF
	GcKxO9CCWhm0m4wjqe8MrWLEAtB215bNj30aDBKuxLVMDC4iglex98e6lS8v4BUdYdwVpHTOAIc
	CK/CeEWaMyieWrqJb7++t5PQJfvHa/m0xwUXHzfCLIv1M6ZpNNs/SLOCfI0iuTFS9E3JZ0J28to
	2y1LmJA+KhwnMg4na79+1g99RppLpO5gJr2kyXzei1rMzZ5gFgFIZtm9yVXnbECwfD4sFWGQ3Sr
	DAIZzVq80vNTsY0XX4vTUsEOe
X-Google-Smtp-Source: AGHT+IHx9IRQDvRtg1mLpDGTbJyv9WzL268TwPwvqQ6KNZYc5t1shyGS3ZrVrPkSr44osRE1m8UK3Q==
X-Received: by 2002:a05:600c:4ed1:b0:453:78f:fa9f with SMTP id 5b1f17b1804b1-4533ca510afmr97441065e9.11.1750109190660;
        Mon, 16 Jun 2025 14:26:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a547ecsm12251433f8f.17.2025.06.16.14.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:26:30 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:26:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas =?UTF-8?B?V2Vpw59z?=
 =?UTF-8?B?Y2h1aA==?= <linux@weissschuh.net>, Oleg Nesterov
 <oleg@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, Peter Zijlstra <peterz@infradead.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] mul_u64_u64_div_u64: fix the division-by-zero
 behavior
Message-ID: <20250616222629.620830f6@pumpkin>
In-Reply-To: <q246p466-1453-qon9-29so-37105116009q@onlyvoer.pbz>
References: <q246p466-1453-qon9-29so-37105116009q@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Jun 2025 15:22:44 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> The current implementation forces a compile-time 1/0 division, which
> generates an undefined instruction (ud2 on x86) rather than a proper
> runtime division-by-zero exception.
> 
> Change to trigger an actual div-by-0 exception at runtime, consistent
> with other division operations. Use a non-1 dividend to prevent the
> compiler from optimizing the division into a comparison.

Given there is a definite 'plan' to avoid adding more BUG() to code
I'm not at all sure generating UB here is right at all.

I don't know the best solution though.
To my mind returning zero for divide by zero and ~0 for overflow is least
likely to cause real grief later on in the called code.

	David

> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
> 
> Change from v1 (http://lore.kernel.org/all/q2o7r916-5601-11pn-30pn-8n5ns6p079o7@onlyvoer.pbz):
> - use OPTIMIZER_HIDE_VAR() in place of the open coded incantation.
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index 5faa29208bdb..bf77b9843175 100644
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
> +		OPTIMIZER_HIDE_VAR(zero);
> +		return ~0UL/zero;
> +	}
>  
>  	int shift = __builtin_ctzll(c);
>  

