Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730225D1E9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479135; cv=none; b=Ay2dlfeVzFb0Cjio2vQ/B6pb31+7rTbEmdkCb0I5+WQkumPf7e4f6HjcgdzXI/QN1N7AXkbJwIrMREo//M4YOeutoex0py2OSYuFh43PST1DWM5j/2EaA3D8PVqueu5vCr9SvIFbQv+hp7AtlSnlIhcgNzcT4c0iXDAjphdbeZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479135; c=relaxed/simple;
	bh=7Q9lxvzufrlgaieFsmmIoaVB9+vEIKHKjtHXHbbeTcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXZu/kKjlNdryijERP0Djiq5BMerj5sH43XPR3KsBUA0CyeBt+xkvIaHCUFXWEsKEaIrCKJw0+YVch8zLyuqsqMpZYUdmfe//40QiSyRAXL5mAxgWKPR4Uu2GyIOXiELVwlas7b6DwSJIljkSLvXKZwQoK05WgnLP30/Hd0VrKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aN/QgR9s; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aN/QgR9s"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e73e9e18556so4140027276.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479133; x=1750083933; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9yDBCL9OQQ2dpuHj/+WEzZXErX2MF2uYZnoNM7uA4=;
        b=aN/QgR9sWBUPeQ/ZC6YJuXVA9Y7NzKYqh37KQnnHER8Wex+E7ga/Gmy98YRPgsdszY
         Lm3zOwCT7jbXNeD4PeQ3CrV3HjFFv84ST1bLhRe+EMPMKi0NPRlezS64IPakt+uNcIdz
         xuL0Uz26g+o3DhhJJVm/Ngf8AmeW/q/jDqxY+rqJt7ZndP39j2mmQi/eq3xdlYxI1ECU
         0P8IOK5fmG7T8wB7nYtOZ79rGbes3INw8Ub+6LhLPYh4JZfHKIhLeVVedTG07ShV7NA/
         jEkU46411IR0GWzzyNhcEVuPPF5poc4LLLDZAWthTuAXHpnn9X+r2qkvm3MDA38ISMx/
         +Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479133; x=1750083933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qs9yDBCL9OQQ2dpuHj/+WEzZXErX2MF2uYZnoNM7uA4=;
        b=V0KQRySQl0YNJRe7PlMkYsj3u0lLj4tJQ5mT6YT3/FLXG5M1fLob+Eu6txIUsPZMQP
         AFVcZ1wmve4edxCVu5q6jOGCjd/0D+nOg4x6NmQNnJvrQ6AkMGT1pnTH4nX2sfqD3UHu
         /pvwRCpMfwRfaMdubncd+7JL3ZneThPrRgoAAkgo4T+l2pl4AqPYGlo8yIyp0ivRWx/N
         vgqyoCuML7f1vNgGCJztRp00D47sURtzI58ErwvCHa1MJq3H56URfWV4zcCp1v/6Gv+x
         QwOqYhUN3A3HABiaqA5EQ5vt9tT3p0tpM0RuWnlol/wZyJ8vwyfBu1tmQhnEMyagrBqv
         7H0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4WUjikBzzBAO+af5cztCo1Q2HZTgH/FdYzhKE66cfw/4lGgZ6nwc7gPMqlFbzW9P7dCjgtIF6PejgJ84=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhAcfJTGXyqGD+ypZEYoND+NWzPOih+6X+r7tP3PhNVOeOsEbb
	gyJQtSkDvQ97z3sgm7wnjbWfKvEoYIXL6LHzucrv7NozKoq8zpj/usIyM53dX9asOSbrJzqn/09
	J9H95G7bHVjd82F02bDQOP7SM5/KDRPmkitExwUDlrQ==
X-Gm-Gg: ASbGncsuqEWk1vS2omAQomxLvSgqRmzMZ1L+ynhcAxjh8/qw8oauAhVcixhtL1L9mLF
	/hPDzwW3ewMHbNBlTudioV94ikBKLTWRmBAahk1wv5s7pVliR30LAzVj5rCw11Z2Zi1Rb6Msfms
	srbnqyWlZjBtaPtL7EuY00k6C4L5Nrn3y9Zg==
X-Google-Smtp-Source: AGHT+IG9S1xNruNzhNFugEoEcohrFQLqoxTMTaqwCUIforBGu07/WXI6ZQ6WYR+jbUueu4Zz7wktb1J3/XAbxy5DAZ0=
X-Received: by 2002:a05:6902:1005:b0:e7d:a290:9532 with SMTP id
 3f1490d57ef6-e81efde986amr99713276.6.1749479132960; Mon, 09 Jun 2025 07:25:32
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521025502.112030-1-ziniu.wang_1@nxp.com> <20250521025502.112030-2-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521025502.112030-2-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:57 +0200
X-Gm-Features: AX0GCFto9k3Gr4YCVyXjpM_DIPE3WFVihsUYF7aq38OAJZNQC3fiKNoXcigrZNg
Message-ID: <CAPDyKFoHqhgWqy4EeQ2vr0eQgCnUkSf6SLyKEVLzar30Sy7OHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: sdhci-esdhc-imx: optimize clock loopback
 selection with dummy pad support
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
> For legacy platforms without dummy pad:
> When clock <= 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 0 (external clock
> pad loopback) for better bus clock proximity.
> When clock > 100MHz: Set ESDHC_MIX_CTRL_FBCLK_SEL to 1 (internal clock
> loopback) to avoid signal reflection noise at high frequency.
>
> For i.MX94/95 with dummy pad support:
> Keep ESDHC_MIX_CTRL_FBCLK_SEL at 0 for all speed mode. Hardware
> automatically substitutes clock pad loopback with dummy pad loopback
> when available, eliminating signal reflections while preserving better
> bus clock proximity.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index c448a53530a5..5f1c45b2bd5d 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -212,6 +212,9 @@
>  /* The IP does not have GPIO CD wake capabilities */
>  #define ESDHC_FLAG_SKIP_CD_WAKE                BIT(18)
>
> +/* the controller has dummy pad for clock loopback */
> +#define ESDHC_FLAG_DUMMY_PAD           BIT(19)
> +
>  #define ESDHC_AUTO_TUNING_WINDOW       3
>
>  enum wp_types {
> @@ -348,6 +351,15 @@ static struct esdhc_soc_data usdhc_imx8mm_data = {
>         .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
> +static struct esdhc_soc_data usdhc_imx95_data = {
> +       .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> +                       | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> +                       | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
> +                       | ESDHC_FLAG_STATE_LOST_IN_LPMODE
> +                       | ESDHC_FLAG_DUMMY_PAD,
> +       .quirks = SDHCI_QUIRK_NO_LED,
> +};
> +
>  struct pltfm_imx_data {
>         u32 scratchpad;
>         struct pinctrl *pinctrl;
> @@ -392,6 +404,8 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>         { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>         { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>         { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +       { .compatible = "fsl,imx94-usdhc", .data = &usdhc_imx95_data, },
> +       { .compatible = "fsl,imx95-usdhc", .data = &usdhc_imx95_data, },
>         { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>         { .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>         { /* sentinel */ }
> @@ -1424,9 +1438,10 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>                 break;
>         }
>
> -       if (timing == MMC_TIMING_UHS_SDR104 ||
> -           timing == MMC_TIMING_MMC_HS200 ||
> -           timing == MMC_TIMING_MMC_HS400)
> +       if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD) &&
> +           (timing == MMC_TIMING_UHS_SDR104 ||
> +            timing == MMC_TIMING_MMC_HS200 ||
> +            timing == MMC_TIMING_MMC_HS400))
>                 m |= ESDHC_MIX_CTRL_FBCLK_SEL;
>         else
>                 m &= ~ESDHC_MIX_CTRL_FBCLK_SEL;
> @@ -1678,7 +1693,9 @@ static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
>                 writel(reg, host->ioaddr + ESDHC_TUNING_CTRL);
>
>                 reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
> -               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL | ESDHC_MIX_CTRL_FBCLK_SEL;
> +               reg |= ESDHC_MIX_CTRL_SMPCLK_SEL;
> +               if (!(imx_data->socdata->flags & ESDHC_FLAG_DUMMY_PAD))
> +                       reg |= ESDHC_MIX_CTRL_FBCLK_SEL;
>                 writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
>
>                 writel(FIELD_PREP(ESDHC_TUNE_CTRL_STATUS_DLY_CELL_SET_PRE_MASK,
> --
> 2.34.1
>
