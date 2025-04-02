Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352523817D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594259; cv=none; b=TJNOzNQJ9kxGU5dkAA/2C0jUbK2os3QrgUeq1Njo/YyLrWuGRhAxXnUVd8Fq4H2N0no5dEoftzY93bdGaUFe+gK1nZ40qsBdlBuWG1/rnvotYN9xioCxT1K4qGxquWT9psB27Kb7xwSOquaf0HFrIU1KoNC75Pb5frc58503TI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594259; c=relaxed/simple;
	bh=gg299aIBo0h7KU2NkhsXnk65DPIe/9LaoqfuKARNUFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBAOF2M4GtMx2B6J0txOrBEvYvUbZe3DMqmY2eUf6NuX6/WWS4LS6wn0qkcuD15xjGGmQVLfFOVlS9YjwE0WvhKHCGB7rPz4VP7k76//MnWOqOgqzvmBAZ3IQsrnSFLNBIY1d6QFl3tNN2PAzfBIvk/TiiYpUrRyE5DsgVwBKG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f7MNR61L; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f7MNR61L"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1599845e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743594256; x=1744199056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9Yx8HGWWz6hgTPomrXgKhcRZgBSmV4fN3I8vYiFJco=;
        b=f7MNR61LPk1qFGkBwWTVkyhgXFOlcrseMnNrrkcFlvm2drbUYeeXnMlpvtukXm4LIl
         Q5HmyG3za8UEN095/WpTOyKgdTgFSO5goCPTIrlwCt3N5COgp+ARHQYb2oTbrh3qA16j
         1kkcGieL2rQ0/O5Ynq9+DTgmr6VN9270ZVHa2TgLUnh8gceoD3vPuPXc3YvvQ3LWt3sF
         11Ui+3EIoukrFsAj9TBFB5cxKN9Dr91usJLXOSL9kbrGkgVGtjMCCN+39+bOarfI7s5T
         nuiWc+7YcE1q3wBLf7jnvpicj/N/GIbxds1MDc7N7tUjQgY+Zav9vhhN+yrGdtqSR911
         g9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594256; x=1744199056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9Yx8HGWWz6hgTPomrXgKhcRZgBSmV4fN3I8vYiFJco=;
        b=F1Ey6hTvS+PN/tnwXYJ4/2/9NomycttpoAfFZPR0g0r/kBEwa+AEmUBTUp0EhgaJS4
         lnPEbC1EOHzTOgKZhfrbfJWrl/m17B0p13VhwvfGXyOAtDYzUr96LEGxqZeGuY0iGa9w
         nVVuB5Nwor6m4/BVmcY+vflSxgqiwa5XNWgN7X+V+SC24OXUk3VOCMxs7qmP78zqQgCY
         r/x0SyVeC1XDXvcE0UxCe3M7Ly9oxNOdiooG+QvIWCBn4TroWyjUMrWLnDNLBVXOS4GB
         695LCBzlgeSlgQCWvOovqmAJWJwXwTSmRpgSrr7IP4yJwwuunUrBM73STEZrGpBn8mHy
         EM0g==
X-Gm-Message-State: AOJu0YywXxA2uZwHwmySmgn5WCek87pCm9JBAPt/fpXgTrxCxeFvx+jl
	ewzASQcAJSuw7iBTUD5W2Z7VUZNrauYYUc4JoIHdP4h6PY03CRDm7wBGKwwn4UFvw66ZsEILNfi
	F/JdACZbJF9eTJ+fGGQ5o2kJPJQO81IkbOh6URw==
X-Gm-Gg: ASbGnctXBvUmAwWXGjs63AT56I2gfWECHQhTtnNx+tr9ItF7xThg/ZMZ922tVAvSfmX
	Zng6k/mR0aJHrgCxML5YbQvBfgPPEZGyRAGUhO2wksvVCEWrRQfooDh3qJKX5JbQ/CO5vrESjPO
	VS0TR4IVcaTkPcaaxtnwTwOGzHH76WTHg08g9JAN3+JZBYXMKKJPgX8j6UvQ==
X-Google-Smtp-Source: AGHT+IHW/kGqImrLP2FvLwHemjcshG451ryY8vcg74Qlr22qJBaIDv63Gcij3j/k2qFPQPNOKFQ4n1acyWCMv+TErZQ=
X-Received: by 2002:a05:651c:98b:b0:30b:963e:9b1a with SMTP id
 38308e7fff4ca-30eecd3b6c8mr23076271fa.23.1743594255916; Wed, 02 Apr 2025
 04:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250401233603.2938955-1-florian.fainelli@broadcom.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 13:44:04 +0200
X-Gm-Features: AQ5f1JpN-sWsvmePPYG3vEIc3GLu6mXVKUC_Me1qpDGqIHgBjPryChV7V6bxiug
Message-ID: <CAMRc=MeiALzO3XAmH9BLjxrB3EA1br1tpzHd5Qucw2NCVQ2q7g@mail.gmail.com>
Subject: Re: [PATCH] spi: bcm2835: Restore native CS probing when
 pinctrl-bcm2835 is absent
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 1:37=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> The lookup table forces the use of the "pinctrl-bcm2835" GPIO chip
> provider and essentially assumes that there is going to be such a
> provider, and if not, we will fail to set-up the SPI device.
>

Yeah, the consumer driver itself is an unfortunate place to define the
provider data. This could potentially be moved to gpiolib-of.c quirks.

> While this is true on Raspberry Pi based systems (2835/36/37, 2711,
> 2712), this is not true on 7712/77122 Broadcom STB systems which use the
> SPI driver, but not the GPIO driver.
>
> There used to be an early check:
>
>        chip =3D gpiochip_find("pinctrl-bcm2835", chip_match_name);
>        if (!chip)
>                return 0;
>
> which would accomplish that nicely, bring something similar back by
> checking for the compatible strings matched by the pinctrl-bcm2835.c
> driver, if there is no Device Tree node matching those compatible
> strings, then we won't find any GPIO provider registered by the
> "pinctrl-bcm2835" driver.
>
> Fixes: 21f252cd29f0 ("spi: bcm2835: reduce the abuse of the GPIO API")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/spi/spi-bcm2835.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index a5d621b94d5e..5926e004d9a6 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
> @@ -1226,7 +1226,12 @@ static int bcm2835_spi_setup(struct spi_device *sp=
i)
>         struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
>         struct bcm2835_spidev *target =3D spi_get_ctldata(spi);
>         struct gpiod_lookup_table *lookup __free(kfree) =3D NULL;
> -       int ret;
> +       const char *pinctrl_compats[] =3D {
> +               "brcm,bcm2835-gpio",
> +               "brcm,bcm2711-gpio",
> +               "brcm,bcm7211-gpio",
> +       };
> +       int ret, i;
>         u32 cs;
>
>         if (!target) {
> @@ -1291,6 +1296,14 @@ static int bcm2835_spi_setup(struct spi_device *sp=
i)
>                 goto err_cleanup;
>         }
>
> +       for (i =3D 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
> +               if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i=
]))
> +                       break;
> +       }
> +
> +       if (i =3D=3D ARRAY_SIZE(pinctrl_compats))
> +               return 0;
> +
>         /*
>          * TODO: The code below is a slightly better alternative to the u=
tter
>          * abuse of the GPIO API that I found here before. It creates a
> --
> 2.34.1
>
>

The fix is good for now but I'd still try to move this out of the
driver at some point.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
