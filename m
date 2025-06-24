Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67191291C2D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775546; cv=none; b=e93JXwhI2oU73z+zgcvZH9cT73Lm1OwGXAUeZQYhp6O6hOHIvSLrjEQZcWx2esUSCaan+Q6i1PVBjzZ0e+b2D+uMiaMX956NXrBLjrUtbrKMRI6m7GYeNVRGc1RR4y/Z/FOl/SFf2pkeXIKRnPQSTbcjEZnxGzB94vVpwKHgC/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775546; c=relaxed/simple;
	bh=/n7FMNMINwO4mp0WyIHGBmD2FtlJIjDt+/3cn/GQT88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjDItbsunBbk9IgMNHlACJU882pxoqZ5bwRYQtoxk3pNmR5/hPchcPc/HOaL6hz03dkMLBmzf7NPUgdrD0jwKaSZxkNKwfdApRwfuW79+IYJTz3cqI+y7PZPRJGAR39IC31MegY4G3EzeKvRe61laaBx0ThMvFogWCxP3R1S+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMmufwzr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMmufwzr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453749af004so3182015e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750775543; x=1751380343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smIRAyIvWrWgWNT4Occwud1SoHjbpdF912MDUcyeXtU=;
        b=DMmufwzr2r8y0AA1nLFo/nDOAwwNVSjhbMiW7aiI7fYH7eDwSljfyUAaMemawNNJQb
         bQgqaHPinoVe39sPKwfvoXw3yZkEhYWw+6wv1VRPS1U2X9NoOXgcbF6lSnkToh2fZy/g
         lvrJwCl6X+3y4xFTpnz23soQVl8P1uyrb0NSO7JtLsahRpbprCbjtTGBF3UrRMJ+FOg7
         bfwhuI1VOelqCogt3KMP4ObMOA4wlYPhSbkflBNjDgfaZH3T/W3PpRTZtmriWk8hbc2i
         9Sv1b4iucgj7bGIA0+my5HAzSL/VAWqiXqs+9gwvSFAR9N7sKSxsVFnCDAyIe0lzyGUU
         X6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775543; x=1751380343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smIRAyIvWrWgWNT4Occwud1SoHjbpdF912MDUcyeXtU=;
        b=iPml/3FyjfMTYVAxs/h1QB8kRFo9wsvojOr9Ty65ry8skU9vYZ8fx4Z8pz1U/i+ATn
         mUCC9xEtH/Js1xSMLanRi5/Q/83GsyHsr2cKu75xyIeexrsC9Dm7XR+qE4l5aGOF9u1A
         BYQx2xfjNdRyHuzG7iWV7iBrmjXIseaUillOLnNMCgEeU8QGAZsVv9g8ccP4KvZfGr7v
         jURZK2qENZZqwjvtTYnlll+TpdgC6D/f3cttebNTqHoG9g0FS9D5c6ef/yQ4ohKx5Vf8
         n3MrAAKLBB6z55TeX95QPX/YAN/1DP1T2cOvkLnpycmqhmATJbHXKbZ7oRYQH1De+qcu
         wQiw==
X-Forwarded-Encrypted: i=1; AJvYcCVZmLeaDAqAvhLAiGff3rwjGOYTWyoViUrsqWQxSZ+s3q8sESQOhrnJjKBLUjd4o0bS/osUjT6MyM+COTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgmpJLmHsO+6nvqVY3FmOLjfNsKSjquD6U9BnC8A1pVDTA1cA2
	BWCIbhM0G9jzyXuZbd+bpE6YPwzvcpaJZmL2uDc7Zsus59CaLKp9BkogX/hVfKB8t54=
X-Gm-Gg: ASbGncu0Ff4nVewrsfRtuNGO8CmrPNr1MOEcvTiihe7taUDjNIZFnzWz08RTHPO6m8F
	rlaIcGFnb8OEPbAYzWaNbJ3VOETu2q9q9gK9Z4a+MpCYdlJO15GpDbHqugcgyRB/XmY+23VNkNO
	xAJpOZYLqT3oRrIV/sI4eX2vl9DZs+SAnCzZcvtME3b3x/Ff8wgt8wRO3m2xDBDeXIkTWH2otI9
	Loz+Rx4gUk7MEG1iPzu3FfS2lZbS0NFqskF0PujN18h3szvlgLG6GQK54fbqOPlQCK9laKsfzjU
	dq+FD+5xjLIWTD5WBwCq4v09ZDSMxrVkVkLwtJO4xrf9olZ4teFafeoDYNlystLGYmbiStJpl7H
	4F+VxlpzldOkYazX98vIjOJoc
X-Google-Smtp-Source: AGHT+IETvUDQWVsb/wzbqO2lFNliysTWuRtBcrxUHsrBFmsF2UJ5OYfM8LC1Cq6w+Os/lZA54+A4bw==
X-Received: by 2002:a05:600c:1906:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-453659b8997mr148222785e9.27.1750775542596;
        Tue, 24 Jun 2025 07:32:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805cda7sm2123628f8f.26.2025.06.24.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:22 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:32:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Pohsun Su <pohsuns@nvidia.com>, Robert Lin <robelin@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-tegra186: Avoid 64-bit
 divide operation
Message-ID: <aFq29Fr5c2TAZOYO@mai.linaro.org>
References: <20250614175556.922159-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614175556.922159-1-linux@roeck-us.net>

On Sat, Jun 14, 2025 at 10:55:55AM -0700, Guenter Roeck wrote:
> Building the driver on xtensa fails with
> 
> tensa-linux-ld: drivers/clocksource/timer-tegra186.o:
> 	in function `tegra186_timer_remove':
> timer-tegra186.c:(.text+0x350):
> 	undefined reference to `__udivdi3'
> 
> Avoid the problem by rearranging the offending code to avoid the 64-bit
> divide operation.
> 

Hi Guenter,

Arnd posted a version which seems more complete.

https://lore.kernel.org/all/20250620111939.3395525-1-arnd@kernel.org/

> Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
> Cc: Pohsun Su <pohsuns@nvidia.com>
> Cc: Robert Lin <robelin@nvidia.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/clocksource/timer-tegra186.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..7b506de65438 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -267,7 +267,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>  	 * counter value to the time of the counter expirations that
>  	 * remain.
>  	 */
> -	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
> +	timeleft += ((u64)wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
>  
>  	/*
>  	 * Convert the current counter value to seconds,
> -- 
> 2.45.2
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
