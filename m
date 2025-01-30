Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72E139B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738207337; cv=none; b=oHzCiYyyJy9Tw+j/RJHcEg1j4i72ds7Ew+0PDx8MXqKeQRBGIohNXhlqUt9UyNo4LIyOpG5Hw+uT19jDyarg1p/9yvIi7QCAYHOluVr2POBkwDAuDafFfMQdRB1Jp9ewTo3zrppXND9VU9BlpRsIfErrVlBPIjTkEZCLb2ygNls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738207337; c=relaxed/simple;
	bh=YrV5s1afiLTZ8aJzAPbd9iA5+2JzwX2PIQjlwXCgHU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxsd5+m+I92GnWcBp6CnBFuVJWw56HaZF9JIM1fj5ZL2dW4TMsun+8OqoU6yBREbl5n03glAz/eulJzPjfW+nIkpjLDSSf9C9koNLX3Jdad1IUIMAJxZRtw+6lnixTQepcrP1nr6z6jXuESMmqsm4xdJosY62dVzPPz4SzzzxGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X7RnxK4w; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X7RnxK4w"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so361043a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738207334; x=1738812134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNv/qF5L9DYQG4GRInYjrKbioOHCY/rhDAdj8Plp3Ls=;
        b=X7RnxK4wfhDqtdYhkY9HYItmL+rdAuzqTABxVOS35DWEV1WTwFG1dtf6+wbFRTLFcK
         cTNBUMwvr/u9E7q74Z7rxYKv5EgMma5nOXCgK+HGBI1l894V4IaaZ2vF41ZiidMu0Cx9
         hYsf1JHZr2DFcYU18cghEMRkcsDaKt2h+NMHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738207334; x=1738812134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNv/qF5L9DYQG4GRInYjrKbioOHCY/rhDAdj8Plp3Ls=;
        b=gTR1aTcO0IEgp+qlu0O9oRZOeljg7Sa8A0mOpLnTLa0EqUGbujHDFUS2dldD5BzivG
         WZTuZGiLLzRmtQoABoirLiH1F0UIn/s/KPwAeu71llgZ/Rr3IxpLEVhjvYNHMuY+CRcr
         HfnVj5V7P1Dl2u4y7lVj5gNrQ+melniiGPibHK+hsaba3wo86V6cz3ANDCnR6ReC7pT8
         HDl15kq8feeH2KCWEgJM9qVtrw8DJ7QXxrbXb4GN0v7Nc8OXE4iHNX3bioz1lpFJoUve
         r8axgtXA1I6eyQP/6sj/1SzSjHJMqo3LQfry4wghDCqogMUL7vw8cwpoZbMRu6Jdf8gW
         h7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAEE+buAJnhs/SgslF6n5z2LV1p5EJda7Dj54YcqjB5Uik+6lNwkjs4Doie/BVaFl4UzXGECumNGkJSoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtZngFou/ozNme73ZO2NRVI1eMXKtBDYKMQdULnZMLYrT3Ov/
	d7c5TUD96oSwf4zUxoiaWLUxE8FTZ7g3AbrRVDsgZwdK5dCU1+QMm2WtGXvKmA==
X-Gm-Gg: ASbGncvP7miPC//sKpOWVGbeNqflJJ4exBkA/M+I+sObZoXhH7I3uM68GaYNiaBs6NB
	LBnWVUojS3eCS29AZAsU0n5lt/xwVFiPtqCXJTlDz7nsIGHHaxMIUh8zowMrojtr4lfZ5p9KTkD
	sSufyvbRa1bjDZLjXMgngg3P0cx2HUyCfBGQ/yzO+wcjXinW7T9wolj3yd7Zn2XlecYdt70ZVBp
	RYYLiGWFTemI5sZKLidCuYkEfuEAwLQAYO6H1lIV7cjdd6AMnAg64COY98WCSN6iMgyoVyXQHoz
	De31d7mNCSyTjsipQDk=
X-Google-Smtp-Source: AGHT+IEHDzUZi3lg9xMhHt59OkIpdTDr2gsnd0+almGl7slYViWjk4HBx7jwg26XFrThilzoksJunQ==
X-Received: by 2002:a17:90b:548c:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f83abda260mr8524977a91.13.1738207334658;
        Wed, 29 Jan 2025 19:22:14 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd0ce4dsm2639680a91.27.2025.01.29.19.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 19:22:14 -0800 (PST)
Date: Thu, 30 Jan 2025 12:22:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv1 3/6] zsmalloc: make zspage lock preemptible
Message-ID: <3oxqvpghezesl6nj474v3xchpseeavc6p3u752yaxswpfmcqxd@ohdx62ahgle5>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <20250129064853.2210753-4-senozhatsky@chromium.org>
 <3f787832-fbb7-8590-c090-1f511b16449a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f787832-fbb7-8590-c090-1f511b16449a@gmail.com>

On (25/01/29 16:22), Uros Bizjak wrote:
> > +static void zspage_read_lock(struct zspage *zspage)
> > +{
> > +	atomic_t *lock = &zspage->lock;
> > +	int old;
> > +
> > +	while (1) {
> > +		old = atomic_read(lock);
> > +		if (old == ZS_PAGE_WRLOCKED) {
> > +			cpu_relax();
> > +			continue;
> > +		}
> > +
> > +		if (atomic_try_cmpxchg(lock, &old, old + 1))
> > +			return;
> > +
> > +		cpu_relax();
> > +	}
> > +}

[..]

> Based on the above, cpu_relax() should be removed from the loop, which
> becomes:
> 
> {
>         atomic_t *lock = &zspage->lock;
>         int old = atomic_read(lock);
> 
>         do {
>                 if (old == ZS_PAGE_WRLOCKED) {
>                         cpu_relax();
>                         old = atomic_read(lock);
>                         continue;
>                 }
> 
>         } while (!atomic_try_cmpxchg(lock, &old, old + 1));
>  }

Ack.

> > +static int zspage_try_write_lock(struct zspage *zspage)
> 
> This function can be declared as bool, returning true/false.

Ack.  Thank you.
