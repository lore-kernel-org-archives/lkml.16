Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13F326159A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204451; cv=none; b=iZFyKvd3Eqy4ynS/RvLu+yO8yxAXZCP+lbfuCoOaMzB3g3yyIOdrSVPkGt4i1LYSI7XKna8kyj3xHZqDDnLCGseHVVTZATWir1gkKw0/DoasK0oQ3rR19kE470+PjAy3u9I2kFsN1aO/xlug2XQbeTvkxL7qPdWWFrv2LeQXXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204451; c=relaxed/simple;
	bh=RjG6o0iKfX8jL0tGwH/fLyQSKKb0qT2KHxKRDWbG/3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZ/mP+HvxajhsPtE/l1HtZy4lbCGY/cKLjdGiSPiw9bLVUEDcOgst0T+Qkg5JPZ6w10eBWnEbmZ215O8lbPClY1nyGBBAAntujsABQFV6CdVHwVofRk3J5pYbf0wWpe32TIES8qq6lIXfAvy05FvIj5Nz5rUOCGfxgxdQMxQQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkFKE5Pw; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkFKE5Pw"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70433283ba7so17710257b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744204449; x=1744809249; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UYEgE/PiBg1IztnrbcbhevaMH2S4img3gfL0GJEJgjs=;
        b=QkFKE5PwR3ubL4b+Uu1s5APxH8w1ylAmpepDLP7tItSiTbiwSS/DS3PZrmdvXQepzV
         1Rm9N1jx3VocE9nKRm71vq7i+jzyOCyOhLHEMPqRVZkHfauSWew/aetSj2dgVBsue03f
         ZB6TjF7l1S8wLJQxqk2SfLsasgwIpwJ+nZZgeSDNOfKvqNF/7T+TH6BYik0MpXF/VHwX
         ElOso8ecE8rabjI56c0L2wuwjE9fgHvCU/CzbHwt25LKGKw6UfXRUh9p8psHTUDrj2bi
         f/s4fsYzJQ+cOqCihOFJWsUn9IZXta0SXCXGnlzMh4gDS0J13M5NJXgr3TcCCYOuhzwA
         X/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204449; x=1744809249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYEgE/PiBg1IztnrbcbhevaMH2S4img3gfL0GJEJgjs=;
        b=Q1GVxvZhNYeMEJLRebwFaCA/nRR4FL3TlywZlkrf7BIMacRexFKsXFF76DZx6z64CW
         l3MFgVcGk15QL+c91CRXwoWwq0t1czBuGvwbUdfwNYWJkGgqYzFLNKiSEqWw3vNQkxK2
         l9cWKaI5UPpZvSWUpNy9WB9j256NqxmvkZFTMxLDBGtCFT/27dtKqU1ODPyMpEFeqZvy
         cvKY2e08Mbb63xGiIMk4GMxLugdGGcweB0sGm2gSNQu1rGe/1phG3Qg0PuEiMgBVGczj
         mnNEOL4aAQQ31eyumff/rDjSSeLtq333dIyRQLWpY7ZAdY4Bu8DF/aTS+Q29BxyVkbYd
         DDuA==
X-Forwarded-Encrypted: i=1; AJvYcCX6cSTHp7fzbM3CdQ0EbbYEYVnbpMW9jLfPwCFt87BjjeJtRBDKleK5oZJwiN/BvaOtVND7moGMV8FZofQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32ZLEXZfEguOhiGBhH699U4ABzsY5HxTYMg00FTo7ogOs4pKZ
	uqKOTJYK0x5Byn2DJN7o+yOM08ZWO2Il5pkKfkaJ8nP+4TZ8+kITwzkSRZZPKTI5LwQpZj2wsR2
	MmytaA8yX8PfSnjJQ9LCOf09m3HvV954Wc+z6wA==
X-Gm-Gg: ASbGncvI4LUHAMtoZ/sdbhFA5cFK52H6ctUexuDNGb2Y67ehhwr3g1jPYpyZAcOBAie
	Rc4/8ddpguDW8ZdE2AS8TH+p7M5pgffNB/VaMdqk13PZFT1WFfbH6SgHMeS1lbs+8KUENZqXqmg
	4/FMT/oULrMbEhetIXe8IKdA0=
X-Google-Smtp-Source: AGHT+IG+yxIWgvhdp2EZ4of8o0ckVd4NcI4xx0S8pWnptpGAGLHxl9dkGzz2FLcsdd7dMhxlckIuQgH8oFvPnX7b+mk=
X-Received: by 2002:a05:690c:7304:b0:6f9:48c6:6a17 with SMTP id
 00721157ae682-705388b7404mr56470887b3.26.1744204448801; Wed, 09 Apr 2025
 06:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328112517.2624806-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250328112517.2624806-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:13:32 +0200
X-Gm-Features: ATxdqUHDkokNL-noNnSwaaVtmNmb_z1erIlahIdi7LNFHp8TEBsFeL9co4HUot8
Message-ID: <CAPDyKFqBVwdK8O8jkZ6JKvk4zKoCb7vsUQnRVjkBG7WShhchLQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: host: sdhci-esdhc-imx: save tuning value for the
 card which keep power in suspend
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, frank.li@nxp.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org, 
	s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 12:24, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> For SoCs like i.MX6UL(L/Z) and i.MX7D, USDHC powers off completely during
> system power management (PM), causing the internal tuning status to be
> lost. To address this, save the tuning value when system suspend and
> restore it for any command issued after system resume when re-tuning is
> held.
>
> A typical case involves SDIO WiFi devices with the MMC_PM_KEEP_POWER and
> MMC_PM_WAKE_SDIO_IRQ flag, which retain power during system PM. To
> conserve power, WiFi switches to 1-bit mode and restores 4-bit mode upon
> resume. As per the specification, tuning commands are not supported in
> 1-bit mode. When sending CMD52 to restore 4-bit mode, re-tuning must be
> held. However, CMD52 still requires a correct sample point to avoid CRC
> errors, necessitating preservation of the previous tuning value.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v1->v2:
>  * Used GENMASK/FIELD_GET/FIELD_PREP macro
>  * Added check MMC_PM_WAKE_SDIO_IRQ for save/restore tuning value
>  * Fixed typo and tune commit message
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 88 +++++++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index ff78a7c6a04c..7e8addaed697 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -81,6 +81,8 @@
>  #define  ESDHC_TUNE_CTRL_STEP          1
>  #define  ESDHC_TUNE_CTRL_MIN           0
>  #define  ESDHC_TUNE_CTRL_MAX           ((1 << 7) - 1)
> +#define  ESDHC_TUNE_CTRL_STATUS_TAP_SEL_PRE_MASK       GENMASK(30, 24)
> +#define  ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK  GENMASK(14, 8)
>
>  /* strobe dll register */
>  #define ESDHC_STROBE_DLL_CTRL          0x70
> @@ -235,6 +237,7 @@ struct esdhc_platform_data {
>         unsigned int tuning_step;       /* The delay cell steps in tuning procedure */
>         unsigned int tuning_start_tap;  /* The start delay cell point in tuning procedure */
>         unsigned int strobe_dll_delay_target;   /* The delay cell for strobe pad (read clock) */
> +       unsigned int saved_tuning_delay_cell;   /* save the value of tuning delay cell */
>  };
>
>  struct esdhc_soc_data {
> @@ -1057,7 +1060,7 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> -       u32 ctrl;
> +       u32 ctrl, tuning_ctrl;
>         int ret;
>
>         /* Reset the tuning circuit */
> @@ -1071,6 +1074,16 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>                         writel(0, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>                 } else if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
>                         writel(ctrl, host->ioaddr + ESDHC_MIX_CTRL);
> +                       /*
> +                        * enable the std tuning just in case it cleared in
> +                        * sdhc_esdhc_tuning_restore.
> +                        */
> +                       tuning_ctrl = readl(host->ioaddr + ESDHC_TUNING_CTRL);
> +                       if (!(tuning_ctrl & ESDHC_STD_TUNING_EN)) {
> +                               tuning_ctrl |= ESDHC_STD_TUNING_EN;
> +                               writel(tuning_ctrl, host->ioaddr + ESDHC_TUNING_CTRL);
> +                       }
> +
>                         ctrl = readl(host->ioaddr + SDHCI_AUTO_CMD_STATUS);
>                         ctrl &= ~ESDHC_MIX_CTRL_SMPCLK_SEL;
>                         ctrl &= ~ESDHC_MIX_CTRL_EXE_TUNE;
> @@ -1149,7 +1162,8 @@ static void esdhc_prepare_tuning(struct sdhci_host *host, u32 val)
>         reg |= ESDHC_MIX_CTRL_EXE_TUNE | ESDHC_MIX_CTRL_SMPCLK_SEL |
>                         ESDHC_MIX_CTRL_FBCLK_SEL;
>         writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
> -       writel(val << 8, host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> +       writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK, val),
> +              host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
>         dev_dbg(mmc_dev(host->mmc),
>                 "tuning with delay 0x%x ESDHC_TUNE_CTRL_STATUS 0x%x\n",
>                         val, readl(host->ioaddr + ESDHC_TUNE_CTRL_STATUS));
> @@ -1569,6 +1583,57 @@ static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
>         }
>  }
>
> +static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> +       u32 reg;
> +
> +       /*
> +        * SD/eMMC do not need this tuning save because it will re-init
> +        * after system resume back.
> +        * Here save the tuning delay value for SDIO device since it may
> +        * keep power during system PM. And for usdhc, only SDR50 and
> +        * SDR104 mode for SDIO device need to do tuning, and need to
> +        * save/restore.
> +        */
> +       if (host->timing == MMC_TIMING_UHS_SDR50 ||
> +           host->timing == MMC_TIMING_UHS_SDR104) {
> +               reg = readl(host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> +               reg = FIELD_GET(ESDHC_TUNE_CTRL_STATUS_TAP_SEL_PRE_MASK, reg);
> +               imx_data->boarddata.saved_tuning_delay_cell = reg;
> +       }
> +}
> +
> +static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
> +{
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> +       u32 reg;
> +
> +       if (host->timing == MMC_TIMING_UHS_SDR50 ||
> +           host->timing == MMC_TIMING_UHS_SDR104) {
> +               /*
> +                * restore the tuning delay value actually is a
> +                * manual tuning method, so clear the standard
> +                * tuning enable bit here. Will set back this
> +                * ESDHC_STD_TUNING_EN in esdhc_reset_tuning()
> +                * when trigger re-tuning.
> +                */
> +               reg = readl(host->ioaddr + ESDHC_TUNING_CTRL);
> +               reg &= ~ESDHC_STD_TUNING_EN;
> +               writel(reg, host->ioaddr + ESDHC_TUNING_CTRL);
> +
> +               reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> +               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL | ESDHC_MIX_CTRL_FBCLK_SEL;
> +               writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
> +
> +               writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK,
> +                                 imx_data->boarddata.saved_tuning_delay_cell),
> +                      host->ioaddr + ESDHC_TUNE_CTRL_STATUS);
> +       }
> +}
> +
>  static void esdhc_cqe_enable(struct mmc_host *mmc)
>  {
>         struct sdhci_host *host = mmc_priv(mmc);
> @@ -1900,6 +1965,15 @@ static int sdhci_esdhc_suspend(struct device *dev)
>         if (host->tuning_mode != SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>
> +       /*
> +        * For the device need to keep power during system PM, need
> +        * to save the tuning delay value just in case the usdhc
> +        * lost power during system PM.
> +        */
> +       if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
> +           esdhc_is_usdhc(imx_data))
> +               sdhc_esdhc_tuning_save(host);
> +
>         ret = sdhci_suspend_host(host);
>         if (ret)
>                 return ret;
> @@ -1916,6 +1990,8 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  static int sdhci_esdhc_resume(struct device *dev)
>  {
>         struct sdhci_host *host = dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
>         int ret;
>
>         ret = pinctrl_pm_select_default_state(dev);
> @@ -1929,6 +2005,14 @@ static int sdhci_esdhc_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> +       /*
> +        * restore the saved tuning delay value for the device which keep
> +        * power during system PM.
> +        */
> +       if (mmc_card_keep_power(host->mmc) && mmc_card_wake_sdio_irq(host->mmc) &&
> +           esdhc_is_usdhc(imx_data))
> +               sdhc_esdhc_tuning_restore(host);
> +
>         if (host->mmc->caps2 & MMC_CAP2_CQE)
>                 ret = cqhci_resume(host->mmc);
>
> --
> 2.34.1
>
