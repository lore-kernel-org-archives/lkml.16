Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83AD1E7C11
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973281; cv=none; b=QqZm5Xh6cOC142HXFTSCjJerublCdQXBjWdhA289i7rsdZKbd0xfSfnWGS9mtiMdF1cR/9GT1D+apnFJvFBWO/R3uWGYX0LK+l8zFUODVimZLHqnakVVWtkf4f8jGLxLD9R7lzTwCRH5nmTkeLOlYaEr5k80cRFbAKavnlqKLOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973281; c=relaxed/simple;
	bh=ldRV3yiK3frofPHpemDZRG/9dNoJTR40n01/P/4BPbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtiQJLdTz24j4n77gpCn6FYKeA/8I486vU7wf4PGns2zk9GiPXrnb3cOTpudQtCD65UNv8SmT9rNHPYGKjDMUOV04Fw1yK6leM8Ij3Xcv+ASQa0Kfy0mKuGQDayfsZeduhcr6ywuuZHS/BrXm3fTUPETJdt+nENp/a8tgSg0Bbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CO+REiYq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CO+REiYq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5187711a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973279; x=1749578079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
        b=CO+REiYqDVywwEZN9K03eb5hOOaWZjpmb7pberMjSQRfVQe47ADp1l2JuCjUYMwpUV
         bKSK6hk11fUJ5EXYnHj/Chyu7ybVOXa5H6GHCXKVJBbVIF67DvvVbM/zUDqUQ11fO7jv
         VEDVBPsLjpN5rlh1ped5p+W06Ol9RLPCYmj5KER+9iPJXVxRr5GfjZA0CxU3dR1dVYCl
         VXgp+A5Wg8pPPQP1rDiLuQqqrdBdD7AjHGFHWiBr+e5hWV76znEkhUoI7WnZ+rhLUhE+
         qxWqlGXiLsO98lFNRuiUJqZyo5KX+z48PDI/cqskSLftTObwtfUUVv/xQXMWXTk9FrPZ
         5xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973279; x=1749578079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
        b=iuvd0MP7sPO2O9gKlxFonQBxPQKITgx/MjxYClbQLAzl+lf/LslNMwuSlftHWuYYh3
         8uHyPQennWjnAEl93qd7HSW5WHuXUTZLH2tDSOcNDNjVnuuU+LmJju3EaW4s8IVVkCAC
         UzSHz+G+edKePsLdP6gVwxYAUmJmIQKube5IUG4NvNm3iOAFkFgjriOhIMC0+vVFuKav
         AhNF8X5ZZndqR2n/rn+Zv4MttU+U/wOtWFmfLHDFynFHBbbf8UVnMmkWH5Hjr5QQ4+tc
         nmnc52t31wm8XrC/Zum9pdEStcCvNlqRcxDMzZVbUzbKRS97XJrAZSU13dObL/mv0TR7
         5VVg==
X-Forwarded-Encrypted: i=1; AJvYcCXzKfVZrm+WZJfuNfGYEOswY1cbb6Yj23li169nDD10kJ3FgI5njgPhNhwXM9SWyYLZ4mnt0jnktxEHH/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY6xrDaCT7thg75OOO3n0uXLNhrL9jpH6UnJ8BFEcXsQX+W/YN
	0zDVUn0mVm/trxOa/eIeKmGK9fqRJdeHAxQnFpdJO1rSoRbyITrSaCw8dFf8Pf7uVw==
X-Gm-Gg: ASbGncv/icCYwQ3+OPzqHa4BVJLz8oJ+TffO+DlGrzWuY6nXkRfjAYujQ6RE+GbskKg
	HDb/OfvcNXm6aqa733fm9O7At2WFXax9mjZjv+Ywm7CoGjnaEEqn9mkSfOvDGadfbfwqwRczDi+
	LDNJ4pWn6zzlD3ZuotKdOF07Z1bC7E6FLKYNQwngY2v13wkJxacYj5MsfTsvMZ7iRoXfdTQAHs/
	AQDSSj0Jmjb8hGH2NZDXHoF9u/CWN5dPmxyxvWnsSfnjBi97U3WSnpjfoCQMbgPuWhsHW3nPDwz
	AAD5rC8+xLlivDhM0aDhoPE1bvKMnpAf4IArCnyQqbk/N220ds1u/I0eEM+T+CDciWt37CaWYbI
	fmcTnOmTQxRTNxn3SwMWWiqLjhiM=
X-Google-Smtp-Source: AGHT+IFTvlmrdVshd5QxHXcEQ6MKKQjAV8TvJ2nBjRVCK5/HXrreUCJZBUa7P7G7vUU+2pvwwgQ3Ww==
X-Received: by 2002:a17:90b:55cf:b0:311:df4b:4b8a with SMTP id 98e67ed59e1d1-3130ccf69ffmr22034a91.3.1748973278786;
        Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9474sm7517618a91.29.2025.06.03.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:54:34 -0700
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
Subject: Re: [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add module owner
Message-ID: <aD822umlHEamq_bA@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-3-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-3-daniel.lezcano@linaro.org>

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
>  drivers/clocksource/timer-stm32-lp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index 928da2f6de69..cf1423ca00d0 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
>  	priv->clkevt.rating = STM32_LP_RATING;
>  	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
>  	priv->clkevt.resume = stm32_clkevent_lp_resume;
> +	priv->clkevt.owner = THIS_MODULE;
>  
>  	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
>  					STM32_LPTIM_MAX_ARR);
> -- 
> 2.43.0
> 
