Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E377A957
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699586; cv=none; b=WeTs+QcTbDTTibFd8IPwicsRrYSSyEhWMhV4ewrkUG5Pje0OdmcYqT1t3q4zP9ORFDNyxwXgaB3bVllRrPKP3vbxzAzqq/bvv0wcySpTnBURIG+AhVNuXIdpMx9AB2mDYZAQrg63w6Ah8KSeGBYmvKSvQ4sharwwyrWYIhNFnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699586; c=relaxed/simple;
	bh=sP2VTvgEobbv3CXl+n4BZ8qjaHLld7o5UloKkZ+9cC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzcGM0ncJlfVCKylE2v3m9f7tWBZT29Hyb2chEk7UlrqfmnGyrtC9R0KPrWzsJdNbCa3NlFFGZVKCVTxTXt0v+MBdbH69eidlHIKiBT/r1x+cNenAqvRZbfhlc8h+W/gSiHPYMdUV/Wwi1XTQ+16l1FCwQosLy/DH+L65dIm6fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PC0AygGp; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PC0AygGp"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c2504fa876so380358fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699582; x=1747304382; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fvv70pMgCJ3FiwAsjSiNoU6Z16zsSHQiIGX3w5dV3qE=;
        b=PC0AygGpyjoT9fVSU24as7HpCzXAN68CtFy4FRz3K82WpvH2eLse5pP+nAt6iuYMbc
         x7Pd8YAK7RBgrqT1JusHvlHr1Fm4pt2T97KU8iTYTmuON7p645x3MD9uX8t4pQL2a26t
         nUco00AjqV2/9KP04u7C7c3FS75UcWmlIgJhaDW2VtJmw3OAQPMItzhpQrBgXhmVAbb7
         kuNxJUMF0qd0OaxtfQN3HfD5uL8JEJIICjdSeLvwj5SImMvG+QQm5Rhd9ys1IaRknut0
         NmKuACd77K0dRPfkWjASfwFa8jsJ/Pz0Dziadqqz+/xpe6ZK07NqAPoX9iFXYcqTbyn+
         md1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699582; x=1747304382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvv70pMgCJ3FiwAsjSiNoU6Z16zsSHQiIGX3w5dV3qE=;
        b=W0R77T3mQhPV40J+fIOXwcN8vIW4SWS34j6yAesfykTAKQ+sM4/8GC2V0dP2XGbWuw
         gtAWjBT6OUcB+bbwHNPagwf3Twqu/66hrzi8JSbE0MSeR2LrjLiZRYUhpyJ0fxzyo8I6
         h54XwQUKFHK5VngyldYtsR4In1kN+2dKiJHi232Ai+k4jC5RD04pOUV/oiA8dWesro9Q
         GkAF38ojujYRlVD/SkDJvpGCBhhq/9bUYmq38eYSnSiLjmuvBKK+tzos8XxW4OfcVChw
         LRt6kOc/iBocWz+Wn3M05md0I+siYaIOTFAPEh8ySnhuYKJbgj8r1S4PZRCa16I6XLoY
         bXSA==
X-Forwarded-Encrypted: i=1; AJvYcCU7rBh4w7w+EyZz4a/SxRWkd/6hSYx2WhdQAIVnkUakR2JmrFC0dVdAvA6AkPmY8GaCc2PmqLCxQNkiJ9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrE2TiE4p9PJEDOB0zixWnWyOdsBziK8XhEK+yz4COIbQv11bS
	1/qBS8XaNfNExxKqGJtCmr65LdWI/hxSNcN8x+mw5VkaEzYDYPRB0BoqlXez0iodz7r2aANotb1
	VDv50i1rQlHcxf/SNRBkFvhBGKKQ1cqaQSCDDDQ==
X-Gm-Gg: ASbGncsEb2xI1NFd5vqRTRIBNtMQT9oCjz2uQs25aDlL6i/2llwjHtEzr/vMEveU6LI
	3hsg5QMDv3XEkGJtwPK7+m46tPFzIcEgw3LVYFFrqeBWPhRAoq/PpcB30j7ACw7e+CnUejye+XN
	t9Tz9P3fboCGHNoOok8hh0tbY=
X-Google-Smtp-Source: AGHT+IF520N+kx+oR9rt9xJhtNWjWu/wTkoOchusiLD7WoO6maRQXw9xMSqaOd3WIebwagelwsLLqkPIqfbMN6EVIXc=
X-Received: by 2002:a05:6870:7020:b0:2c2:2f08:5e5b with SMTP id
 586e51a60fabf-2db5be3141amr4180433fac.13.1746699582240; Thu, 08 May 2025
 03:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-6-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-6-willmcvicker@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 11:19:30 +0100
X-Gm-Features: ATxdqUFInfzL-Wd6UFpfOdOxzv03B4za9dTc_DPavO3LtoEQp9Xr8GSGsSU8UXU
Message-ID: <CADrjBPpDs_itymvGckRYeuJDkMSOo5bc60tYTeRBtAu6Tm8O6Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] clocksource/drivers/exynos_mct: Fix uninitialized
 irq name warning
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Thu, 3 Apr 2025 at 00:34, Will McVicker <willmcvicker@google.com> wrote:
>
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
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

You could additionally consider adding a Fixes: tag and CC stable if
you want this to land in LTS tree's.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clocksource/exynos_mct.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index a5ef7d64b1c2..62febeb4e1de 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>                 per_cpu_ptr(&percpu_mct_tick, cpu);
>         struct clock_event_device *evt = &mevt->evt;
>
> -       snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
> -
>         evt->name = mevt->name;
>         evt->cpumask = cpumask_of(cpu);
>         evt->set_next_event = exynos4_tick_set_next_event;
> @@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>         for (i = MCT_L0_IRQ; i < nr_irqs; i++)
>                 mct_irqs[i] = irq_of_parse_and_map(np, i);
>
> +       for_each_possible_cpu(cpu) {
> +               struct mct_clock_event_device *mevt =
> +                   per_cpu_ptr(&percpu_mct_tick, cpu);
> +
> +               snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
> +                        cpu);
> +       }
> +
>         if (mct_int_type == MCT_INT_PPI) {
>
>                 err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
> --
> 2.49.0.472.ge94155a9ec-goog
>
