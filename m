Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2B71E5B9A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973321; cv=none; b=cPXUsYi7nqGXhu0ynuIj8bXhWanELtT+qq4tKrDgtVyQb6jbLGBFOGLfsmZs+j6mYDwFdfAKkg6GFgMrRpSQnqMD9qb2kCNqzCiFu8hB+bg4tgjvNM/Qwn9ehLCLjHvsMvekinb2Lr3uZzIE1ZCpG9cQcwHsXprno3512nrRMCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973321; c=relaxed/simple;
	bh=Zynt2xYe4yLXyl+ZNUkX5fnAcUYRdDyO5jFQWOfl0z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB2xEoii5XEsvlD5U18BkoM2kNk1i5EWBRe1SeUNRLEkBz55xD8NxwaXETf2aF2/LZwSHCgn/xkg8xajFcKTtHN0RWAPr1KDZHKcYhcIF8MzaJq7xv/UfEqrhPz4jXU4KEmz51prZ9mSwuPnXpRsjJ8XsER9RR7lMclFbUA9SAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uai4lAgN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uai4lAgN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234fcadde3eso70818055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973319; x=1749578119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=Uai4lAgNjGyKwfWkEPE2cR3ZTrsSVshwOqYsCF+PlZ2RqV2VP+FoWgmCmEIFuYnu2b
         aF9c+OQGaqOPbQb403yHwjMECDOzH9FOrxUm2dCBb3Yy2ncGOGbkKeDThJt2ouE35BOm
         C20LcYOxWlIKeU2m7j8paCifnMt6xe+UbAD+nuO9dkyrVN8pl//y8rNrzIhWKQWOXSdk
         njYQkkSvd6wAEYXn4TUTN+77V7oaaHk1pKTTyE1BUdO02cOVySY93zsUEkGeLeFwDgbO
         HUOaVi+H437sW9/LPjODC7iJh1yUDHaapqDRTkJVb67wlYu3RCBMbHbzsCXW6TI92ZUI
         0kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973319; x=1749578119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=bSPZASn/cJ07wW3OTJEwZVNPBcPXa7TuHvs3Rx30Lj4RMl1BXuHR7tWjn/HOwnFluL
         6bGATLQlLIuYXMZTni8eqj40oXFJ5PY9/03Vi/rjL3qZSQuVD2yn3gYezELzchxCpp2A
         h8KTSTGWRko9flnSDselnWImjos1lIgyMHCfnG3JW+UbnNTqCKXggAnyKspPDM16my1N
         0lfb77jeasYxD7BeOzvQBFRJbNLIyopAf5hdLSdChkudtT4gl+zydHK786WId/bOgGTo
         CmB6joZ12J2v5gv/Q29AqsLrZdi1/9jEFIPjx9s2RwPdM+acjqY8od0I6TaqdEMyUEq5
         8nzg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8KqvZwn25L1FQD2l/dlogKo7LTTfM53K+2pI3/fO8S4jpdB9sJLP+2NSy3OLkw58zTpQczwcq0ZfIUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YywGLGGaD+q7UUjP9wgC5tHpcgagGJQ2/cHIdbCB556lOR3ws01
	dUhoEUUFYxRWg27WEh5O+zhEdofRXzXJBVpbB9Xc9XoxVkm+IGpO36el75U5ss2nEQ==
X-Gm-Gg: ASbGncvzOJxz2DGmrsYOBr+dPNeTqbX/PGPnUHVe44f/+PAqoeGlkCyzB+JELY7Xq65
	SM+VDn1bmjT/P1u1Dt3h/y/RGwqoqVjDurMf7+IiJ0jbYuG/24Waj8Og0vE/YeT5t68e2f/cKPS
	pydi+mzrOgGuXtRV5X8plZCsBduivnrh+5YM0S58sjyAC6wNB+m2AK/up0tfIJV69ckIYRAbNmT
	zAzpBCdIkn9pkymYjdvhVY822kModsVQFgQHmrUV1xjY2a+bggXn5gO2ZFGA4WdEnXkPMaui2BU
	I9HTnA2NM8dHteILa0sVfRtnfkKTyS+jFxfNOdk9sKyjSlU1/cJYIRePDh2IY1cA7dcVgtC8DWl
	+GI/zqVGwD0fAnnpuSpJcBAXx0tU=
X-Google-Smtp-Source: AGHT+IEL8qWQXsZH17HCYlbbIw9UGPDhlEkxpYMP6+pX9reecYXFMezlkTqgJADRlqe4EFkksHLW1w==
X-Received: by 2002:a17:903:b50:b0:235:779:ede3 with SMTP id d9443c01a7336-2355f9ef557mr237428345ad.41.1748973318650;
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14bcfsm90207425ad.236.2025.06.03.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:55:14 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Message-ID: <aD83ArjAx463xOx2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-4-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-sun5i.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
> index 6b48a9006444..f827d3f98f60 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
>  	cs->clksrc.read = sun5i_clksrc_read;
>  	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
>  	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	cs->clksrc.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&cs->clksrc, rate);
>  	if (ret) {
> @@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
>  	ce->clkevt.rating = 340;
>  	ce->clkevt.irq = irq;
>  	ce->clkevt.cpumask = cpu_possible_mask;
> +	ce->clkevt.owner = THIS_MODULE;
>  
>  	/* Enable timer0 interrupt */
>  	val = readl(base + TIMER_IRQ_EN_REG);
> -- 
> 2.43.0
> 
