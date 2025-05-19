Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29142580D5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657507; cv=none; b=kWQq/i9UpkbjOMrgbNvF3GNNd8Ek+8/z/3QywocquKj4bgG9yqJBUM5AAObWJWpSBCjmFmCYjXsDhLSOiU9FbLnY2F5GTJDbl9OKJCnXmlh/DhfM1Wspz7ChCMOTLvFplfiTKrYE8KGKXABgrEq7Lghjw22c+W+ieIOREm4+IYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657507; c=relaxed/simple;
	bh=i8lStx9MZrOnfLyoy6ixYxAxv57m+42YK9zyquTDgvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tI8Vk7Tp0TlYczbKvQ2nMmghJV4lkedBhqkZWOq5JwoH4n3BkJTNDG5y7x58rG5sgdWx8eVNUtUQ83JtNKOwnkOOi2RSCPVwa/D2366Of+r6ftVk5vVVvh3w7ovFhrz0j4Ss+n9C3AdTg5bvYdbLr9UW43CbuH1B75MnCqM4RKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBA9plV5; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBA9plV5"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7b3178473eso3936036276.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747657505; x=1748262305; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw0RrkoAM9knnJQWc1ponuJoeLASxwb9luyTQRlpOCc=;
        b=HBA9plV5wT1zCasT7mI0brIeA3/RWvYhYbVzgT1K/DPVZSfnbAgU6KtaBl9Ttx3E3Z
         Y9s5uBn/eW51EgVk+31AHWtAJTwmm2wjLjDUP7z9Fl9ASuFr2vKm+RznplAfD2zu+NBT
         GwcrAlKq+6JeFc7j2xUyZwn3X57Dt8ITbCTYT6UK1kWkpTu8RA7n7kDT/DmJW7Sj3cMU
         aHaG2vD6TRfg5Etvrbl1IN84fK/mbPnMzqODBxo8Cgo30M2dU5LfhDEjTGSuoBWf9Tve
         0cIDPf03xU6MMXvrWuvquEUtX/NsYL159Mz0BkfVODxFKjpcvDGzQdxf2qt6nhoxkbRW
         iqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657505; x=1748262305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hw0RrkoAM9knnJQWc1ponuJoeLASxwb9luyTQRlpOCc=;
        b=laEXEX1A2HAWlc86OWoT38yykHCDzV8F4jJttGC2njF1duDFK/MJ48x+o5U+nXXyCk
         aYHBXeU+ExvPzaA8iT9CTMU60/hvIXLsPluQ+miWXkFmOAJI4qjEFHBuFoDncHCxojfw
         HFVbXtkx3+aOOIqzX5jzYFGE1OC/RjpCXHG6k+ukXAO4mpK/FY4AdOx+kNXLu36ywS7l
         LOR8TJpZmOU5EV2IL5KyCwLOgihmX/JN3KNdDNbc79RcxyPbDXkD1EaBch928+JJ2pp4
         GWTNg8nJG3JMPSBxoJj44onNaQG+tJ/Hdvze/VfLX5FNVoRdOsbnytVjnskrhZdsziCy
         cjAA==
X-Forwarded-Encrypted: i=1; AJvYcCX9cvbl+mMB1YICC4cYig0ps7nYilL1FCTx5rK0DWscI2JlSYj4BnOqx9MJ42KoWsUdzVsV/BVxnFNxeVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw2sweu9ifaMZnAjddYDVZUiq26pzcmpBZJmpaD3S+OzKfZ5P5
	CAB7JUR1wh7daF6XF1WuMMnhwcqUyoSl5YLn560nzVxh2wVyjmIedTvTTSJjVbGmw7Vn4eXc8Fb
	37LgP+xyz2ycq76nuP9RqXPomu3RCAA4mo/m1aQO5YQ==
X-Gm-Gg: ASbGncsiUYKsJtbDT5rc7XxxNbBKSBPcqSncUE9xoPdCDs7KcShRBOyFlGQq5XY7MP/
	9KhlCMalSn96SfG1UsdZcXn2i9buy1w0JD5WsLNzJT/AjzuIuuTq5+LZ/qxE1dE22UNX1ITVElw
	L1N7CPqsVxmOxD1pdf9eJmVcc85xtlwx///Q==
X-Google-Smtp-Source: AGHT+IH7yUGB1EiCDoGxwBB/WyWUZnZ73SldROyVTnQxmPw6RjEohZHFonLFRz3zXaPKDnKhdJfKJ9LLmLXCPuSDemU=
X-Received: by 2002:a05:6902:e02:b0:e7b:96e0:68e0 with SMTP id
 3f1490d57ef6-e7b96e06d2fmr7718910276.13.1747657504656; Mon, 19 May 2025
 05:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516092716.3918-1-victorshihgli@gmail.com> <20250516092716.3918-3-victorshihgli@gmail.com>
In-Reply-To: <20250516092716.3918-3-victorshihgli@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 14:24:28 +0200
X-Gm-Features: AX0GCFux-Dp9aFVC9q0ZPMWtr_1CzLEvp1YieGpAtSbFQdRvWz0hn5qATIpk2Pc
Message-ID: <CAPDyKFqCo2-9fYYAoNpmJf7XOiTvLM07hQks1io-S0MvmbAjCQ@mail.gmail.com>
Subject: Re: [PATCH V1 2/2] mmc: sdhci-uhs2: Adjust some error messages and
 register dump for SD UHS-II card
To: Victor Shih <victorshihgli@gmail.com>
Cc: adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, benchuanggli@gmail.com, 
	HL.Liu@genesyslogic.com.tw, Greg.tu@genesyslogic.com.tw, 
	Ben Chuang <ben.chuang@genesyslogic.com.tw>, 
	Victor Shih <victor.shih@genesyslogic.com.tw>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 May 2025 at 11:27, Victor Shih <victorshihgli@gmail.com> wrote:
>
> From: Victor Shih <victor.shih@genesyslogic.com.tw>
>
> Adjust some error messages to debug mode and register dump to dynamic
> debug mode to avoid causing misunderstanding it is an error.

Dumping the register may be useful for the debug level, I am not sure.
Maybe Adrian has an opinion?

>
> Signed-off-by: Ben Chuang <ben.chuang@genesyslogic.com.tw>
> Signed-off-by: Victor Shih <victor.shih@genesyslogic.com.tw>
> ---
>  drivers/mmc/host/sdhci-uhs2.c | 18 +++++++++---------
>  drivers/mmc/host/sdhci.h      | 16 ++++++++++++++++
>  2 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-uhs2.c b/drivers/mmc/host/sdhci-uhs2.c
> index c53b64d50c0d..9ff867aee985 100644
> --- a/drivers/mmc/host/sdhci-uhs2.c
> +++ b/drivers/mmc/host/sdhci-uhs2.c
> @@ -99,8 +99,8 @@ void sdhci_uhs2_reset(struct sdhci_host *host, u16 mask)
>         /* hw clears the bit when it's done */
>         if (read_poll_timeout_atomic(sdhci_readw, val, !(val & mask), 10,
>                                      UHS2_RESET_TIMEOUT_100MS, true, host, SDHCI_UHS2_SW_RESET)) {
> -               pr_warn("%s: %s: Reset 0x%x never completed. %s: clean reset bit.\n", __func__,
> -                       mmc_hostname(host->mmc), (int)mask, mmc_hostname(host->mmc));
> +               DBG("%s: %s: Reset 0x%x never completed. %s: clean reset bit.\n", __func__,
> +                   mmc_hostname(host->mmc), (int)mask, mmc_hostname(host->mmc));

As I said on patch1, please use pr_debug() and drop the macro.

>                 sdhci_writeb(host, 0, SDHCI_UHS2_SW_RESET);
>                 return;
>         }
> @@ -335,8 +335,8 @@ static int sdhci_uhs2_interface_detect(struct sdhci_host *host)
>         if (read_poll_timeout(sdhci_readl, val, (val & SDHCI_UHS2_IF_DETECT),
>                               100, UHS2_INTERFACE_DETECT_TIMEOUT_100MS, true,
>                               host, SDHCI_PRESENT_STATE)) {
> -               pr_warn("%s: not detect UHS2 interface in 100ms.\n", mmc_hostname(host->mmc));
> -               sdhci_dumpregs(host);
> +               DBG("%s: not detect UHS2 interface in 100ms.\n", mmc_hostname(host->mmc));
> +               sdhci_dbg_dumpregs(host, "UHS2 interface detect timeout in 100ms");

If we really need this, I think we should first introduce the helper
function in a separate patch, that precedes $subject patch in the
series.

>                 return -EIO;
>         }
>
> @@ -345,8 +345,8 @@ static int sdhci_uhs2_interface_detect(struct sdhci_host *host)
>
>         if (read_poll_timeout(sdhci_readl, val, (val & SDHCI_UHS2_LANE_SYNC),
>                               100, UHS2_LANE_SYNC_TIMEOUT_150MS, true, host, SDHCI_PRESENT_STATE)) {
> -               pr_warn("%s: UHS2 Lane sync fail in 150ms.\n", mmc_hostname(host->mmc));
> -               sdhci_dumpregs(host);
> +               DBG("%s: UHS2 Lane sync fail in 150ms.\n", mmc_hostname(host->mmc));
> +               sdhci_dbg_dumpregs(host, "UHS2 Lane sync fail in 150ms");
>                 return -EIO;
>         }
>
> @@ -417,12 +417,12 @@ static int sdhci_uhs2_do_detect_init(struct mmc_host *mmc)
>                 host->ops->uhs2_pre_detect_init(host);
>
>         if (sdhci_uhs2_interface_detect(host)) {
> -               pr_warn("%s: cannot detect UHS2 interface.\n", mmc_hostname(host->mmc));
> +               DBG("%s: cannot detect UHS2 interface.\n", mmc_hostname(host->mmc));
>                 return -EIO;
>         }
>
>         if (sdhci_uhs2_init(host)) {
> -               pr_warn("%s: UHS2 init fail.\n", mmc_hostname(host->mmc));
> +               DBG("%s: UHS2 init fail.\n", mmc_hostname(host->mmc));
>                 return -EIO;
>         }
>
> @@ -504,7 +504,7 @@ static int sdhci_uhs2_check_dormant(struct sdhci_host *host)
>         if (read_poll_timeout(sdhci_readl, val, (val & SDHCI_UHS2_IN_DORMANT_STATE),
>                               100, UHS2_CHECK_DORMANT_TIMEOUT_100MS, true, host,
>                               SDHCI_PRESENT_STATE)) {
> -               pr_warn("%s: UHS2 IN_DORMANT fail in 100ms.\n", mmc_hostname(host->mmc));
> +               DBG("%s: UHS2 IN_DORMANT fail in 100ms.\n", mmc_hostname(host->mmc));
>                 sdhci_dumpregs(host);
>                 return -EIO;
>         }
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index cd0e35a80542..2c28240e6003 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -898,4 +898,20 @@ void sdhci_switch_external_dma(struct sdhci_host *host, bool en);
>  void sdhci_set_data_timeout_irq(struct sdhci_host *host, bool enable);
>  void __sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd);
>
> +#if defined(CONFIG_DYNAMIC_DEBUG) || \
> +       (defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
> +#define SDHCI_DBG_ANYWAY 0
> +#elif defined(DEBUG)
> +#define SDHCI_DBG_ANYWAY 1
> +#else
> +#define SDHCI_DBG_ANYWAY 0
> +#endif
> +
> +#define sdhci_dbg_dumpregs(host, fmt)                                  \
> +do {                                                                   \
> +       DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);                 \
> +       if (DYNAMIC_DEBUG_BRANCH(descriptor) || SDHCI_DBG_ANYWAY)       \
> +               sdhci_dumpregs(host);                                   \
> +} while (0)
> +
>  #endif /* __SDHCI_HW_H */
> --
> 2.43.0
>

Kind regards
Uffe
