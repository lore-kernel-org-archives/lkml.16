Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D70232395
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793832; cv=none; b=r6baJuLQlevnjiJnoAsf/6pa/E+aUn5WTegFvwQqz7GOoGRsxnVJbmoZvEy/iPBcWSZEJawKq5unKzYXQnFaLBcAnJq5b5vDbndHXE0rrjBwxVoGCpzoHfVWmIzBQI2Hwk1dkM4NiMtkXxpmKAOao5R32PHhOdJLIvg8KUy4oDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793832; c=relaxed/simple;
	bh=nwHbjChnx8SSvoyq881Zt4FBJaYQPTYTd/ChpimTRck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oUD2LFi2b3XXXRnH91hCXzqqGfpXM5ir9w5//BXdjTLeArvVhFyiVICYBlFyr4QNoi9rbGOeK6sa5JaL00CEm5xWxNZoOvJIQ7sT1LkAy3lj2vCY8HTsYUCnBZiyccZicnFP/GyuR3WiJouaAL0XGXnIFZq9Qn/qE32dW98CenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j67OMXkE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j67OMXkE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so51203505e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744793829; x=1745398629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2q9mWrQ077CpWx7gvzoZmI6LLaEYOe/WRqM0y6kozc=;
        b=j67OMXkEQtBAK/DU6IdUZ5Num6+TR6ykz7yQrAr6pWsz+Y6U2IfmT7yphUl4sYDNCl
         eZZUm2LE09yw+XT9q5jzydA04t1t+GT+4PlKZCYGYw/CoTgkI9Zft+kPfKgGTanUGb2a
         Tl04lV+Qm07qvCHkEhB/TWIL5Vm/XQBLEIeeYNsJKL43z4EyJIItQYj4YWKZnpyWwsEq
         a/TQV6W39wM+TsdYgTl9HNT77AdVWi5IjLrGXEHTGUCYOWnxi4lRZ0gUAOIRdrMzNeRm
         KjUPEeB/He54oI4Q3yjVY9RieLjMctlwLG9SzmGMv+g8yUxMMk8aYGizoYQG2hcXIG3k
         F3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793829; x=1745398629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2q9mWrQ077CpWx7gvzoZmI6LLaEYOe/WRqM0y6kozc=;
        b=QBwmnUMMm+3HM7VreaXmo9Tv2s52r/mHLNAXkYD1xt6u/YiWm8vNqW0HDQosTygGs4
         H6RD9OscS6pBGoAJTerRDRiScU664YSpxtxXOlqGoOhScXreAxyMofWALbQ7jmCzM7u3
         DvVGave7piuOhvtKm79wf/VHceWQAwx2ejFnIFqhJQZYB3uXyBH7EpWjDIMMS1L+tN8W
         FK4zN9Y+c7yEfQjPO+LzdtyX+VbNPaX8CxKlS34711Q1oST21QhkttboAUsJqGMs1/I2
         cCW+OH+yIQu0BbSQPrLBIn/71vhQsduCnpTUjOrtgaM9R7L6SYEgnzEd1cKkiX+QBhAi
         Zv+A==
X-Forwarded-Encrypted: i=1; AJvYcCXbrmq019EiQGtQzrkzhUhv+qaZj2GpUmqgNduMPBNOuWe32/yLbBjvxo/iWPXjDsOy7232Fgg9e8Cqrvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKA91cWMFDEYgEDkIJNp2p6BtOmkwN7ZdSJZBfrhoBKTDbB/O
	tBYXH+jIwx1LxcWhRC7x1AWx+AO0Ser5jn865ltbBLBDgGYZbJcJ
X-Gm-Gg: ASbGncvIbeBlJd93wCETtCg5ZXiKfB0scx5DboLi+k4hosnH7iCqmGm28QHdwYW2IbV
	LfT8NATdcwKcJvWikc3oKcTZryjczemwLAhCQung5zbaA6KyWPq8RteKvlWD1bbZMfH/K15fuXo
	iieCc6Rw4g/xh2HWszIRAgNMcTlT52Jx5Xr00XuXQMwjY66n97F2UJP9qay/xelSrUz+O8hPr77
	BbUEgWecN+FC7psCGTvEMIquxH/DRd5p6gJ7SufIfo/BdSrem8R2UXSKp0IKQz0Z+gYsOJapG0C
	gvTb3jCWFnaz3ijlOGxyGmmnQDxc84Jb6cEkM789CkSHuoAr9bB3nEh50KvbX/Hj6CcKKv1F+98
	+Rj8=
X-Google-Smtp-Source: AGHT+IEdRu9lqhEI67GQdu6KzEDCKydS6x6IrBr2xmSqPRQe84os+UnJO/xBR4d/+hw1Eky5YD7SfQ==
X-Received: by 2002:a05:600c:4e45:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-4405d616b5amr9104385e9.11.1744793828365;
        Wed, 16 Apr 2025 01:57:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640e3sm16841706f8f.12.2025.04.16.01.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:57:07 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:57:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Xavier <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
 21cnbao@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com,
 david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce
 redundant operations
Message-ID: <20250416095706.47a8afa2@pumpkin>
In-Reply-To: <20250415082205.2249918-2-xavier_qy@163.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
	<20250415082205.2249918-1-xavier_qy@163.com>
	<20250415082205.2249918-2-xavier_qy@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 16:22:05 +0800
Xavier <xavier_qy@163.com> wrote:

> This commit optimizes the contpte_ptep_get function by adding early
>  termination logic. It checks if the dirty and young bits of orig_pte
>  are already set and skips redundant bit-setting operations during
>  the loop. This reduces unnecessary iterations and improves performance.

Benchmarks?

As has been pointed out before CONT_PTES is small and IIRC dirty+young
is unusual.

> 
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..0acfee604947 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>  }
>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>  
> +/* Note: in order to improve efficiency, using this macro will modify the
> + * passed-in parameters.*/

... this macro modifies ...

But you can make it obvious my passing by reference.
The compiler will generate the same code.

	David

> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> +		if (pte_##flag(__ptep_get(ptep))) { \
> +				orig_pte = pte_mk##flag(orig_pte); \
> +				break; \
> +		} \
> +    }
> +
>  pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  {
>  	/*
> @@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  	for (i = 0; i < CONT_PTES; i++, ptep++) {
>  		pte = __ptep_get(ptep);
>  
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>  			orig_pte = pte_mkdirty(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +			break;
> +		}
>  
> -		if (pte_young(pte))
> +		if (pte_young(pte)) {
>  			orig_pte = pte_mkyoung(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +			break;
> +		}
>  	}
>  
>  	return orig_pte;

