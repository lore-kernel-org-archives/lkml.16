Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FBC8DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336689; cv=none; b=aLe4mgGSracbiNmdBPAhmRcjwPuqDRgU6ralvNF8lqXXswm/2rxGYem1A/khjvP7kGae7rul8MSVLRfb0Y8u6JpsN6rPdSLt70aFGDpoeEbC0kIe00AtA8yt5O6Dc+09cpjuGTxBecwbONhKqwQH962hAwhFzY9iSeB7zO3StZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336689; c=relaxed/simple;
	bh=6qWLggXJPCM0HeOHIa65h9aywtSvV/SIK/9zjhWaRL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnRdFMgEJe9eQZhkPYmKU0OhS86P03jWt70O0/UgCVQOW3UNWI4XGnRhefIn1O2ap1AIN4JATd32bEu+LYdLyoGWQLlVjQUNHgM90/+BInEcetLRWzfubXx/3M8dSWysxve23Ox90ldfb3pDyG5i6GiKVo4luZwRmUwzQeEvVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHzEBB+1; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHzEBB+1"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7040ac93c29so49939097b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336686; x=1745941486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9ngDNGkZRiVWGtgvkMRHPkUgF6S7Nt/Bo4JqOL13oI=;
        b=wHzEBB+1kPHLOrimzfhjPKlF+K3jPwVA1atnc1A/1Qp7le3WyLqdfB7nIhFGu3vVfZ
         TWAzA4c8MIv7hJXsb+XRWhKKUgmvehMcm2pS5Hfrx4kecITacbKFPD8eLpfzEN5iWXl3
         tusm7r98rhlVVwf4Cl2hZyQTuChhUAB8JvXorPIdqMaI76fJHTr2XkO7+HNAY84ONnWA
         ix0Y7oRPEqFg5JIEe5EVPJaeMhO35OHOTqGvcvunkBUF4wTfTubT0Ws8jB7F4c6u7Lyu
         hClKhCL3iqyhvaSSNQDDnpBPURKNn4+SAVD3LJdfhqy+QV9o1E3iLErPWdyK6ivoc1eo
         tsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336686; x=1745941486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9ngDNGkZRiVWGtgvkMRHPkUgF6S7Nt/Bo4JqOL13oI=;
        b=mtObxJJ912coQGfKFUVilvc1o4vsV0bnshgbadP4kXlI24sMlD3kYdJvh//rT9UJFI
         MnxQ8cHcNE/BlwrQoXDKO0YlnhZ+fNooWMXIkNmyO93cJjBZDu2JndJud+5WNNE11enQ
         rz4+sd7yo+zhuk87X6Fd7vw2SddECiXTXDYed5S20MD0BLU/ItanUWWe+Aw2a9h3aCxu
         8e+HfHV02BZfU839XTFO9BxRvR9RI7zQ7FbJ9jN2phlAbJhhsM3qUyKG7Np/0Y9Vntg5
         vgJN5+S9eYVEOlwAjrcRol+V4wpoTzz/FSGFfUGGlws7okqu8AeRlAUplebd7dgewT5L
         W2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVJCpN31yDV5CloboEmnYLvX908X6F2CVEUQDil+I8JPj1xSGlIA798cxn+x+nAqUIQLHyobv2z6vv7tuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HIcU2BL1HTA355wIs/Yqf2cXBBFwluGstZbXCE8otd/tMfu0
	/H+Bx0mKSvsykpjFebbXaf+AM+uvuV+PhpvecYvG3T7CRuNGi1qVPzHwbCbk27Bwr+IoH0yunI2
	D+tIelAGKJA9opA2bp0Et9+cedlKa7Pcd8pqRQg==
X-Gm-Gg: ASbGncuXZ86KZUxkWs9UZb+qTaAXVxfm22b3+BDKx297DX69zwjq2O3SjCh25wJBkgh
	S/pH/H27yc94wrLOk/lQMr3zo/tk5yKf7EfdAuHphO/SLBlrmc+p76EfsMGa5TZzm+yGXVekKrg
	5tGo0sQ+d/YssJ5uVVNsqo+1c=
X-Google-Smtp-Source: AGHT+IE3NCo/U+OdWL0RzxeIBOTKrxCpneJJYIv5a9wSEqVGqkMe/Lxmi2wisNM7ZZMHxbrfn2WvD6fXWik7UjeBc4U=
X-Received: by 2002:a05:690c:6e0d:b0:6f6:d0a8:8d65 with SMTP id
 00721157ae682-706cce25937mr208437997b3.28.1745336685661; Tue, 22 Apr 2025
 08:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409072604.3410459-1-ziniu.wang_1@nxp.com> <ac3546ef-bffa-47ac-9c65-c3250da5387d@intel.com>
In-Reply-To: <ac3546ef-bffa-47ac-9c65-c3250da5387d@intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:10 +0200
X-Gm-Features: ATxdqUFxVnXPCSEBPjHmKlVJnatv7iIefwywUip8-eI--PGoBu-PH0qykz7ZccM
Message-ID: <CAPDyKFpmK3ZGyqgXFsZ43aU_JG8JG-mw751Lcbk3PZ1_9xLnyQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-esdhc-imx: calculate data timeout value
 based on clock
To: ziniu.wang_1@nxp.com, Adrian Hunter <adrian.hunter@intel.com>
Cc: haibo.chen@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 12:24, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 9/04/25 10:26, ziniu.wang_1@nxp.com wrote:
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> >
> > Calculate data timeout value based on clock instead of using max value.
> >
> > Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
>
> We overlooked that Haibo wanted the "bit[23]" comment dropped,
> but nevertheless:

I have dropped the comment when applying, no need for a re-send. I
also added Haibo's reviewed-by tag.

>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


>
> > ---
> > v1->v2:
> >  * Added SDHCI_TIMEOUT_CONTROL to esdhc_writeb_le()
> >  * Removed esdhc_set_timeout() to use common __sdhci_set_timeout().
> > ---
> >  drivers/mmc/host/sdhci-esdhc-imx.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> > index ff78a7c6a04c..a34cabee5916 100644
> > --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> > +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> > @@ -870,6 +870,16 @@ static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
> >
> >               esdhc_clrset_le(host, mask, new_val, reg);
> >               return;
> > +     case SDHCI_TIMEOUT_CONTROL:
> > +             /*
> > +              * ESDHC_SYSTEM_CONTROL bit[23] used to control hardware reset
> > +              * pin of the card. Write 0 to bit[23] will reset the card.
> > +              * Only write DTOCV field here.
> > +              */
> > +             esdhc_clrset_le(host, ESDHC_SYS_CTRL_DTOCV_MASK,
> > +                             FIELD_PREP(ESDHC_SYS_CTRL_DTOCV_MASK, val),
> > +                             ESDHC_SYSTEM_CONTROL);
> > +             return;
> >       case SDHCI_SOFTWARE_RESET:
> >               if (val & SDHCI_RESET_DATA)
> >                       new_val = readl(host->ioaddr + SDHCI_HOST_CONTROL);
> > @@ -1385,17 +1395,6 @@ static unsigned int esdhc_get_max_timeout_count(struct sdhci_host *host)
> >       return esdhc_is_usdhc(imx_data) ? 1 << 29 : 1 << 27;
> >  }
> >
> > -static void esdhc_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> > -{
> > -     struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > -     struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> > -
> > -     /* use maximum timeout counter */
> > -     esdhc_clrset_le(host, ESDHC_SYS_CTRL_DTOCV_MASK,
> > -                     esdhc_is_usdhc(imx_data) ? 0xF0000 : 0xE0000,
> > -                     ESDHC_SYSTEM_CONTROL);
> > -}
> > -
> >  static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)
> >  {
> >       int cmd_error = 0;
> > @@ -1432,7 +1431,6 @@ static struct sdhci_ops sdhci_esdhc_ops = {
> >       .get_min_clock = esdhc_pltfm_get_min_clock,
> >       .get_max_timeout_count = esdhc_get_max_timeout_count,
> >       .get_ro = esdhc_pltfm_get_ro,
> > -     .set_timeout = esdhc_set_timeout,
> >       .set_bus_width = esdhc_pltfm_set_bus_width,
> >       .set_uhs_signaling = esdhc_set_uhs_signaling,
> >       .reset = esdhc_reset,
> > @@ -1777,6 +1775,8 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
> >                * to distinguish the card type.
> >                */
> >               host->mmc_host_ops.init_card = usdhc_init_card;
> > +
> > +             host->max_timeout_count = 0xF;
> >       }
> >
> >       if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING)
>
