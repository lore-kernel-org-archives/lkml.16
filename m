Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734C25A625
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203916; cv=none; b=pu9jqFeKvsks3ellCPRoAKExgKl7/qb9FZ9/ZvayUW6It2OglJSk7oW2U7r3oinBxyu5J64fQkkAN4EvphkafIWoLNxjou3rtdnuVqp8W6TC2Md8xmkzhTAYoZoeA9mNaYd7vaT3uUsKvnLw7j5ON2QOf5ZrznkAG6T9WQD6BjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203916; c=relaxed/simple;
	bh=8qftagvfjmoYt1+fDk9WXpvjMtDWwgn0O2decNVAM3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtON0NtiI00VPVOhBK7hPPqZNbxvIdwS+jeVZ3ur+ezsJs+dGCz1UP2Kk3IE5g1t/jHtU4XdJ3My2ndZ+JCHJ3bZ8j0asNOnkQ7lK7kse43NOGXrQFVffyp8i/rC/6HnuoeLRPbmjnfFMPik2qrnPPLOPzOO7nbRhLahiIIu0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8I8sRHb; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8I8sRHb"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ff27ad48beso63022627b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744203913; x=1744808713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1d4Kj/+jBoQ/lsWd2+1iruPICBj1Kd2s6XSogc2V8og=;
        b=O8I8sRHboUes3ol5Jp//pRoUSmigdJdhN9DDk2mhfdvStKr0VZdCGU625E9e4z61Eh
         lQ7xf2D0uFz9jYwJS05l/MeakDRmYIvDs9D8JzTjHG6hoFhsx+kPz4+g1x9d4PwglWEf
         Sm2unEdOIOi+b8xQZa/7P6FcYKH52/7nU9e3acGBk0OUEqfRs4ZfEjo2OJKRnYuWuhRX
         n9zsiPQTdDi1Owm0Zn7I12/LjG6onMnIhB2M6ucRXcA/AvKX6aPGa6QdzKtV5z4zEKaB
         NT9vyFpHUiihUv9wUJzHy2DFf5pcGuvitohtH+UZtm5Qkgk/tWHnLid7n0KIJqczIDSi
         nrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744203913; x=1744808713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d4Kj/+jBoQ/lsWd2+1iruPICBj1Kd2s6XSogc2V8og=;
        b=RoFDYe0vHGCMJrfZ+Pc0iwPZaQEwY22OYm0zVk4V8xLO2TRrVhgM4ZXgQp+v2tJq/u
         sK3YTS0QLhu8PriejpMi0pvzE9koZpKlxX7gAx0xpFkYpilts2FTrDObB7p1qPo6XYpD
         MwrdJ+HWeYuIj7Z/XGhFp320joX8VCaJgNSkORMuSolYi4JWvq80dYUThJt2g2BOLOYg
         y+u7jkgT+Qq1JC6QAzq3v4PTyw0jmLGNbQZKnoae44lF5xLWvwlSR+di2ZlVl/YZ13Ku
         mwlluDLbYUN2jLOPoEt0CC2jRM+h9lcqHeCV8o67Boe71DIKoDMTkLt4HFQMk3NyROXd
         aw1w==
X-Gm-Message-State: AOJu0Yx8dduHzC6zsbBgfD5l4UFDi7ybf/9sO92iokESrx9YcecpuNys
	LfoAFpY84Al4RAgweplpGN9vLhKi5trnTciD4CyEh0T+jroepATSyDVMe71K444BiA7FZ3L5j9N
	H1LsO+JhVB3gCPjubiNF5YnzbKDPZGHxWfuJ1rQ==
X-Gm-Gg: ASbGncvqvr0yE3ZLXFSBi6ajC3/Ng9pr/V47ZQzCmYqErOq4329CcEocCIbhdthqXWx
	mx+RLo3ThnKxwxA5QlV9eOSGik+3iNoiLOVejl2GVEYc1M78MpDB5Wavqt3Svg/d/6m8l9DlsVA
	jysCFtHCw7mMtcAotNcdNhTwY=
X-Google-Smtp-Source: AGHT+IEkEr688RqWZk/UFW+aFLhEVhnfHLhnS63mtOdasqviB60kL6L24sWq99KSc0ZiD+dQHcM2wGgQ6T0FmR5eTuw=
X-Received: by 2002:a05:690c:6711:b0:6fb:b524:48bc with SMTP id
 00721157ae682-705388d5192mr58242347b3.35.1744203913024; Wed, 09 Apr 2025
 06:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401025123.895307-1-ricky_wu@realtek.com>
In-Reply-To: <20250401025123.895307-1-ricky_wu@realtek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:04:37 +0200
X-Gm-Features: ATxdqUFnxqtQgEeY9G3rMVrdTwVyrrp85v3mAMPpR_PXa_Z9J8dJz3PUBElpDoY
Message-ID: <CAPDyKFpn5xB50eTomNM=4LbFDX4r154iY2Qk8GBiYb+vor0kbA@mail.gmail.com>
Subject: Re: [PATCH] mmc: rtsx: usb add 74 clocks in poweron flow
To: Ricky Wu <ricky_wu@realtek.com>
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 04:51, Ricky Wu <ricky_wu@realtek.com> wrote:
>
> SD spec definition:
> "Host provides at least 74 Clocks before issuing first command"
> After 1ms for the voltage stable then start issuing the Clock signals
>
> add if statement to issue/stop the clock signal to card:
> The power state from POWER_OFF to POWER_UP issue the signal to card,
> POWER_UP to POWER_ON stop the signal
>
> add 100ms delay in power_on to make sure the power cycle complete

Why 100ms? That sounds a lot to me?

Is this fixing a real problem or is just trying to better follow the spec?

>
> Signed-off-by: Ricky Wu <ricky_wu@realtek.com>
> ---
>  drivers/mmc/host/rtsx_usb_sdmmc.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
> index d229c2b83ea9..e5820b2bb380 100644
> --- a/drivers/mmc/host/rtsx_usb_sdmmc.c
> +++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
> @@ -48,7 +48,7 @@ struct rtsx_usb_sdmmc {
>         bool                    ddr_mode;
>
>         unsigned char           power_mode;
> -
> +       unsigned char           prev_power_mode;
>  #ifdef RTSX_USB_USE_LEDS_CLASS
>         struct led_classdev     led;
>         char                    led_name[32];
> @@ -952,6 +952,8 @@ static int sd_power_on(struct rtsx_usb_sdmmc *host)
>         struct rtsx_ucr *ucr = host->ucr;
>         int err;
>
> +       msleep(100);
> +
>         dev_dbg(sdmmc_dev(host), "%s\n", __func__);
>         rtsx_usb_init_cmd(ucr);
>         rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SELECT, 0x07, SD_MOD_SEL);
> @@ -1014,6 +1016,16 @@ static int sd_set_power_mode(struct rtsx_usb_sdmmc *host,
>                 unsigned char power_mode)
>  {
>         int err;
> +       int power_mode_temp;
> +       struct rtsx_ucr *ucr = host->ucr;
> +
> +       power_mode_temp = power_mode;
> +
> +       if ((power_mode == MMC_POWER_ON) && (host->power_mode == MMC_POWER_ON) &&
> +                       (host->prev_power_mode == MMC_POWER_UP)) {
> +               host->prev_power_mode = MMC_POWER_ON;
> +               rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN, 0x00);
> +       }
>
>         if (power_mode != MMC_POWER_OFF)
>                 power_mode = MMC_POWER_ON;
> @@ -1029,9 +1041,18 @@ static int sd_set_power_mode(struct rtsx_usb_sdmmc *host,
>                 err = sd_power_on(host);
>         }
>
> -       if (!err)
> -               host->power_mode = power_mode;
> +       if (!err) {
> +               if ((power_mode_temp == MMC_POWER_UP) && (host->power_mode == MMC_POWER_OFF)) {
> +                       host->prev_power_mode = MMC_POWER_UP;
> +                       rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN,
> +                                       SD_CLK_TOGGLE_EN);
> +               }
> +
> +               if ((power_mode_temp == MMC_POWER_OFF) && (host->power_mode == MMC_POWER_ON))
> +                       host->prev_power_mode = MMC_POWER_OFF;
>
> +               host->power_mode = power_mode;
> +       }
>         return err;
>  }
>
> @@ -1316,6 +1337,7 @@ static void rtsx_usb_init_host(struct rtsx_usb_sdmmc *host)
>         mmc->max_req_size = 524288;
>
>         host->power_mode = MMC_POWER_OFF;
> +       host->prev_power_mode = MMC_POWER_OFF;
>  }
>
>  static int rtsx_usb_sdmmc_drv_probe(struct platform_device *pdev)
> --
> 2.25.1
>

Kind regards
Uffe
