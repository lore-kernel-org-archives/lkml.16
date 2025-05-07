Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A874148830
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605495; cv=none; b=eNqGs1MmU766QJXFxeNVxONZeQWa+Z1Aq5RrHMRJnBotGq91X1DX1cGoytRxliEP/kUesvr7XukP2zhTf5vCBo0DOJsO2e+R5veGPjBV5yvZtpdH30YmCkyesUgvUAxiwDR9kYkB3ZE5kPTScPgQeeol4VAzoykJXs2j++ITv+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605495; c=relaxed/simple;
	bh=H8i9MvK1BY5ylh4RyN38zP+g+yB2uZRGArMW7X6TdQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQlG2BEIfdDYDxvRpzfqWlpR2AqcjCHMvB+cogyZFHPVyu2mZevIChRa5KGkjNEcS9i7zssXJstaCUTr6UGMTCSScMAb62nwjnXFtmSiZjzd7OAnUGJjDR8ULkaCF9vHh47lPA/N7TEbFHoRW3p4bx//NG0J6E2qa07wcQ4x45Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GUzPc2P3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GUzPc2P3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4351330f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746605491; x=1747210291; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fUxHTW9oTnCnDDJymWUkMxcwJTZ3qspYSFBANPgiIuQ=;
        b=GUzPc2P3d4TZl7zSjdw64BVaDpA2isJPgoOnH7JFbALUpB/GiNVsAOkLudcjWn62Rz
         7LRERsGNPojvC694IVXfx38kDsje5HZG0np9QvGbZwh4stuBAbZlA73x8C0FqtYaIuIo
         I8GBCR8EPFDuxlzrIwYbOmTD2k+8O3M0wy+oCtdMpQkNAzTh05D2Um3NWUFe9FfLPBmq
         mF0ZBCRL+ey84ByqZ3/08x/l5UBzR89mFaGuapgawMNJK9xwlVHokqixvBl0tKIPfV4K
         gXoKu/Mi8t9ZGsMncTG8UYg70mxC1rVWfBy+HVYY+ape2JlGI6ymUhdtZAsMMMSzsZBb
         VcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605491; x=1747210291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUxHTW9oTnCnDDJymWUkMxcwJTZ3qspYSFBANPgiIuQ=;
        b=F7O4MDJs4XCb8SMauNn4oV3/rlcJYzDk9IzL55DR7Leu/ss/KEcYKqXCMkN56AXWkW
         NUK2iBYLZLZBJFRmtFOkltNUN4VMkPstP+1rjw/K6AalhQY/wVnF94vWjCeQ76EHsvvz
         Lj2o2MrOW9hPN3XOGT2Ia9rF1tZGjhLKMKeUHfvMnWKDWytDs7gCN0jtFLu0dx7tODC4
         v0vwnx4DLwkbe9l2uuLMi0eQ0gMfGNX7hrzjsJgmuj6I8fQl9L0X6lRcdGZHHEDCRyIz
         kBJ8FEx4U7Vb7mrCsQXDLQ/qTxPAbxQ4JZTH5/GYewZXmGDYZ4DA4fcMQZ+35rvyqQx6
         7SjA==
X-Forwarded-Encrypted: i=1; AJvYcCWwK0C7644umfrsnFngLr9DwOMYpgvbrMi4FYSS3zlo+UMCLr3sm5aJ0EK5eUwZW0EY1QX1EUqjYwBEBsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9ZnIhJAHvrSrZILjplWBvbqN3l82epp+LQU7CyEZOhgMz/nl
	wvDDaTE83kQCRW62+zZL7q/1BpEYmc/B/W4aUz3JBIDrqDQAxmR8PYexoRv4FaL9rSRTz8smP5n
	J
X-Gm-Gg: ASbGncv0+s4Qy+4qLbaNDKvWQkfuoSuVdd9YtXVWwnQcMoJfxfazZJaFU9V3f9ROeOb
	Tn0W4ZgpDRtGL6leklVAVswc1B4Y/Xxr1apK6dsAaCnjrhq2dB+TvfCe97MC+ak0QlLjbIwwP73
	Le+e//qaqQJsM3t8OF7WcVEXtLoKpSCxjpwcnu0xWau2y4TZJYRFwL9u11mmpbUbNFh+7obsViV
	WU2MAYMnH7SC3B9R2f/DHGe21Fsw91bTDYwUlPZaPY+gITfUHDlbOkx9ofxgftO/OJGoyUk9Nfh
	7CMk+2GXE9xNUYGM+IyVQZX1BpRZt4LycpYuoLkitXW9edrkFbPx4IdtGXvKBId6rWZcmtavyos
	HHuQ=
X-Google-Smtp-Source: AGHT+IFP0FcqjGph0Z52NsgE3df3PjlTl6q8vDX39aF/6cNObJt5BCXhT+qdiFPhURB7mBIotfUIDg==
X-Received: by 2002:a05:6000:401f:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-3a0b4a14a83mr1993664f8f.16.1746605491424;
        Wed, 07 May 2025 01:11:31 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bc0sm15864510f8f.20.2025.05.07.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:11:31 -0700 (PDT)
Date: Wed, 7 May 2025 10:11:29 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clocksource: timer-sp804: Fix read_current_timer()
 issue when clock source is not registered
Message-ID: <aBsVsZu50MMJkI0q@mai.linaro.org>
References: <20250414-sp804-fix-read_current_timer-v3-1-53b3e80d7183@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414-sp804-fix-read_current_timer-v3-1-53b3e80d7183@gmail.com>

On Mon, Apr 14, 2025 at 10:55:59AM +0800, Stephen Eta Zhou wrote:
> Register a valid read_current_timer() function for the
> SP804 timer on ARM32.
> 
> On ARM32 platforms, when the SP804 timer is selected as the clocksource,
> the driver does not register a valid read_current_timer() function.
> As a result, features that rely on this API—such as rdseed—consistently
> return incorrect values.
> 
> To fix this, a delay_timer structure is registered during the SP804
> driver's initialization. The read_current_timer() function is implemented
> using the existing sp804_read() logic, and the timer frequency is reused
> from the already-initialized clocksource.
> 
> Signed-off-by: Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
> ---
> Changes in v3:
> - Updated the commit message for clarity and structure
> - Link to v2: https://lore.kernel.org/all/BYAPR12MB3205D7A2BAA2712C89E03C4FD5D42@BYAPR12MB3205.namprd12.prod.outlook.com
> 
> Changes in v2:
> - Added static keyword to struct delay_timer delay
> - Integrate sp804_read_delay_timer_read and
>   struct delay_timer delay together
> - I moved the acquisition of delay.freq to
>   sp804_clocksource_and_sched_clock_init.
>   sp804_clocksource_and_sched_clock_init has already
>   acquired and judged freq, so I can use it directly,
>   and in this way I don’t need to consider whether to
>   use clk1 or clk2, which can ensure that the clock source
>   is available and reliable.
> - Added detailed description information in Commit
> - Link to v1: https://lore.kernel.org/all/BYAPR12MB3205C9C87EB560CA0CC4984BD5FB2@BYAPR12MB3205.namprd12.prod.outlook.com
> ---
>  drivers/clocksource/timer-sp804.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-sp804.c b/drivers/clocksource/timer-sp804.c
> index cd1916c0532507fb3ce7a11bfab4815906e326d5..3194c743ad1d7d3862c63a32fb1297d8db291008 100644
> --- a/drivers/clocksource/timer-sp804.c
> +++ b/drivers/clocksource/timer-sp804.c
> @@ -21,6 +21,10 @@
>  #include <linux/of_irq.h>
>  #include <linux/sched_clock.h>
>  
> +#ifdef CONFIG_ARM
> +#include <linux/delay.h>
> +#endif
> +
>  #include "timer-sp.h"
>  
>  /* Hisilicon 64-bit timer(a variant of ARM SP804) */
> @@ -102,6 +106,15 @@ static u64 notrace sp804_read(void)
>  	return ~readl_relaxed(sched_clkevt->value);
>  }
>  
> +#ifdef CONFIG_ARM
> +static struct delay_timer delay;
> +
> +static unsigned long sp804_read_delay_timer_read(void)
> +{
> +	return sp804_read();
> +}
> +#endif
> +

#ifdef CONFIG_ARM
static struct delay_timer delay;
static unsigned long sp804_read_delay_timer_read(void)
{
	return sp804_read();
}

static void sp804_register_delay_timer(int freq)
{
	delay.freq = freq;
	delay.read_current_timer = sp804_read_delay_timer_read;
	register_current_timer_delay(&delay);
}
#else
static inline void sp804_register_delay_timer(int freq) {}
#endif

>  static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
>  							 const char *name,
>  							 struct clk *clk,
> @@ -114,6 +127,10 @@ static int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
>  	if (rate < 0)
>  		return -EINVAL;
>  
> +#ifdef CONFIG_ARM
> +	delay.freq = rate;
> +#endif

drop the above

        sp804_register_delay_timer(rate);

>  	clkevt = sp804_clkevt_get(base);
>  
>  	writel(0, clkevt->ctrl);
> @@ -318,6 +335,12 @@ static int __init sp804_of_init(struct device_node *np, struct sp804_timer *time
>  		if (ret)
>  			goto err;
>  	}
> +
> +#ifdef CONFIG_ARM
> +	delay.read_current_timer = sp804_read_delay_timer_read;
> +	register_current_timer_delay(&delay);
> +#endif
> +

drop the above

>  	initialized = true;
>  
>  	return 0;
> 
> ---
> base-commit: 7ee983c850b40043ac4751836fbd9a2b4d0c5937
> change-id: 20250411-sp804-fix-read_current_timer-1c7c5a448c6c
> 
> Best regards,
> -- 
> Stephen Eta Zhou <stephen.eta.zhou@gmail.com>
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
