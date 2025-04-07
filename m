Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D0209F5A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041942; cv=none; b=NtlXBR99hjsQNSAQ0ZTBgXO6OGaLyAA+oGmd+NKNaCriOadHEGvDIwsejksQu7/lxyhrsyD6O9SvRi0z/ICnNKBOf0hE3mE9ahS/uUGL43MkuPwxBp38o1MLSM/6vX7zG4VfozFxR2VeIxjF5fn1k5fu93gxEpKWBN8W/O333ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041942; c=relaxed/simple;
	bh=I2u4ppM+RyvuPVMZO/PiQUy22pUqtQuCSG2fA6/oVQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=miwHkjjEl2b5K0CaL+4ygfyS7/bVyz6X3C/2BA8NYLwTcdicV7H2TwMKpCCzL6MqIO4MYV6m0Lq3nMxyUepTt85cT3LmyElIQBc7m2qpX3ZhZOW7Ay2pIwCCBmEzgrtZP9t4iRSqdxX4Jpm2mqTbhyXS3+fOHJRR05AArc76o9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9xl9JKq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9xl9JKq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ff27ad48beso40948407b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041939; x=1744646739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d2xPpiftpl7P88+FscNBgQNNjVW3ejU4Tfw44EUByX4=;
        b=n9xl9JKqRSYnbpNFKg8QAtBs6f3de6p4bNqNTao6J6dN2VOLkUgAis4mdQwpyvAijr
         fobxqSKjYvo9pSPZRQ7OYLuZN7l9WvDGIcR2djxZAJYQuCLmp51doveJEnV1HxjbsqRg
         qvrV8DhZqv5BYQRkPJrMj0ADU1LdHF09Z2ybrUtIzJ70TLpGaiKjUsjdLct6OR58CusV
         EdA6hqg8Tkky6ycXTQjsnHtqhHmYUgtE7+nIP3s098blC9rFH/+YiYwUuQytrm8/qYFA
         zJtmiQAlOffRgwxR5HpHzj/zbgIzVUWRQk0Q/ecMNLbKGUz8rzewVEQv6S0//b7wuC+G
         +CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041939; x=1744646739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2xPpiftpl7P88+FscNBgQNNjVW3ejU4Tfw44EUByX4=;
        b=EfFiRl/bz56EQdTn1WON6JjWpQgEesYrzooIpstWECpBFVauHVFVzDZJJ2jxXXJeh2
         /o9OIYoF8zMvlpplvbf3xLwZBNuHGzuGIP6K9Yevd7XWsax/Rg+s18EM9fzBuQaF9Cw7
         zWC2V9R657b0Xl31lz8q5lbVsLgLxPorwdrYOpvBohHay730TnrmtoWLkBcB8633S5ke
         T6kDJphB2SaVJa0zGmv3WgnRr+XjOHMbdiU/rnj/Jqn/UMyu4b6whsM5T8HM7pbLDyOl
         EPlq+Xb5y1lkp/VhJtjriknox+S2MYto//ByBezUG8hYYhom/iUp0euQeNgO3DYEwzLq
         Y96g==
X-Forwarded-Encrypted: i=1; AJvYcCUic/U9zpp5Jhl4djA3v5aY+qiX3QPwVfW2CF0xG3C8nc7rIQq7K6xjfLcNEDv9bo1fhLfI8I79BjPWGU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNcJSmrHuDzMo79iQ4zdFcRfMYppMxmPeu03/1oijXvWHBCgb
	NOjbn6q55NXNGL0Jtujx1XG+imbkh/zHayqBBKfazIwo5HRiDaPfpDbqM0MQunPUhvolRzn6D0f
	hYam6ocAabgX1GLw0KQfmGvxHs8SonuYUDTHJ6DBdF/HDo6Ld
X-Gm-Gg: ASbGncvKOhAE3rD+HuWUbd1w2C2DHcKoH4q5X/SGsB8gc1qR5w8w5nYgAzYtWprjCU+
	J9EHlI1Z/vzlu/wl82R48oxk4u8EAjiqCiwy2GrBmVGZ4x/91dhP7vdfrQE32W7sEJRe/f8XpmF
	yXtt5acyJEYFqE1094ACbVUCPb/lg=
X-Google-Smtp-Source: AGHT+IF5ADVE47uJKnFJ4kq2xdVJnqmsU02Iw7FV1VifWjG0DDAsy2+MdHm3dcsQo64snWJgiAuTUoYee1SoeHCicew=
X-Received: by 2002:a05:690c:388:b0:6fd:a226:fb2b with SMTP id
 00721157ae682-703f4138253mr165922597b3.3.1744041939564; Mon, 07 Apr 2025
 09:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331221337.1414534-1-erick.shepherd@ni.com>
In-Reply-To: <20250331221337.1414534-1-erick.shepherd@ni.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:05:03 +0200
X-Gm-Features: ATxdqUFV_2ejKOf9rXpEA6i0tWGjzCIihFx_bvFhJcsk_7jetzJCZ6lEZyx0IkQ
Message-ID: <CAPDyKFpnZbATVX7kXX9f+hDjae-kbiJQ9v-dJ+eDkNd7BjegHA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: Add quirk to disable DDR50 tuning
To: Erick Shepherd <erick.shepherd@ni.com>
Cc: linux-mmc@vger.kernel.org, adrian.hunter@intel.com, keita.aihara@sony.com, 
	linux-kernel@vger.kernel.org, avri.altman@wdc.com, 
	wsa+renesas@sang-engineering.com, jason.lai@genesyslogic.com.tw, 
	jeff.johnson@oss.qualcomm.com, victor.shih@genesyslogic.com.tw, 
	andy-ld.lu@mediatek.com, dsimic@manjaro.org, jonathan@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 00:13, Erick Shepherd <erick.shepherd@ni.com> wrote:
>
> Adds the MMC_QUIRK_NO_UHS_DDR50_TUNING quirk and updates
> mmc_execute_tuning() to return 0 if that quirk is set. This fixes an
> issue on certain Swissbit SD cards that do not support DDR50 tuning
> where tuning requests caused I/O errors to be thrown.
>
> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/card.h   |  6 ++++++
>  drivers/mmc/core/quirks.h | 10 ++++++++++
>  drivers/mmc/core/sd.c     | 32 ++++++++++++++++++++++++--------
>  include/linux/mmc/card.h  |  1 +
>  4 files changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/core/card.h b/drivers/mmc/core/card.h
> index 3205feb1e8ff..9cbdd240c3a7 100644
> --- a/drivers/mmc/core/card.h
> +++ b/drivers/mmc/core/card.h
> @@ -89,6 +89,7 @@ struct mmc_fixup {
>  #define CID_MANFID_MICRON       0x13
>  #define CID_MANFID_SAMSUNG      0x15
>  #define CID_MANFID_APACER       0x27
> +#define CID_MANFID_SWISSBIT     0x5D
>  #define CID_MANFID_KINGSTON     0x70
>  #define CID_MANFID_HYNIX       0x90
>  #define CID_MANFID_KINGSTON_SD 0x9F
> @@ -294,4 +295,9 @@ static inline int mmc_card_broken_sd_poweroff_notify(const struct mmc_card *c)
>         return c->quirks & MMC_QUIRK_BROKEN_SD_POWEROFF_NOTIFY;
>  }
>
> +static inline int mmc_card_no_uhs_ddr50_tuning(const struct mmc_card *c)
> +{
> +       return c->quirks & MMC_QUIRK_NO_UHS_DDR50_TUNING;
> +}
> +
>  #endif
> diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
> index 89b512905be1..7f893bafaa60 100644
> --- a/drivers/mmc/core/quirks.h
> +++ b/drivers/mmc/core/quirks.h
> @@ -34,6 +34,16 @@ static const struct mmc_fixup __maybe_unused mmc_sd_fixups[] = {
>                    MMC_QUIRK_BROKEN_SD_CACHE | MMC_QUIRK_BROKEN_SD_POWEROFF_NOTIFY,
>                    EXT_CSD_REV_ANY),
>
> +       /*
> +        * Swissbit series S46-u cards throw I/O errors during tuning requests
> +        * after the initial tuning request expectedly times out. This has
> +        * only been observed on cards manufactured on 01/2019 that are using
> +        * Bay Trail host controllers.
> +        */
> +       _FIXUP_EXT("0016G", CID_MANFID_SWISSBIT, 0x5342, 2019, 1,
> +                  0, -1ull, SDIO_ANY_ID, SDIO_ANY_ID, add_quirk_sd,
> +                  MMC_QUIRK_NO_UHS_DDR50_TUNING, EXT_CSD_REV_ANY),
> +
>         END_FIXUP
>  };
>
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index cc757b850e79..fc3416027033 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -613,6 +613,29 @@ static int sd_set_current_limit(struct mmc_card *card, u8 *status)
>         return 0;
>  }
>
> +/*
> + * Determine if the card should tune or not.
> + */
> +static bool mmc_sd_use_tuning(struct mmc_card *card)
> +{
> +       /*
> +        * SPI mode doesn't define CMD19 and tuning is only valid for SDR50 and
> +        * SDR104 mode SD-cards. Note that tuning is mandatory for SDR104.
> +        */
> +       if (mmc_host_is_spi(card->host))
> +               return false;
> +
> +       switch (card->host->ios.timing) {
> +       case MMC_TIMING_UHS_SDR50:
> +       case MMC_TIMING_UHS_SDR104:
> +               return true;
> +       case MMC_TIMING_UHS_DDR50:
> +               return !mmc_card_no_uhs_ddr50_tuning(card);
> +       }
> +
> +       return false;
> +}
> +
>  /*
>   * UHS-I specific initialization procedure
>   */
> @@ -656,14 +679,7 @@ static int mmc_sd_init_uhs_card(struct mmc_card *card)
>         if (err)
>                 goto out;
>
> -       /*
> -        * SPI mode doesn't define CMD19 and tuning is only valid for SDR50 and
> -        * SDR104 mode SD-cards. Note that tuning is mandatory for SDR104.
> -        */
> -       if (!mmc_host_is_spi(card->host) &&
> -               (card->host->ios.timing == MMC_TIMING_UHS_SDR50 ||
> -                card->host->ios.timing == MMC_TIMING_UHS_DDR50 ||
> -                card->host->ios.timing == MMC_TIMING_UHS_SDR104)) {
> +       if (mmc_sd_use_tuning(card)) {
>                 err = mmc_execute_tuning(card);
>
>                 /*
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index 526fce581657..ddcdf23d731c 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -329,6 +329,7 @@ struct mmc_card {
>  #define MMC_QUIRK_BROKEN_SD_CACHE      (1<<15) /* Disable broken SD cache support */
>  #define MMC_QUIRK_BROKEN_CACHE_FLUSH   (1<<16) /* Don't flush cache until the write has occurred */
>  #define MMC_QUIRK_BROKEN_SD_POWEROFF_NOTIFY    (1<<17) /* Disable broken SD poweroff notify support */
> +#define MMC_QUIRK_NO_UHS_DDR50_TUNING  (1<<18) /* Disable DDR50 tuning */
>
>         bool                    written_flag;   /* Indicates eMMC has been written since power on */
>         bool                    reenable_cmdq;  /* Re-enable Command Queue */
> --
> 2.43.0
>
