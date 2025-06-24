Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90872BEC39
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771341; cv=none; b=ZafFwkuay2zM3uQ95wuhvpNbw/VIgO+zF6Dsg54sGEV7Qlt9M6Ss3bXr/Kid/FNW4yJDnsAP73GUWaQkTGmXgJ1vm6gvxb9D+HVZjH7JFA+y3pCRXzqNIyeZAXDS6RM/j43a+Z8Yk7EuqSwB1hFEb60YuHfz1+VcY6KaT5cN7VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771341; c=relaxed/simple;
	bh=KAxAKRXlBPcS9wG2BoAAuUo03/mcQMhwhzDg62Xp9vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfoifPcOR82ecu/G067SYRPBOepKtbV2bVTNoaK5eLM0sHsiI9o9xwIpvQqaexUjbcAwHs9wPhLSQeFC1Jsh1MCm+OzsQEFN8jpofKygfNHM1e2raA62VevhMskXB/QJCwnWiGuUICfyLt9JM2SenfaVrpi+KDuqh4RVCtRvJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snKmMmwi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="snKmMmwi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so3219925e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750771335; x=1751376135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOOE3chh08F/O7R/WBaJb8nuz+JcsL39gDG2UPlu8EA=;
        b=snKmMmwi1Qz77r2rHgAT0tcmjdBNaEzYKoTSh9V+mE9K9VKSm6ksWDWB/tJnXSWc9n
         yujdIZN1B8f1J68CKEz1+r15RRQzzmO3jSVYLYYsHBJF2MMt13fEUbo6vYBDnwf8ULF7
         u+BHPBpddfaD46pO/exudl85NVOI32VRZR6sR2KqynzZhh3Z8tlEuawmRtW6ZmGa5ffS
         7ytIUNiXmluEII/7rz9A8e6hHk397QQeGBCvaVB0kYVnoo9JFzh76Y7NHwcpNY0r7HPa
         yaZ5qTakaoPAiOVYHd4Y9rtIT1wEqqH17lKi1/vz7XLi8SCojVgiqLlXntlqlS8mym/B
         uWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771335; x=1751376135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOOE3chh08F/O7R/WBaJb8nuz+JcsL39gDG2UPlu8EA=;
        b=vtNyF03ITGXfQRnOFnbQqiJDP4VSehYZsIXiBQcld0x2tl4RmyBD7mKRd54t97A16g
         zxAbsfRNlJXbw82XZE0hoRgzDE55I3LJtpKk/aXoS0x9ZG3hovyOU/mshzqDyk886tUM
         WCfZWRtuXf7rvkfKL9hmvj7ENCwsA8xnUTksm/QOECM9h261j+fymF9yJNqmKsUV3KK3
         a3W+FVIM5DpDN74z9xp/xsGokiJFCPlM9MELR+MJ0vcw9UYMcqS1vVgUj4tiwOCTbVI1
         78Xdc6XedyUz1LRKUOBpES0jRqaanfqG9yXzNjunx6rsbUaMJEsWZSFAbPej5S3vCOhX
         fZSA==
X-Forwarded-Encrypted: i=1; AJvYcCWjQfcxsRZgD5ULPw6ZEc499ldnbXij6kBG5S0sEqCSmvPTGZ+CW/7Ou+PGqKvZP/AkYqjrCWCAZjowpSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkG/HEYihlzAJOq8QzhHcpDCStMNubLg88jQhRtdLFT+zYl9jJ
	6DuWzTEGVJi86m659HRD3wLgAPKj9cOUnLpLus4B6SfyvOzcXiXq38++JLq2CpmGtAE=
X-Gm-Gg: ASbGnctxmXC0UqyKf5PR8xYNXZGFtD8e4iuQQSAzZsCuQhNVleawhEFxjglNvAkbzoS
	gmrtgFtAsWOH2CyxRVp7VOTEWef95o7VpzJJlh2avYAAwM78G+A16ma23GkX0Te4o7+qHfysW3L
	9zprCpDxQA7h6+LVUMp/CBX+xe/KTPp3vIMgJ8AmAG24a5kZEjjjTa4jqC4LSykOSqpRB2ovUYP
	XTQQMJzm450RL0J+nkQCGKIzAoBNEOR69CJPETZjqhp+3GKK1gDaAL+o0zAlry2GLoDRVGtL/Px
	jxN/VLYGqppSkoMngIm61o0ZMSYzb4M2stPo84DtC+bAciZ9RNJqHn0IHtXZZAaavLpu19nyIOy
	Lv0ra73SKgx0T8MtIepKsDa+3
X-Google-Smtp-Source: AGHT+IG+8KGqgrD4nKqGiWFlJ35WJi/rcQ0CDHHa05PY7P7SDQChCXBy5adbtSKpQbTgkIYAR9gLDQ==
X-Received: by 2002:a05:600c:c4aa:b0:453:a95:f07d with SMTP id 5b1f17b1804b1-453654cb7b3mr197942675e9.10.1750771335032;
        Tue, 24 Jun 2025 06:22:15 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051001sm1940164f8f.1.2025.06.24.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:22:14 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:22:12 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] clocksource/drivers/exynos_mct: Fix uninitialized
 irq name warning
Message-ID: <aFqmhDQnlUHh4vLY@mai.linaro.org>
References: <20250618210851.661527-1-willmcvicker@google.com>
 <20250618210851.661527-5-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618210851.661527-5-willmcvicker@google.com>

On Wed, Jun 18, 2025 at 02:08:41PM -0700, Will McVicker wrote:
> The Exynos MCT driver doesn't set the clocksource name until the CPU
> hotplug state is setup which happens after the IRQs are requested. This
> results in an empty IRQ name which leads to the below warning at
> proc_create() time. When this happens, the userdata partition fails to
> mount and the device gets stuck in an endless loop printing the error:
> 
>   root '/dev/disk/by-partlabel/userdata' doesn't exist or does not contain a /dev.
> 
> To fix this, we just need to initialize the name before requesting the
> IRQs.
> 
> Warning from Pixel 6 kernel log:
> 
> [  T430] name len 0
> [  T430] WARNING: CPU: 6 PID: 430 at fs/proc/generic.c:407 __proc_create+0x258/0x2b4
> [  T430] Modules linked in: dwc3_exynos(E+)
> [  T430]  ufs_exynos(E+) phy_exynos_ufs(E)
> [  T430]  phy_exynos5_usbdrd(E) exynos_usi(E+) exynos_mct(E+) s3c2410_wdt(E)
> [  T430]  arm_dsu_pmu(E) simplefb(E)
> [  T430] CPU: 6 UID: 0 PID: 430 Comm: (udev-worker) Tainted:
>          ... 6.14.0-next-20250331-4k-00008-g59adf909e40e #1 ...
> [  T430] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
> [  T430] Hardware name: Raven (DT)
> [...]
> [  T430] Call trace:
> [  T430]  __proc_create+0x258/0x2b4 (P)
> [  T430]  proc_mkdir+0x40/0xa0
> [  T430]  register_handler_proc+0x118/0x140
> [  T430]  __setup_irq+0x460/0x6d0
> [  T430]  request_threaded_irq+0xcc/0x1b0
> [  T430]  mct_init_dt+0x244/0x604 [exynos_mct ...]
> [  T430]  mct_init_spi+0x18/0x34 [exynos_mct ...]
> [  T430]  exynos4_mct_probe+0x30/0x4c [exynos_mct ...]
> [  T430]  platform_probe+0x6c/0xe4
> [  T430]  really_probe+0xf4/0x38c
> [...]
> [  T430]  driver_register+0x6c/0x140
> [  T430]  __platform_driver_register+0x28/0x38
> [  T430]  exynos4_mct_driver_init+0x24/0xfe8 [exynos_mct ...]
> [  T430]  do_one_initcall+0x84/0x3c0
> [  T430]  do_init_module+0x58/0x208
> [  T430]  load_module+0x1de0/0x2500
> [  T430]  init_module_from_file+0x8c/0xdc
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clocksource/exynos_mct.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index a5ef7d64b1c2..62febeb4e1de 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>  		per_cpu_ptr(&percpu_mct_tick, cpu);
>  	struct clock_event_device *evt = &mevt->evt;
>  
> -	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
> -
>  	evt->name = mevt->name;
>  	evt->cpumask = cpumask_of(cpu);
>  	evt->set_next_event = exynos4_tick_set_next_event;
> @@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>  	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
>  		mct_irqs[i] = irq_of_parse_and_map(np, i);
>  
> +	for_each_possible_cpu(cpu) {
> +		struct mct_clock_event_device *mevt =
> +		    per_cpu_ptr(&percpu_mct_tick, cpu);
> +
> +		snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
> +			 cpu);
> +	}
> +
>  	if (mct_int_type == MCT_INT_PPI) {
>  
>  		err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
> -- 
> 2.50.0.rc2.761.g2dc52ea45b-goog
> 

There are too many for_each_possible_cpu() loops in this function.

Why not move the per cpu relevant code in the hotplug callbacks ?


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
