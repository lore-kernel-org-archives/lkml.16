Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB5D259CBB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479126; cv=none; b=l6am7ybUDkbaklM3nMJuSRez9G2ixjytdrMtjyS532ZT+jdBVF3vMn/he1sID/ynQFIF7RYjwHu5UNaF9sv+JcH+W1EYngyuNQRgV8Gw8oe87/MB6SPSvVjeyAPdeOAElQsis4RRAy/DaBNDlsDbhY6AdQopqR2TAz42tAqW3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479126; c=relaxed/simple;
	bh=RMxwU4uMw3X/ihqmtoM44ZozrFhIFNNLFQWT28zbLhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHHI9e6vSY2DcUqhBzjC69uhx1SNk84y/jYH6KoD+XYkh1bcjDKvaJTNs/cqX/H4RlyPQjCCbpEhd31iDVxsF++X84obBilYwF0IvmgFHeFlsyASvOkpw7bRwQHsQD8K8c0BOkah70750FaH8lTPX9GKszsRv82b1x2EflGM+lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j6Lwfr5N; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j6Lwfr5N"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e81a7d90824so2361984276.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479123; x=1750083923; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JG77WgKR93x/LtBVjZqNlrO3c6x5SGKIjmb1nd9PqZU=;
        b=j6Lwfr5NFTdWmemEYQWY0nTCpZPhhYfyqxHkoZ2ddojw0GEL3gMx3xCkZIn2vwRTlL
         E6UXbY7IQ/0g4IVgIGnbNaZ/gxm5oRBIDIYRYQEhbMxt+Thn0NrWjMN3F0ovVkhJe4GG
         yw05st3McYHu6ZY6iGC2hLTkcMyBUmzErotaPyalagrRGwnstr1Qcn/NSpLeDYIvT4Gf
         2j+wGXmMvzaY35esVGr6wpUQw5+rBR2PgaQVfz45c4IXSYM5htldPfVCpNMtizfyv++c
         Zpz0JazrTG4aBvTbIoknXFHkNu/ggZR25cIT8M3rGxD5mrdUvcc4bKW0X8l3S8ZC84Xt
         T24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479123; x=1750083923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JG77WgKR93x/LtBVjZqNlrO3c6x5SGKIjmb1nd9PqZU=;
        b=u5n95kze0ENJOlbTRBqxOc6pYunCdwmzbKmSHkjHk3iS19b5I1bhB5Pn3in17aYl7f
         fowlewFP8Ix0fx0AmX74zU+sJe2m6dtrvweq0oDGKB+69OIumRtxn5lWZKPUSQVT+ItA
         Q4z0fdzSyghGGZv4Z/unAvJ39tIu/dlnURVjdh9JRNoFkr8uN+vEm3ZTagk5Jy4yD1c0
         kOsmxfgu2X6r5WoT5al8u8K0Z7EzqxJPHFIFkEUUVCd9LQoQpDUjzdxjzz1lUXS9lNsr
         Djwa2dlbaXDlB1jOQ3eQmPzijHqzpLKsZOybluwg22dTfpWieKA0L6QFeG09RIdJrkhu
         VU/A==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZKeLAaFCjhCxr5vZk/hGoakWhCYJONOc5Z89sRVJbpI5WO3MtLFUPgqShcBzGzFRx8G+eAPmNB891gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFz8tkXnytHfWR17Eag3GhEPx7xQcOsp0YI90m1ZRWf+cJt+ZH
	gL5a6fzHEm/WRd1Xf+ZX5fIZA862/kU/gR8ZlfD+nLdd3ebac9S13odxXeFjyS4hd/JEmEA5QR5
	cDQv1tIQBWbE5bD4d9d4pASc1qcYEHSmPaw4qMP/LUQ==
X-Gm-Gg: ASbGncvi/nUR7yEHQBukvG6IyxeAF1pzHPoNIg+wXxiFwrEOPc0UIOA2sCvIZSksfE1
	XY5ByCZw2MVJaYXcVhGH0fnPUqdOMoAWx0CMnJgtKtkAKKrXf02qyV9SZ86lfEg52ri2tXK2D9e
	Z6WEs/g5nmrNbyphE9AZyQxPsCZvEkX+U551LBHAyoBOLP
X-Google-Smtp-Source: AGHT+IHLNEnuAme9eHASfWL8QqGkVGxEwvncLnTk7Ne6+v13yqzaemTTYFnukN2K2Zr05hKAsZjb76xfzqBgFfZg0J4=
X-Received: by 2002:a05:6902:690c:b0:e81:d3db:9e53 with SMTP id
 3f1490d57ef6-e81d3db9eb3mr5064016276.32.1749479123336; Mon, 09 Jun 2025
 07:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521033134.112671-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521033134.112671-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:47 +0200
X-Gm-Features: AX0GCFsxQzRzF0fm7fx2jH_zKPRXvTdReaWYtTKHfDZG8Ytl7CNAKn6UVwNB5jk
Message-ID: <CAPDyKFogKcwssmQXSDQ+WFBP5iPMOHaK9RSAmRtn89MUnTJb=w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: do not change pinctrl state in
 suspend if function irq is wakeup source
To: ziniu.wang_1@nxp.com
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

+ Frank

On Wed, 21 May 2025 at 05:30, <ziniu.wang_1@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> pinctrl sleep state may config the pin mux to certain function to save
> power in system PM. But if usdhc is setting as wakeup source, like
> the card interrupt(SDIO) or card insert interrupt, it depends on the
> related pin mux configured to usdhc function pad.
> e.g. To support card interrupt(SDIO interrupt), it need the pin is
> config as usdhc DATA[1] function pin.
>
> Find the issue on imx93-11x11-evk board, SDIO WiFi in band interrupt
> can't wakeup system because the pinctrl sleep state config the DATA[1]
> pin as GPIO function.
>
> For this case, do not change the pinctrl state in suspend.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

I have followed the discussion and I agree that there is room for
additional improvements (such as adding a new pinctrl state).

In any case, I still think $subject patch is the first step to take,
to fix the current problems. So, applied for next, thanks!

Note that, we may want this for stable kernels too, but perhaps easier
to manage that by manual backports as this depends on commit
676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM
logic") too.

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 5f1c45b2bd5d..f206b562a6e3 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2057,12 +2057,20 @@ static int sdhci_esdhc_suspend(struct device *dev)
>                 ret = sdhci_enable_irq_wakeups(host);
>                 if (!ret)
>                         dev_warn(dev, "Failed to enable irq wakeup\n");
> +       } else {
> +               /*
> +                * For the device which works as wakeup source, no need
> +                * to change the pinctrl to sleep state.
> +                * e.g. For SDIO device, the interrupt share with data pin,
> +                * but the pinctrl sleep state may config the data pin to
> +                * other function like GPIO function to save power in PM,
> +                * which finally block the SDIO wakeup function.
> +                */
> +               ret = pinctrl_pm_select_sleep_state(dev);
> +               if (ret)
> +                       return ret;
>         }
>
> -       ret = pinctrl_pm_select_sleep_state(dev);
> -       if (ret)
> -               return ret;
> -
>         ret = mmc_gpio_set_cd_wake(host->mmc, true);
>
>         /*
> --
> 2.34.1
>
