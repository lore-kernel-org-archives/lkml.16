Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6B23D2A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744735850; cv=none; b=ZxyXERdNzE2HFnR/B1AVauEobNCgZpX1U5Pd7QqSWUicRL/7CNKmS03HBapS+e1153kQyQLYai1cVft0DdIMnKK+2D/4M2pdDszfUY4Spqp+yB9RDWBS3PAt1SEJ3TMfno5YJYpe1twvXPjxixTolmA1Vdca/0/+XpCxgFwMQ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744735850; c=relaxed/simple;
	bh=Yc+bgZqVf23P5pOAT5O2XAs02PaKKFslNLWiEokt3zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ed7yP/HQj/o3n5cjc/Ta0ZzFdnaYWEXmoKsMiXaPVpCfjHCQ+fvE0h7GWMB+fEfy2LXJIYxyDQRRO0UL20BIKwNLfLXOBDHdbgTVehbu7CDBoJnaGYuAS367gM+bOWXXt2YnYYXy9xJdBYiDqoIpXR01FFgKeyW21ZPSyzUPfto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPBcSYfz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPBcSYfz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso56502585e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744735847; x=1745340647; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tlVAQGNvnlCWZGAKFMSG1jFD5hLtBh/GXl4+Ouwj/Fc=;
        b=aPBcSYfzz2IFoyeEboocHrK6XntyIUXzvgfeIZgzvohXzs0vM83Q+trwDYMxdAJ07z
         mdKRUyFK+4c7DnwKg07aIByOEdA4SLVqP6VA0gxbkECJKxVhtYRmCDekuAbFy8EUiFBk
         lDNiDo1fuhpcHLX/DwraKXU505GQ5Plwv7GSh7uq7gGomyBwuNS4nA1LcwLbdBJFb2m9
         qP83WOzMqBkQ2DSQd+F0JidFS8FtM2FreediGkVFWg85qpdyi+1dfXP00xlznqMF3PLD
         BJ4Ni+OlSbQGZnRMGHvdFram57IwMK54NnUSLqlOSkMLjRMcttzCbl/4f8LoVgQmK3IG
         X80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744735847; x=1745340647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlVAQGNvnlCWZGAKFMSG1jFD5hLtBh/GXl4+Ouwj/Fc=;
        b=bqoQWmX3oXbcip+lprlyZQQt9N9Nonc2XJM3Vv48n1V0EYR4xPruooPXSeKn+tBSP4
         Myv0uMKdyAHZwExqa/EBjZcsq+y7rOxAYW2P2sYGhTqa+Wi8XVME/kLw891yXstuYjPw
         CsDp+R25hTAtuK9s/B9A5xKM39STSNs722cHUSFCvOm03u5NFyzKdi7PTkjpht1ATeo2
         FzgAIFRQAHhX8qZgfOV3lsHA5y5xZCjP8TIboki394GEoDxcKp4bMoUjEj1kR7tqnBbR
         L6EpkDAEwLg9cdF68How9FMtzTH+3hTbQ/euGUUM1BM637wJwLjDieD0yEzWqcBV+WBZ
         Gk/w==
X-Forwarded-Encrypted: i=1; AJvYcCXT1bqEjpkZvO6NOMSjFYHwUkBFHYoI+euDD3u+WPBe746dRUt2K6CeRG8tMHzGyocKnq/L9uqdryt11y8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+4qvz22A+3N9bLmEHMfgsvwBPNk1EkQvhg7hRwBRfRzGn8A7D
	h8f0zA+A8Mr4LU+EyQh8KHknR987hNSMg/6OPaev1+RkxfiXgM6YTs2OwjwabRg=
X-Gm-Gg: ASbGncsDRpT44ZqgPwFPqdE0QrOJDaehmzi7d+WFAqoxLZAI4GGWm/bp566tApR9VAe
	cJlfD6DNPQnUbWy80JNfX4wu1P4AwZx7x1CvSq+JocVSGzdMD4XvHWK5S4yF+yKLru2q6NH3m/4
	xhrbpzRqYXhbjKeiz+lyQa5OEHaQlC6CR3tbhzv9MXoW6l8F5ReB0oMMzSPPspmL0rgQSdo9MDX
	lgcyXUR1JrESiVE5XNn/GlXOEDQuqayRr4aD3TKRjN6Hc5HROXRW982uf4yJF0Dkgs5RiLAe57m
	mM5fY1SMaoCYUUIFtbqC7w5vx2ZqrMP9p+DI8lYwCfLDUajpcue2a9rDJZYA0XUr6HEtHIk2KiG
	xEVzLkTU629GA8g==
X-Google-Smtp-Source: AGHT+IH/mPDTsLx4PlG7B3akd7q5hvRmVjt0R/Ymm4Ns9uebUkuiIOp2ecSrLQUodXoC8P0d0Jpwsw==
X-Received: by 2002:a05:600c:1f94:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43f3a925de9mr183619625e9.3.1744735847024;
        Tue, 15 Apr 2025 09:50:47 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c81f6sm211899675e9.20.2025.04.15.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 09:50:46 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:50:44 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z_6OZHYfC0bC5289@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402233407.2452429-7-willmcvicker@google.com>

Hi Will,

On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> From: Donghoon Yu <hoony.yu@samsung.com>
> 
> On Arm64 platforms the Exynos MCT driver can be built as a module. On
> boot (and even after boot) the arch_timer is used as the clocksource and
> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> source for the arch_timer.

From a previous thread where there is no answer:

https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/

I don't feel comfortable with changing the clocksource / clockevent drivers to
a module for the reasons explained in the aforementionned thread.

Before this could be accepted, I really need a strong acked-by from Thomas

Thanks

  -- Daniel

> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/Kconfig      |  3 +-
>  drivers/clocksource/exynos_mct.c | 49 +++++++++++++++++++++++++++-----
>  2 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c85259967..e89373827c3a 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
>  	  Support for Timer Counter Blocks on Atmel SoCs.
>  
>  config CLKSRC_EXYNOS_MCT
> -	bool "Exynos multi core timer driver" if COMPILE_TEST
> +	tristate "Exynos multi core timer driver" if ARM64
> +	default y if ARCH_EXYNOS || COMPILE_TEST
>  	depends on ARM || ARM64
>  	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
>  	help
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 62febeb4e1de..8943274378be 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -15,9 +15,11 @@
>  #include <linux/cpu.h>
>  #include <linux/delay.h>
>  #include <linux/percpu.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  #include <linux/clocksource.h>
>  #include <linux/sched_clock.h>
>  
> @@ -241,7 +243,7 @@ static cycles_t exynos4_read_current_timer(void)
>  }
>  #endif
>  
> -static int __init exynos4_clocksource_init(bool frc_shared)
> +static int exynos4_clocksource_init(bool frc_shared)
>  {
>  	/*
>  	 * When the frc is shared, the main processor should have already
> @@ -511,7 +513,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int __init exynos4_timer_resources(struct device_node *np)
> +static int exynos4_timer_resources(struct device_node *np)
>  {
>  	struct clk *mct_clk, *tick_clk;
>  
> @@ -539,7 +541,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
>   * @local_idx: array mapping CPU numbers to local timer indices
>   * @nr_local: size of @local_idx array
>   */
> -static int __init exynos4_timer_interrupts(struct device_node *np,
> +static int exynos4_timer_interrupts(struct device_node *np,
>  					   unsigned int int_type,
>  					   const u32 *local_idx,
>  					   size_t nr_local)
> @@ -652,7 +654,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>  	return err;
>  }
>  
> -static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
> +static int mct_init_dt(struct device_node *np, unsigned int int_type)
>  {
>  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
>  	u32 local_idx[MCT_NR_LOCAL] = {0};
> @@ -700,15 +702,48 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
>  	return exynos4_clockevent_init();
>  }
>  
> -
> -static int __init mct_init_spi(struct device_node *np)
> +static int mct_init_spi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_SPI);
>  }
>  
> -static int __init mct_init_ppi(struct device_node *np)
> +static int mct_init_ppi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_PPI);
>  }
> +
> +#ifdef MODULE
> +static int exynos4_mct_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int (*mct_init)(struct device_node *np);
> +
> +	mct_init = of_device_get_match_data(dev);
> +	if (!mct_init)
> +		return -EINVAL;
> +
> +	return mct_init(dev->of_node);
> +}
> +
> +static const struct of_device_id exynos4_mct_match_table[] = {
> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> +
> +static struct platform_driver exynos4_mct_driver = {
> +	.probe		= exynos4_mct_probe,
> +	.driver		= {
> +		.name	= "exynos-mct",
> +		.of_match_table = exynos4_mct_match_table,
> +	},
> +};
> +module_platform_driver(exynos4_mct_driver);
> +#else
>  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> +#endif
> +
> +MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
