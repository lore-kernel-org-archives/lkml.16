Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479683D3B8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973644; cv=none; b=SEhKkf1w6ggyqieWjIWY/llZlE13gum1Kh4Ka818jdXqsYzFZtW3QZ6X4nIeViC1A9FXO1aXvRg5V4pp7WLTCvPCr7liGLXwN3mKGCkjtj9+UJGSZ5OISld9oRz6vDZ+kPrDZXY+yRYp5gdY8CidUcd711IWXQuCM0A6h2FiBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973644; c=relaxed/simple;
	bh=rD3AJa/sm9PmeCYaTHhDjRKPgFI4ycYyijxoyHiuPMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERjKFiEbqfQub3n4xJVZoXIZCXXtANOKvj0+fTJ2JETgQ9NP4xvuNJuFRPERHoicdOeCkd3e/uoUbsltd05BhdndWSzEnHfyy1HoeQnsUmmrD3KaCwQMwjxEke9hBMUaO21kjvXbMeA+oOtWgtY9FQ2R4dkDKzB70IfTofqSbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E87sTH9v; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E87sTH9v"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fc7506d4so1087014b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973642; x=1749578442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
        b=E87sTH9vO763OWb0njIIScQ2trEwVNUwtqsAl3IcwkUfLjIGrH81D7jhxjJjGDLe7K
         TVXzLaXs2L/hJB7hb/VzA8FIaFRgKt1ugYPBeoSl/tDRfJ51BGqZQukO8OvEnaR+kIrz
         j/HOLFO3SzYY3VHNcIWmNYaSSQXRM6li38afiGi7ePxQ+TiGK4jG6SmacihixOO3aPHZ
         PGp7smFLviMBfA/sQSFkeA9O2DXHGhvtlSzaef7PMErklZme4+ltvL1zKcBrJqlrZRaY
         irwxDzgEGcttv3wnNorGl+araoDjcVYttGrE+QS83Gw3jtO7QExW15IuYGGNl5HWi+x/
         pfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973642; x=1749578442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6fuPGgjUjgpvLiVwa9uHLktuxrC3x8lruIV/MEvnmQ=;
        b=nQwziSTQ9NB5otx4AfF2wxn+4ePLfzruXAHkyvGay7iFIXfeogQPVL+YwvgUd//A3V
         QEjpStLluciZQmvA+vm8KLBPGN65H0hDE5eVuCcx5dJgdZyY8VDRaWfHB1bsBMJ/FzEy
         nOHLjNqAj+QfVIzW5BNyTIhZEeHMWMRAdJAFx0BzTjHSRm9pD4OpWOao3+Yjr1TTNmdO
         Rvc5i9VuGM8bBT9tuZUB4bIWTndXvRtzCbuMSJiVW7SvmqhLy2NC6aWV8pxOpy1tX6Xu
         dTVliFiEw/7f3klT6gkghCJsyzCsrv3GegDjp4lo3ZJ0QgE7ZPVmDgaQXwm/1EQLZ4ft
         tCQg==
X-Forwarded-Encrypted: i=1; AJvYcCU5p7Pfr2xxu09VvfI0vqdfQB+UuforIzBGh+/iAXZKsNP9WUCxcgSNmN6QAxh94LyiqHY4fvRQkNgWsn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCAy+gZaQiHY134lEme4mrelEXJgoL+202pYAyAZat02alQo7z
	OETzPz3dLzygrJ+JvNeWJlubLDGzpVAyknubVNnSJSKeAA0fYPsg4KUKjmqxrSwyAw==
X-Gm-Gg: ASbGncu9Im3CgMcorNeF9O3FNTSkL4JCPkz5XaUmu8KUJTsCha8bSAfW8+oTWoTM4vQ
	TeYd84JfgkIfNbj8q2rP3sb84Ndpf0KBtVxXl2GxS/YY5wLJELPU8WwagYEpV2kEUm1/BS8md6V
	ojW6QkErhJRSYHXdkSsMVFhoAmg7suwKBwY5paocS6dA0yzoszTzH04OOtL8hxnyENIuglTtpC/
	PhiuoM4tUEBTLbd1sGKZKj6CWXXKsO+7WnQB60DCzaJOQYf6Yhvjb3tV+tETiur7kuHY5a9oxLx
	FSwF1AvtvySBpwWzHrsK6v4cQf2N5+mcqqTkY5X/GTm2sr4OrXGxvXRU8Rt692NNuLesD80ybJ6
	RKX/9/+VO7pxnIgetFJWk28hnSf4=
X-Google-Smtp-Source: AGHT+IEodTIVtAPtf3Z5cQ4Uq1uQBXjGOn+G7Y9GhI4s+r7QBMKm7jSlhasASzLhvPxxrzys9RVm6Q==
X-Received: by 2002:a05:6a00:1a8d:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-7480b1f6371mr74882b3a.3.1748973641368;
        Tue, 03 Jun 2025 11:00:41 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm6427681a12.74.2025.06.03.11.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:00:40 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:00:37 -0700
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
Subject: Re: [PATCH v1 6/7] clocksource/drivers/cs5535: Add module owner
Message-ID: <aD84RUX4Tt4jg62m@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-7-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-7-daniel.lezcano@linaro.org>

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
>  drivers/clocksource/timer-cs5535.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
> index d47acfe848ae..8af666c39890 100644
> --- a/drivers/clocksource/timer-cs5535.c
> +++ b/drivers/clocksource/timer-cs5535.c
> @@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
>  	.tick_resume = mfgpt_shutdown,
>  	.set_next_event = mfgpt_next_event,
>  	.rating = 250,
> +	.owner = THIS_MODULE,
>  };
>  
>  static irqreturn_t mfgpt_tick(int irq, void *dev_id)
> -- 
> 2.43.0
> 
