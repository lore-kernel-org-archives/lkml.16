Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED65D21771B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746177579; cv=none; b=fyD223gIq1CUpFJBq1nEjyWAv2lzEq2LiHG/n+ii5AiBPTFT4wWMvZV+2KEpqZ61Lf1ot9u9m/6bLzEDJ38TQy2Fx+jCJLUedS8lqbw88iGzIEmiIonJMJHNb4mQHrZ11HCqyoEbMUrondLEL8q+wSWVdRAzsuYgv+TK3DrLnEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746177579; c=relaxed/simple;
	bh=uHq4ABq7++1dNMxyAxjzXAnnHVwSDy0wZimtLtVFdcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSOgn6LfT1tlX8IU4RcPkk4f14536Ux14VoJF7axIrRjxWztvU8W7u66XrP1LY0lATjAKNdpzeI9uaZ4Ij4uJd4Cen8/zXZ+9O0SB+ba3CWNOsmh+hzJj8sVM+i8T3VdzipYEkdMeqPYDlmvx+qR5DYV7stdnsqy553OqbSY5ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vp+LXvFa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vp+LXvFa"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1249858f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746177575; x=1746782375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l6rQvGPZo9tLAs7ZOVR8KmW4U4DNG5ayaoH0ypnwmY8=;
        b=Vp+LXvFad4nAMYOcs3iLfa6XmjCESFMi7IHfyjBCWuLtsW3FMG1UCeNMDQudPatEuo
         RNGGnAiVL2g9y38hZbhKo9yf6qGaLPtoSM/CPi7l1YGkQeY4boUzY2tugU+PC7mRUeVb
         QG2w/PakvUYOIJC59lbnSLJYciJg1CzELsF/BBp1fqrOE+ErN1L02Nk1H8WjJYsJGzUy
         fCS6S8Wf6Rqj9UEKhYRg0+Li4J4MW3xyRj53Q/YQY7G2cOVGeMb5NrKiYnk6rP/f8ybW
         s+4CQPdirnqOFBmMLMGpl/BnRdpE43S69eebIPbdi4//jQ0TNl6jBCjbAGlYTuUTpxJ2
         pOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177575; x=1746782375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6rQvGPZo9tLAs7ZOVR8KmW4U4DNG5ayaoH0ypnwmY8=;
        b=Zs28Q+BMiple6OnDIAn1oZDG+asLVTtee3bVL0XoVjlKnLYfDowRm9Mr7G8l1i1Gv7
         W0czHrOzRI9BGVDMsm0J13Gt3nttKPNIx5ZHE9LOuGSH2o1wFJWpEw0sFh5YxABM/86C
         KaEWiSFHXwacZTWv3Fm6ZaAgcEGn1Z5jvKPvzz+rObLEcnDqm3matkxbZR0SBGDbM0Am
         O1icZ2FTHDNAL3JkW3fztsIqM/lOrS2JJYc7hdIGhBQsmQxfsfUBRQXH/2Lh62jT1AtO
         09pOXh6MS/ffdWt0V67TH1PakzRhqJdajMbSlsQsyEbBKxA6+HhJFhl6TItlGfxpGpfC
         t4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXstsaRBKJLkhWwVADYPuT/4LxpBNVPBRVDrlRhJj7gjKbKC8odanNEMdmsPhr26CrvrkyP7CoDNeJnBWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/xgEqGNysbTaPGtlmBVlsClfoXBjV53yHAfTtJERaIRtEn0+2
	zRMTQw70AJA9ITT2ekb8DBu9iDC5gbv13O7jj9r2H0NQcaSjU1/fzUb7RKjH7js=
X-Gm-Gg: ASbGncvNWb3yoT3SKP0+s+L3umnO4ZwgU/O1LMo9JZD2nD99Waze6QqlWtsmtt3rRJ0
	1dKao4Wt+E1xEAitanqACNX0DNdOjn8KS9FxPOaLObAlK6EFzOfsV+mXT0Y3eafQN3j8NOcpK1F
	gvfTb39+bSXxhF8qKLBVNLUEF9qQFDLLULAJyHjJcWPqwLsD+Vn+uT3him0Orq39Wt/AD9/XErH
	rQEg7TAMaP8utr0f8X7/MOWUYmgimP9T51GQcHQkIw5f4s78HYVtjT2iW9TZaTTVqWYuBqI/g3w
	WW68FEphy44+LvVM9uyVRpKOD+zQtqNz32Z5p5epe+rmE5/IwaNNMOl7/kN1flYx+KdRbZoClJZ
	6YJc=
X-Google-Smtp-Source: AGHT+IHn+ENJqTE2uYFbihut7grVeF+/ULv+gpy0cAurh77LeQ5sLNb1KEKWkJWA/dvxjFXxrzBgCg==
X-Received: by 2002:a05:6000:22c1:b0:39e:cbc7:ad2c with SMTP id ffacd0b85a97d-3a099adcc3fmr1406930f8f.25.1746177575194;
        Fri, 02 May 2025 02:19:35 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7b09sm1570737f8f.48.2025.05.02.02.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:19:34 -0700 (PDT)
Date: Fri, 2 May 2025 11:19:33 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <aBSOJTlQUUnFIEVr@mai.linaro.org>
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502043727.396896-2-robelin@nvidia.com>

On Fri, May 02, 2025 at 12:37:25PM +0800, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
> 
> This change adds support for WDIOC_GETTIMELEFT so userspace
> programs can get the number of seconds before system reset by
> the watchdog timer via ioctl.
> 
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index ea742889ee06..8d5698770cbd 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/clocksource.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
>  
>  #define TMRSR 0x004
>  #define  TMRSR_INTR_CLR BIT(30)
> +#define  TMRSR_PCV GENMASK(28, 0)
>  
>  #define TMRCSSR 0x008
>  #define  TMRCSSR_SRC_USEC (0 << 0)
> @@ -46,6 +48,9 @@
>  #define  WDTCR_TIMER_SOURCE_MASK 0xf
>  #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>  
> +#define WDTSR 0x004
> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> +
>  #define WDTCMDR 0x008
>  #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>  #define  WDTCMDR_START_COUNTER BIT(0)
> @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> +	u32 expiration, val;
> +	u64 timeleft;
> +
> +	if (!watchdog_active(&wdt->base)) {
> +		/* return zero if the watchdog timer is not activated. */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Reset occurs on the fifth expiration of the
> +	 * watchdog timer and so when the watchdog timer is configured,
> +	 * the actual value programmed into the counter is 1/5 of the
> +	 * timeout value. Once the counter reaches 0, expiration count
> +	 * will be increased by 1 and the down counter restarts.
> +	 * Hence to get the time left before system reset we must
> +	 * combine 2 parts:
> +	 * 1. value of the current down counter
> +	 * 2. (number of counter expirations remaining) * (timeout/5)
> +	 */
> +
> +	/* Get the current number of counter expirations. Should be a
> +	 * value between 0 and 4
> +	 */
> +	val = readl_relaxed(wdt->regs + WDTSR);
> +	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> +	if (WARN_ON(expiration > 4))
> +		return 0;

Each call will generate a big warning in the message. May be simpler
to add a pr_err() with an explicit message.

> +	/* Get the current counter value in microsecond. */
> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft = FIELD_GET(TMRSR_PCV, val);
> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain.
> +	 */
> +	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
> +
> +	/*
> +	 * Convert the current counter value to seconds,
> +	 * rounding up to the nearest second. Cast u64 to
> +	 * u32 under the assumption that no overflow happens
> +	 * when coverting to seconds.
> +	 */
> +	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;

Did you check there is a macro fitting the need in math.h ?

> +	if (WARN_ON(timeleft > U32_MAX))

s/WARN_ON/pr_err/

> +		return U32_MAX;
> +
> +	return lower_32_bits(timeleft);
> +}
> +
>  static const struct watchdog_ops tegra186_wdt_ops = {
>  	.owner = THIS_MODULE,
>  	.start = tegra186_wdt_start,
>  	.stop = tegra186_wdt_stop,
>  	.ping = tegra186_wdt_ping,
>  	.set_timeout = tegra186_wdt_set_timeout,
> +	.get_timeleft = tegra186_wdt_get_timeleft,
>  };
>  
>  static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
> -- 
> 2.34.1
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
