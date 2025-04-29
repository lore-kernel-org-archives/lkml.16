Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212741D61BB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916785; cv=none; b=Yd53RZuB1ooz7crTEbun7invVh3la3Jg2hg8ezLSrNQxv6Xu9mPOYCjW/YSNXWCEKq2ZjMsv+rXypxoEBIn3KCVUvrYV02+uk8xXcNFzZZf2/LShuH7zK3qI3OT4xDnbT6rqloMoiOxLxMgk5SNDzkMvyScf12I0Desh5KzcK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916785; c=relaxed/simple;
	bh=v92vEEeOWiHgBwdUHqiC+8ki+M+nH+RwczaGa4qWQOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYwrCNoiEDRQMeE3kPiVYDKZHCsdSkjg/kq/q6a1XOmlpLIMv24fMpVlquVEvajFRxPjciKyvLstET0NEwwZisoNMtbzu/NbpfhScNX4pTsqrdJsbwap47CN6MpPyEqgaLMBSNZGSORX2N953xizWIut0ecCV0WxDQaIJZVUqYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yM1SRdoh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yM1SRdoh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3249151f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916781; x=1746521581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zKqLvJDLHg3mLsLtv56H1QUNbgD7dc1QV5N9TVSOwWg=;
        b=yM1SRdohQdVrTjdy5Fuzb8WgobHYj/6N7SnToFIfc7XF4NHQiuZwd1yl6FTeDbMKkO
         jQxwgHgzeIiY4pD3/OOLw8NDRE/I8qvJAtimDCM0tvKC5NI/6Ia7xKRDXt+pPmYYQENg
         ccAamDGKrCOrCfMmwDRbwDiXyI6UQYcrc+F/K6rZycUD5OmfsUdTyxa13qF2IlqfYM9q
         leG8O5D8+Cq7XcPkJ1JZrwzdWnKWeZH6En8dNu410vQV//iXJ/J8NgwgqH8FSAy5HiGh
         jFBlUQTDMrb/DWnsJHtI4gkhEC6ZdrxeCgFzYhaRbDXBAe/eOlN0yX98ld2tlSBHqQIH
         B06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916781; x=1746521581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKqLvJDLHg3mLsLtv56H1QUNbgD7dc1QV5N9TVSOwWg=;
        b=Tn3b0mnL+Tz5TQTZhcwsgH0x2wCufstJ6XbCPZsizdODNDfW2LGY+6PnUIERm18Rjc
         QVtI/KP9YFkf3cKBAzzRfavhS2orCHbrRHajJNp6N9hmmAY28dmqHbWZJiUZZ9HyW932
         /VtysQEeQH5cMeYbGiOPib0Zd+DJwY6ZrN6G1khcNx0ljwtotOOxdPS3Btq/8kfwI+1+
         3uRpz24mvLPd5QW5f03fJ/IjKG9ukE4vMNZLRmBSIPEFCwJ3aXsGfqhhj0Xi4CgEe1Kh
         0Gv9FJb/cHDtNnEFPND+y0ViA9k9OuhCMlZEXRw7BKJbEX6N8bNdw1lT9/tDoeRRUrA3
         9cyw==
X-Forwarded-Encrypted: i=1; AJvYcCVulKOeYi/XZvXpOMRXl2YQFDLdmdV1VTFHfPmFkBozU2qSJczqQgvtkGwAmuZiM8zsZZtcF+Ew7mxwbLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgw/rZ4XNZWhZdPuv2OLxn7aiejF9cStHliPJu5IX6HSGHzq0o
	hDMcwfUef9o53XueI5yAVgDwPrVVB4FBo+Q8ipe590KPQLdx2XIoReeHWS94v+0=
X-Gm-Gg: ASbGnct8cRru4eMTVCMPGXRAhHYcrXrSgSp5w+ccqXtlByEJRiVzVyqGghbkKrRHoJB
	eqpj87OI8sw2tuqPsOmKdA32k+jKt8Ij6B83u2qlb/ozlAP1UFPPEJOvdYo0zcoPfcstBwdQXdj
	TWfXxDfZLNedX6lZYx5pCtivScbGpjGf9wrLWTHH2qjMlC1jmnY5LE8MFRcW4NNA95CtyCBwDau
	0nnIpQH8r3BPwuJZVq6fNC34nbBj4PVKMpEyOmYFbJD2/k3f8uP8oD79TgoG1a3gwLdP+PDyeH2
	/NRcPXvNeXw1BdFAI9L1pep5bwpN038P2GP43c+D2rB4KHUmn5opX3O/961YmaL8/aTCQiN/55v
	mBto=
X-Google-Smtp-Source: AGHT+IHtz01PyWBregDzZIebb5zrLCzrzgNknGM29Tj9OvHaxvGjPLwmNm7NGF/h6FyYetY57edG7g==
X-Received: by 2002:a5d:5f4a:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-3a08a351737mr1917315f8f.16.1745916781374;
        Tue, 29 Apr 2025 01:53:01 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm13221430f8f.84.2025.04.29.01.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:53:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:52:58 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] Allow for riscv-clock to pick up mmio address.
Message-ID: <aBCTagteN-pnSqKu@mai.linaro.org>
References: <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
 <DU0PR09MB619673345C9082CB442A8DEFF6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU0PR09MB619673345C9082CB442A8DEFF6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>

On Wed, Apr 23, 2025 at 12:17:37PM +0000, Aleksa Paunovic wrote:
> HTEC Public
> 
> Allow faster rdtime access via GCR.U mtime shadow register on RISC-V
> devices. This feature can be enabled by setting GCRU_TIME_MMIO during configuration.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  arch/riscv/include/asm/timex.h    | 59 ++++++++++++++++++++-----------
>  drivers/clocksource/Kconfig       | 12 +++++++
>  drivers/clocksource/timer-riscv.c | 32 +++++++++++++++++
>  3 files changed, 83 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index a06697846e69..47ad6285b83a 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -7,31 +7,24 @@
>  #define _ASM_RISCV_TIMEX_H
> 
>  #include <asm/csr.h>
> +#include <asm/mmio.h>
> +
> +#include <linux/jump_label.h>
> 
>  typedef unsigned long cycles_t;
> 
> +extern u64 __iomem *riscv_time_val;
> +DECLARE_STATIC_KEY_FALSE(riscv_time_mmio_available);

Please keep it self-encapsulate in the timer-riscv.c

> +#define riscv_time_val riscv_time_val

why ?

>  #ifdef CONFIG_RISCV_M_MODE
> 
>  #include <asm/clint.h>
> 
> -#ifdef CONFIG_64BIT
> -static inline cycles_t get_cycles(void)
> -{
> -       return readq_relaxed(clint_time_val);
> -}
> -#else /* !CONFIG_64BIT */
> -static inline u32 get_cycles(void)
> -{
> -       return readl_relaxed(((u32 *)clint_time_val));
> -}
> -#define get_cycles get_cycles
> +#undef riscv_time_val
> 
> -static inline u32 get_cycles_hi(void)
> -{
> -       return readl_relaxed(((u32 *)clint_time_val) + 1);
> -}
> -#define get_cycles_hi get_cycles_hi
> -#endif /* CONFIG_64BIT */
> +#define riscv_time_val clint_time_val
> 
>  /*
>   * Much like MIPS, we may not have a viable counter to use at an early point
> @@ -46,22 +39,48 @@ static inline unsigned long random_get_entropy(void)
>  }
>  #define random_get_entropy()   random_get_entropy()
> 
> -#else /* CONFIG_RISCV_M_MODE */
> +#endif
> +
> +static inline long use_riscv_time_mmio(void)
> +{
> +       return IS_ENABLED(CONFIG_RISCV_M_MODE) ||
> +               (IS_ENABLED(CONFIG_GCRU_TIME_MMIO) &&
> +                static_branch_unlikely(&riscv_time_mmio_available));
> +}
> +

Don't use this function to branch when calling get_cycles(). Provide two
versions of the *get_cycles* and initialize with the right one at init time.

> +#ifdef CONFIG_64BIT
> +static inline cycles_t mmio_get_cycles(void)
> +{
> +       return readq_relaxed(riscv_time_val);
> +}
> +#else /* !CONFIG_64BIT */
> +static inline cycles_t mmio_get_cycles(void)
> +{
> +       return readl_relaxed(((u32 *)riscv_time_val));
> +}
> +#endif /* CONFIG_64BIT */
> +
> +static inline u32 mmio_get_cycles_hi(void)
> +{
> +       return readl_relaxed(((u32 *)riscv_time_val) + 1);
> +}
> 
>  static inline cycles_t get_cycles(void)
>  {
> +       if (use_riscv_time_mmio())
> +               return mmio_get_cycles();
>         return csr_read(CSR_TIME);
>  }
>  #define get_cycles get_cycles
> 
>  static inline u32 get_cycles_hi(void)
>  {
> +       if (use_riscv_time_mmio())
> +               return mmio_get_cycles_hi();
>         return csr_read(CSR_TIMEH);
>  }
>  #define get_cycles_hi get_cycles_hi
> 
> -#endif /* !CONFIG_RISCV_M_MODE */
> -
>  #ifdef CONFIG_64BIT
>  static inline u64 get_cycles64(void)
>  {
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 487c85259967..0f2bb75564c7 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -661,6 +661,18 @@ config CLINT_TIMER
>           This option enables the CLINT timer for RISC-V systems.  The CLINT
>           driver is usually used for NoMMU RISC-V systems.
> 
> +config GCRU_TIME_MMIO
> +       bool "GCR.U timer support for RISC-V platforms"
> +       depends on !RISCV_M_MODE && RISCV
> +       default n
> +       help
> +        Access GCR.U shadow copy of the RISC-V mtime register
> +        on platforms that provide a compatible device, instead of
> +        reading the time CSR. Since reading the time CSR
> +        traps to M mode on certain platforms, this may be more efficient.
> +
> +        If you don't know what to do here, say n.
> +
>  config CSKY_MP_TIMER
>         bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
>         depends on CSKY
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 48ce50c5f5e6..4290e4b840f7 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -22,6 +22,7 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
> +#include <linux/of_address.h>
>  #include <linux/limits.h>
>  #include <clocksource/timer-riscv.h>
>  #include <asm/smp.h>
> @@ -32,6 +33,13 @@
>  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>  static bool riscv_timer_cannot_wake_cpu;
> 
> +#if defined(CONFIG_GCRU_TIME_MMIO)
> +DEFINE_STATIC_KEY_FALSE_RO(riscv_time_mmio_available);

static DEFINE_STATIC_KEY_FALSE_RO( ... )

> +EXPORT_SYMBOL(riscv_time_mmio_available);
> +u64 __iomem *riscv_time_val __ro_after_init;
> +EXPORT_SYMBOL(riscv_time_val);
> +#endif
> +
>  static void riscv_clock_event_stop(void)
>  {
>         if (static_branch_likely(&riscv_sstc_available)) {
> @@ -203,6 +211,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>         int cpuid, error;
>         unsigned long hartid;
>         struct device_node *child;
> +#if defined(CONFIG_GCRU_TIME_MMIO)
> +       u64 mmio_addr;
> +       u64 mmio_size;
> +       struct device_node *gcru;
> +#endif
> 
>         error = riscv_of_processor_hartid(n, &hartid);
>         if (error < 0) {
> @@ -220,6 +233,25 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>         if (cpuid != smp_processor_id())
>                 return 0;
> 
> +#if defined(CONFIG_GCRU_TIME_MMIO)
> +       gcru = of_find_compatible_node(NULL, NULL, "mti,gcru");
> +       if (gcru) {
> +               if (!of_property_read_reg(gcru, 0, &mmio_addr, &mmio_size)) {
> +                       riscv_time_val = ioremap((long)mmio_addr, mmio_size);
> +                       if (riscv_time_val) {
> +                               pr_info("Using mmio time register at 0x%llx\n",
> +                                       mmio_addr);
> +                               static_branch_enable(
> +                                       &riscv_time_mmio_available);
> +                       } else {
> +                               pr_warn("Unable to use mmio time at 0x%llx\n",
> +                                       mmio_addr);
> +                       }
> +                       of_node_put(gcru);
> +               }
> +       }
> +#endif
> +
>         child = of_find_compatible_node(NULL, NULL, "riscv,timer");
>         if (child) {
>                 riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
> --
> 2.34.1

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
