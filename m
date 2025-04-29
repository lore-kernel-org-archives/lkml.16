Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9629DB7B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917164; cv=none; b=DRXV5gabjd8Fsn8p+LjNyMdxOOyvKZt4COxODuhxgZpJiWlFWqM2HkzaFU/onb5PtX/WXusqFU5ZS8THjc0rcfgpC3Ld1GbIYKAFfYO1MWfzOc5c1azkC1hejUd+S6aTbmpHns5gwNeAK+9DjZ7M8u9dq/G5lum7T6qG4CuNRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917164; c=relaxed/simple;
	bh=maF8O0AXI3aSxltp1DZAMnjKxGYaRV9INEbsZPqSfLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOCOrtmsVPNjYSuL2H62cDtBdbO9pfZ4FcjVC8wVq0PwcgKREhn0qF7Ddzhwkjsern59ePjMK2BJ+Q8UnMS7RpnLnMFbqg+cXqMZ4B5z0OTOfW4F3RpKWC5wF7qOfIeapBbjkiXhSmHNOzoZRLNnO3Sc6H9jvkd/ABII3xeu2AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Df/bg9Tt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Df/bg9Tt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so38095485e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745917161; x=1746521961; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72XrpgHFsueeXrTH8jlfFESoodkk8/GL5WRZUg5xx00=;
        b=Df/bg9TtgC9/zADgGYeCRGePd/775IXWODFysiHgUqR/kOHsnQRaz8QA3SQ9YjDQs9
         LNd8b6806E5oQqmeCkf8Drz2lzeSb9Fgc36Qn8rFigCMLV9O1rU5uPV1L7GvzWoa20WS
         E81ZEq06U+bkOTmigWJ6JYRpl38v8oGVM/mrKgkkQDAyb0fIEGix+4wkixFd0spW6+3N
         a2UmHI3S4olAXzrAYtWrY9XgL+iNpbR9BCvBonoGwbRjV5d6v1WP7nJFpyTUJvn/NbZs
         owcmTI+fHaQ7mDvu6b7r8t/41/M3m72xzA7p6ia/FZlrc+RSc5OuOPpmM2ybJFP/Lp8g
         788w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917161; x=1746521961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72XrpgHFsueeXrTH8jlfFESoodkk8/GL5WRZUg5xx00=;
        b=JngbZEmsLr1ArylWuVeYFVB1GUMkzs2xosa1s1pUKgZr9Us0ZP0Grh3rQCyC+WBMV5
         QPp0wAVTfAocQPMHWe6M920AAL1z9l378voRXPHDZmVCBzg/9Skumgvn7OYhARsYbhPy
         KBConKNJnb1QtmSk7r2OgoutCzSY7GHFQYymw9Hj60ICSIPn9yZDkT2zacshCb4zLkqe
         VeyC5o1X/D8AzIXgk2iQu0WsVD6m2O47zWPXGcKaxCGQc6ebW0uf1lp0yrg7LwfUXFrb
         0wvyJtg8u0VaORYGjMe3Idxu6qB8AeovaIcYJQ1PgSm/heMiA0vTtH9tP9jrzHxnoJtt
         R1ag==
X-Forwarded-Encrypted: i=1; AJvYcCVkN8zz837hKZv7ERVl3DgQTOBBCYx4b1D2P+lzOa2VaSfq1BNy1xdpK62nlNq1ld+YkqgVBZmSTyZtE6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhc4zAxeZx7nBDWqTU3NInHLWFwRjp6ByolHtiUHcvtW27XbHa
	yXb9fMJvNPBFcO6gGawyeDqakxFDNYNWGgGR3kFGgzDGrPdqnD0Bji3+Nn0ZS88=
X-Gm-Gg: ASbGncvbcsTsnzLAVT+TOff78A9UUOOrew+Fx3ytEL+QruKO4Mt2wWGw56Ly84PO2ju
	KGYL+v0If9EN5kQdPmMufYE1JJy+TCvOFwqCfvBMD+DU8Fi74y6FflacPjr3YhhUYUjY0JH4N3g
	hPfbPwmPYAVnOQH4qGxCruAogIF5T3HiXmBOXKywt46HtrNiXe/FtmVMeaPH7DmqhRRBBuRUeWU
	njZ4H7S+UdoNKPYMakP28mW7s+WpIKp/FJ69d2OqTFHZVoJik4+b2VA1TQROK9HeU/f9JRX9Fz1
	iFrtL8vnNJM7AumjzcAhRapbzNq7cYXHEzjibqsSfFRuAf9KmQ3PLlhTXnvPB4pExDmZCgtypPc
	LO+A=
X-Google-Smtp-Source: AGHT+IH9cAXRyLv2jIhDe13mooOzLDvV3Gb8BXq2tck1VmIh/qQf68NHpAxzv4kBa17j291y5Gx1/g==
X-Received: by 2002:a05:600c:8119:b0:439:9737:675b with SMTP id 5b1f17b1804b1-441acb1fbafmr18348805e9.7.1745917161139;
        Tue, 29 Apr 2025 01:59:21 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba29sm183285395e9.7.2025.04.29.01.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:59:20 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:59:18 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Robert Lin <robelin@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, sumitg@nvidia.com
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <aBCU5vec0XMX5VRz@mai.linaro.org>
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421100821.2907217-2-robelin@nvidia.com>

On Mon, Apr 21, 2025 at 06:08:19PM +0800, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
> 
> This change adds support for WDIOC_GETTIMELEFT so userspace
> programs can get the number of seconds before system reset by
> the watchdog timer via ioctl.
> 
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---

Hi Robert,

I realize that this driver should be split in two and the watchdog part go
under drivers/watchdog.

>  drivers/clocksource/timer-tegra186.c | 58 +++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index ea742889ee06..56d08bf1b6b0 100644
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
> @@ -235,12 +240,63 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> +	u32 timeleft, expiration, val;
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
> +             return 0;
> +
> +	/* Get the current counter value in microsecond.
> +	 */
> +	val = readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft = FIELD_GET(TMRSR_PCV, val);
> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain. Do the multiplication first on purpose just to keep
> +	 * the precision due to the integer division.
> +	 */
> +	timeleft += wdt->base.timeout * (4 - expiration) / 5;
> +	/*
> +	 * Convert the current counter value to seconds,
> +	 * rounding up to the nearest second.
> +	 */
> +	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
> +	return timeleft;
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
