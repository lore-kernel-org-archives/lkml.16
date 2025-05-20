Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89944C7C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707680; cv=none; b=W9oeJs9Vcw/pECmVxbp8h0ycdtSkSjG/RZS6Ri8WMyKWqe9V83Svp6Ao/ZdoOwN10csUmCmoTqadyjcdlRLFzG7LEX6zSwMrsLUU6FX//QTVx7qdfXt0YR/qqO/+qlSKvnp4Yac6cQW2NPhGGu/inctqbFWOLgTMApBotx9bB1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707680; c=relaxed/simple;
	bh=rnIyZOZwXwyBX4MC9AQ4KpcUOppBZVf56gLBfOF8aaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=C/rgsnzjr/6mCYpUWrDloBesnFIXiCec2QwvoT6kUgqHBQIlOR5zFbyHAKRCURlOfmGVeFIEU07AqPBEo+c8xvOj+z95VR4X9/OIAcqWCLfA/JoIkyxXO7wBTLGT+ARtqjiGZCREOmxNnAUIP0inHOgKDsNTyEBnz8bB8htDSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zxrvWix1; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zxrvWix1"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f8b10b807fso53906136d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747707676; x=1748312476; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mv9NR1w+gxIpIc3S5gfdhi3JSLdkpRz142CJ5qGcBC8=;
        b=zxrvWix12fXobaHp1fUkF0AKEvDN1P8oYXB+JjxtxEcpviqD0l1+UIkzAtd5vaNpA1
         WGYrGHZFS7Mp+yQDD2+RhSwUCkbPfBH3BRe2sOygbqBPO1iPIRzylZY7XB3AUQ/iI63M
         k4vcVi8C8lsvv5CJ+4IOqeTCcHRqwqmeYuDFmthtjWjZMBS8dc7AaDQ7WWNHdn+pOa1M
         L4x2iWFqdIM86wC08tpcQEBNn7mODIYfojfQ0po554SiAWcBT/DyleiPl6HRoQGuUbF6
         wz32eGcxbQi01irLvlvupoMYHIIdfQ+gkoemhKf1FmByPJMXrshlJq4qi8R4k85dYDU7
         n4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747707676; x=1748312476;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mv9NR1w+gxIpIc3S5gfdhi3JSLdkpRz142CJ5qGcBC8=;
        b=vcezz8uYCeWARrcTOq/KFv3QC2JGL891T/32epKu9N7IgY/vfxLgrAXEnKudSo926H
         iAkn2fTvDzT2BWq6j87dkgBhY+3YO4frQo1el8iKWrONrqhKYMAanjwEAlj8GuR3P4zO
         VEajaOVUSbbxELxbP+adovOj1KWqut8q16W9UJ9DMaYjLqecbT4FZwNhVfeqGQXy9aT+
         6O3daPouNEFViYCBBYpYzL8m6kVPn/Pl/w5NT7BLtE7IMMqTVxvj1l7l5n2X82ffZqZa
         yr+0/ebpJoEMG/+0FggPLmZbxteIDzBRkONPkC0/pS95ZwBSlywwGB1dM0T8sWfYvxS5
         9kLg==
X-Forwarded-Encrypted: i=1; AJvYcCVnAYOPGMpo/X7KmX+Rf5RBeTiU/g23RW/Bvady0VvOurOS9ML7XJ1ifCccDzAbCNbjvLLF460pbjtiV04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzha5C7upSbUzgGogLeuEotD06i4QUcrgtvhNDyhcNnoWGQkamN
	bo+GyOEKupKo/Csm6UPRep1h7km21bZQi/ATPxA/HKxFbTqwAlZlD5jP4fuWiQHVNzQ=
X-Gm-Gg: ASbGncu+ztXYxXmE60fZNF28eMfwLvoJdnLT90Ih3K0c6tKL7rycWl4nVjYR3O/cYiB
	E81Fy2ZT2lWzKKv/ZU2yOwtasxH8pT5g4Ch6o4GwBLNRAS+gCiSKLdtIZt3NVi8Kr01nett0cBB
	oc+wIA5mTPBKlOzZvLJEdWoYiARX6mU1gRGd+lx5f6y2seFOZHot3uBFVwJIyufjseIOkabPsZQ
	Rt+7SvL7CCH/XwUMd4WBZ597Fql3gJyEpi2BEWk74BaQ/UGCCHMiUJ5Bwmo5vjwRoU6+TPe86+e
	MJ46c/j8oK7GpaxlDBqvzOR6uROfuHytd20Y8dPyxG4Z0BxzuVOPN9ce9R0DoH+G37AVXbNmgzK
	z0goz1WCp3PnYhA==
X-Google-Smtp-Source: AGHT+IEpKUyEwjXQJkL2YdrPEoyKd44y5EfV4NhY69IIUsVTf/AREwIFgVYdjQXub8D3/wgtOUncQA==
X-Received: by 2002:a05:6214:2ac:b0:6f8:c621:5a0d with SMTP id 6a1803df08f44-6f8c6215d4cmr147988086d6.19.1747707676346;
        Mon, 19 May 2025 19:21:16 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097a3dbsm65039696d6.101.2025.05.19.19.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:21:15 -0700 (PDT)
Date: Mon, 19 May 2025 22:21:15 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
In-Reply-To: <20250518133848.5811-3-david.laight.linux@gmail.com>
Message-ID: <pr79o4o1-5345-popr-r206-8qo76523657s@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 May 2025, David Laight wrote:

> Do an explicit BUG_ON(!divisor) instead of hoping the 'undefined
> behaviour' the compiler generated for a compile-time 1/0 is in any
> way useful.
> 
> It may be better to define the function to return ~(u64)0 for
> divide by zero.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
> 
> A new change for v2 of the patchset.
> Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
> continue and generate 'random' results for any 'undefined bahaviour'.

clang does exactly the same as gcc.

As mentioned earlier, this is a soft NAK from me.

The above explanation is more speculation than fact. And here we really
want to duplicate the behavior a regular runtime 32-bit by 32-bit x/0
would produce, or in other words behave just like div64_u64() for that
matter.

>  lib/math/div64.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/math/div64.c b/lib/math/div64.c
> index a5c966a36836..c426fa0660bc 100644
> --- a/lib/math/div64.c
> +++ b/lib/math/div64.c
> @@ -186,6 +186,9 @@ EXPORT_SYMBOL(iter_div_u64_rem);
>  #ifndef mul_u64_u64_div_u64
>  u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  {
> +	/* Trigger exception if divisor is zero */
> +	BUG_ON(!d);
> +
>  	if (ilog2(a) + ilog2(b) <= 62)
>  		return div64_u64(a * b, d);
>  
> @@ -212,13 +215,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
>  
>  #endif
>  
> -	/* make sure d is not zero, trigger exception otherwise */
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wdiv-by-zero"
> -	if (unlikely(d == 0))
> -		return 1/0;
> -#pragma GCC diagnostic pop
> -
>  	int shift = __builtin_ctzll(d);
>  
>  	/* try reducing the fraction in case the dividend becomes <= 64 bits */
> -- 
> 2.39.5
> 
> 
