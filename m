Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA55625CC6D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479132; cv=none; b=YUUguJLovNb/bYe2t4v4l3tsAz9+zda+91C0uHOB8G8oUlJfmaC5GEKYKPox3q9uPf0hUroIjJFeT9AiUqCXx2+o2PHfpR2ubnjBvCfZ8hCmp5pUPuNjNmYH1YD13vgq9V4qH/xfP2EuJXrA9eg6RTuZ0xXNPQ9gS2i6HojwqTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479132; c=relaxed/simple;
	bh=KBeLUMh2iQI2RMf+hlDrl9qPxrBpsEO7zs58t+tgiRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3VeucLvWr3Z9jvXcWNBOf0zP4wQKVBzauTybEGIoSs74Yx1k4Rrw5smt9D+I7PFCNWSyFRxuN4yv6Sn557B5Zi/uIW0SB+eXK7j7BVPnNuxFU1zD+F+Eb4Yj036jM7+ldwBpMZFhlMnk+D4TUrVQ9RECW9TGwl07AuD4nrT0/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqHrh5PL; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqHrh5PL"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e73e9e18556so4139935276.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479129; x=1750083929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZykcNbDimAS4m5zQC6qPpRpEexn6V57y3u83AlFoEMA=;
        b=bqHrh5PL5Bjt3Rsyv455EOJhdn9fynbLkL+/qbaUHVVLC0XFunB1vXsQpwzEq+W2jR
         eDDt1dOkOIaETShV+iVBMjzL848CSOVASYxqBfEEXgwVQLOl15jnhDWGC1JCFFTfIlqi
         una24V9+/vcsXyVh2GStd2CfE7YJO2mJcUSPRXjRogvHBWmXxdDieRuJ64oiIbFgXKTk
         i5G3zpswX+I7nHS7C8tWslR2lLECHCeWi39y7X6iwI8e7KXITfGE3Cqj2RWbQ2vx0uzA
         TvD0cBIuRykPLxY0ggXJOFZcuUcWxO65IDF1xAzb3upXprbujqddyK5itpcAY7c/BBXu
         EslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479129; x=1750083929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZykcNbDimAS4m5zQC6qPpRpEexn6V57y3u83AlFoEMA=;
        b=oAgYIXtNSFbbaE4ls2n1ebmo8USG1AleJ8qbt5OokLUYe2r1GD6E+HLgQKtE0AWx7c
         Y5au1IwHLKH6y1kjIUkaRBLlGDYcdVJEKALdR1XTi4trQVWiHMv9Pi8ZkDqkAFjZOLSc
         0flyzP2S9NGc9USnw+MK3l9MSik9RwXAaMUs4C/9ANWJN9gQie7xmmddM5RqQFmqEPmI
         JP/dLtlmDgB9Oyof9az4w7gDf6osbvAhqPSvmFO0BDQo/72A+3FzuW60sjgQMjrgLnhn
         eN0m80teBcMJzszwWxVGOZ6DpU6XdXu1mkG+/SyHK1ziEH9tCAtQ63ovjcx2Vjngiy4B
         zwuw==
X-Forwarded-Encrypted: i=1; AJvYcCWYlT/j035HJ6G68yERU1+6UN+T51zAIw/2Kvs9lrDbd9egF5s9iSbQa/8erFM8ANqjce/T3JmvB3T80zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxavkXk1hJjVrtZu564D2tTvzyAGd/36mtL0jbjfkzCy/EMQ0jX
	qFIjgIRoaIcfUK/JeNNoPQNi0s41GE296IDgSS0b0YKPESIB4p4NOLiQffKgzmQSfmqZ6j9bNoN
	9HkC+rsvXkcamglYCS8jTSUj0eZROgDhilrA7xVOi9A==
X-Gm-Gg: ASbGncsn8AYCr4SkxRldAQcMztc7/TAtF196NAnFxr+7qTaewZixKrgadHB66S+sh4N
	0S4kRia/m9a6fqqwYLsewj/f5fgXaI4aq+oHALtn5in/KMH9Dvlam63G2QIwuKs/Z3pJOW6aek2
	EtZGc/qAY4jxi6ToVmsnJju2/bp+5bmCK/ajW4d7aatUmm
X-Google-Smtp-Source: AGHT+IFWaAnhSSW8nsxLfCEosbsRw/tkQutL1OqIK5lEepaSoyu2whvGXaIfcmmuI2AXH/opMexpg40eXSqxjteyUS4=
X-Received: by 2002:a05:6902:a86:b0:e81:8305:b8d9 with SMTP id
 3f1490d57ef6-e81efdccd06mr92199276.1.1749479128789; Mon, 09 Jun 2025 07:25:28
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521025502.112030-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521025502.112030-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:52 +0200
X-Gm-Features: AX0GCFstYtrysknkf_NKK6FH3sANBz-IA2dFPtq7J8l2XlDrZ3cHyVOBugoqvZI
Message-ID: <CAPDyKFrk3B-ZSTgEGqtfuTNa8yqcq55ueUGfoGdTLk6139Rrgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci-esdhc-imx: refactor clock loopback
 selection logic
To: ziniu.wang_1@nxp.com
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 04:53, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> i.MX reference manual specifies that internal clock loopback should be
> used for SDR104/HS200/HS400 modes. Move ESDHC_MIX_CTRL_FBCLK_SEL
> configuration into the timing selection function to:
>
> 1. Explicitly set internal loopback path for SDR104/HS200/HS400 modes
> 2. Avoid redundant bit manipulation across multiple functions
>
> Preserve ESDHC_MIX_CTRL_FBCLK_SEL during system resume for SDIO devices
> with MMC_PM_KEEP_POWER and MMC_PM_WAKE_SDIO_IRQ flag, as the controller
> might lose register state during suspend while skipping card
> re-initialization.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 7611682f10c3..c448a53530a5 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -728,23 +728,17 @@ static void esdhc_writew_le(struct sdhci_host *host, u16 val, int reg)
>                 writel(new_val, host->ioaddr + ESDHC_VENDOR_SPEC);
>                 if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
>                         u32 v = readl(host->ioaddr + SDHCI_AUTO_CMD_STATUS);
> -                       u32 m = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -                       if (val & SDHCI_CTRL_TUNED_CLK) {
> +                       if (val & SDHCI_CTRL_TUNED_CLK)
>                                 v |= ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                       } else {
> +                       else
>                                 v &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                               m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> -                       }
>
> -                       if (val & SDHCI_CTRL_EXEC_TUNING) {
> +                       if (val & SDHCI_CTRL_EXEC_TUNING)
>                                 v |= ESDHC_MIX_CTRL_EXE_TUNE;
> -                               m |= ESDHC_MIX_CTRL_FBCLK_SEL;
> -                       } else {
> +                       else
>                                 v &= ~ESDHC_MIX_CTRL_EXE_TUNE;
> -                       }
>
>                         writel(v, host->ioaddr + SDHCI_AUTO_CMD_STATUS);
> -                       writel(m, host->ioaddr + ESDHC_MIX_CTRL);
>                 }
>                 return;
>         case SDHCI_TRANSFER_MODE:
> @@ -1082,7 +1076,6 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>                 ctrl &= ~ESDHC_MIX_CTRL_AUTO_TUNE_EN;
>                 if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
>                         ctrl &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
> -                       ctrl &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
>                         writel(ctrl, host->ioaddr + ESDHC_MIX_CTRL);
>                         writel(0, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>                 } else if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
> @@ -1177,8 +1170,7 @@ static void esdhc_prepare_tuning(struct sdhci_host *host, u32 val)
>                 "warning! RESET_ALL never complete before sending tuning command\n");
>
>         reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -       reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL |
> -                       ESDHC_MIX_CTRL_FBCLK_SEL;
> +       reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL;
>         writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
>         writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK, val),
>                host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> @@ -1432,6 +1424,15 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>                 break;
>         }
>
> +       if (timing == MMC_TIMING_UHS_SDR104 ||
> +           timing == MMC_TIMING_MMC_HS200 ||
> +           timing == MMC_TIMING_MMC_HS400)
> +               m |= ESDHC_MIX_CTRL_FBCLK_SEL;
> +       else
> +               m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> +
> +       writel(m, host->ioaddr + ESDHC_MIX_CTRL);
> +
>         esdhc_change_pinstate(host, timing);
>  }
>
> --
> 2.34.1
>
