Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA42620D1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202959; cv=none; b=aYKCLp1d9Dlkoi4EbFMFJKm1YllWUcCtHu3HAmxPqK6nXimRbanSpKbJt7hVad0fxcXMlxJTU41FNX+Wlvz5TAaPEywuwLlxolgwEUSop3OapBLLhz/vTju4VhZYdUxke38HUnM40fF8pcs2Xhh8KtsUboZ4gd7URWBlbqFaaJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202959; c=relaxed/simple;
	bh=114xrRYfMDpqZbVsu61+eeWndUu4dIUnfdi6ZWw8+JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTriLv8F00a9LrXB/DfjTMoVrk9ohd6D8K56wzeZIr8vvaeJS/4msJ2+P+4NNvxPBZIeOFE2p8LvWNFujhHCjzHkwgDhN8Ny6zoZsL0vLZj7YtyTTyDsMPysFOSQuNztNSe3ejp33zTOj7fzGEE31uHhew8jfLFkME1vTHusHkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b82oRnuF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b82oRnuF"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70427fb838cso24441697b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744202957; x=1744807757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EeYTwgoKGzk2F10OwjsE7wT2TnLkZjym1rp+v2jZcv0=;
        b=b82oRnuFxlfjR+2Q19rNe9xwhwSMDaJLh6hXqos3QDjArCmXCSem5Ap1ElzE2tcrV2
         OLnpMCLnsk3bI5f0S7yHVIbzWfQQVnIgRuJWY4tquaSGY4cLRKWN4F5sk02pAzqt0EHV
         Y9Z0Gw+fk2nj8iB+xVGUQk4pK3rjoBFcPiQ2ffeDIHt8IwYn4gKbdYVrMggDh2Kv0O4W
         Dca0gSO8+XKtPtkX1jpDqNR/UcKUc/kDPSUSL178rPU0yL0Gs/Wo+kLDDcqjiUh+KlFQ
         fVv9qX7WBpj6JIZGEKgD3CWSrDSxuUXdZ1t/8J+SEAJkElP3YFINfZQzUft5hm5pTHsR
         oQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202957; x=1744807757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeYTwgoKGzk2F10OwjsE7wT2TnLkZjym1rp+v2jZcv0=;
        b=bvFpcOSvTMy2w1jv3XsvrNcR2PsuprsEba8wXnc9WPzfJvDK454ys107Z87tHqKyB7
         saKkQO6EEX+Mep6tbvYOBReq/oZQj957gM4VoFyKsbEX8VEza0LYQBzvKTUPq3Ks6Q+O
         XmwqX/56G0HNrrLRIzCjkbIbn4x6U7TmT3dQtp97eDVKmejJNH43WQseIzR+JMKW8pF2
         Qo3l8sioODkwOoIG2d5v6mOvR1BDnet+N1urwTJHnPDDaKFgKYE7wzbKcoYwTDWtd1HC
         wZPD9TCSo9ULlgPJbcGx94Shuqn9V9TDONAv4BI1o+AzZzbVfdxM2fomAZXOBm7Vp+eE
         GMfg==
X-Forwarded-Encrypted: i=1; AJvYcCVsCRZ22ApZe+nk+XmeEtzdR2T8h4Ks3GrFg2i2/nS7E1DqL0J+8W/zCn9B7U5OthxKSffNlaqevtk77HQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhfa8K1mI/M5+mvJJuE5NOr+AE0lZUNvATdTPNQJJcegSAB9B9
	MbF/FiR2Uz3bgbPyr15/N6uKgyvjCMz3wxUeK3FVQzsnAdX5bqs6DAK4Ow527H1bBjXYbOhDeZg
	tNmJKDa2rhVSlnHqwHDpF0jJ378WVDaBt8vSf2w==
X-Gm-Gg: ASbGncu8ndkGYqDoGgneb9Qjpkg9dRvfBHhMWWr9vI/GRwCakdnzp8HQyouCE9vt/p2
	2Drb3UUjnjUgd1p763AtmvZ7BYL4yMdY7MjgDt1xYLs8Nb4W5sKl22KUmiyOwv/MFqko7f0WN97
	bY0vucB/y/S0JQvar0ZPGVXrU=
X-Google-Smtp-Source: AGHT+IFFrOM5iQ+syWdBk4gtlvAAaRcdg0F4uOku/70K/G81PVazqAESRvcwZBLhcBGLw9VTHa6/7U780dqRDiooazU=
X-Received: by 2002:a05:690c:480a:b0:6fd:346f:97ba with SMTP id
 00721157ae682-70538806353mr52669847b3.11.1744202956829; Wed, 09 Apr 2025
 05:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407222702.2199047-1-jm@ti.com> <20250407222702.2199047-2-jm@ti.com>
In-Reply-To: <20250407222702.2199047-2-jm@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 14:48:41 +0200
X-Gm-Features: ATxdqUEoNFFtpo1c0F2wJLOIYQ9yffuIdmomLfFFB1bdHGETwhIu47n14gQF_YU
Message-ID: <CAPDyKFqx-G4NynanFWrspz7-uXXF74RfjcU-Sw2nq2JhL3LPuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] PENDING: mmc: sdhci*: Add set_hs_ena to sdhci_ops
To: Judith Mendez <jm@ti.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>, 
	Moteen Shah <m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 00:27, Judith Mendez <jm@ti.com> wrote:
>
> This patch adds set_hs_ena call to sdhci_ops so that host
> controller drivers have the option to implement a custom
> callback for SDHCI_CTRL_HISPD control.
>
> On TI devices (for HS modes and legacy mode), timing was closed on
> half cycle timing. If any of HIGH_SPEED_ENA, UHS_MODE_SELECT, or
> V1P8_SIGNAL_ENA is set for these modes, host controller switches to
> full cycle timing which may cause read/write failures and/or cqe error
> logs.
>
> So add set_hs_ena() to sdhci_ops so each host controller driver
> can implement their own .set_hs_ena callback.
>
> Also add sdhci_am654_set_hs_ena to sdhci_am654 driver and only set
> HIGH_SPEED_ENA, for modes > MMC_TIMING_SD_HS.
>
> Signed-off-by: Judith Mendez <jm@ti.com>

What does "PENDING" mean or compared to "PATCH"? I guess you want some
review and test of this - or there anything else?

> ---
>  drivers/mmc/host/sdhci.c       | 55 +++++++++++++++++++++-------------
>  drivers/mmc/host/sdhci.h       |  2 ++
>  drivers/mmc/host/sdhci_am654.c | 16 ++++++++++

I think it would be better to split this up in two parts. One for
sdhci and one for sdhci_am654.

Other than that I am going to defer to Adrian to see what he thinks about this.

Kind regards
Uffe

>  3 files changed, 53 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 5f78be7ae16d7..3a878cf0c59b9 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2355,6 +2355,27 @@ static bool sdhci_presetable_values_change(struct sdhci_host *host, struct mmc_i
>                (sdhci_preset_needed(host, ios->timing) || host->drv_type != ios->drv_type);
>  }
>
> +void sdhci_set_hs_ena(struct sdhci_host *host, unsigned char timing)
> +{
> +       u8 ctrl = sdhci_readb(host, SDHCI_HOST_CONTROL);
> +
> +       if (timing == MMC_TIMING_SD_HS ||
> +           timing == MMC_TIMING_MMC_HS ||
> +           timing == MMC_TIMING_MMC_HS400 ||
> +           timing == MMC_TIMING_MMC_HS200 ||
> +           timing == MMC_TIMING_MMC_DDR52 ||
> +           timing == MMC_TIMING_UHS_SDR50 ||
> +           timing == MMC_TIMING_UHS_SDR104 ||
> +           timing == MMC_TIMING_UHS_DDR50 ||
> +           timing == MMC_TIMING_UHS_SDR25)
> +               ctrl |= SDHCI_CTRL_HISPD;
> +       else
> +               ctrl &= ~SDHCI_CTRL_HISPD;
> +
> +       sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
> +}
> +EXPORT_SYMBOL_GPL(sdhci_set_hs_ena);
> +
>  void sdhci_set_ios_common(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
>         struct sdhci_host *host = mmc_priv(mmc);
> @@ -2436,23 +2457,6 @@ void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>             !sdhci_presetable_values_change(host, ios))
>                 return;
>
> -       ctrl = sdhci_readb(host, SDHCI_HOST_CONTROL);
> -
> -       if (!(host->quirks & SDHCI_QUIRK_NO_HISPD_BIT)) {
> -               if (ios->timing == MMC_TIMING_SD_HS ||
> -                    ios->timing == MMC_TIMING_MMC_HS ||
> -                    ios->timing == MMC_TIMING_MMC_HS400 ||
> -                    ios->timing == MMC_TIMING_MMC_HS200 ||
> -                    ios->timing == MMC_TIMING_MMC_DDR52 ||
> -                    ios->timing == MMC_TIMING_UHS_SDR50 ||
> -                    ios->timing == MMC_TIMING_UHS_SDR104 ||
> -                    ios->timing == MMC_TIMING_UHS_DDR50 ||
> -                    ios->timing == MMC_TIMING_UHS_SDR25)
> -                       ctrl |= SDHCI_CTRL_HISPD;
> -               else
> -                       ctrl &= ~SDHCI_CTRL_HISPD;
> -       }
> -
>         if (host->version >= SDHCI_SPEC_300) {
>                 u16 clk, ctrl_2;
>
> @@ -2468,7 +2472,12 @@ void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>                         sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
>                 }
>
> -               sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
> +               if (!(host->quirks & SDHCI_QUIRK_NO_HISPD_BIT)) {
> +                       if (host->ops->set_hs_ena)
> +                               host->ops->set_hs_ena(host, ios->timing);
> +                       else
> +                               sdhci_set_hs_ena(host, ios->timing);
> +               }
>
>                 if (!host->preset_enabled) {
>                         /*
> @@ -2510,8 +2519,14 @@ void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>
>                 /* Re-enable SD Clock */
>                 host->ops->set_clock(host, host->clock);
> -       } else
> -               sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
> +       } else {
> +               if (!(host->quirks & SDHCI_QUIRK_NO_HISPD_BIT)) {
> +                       if (host->ops->set_hs_ena)
> +                               host->ops->set_hs_ena(host, ios->timing);
> +                       else
> +                               sdhci_set_hs_ena(host, ios->timing);
> +               }
> +       }
>  }
>  EXPORT_SYMBOL_GPL(sdhci_set_ios);
>
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index cd0e35a805427..ebecb49792ca1 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -704,6 +704,7 @@ struct sdhci_ops {
>         void            (*set_timeout)(struct sdhci_host *host,
>                                        struct mmc_command *cmd);
>         void            (*set_bus_width)(struct sdhci_host *host, int width);
> +       void            (*set_hs_ena)(struct sdhci_host *host, unsigned char timing);
>         void (*platform_send_init_74_clocks)(struct sdhci_host *host,
>                                              u8 power_mode);
>         unsigned int    (*get_ro)(struct sdhci_host *host);
> @@ -857,6 +858,7 @@ int sdhci_get_ro(struct mmc_host *mmc);
>  void sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq);
>  int sdhci_request_atomic(struct mmc_host *mmc, struct mmc_request *mrq);
>  void sdhci_set_bus_width(struct sdhci_host *host, int width);
> +void sdhci_set_hs_ena(struct sdhci_host *host, unsigned char timing);
>  void sdhci_reset(struct sdhci_host *host, u8 mask);
>  bool sdhci_do_reset(struct sdhci_host *host, u8 mask);
>  void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing);
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index f75c31815ab00..67a64de4972c9 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -429,6 +429,19 @@ static int sdhci_am654_execute_tuning(struct mmc_host *mmc, u32 opcode)
>         return 0;
>  }
>
> +static void sdhci_am654_set_hs_ena(struct sdhci_host *host, unsigned char timing)
> +{
> +       u8 ctrl = 0;
> +
> +       if (timing > MMC_TIMING_SD_HS) {
> +               sdhci_set_hs_ena(host, timing);
> +       } else {
> +               ctrl = sdhci_readb(host, SDHCI_HOST_CONTROL);
> +               ctrl &= ~SDHCI_CTRL_HISPD;
> +               sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
> +       }
> +}
> +
>  static u32 sdhci_am654_cqhci_irq(struct sdhci_host *host, u32 intmask)
>  {
>         int cmd_error = 0;
> @@ -578,6 +591,7 @@ static const struct sdhci_ops sdhci_am654_ops = {
>         .get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
>         .set_uhs_signaling = sdhci_set_uhs_signaling,
>         .set_bus_width = sdhci_set_bus_width,
> +       .set_hs_ena = sdhci_am654_set_hs_ena,
>         .set_power = sdhci_set_power_and_bus_voltage,
>         .set_clock = sdhci_am654_set_clock,
>         .write_b = sdhci_am654_write_b,
> @@ -608,6 +622,7 @@ static const struct sdhci_ops sdhci_j721e_8bit_ops = {
>         .get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
>         .set_uhs_signaling = sdhci_set_uhs_signaling,
>         .set_bus_width = sdhci_set_bus_width,
> +       .set_hs_ena = sdhci_am654_set_hs_ena,
>         .set_power = sdhci_set_power_and_bus_voltage,
>         .set_clock = sdhci_am654_set_clock,
>         .write_b = sdhci_am654_write_b,
> @@ -632,6 +647,7 @@ static const struct sdhci_ops sdhci_j721e_4bit_ops = {
>         .get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
>         .set_uhs_signaling = sdhci_set_uhs_signaling,
>         .set_bus_width = sdhci_set_bus_width,
> +       .set_hs_ena = sdhci_am654_set_hs_ena,
>         .set_power = sdhci_set_power_and_bus_voltage,
>         .set_clock = sdhci_j721e_4bit_set_clock,
>         .write_b = sdhci_am654_write_b,
> --
> 2.49.0
>
