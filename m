Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C01B4223
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027631; cv=none; b=B5/uEJjVKqT54qJg8K/WjE0kAyPXoWGVxXuFlyZynhWceRwBYp4x5PUeQHUf+7LH7ZplwN6Jly4qO8DcCedsTzfIRwX92E+on8mTkN4+VlbURW/UaOywRmNxzuczBKQETW4DGlm5Qah0p4SRz4eJExJ7N5lWl6aGRHyO22f3cnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027631; c=relaxed/simple;
	bh=QijosWpX/tMSElIdY0cNB2sln/MkYD8vRQRvDg+r1Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHnMW2YXqXsX9QUT0qMryNB9OxqG3opfIkPJ3Az7oItgDGZyp4QselgZyqud5likPhdceYP0bEwrtyxMli62vfihxowKcMmQtT61QS9IPGha3PoZLwU91Yhh4WQ9etEoFk2MdzX6x7N+0RCyw52GdWkw70iSosdvAAa6gKACgD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nb8rbChU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nb8rbChU"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so4895361e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744027628; x=1744632428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7SbASEqc4kTu4n995FrYvq2ycnZirBnlYS1N+sfK70=;
        b=nb8rbChUlWCzMpRGf0piGJwF1vg0MinBC52ecua0V1apbwrSg9yyO5YyYOkox20MGy
         JNZYFNMmDfeTgK3YOZ2DURbHj9g85OggKv4rqDn681Ri3pIVVWmsD29p2G8/VW+3YFQm
         81nMYphHG4N9V2jdruMosZgXOMuoBmqhZvUPIfoOPat9O8CQIo0eMFpwsGJV2uTBuXo7
         VLVv4kNBgXbVpZDgyzqEllvHDWKzzkzcQnkRYDxIMoWWSJc2qOSX+B+LxSAvef1oHK0W
         vzxN+uVZB12BaYJ5wIdet1SCKVysrV3Y6RWgZCiaVxtENLBY4MuXbWVX9oTMmLPto4Jv
         gHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027628; x=1744632428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7SbASEqc4kTu4n995FrYvq2ycnZirBnlYS1N+sfK70=;
        b=J+WiNVJ0R3RDTeZD0n6q3Ta0zpUdyzB++1FkUyua37pv2/PmT6/ex1Y3BleCgAhPlq
         /r+dN2HC9UD6qQNv8Tom1wh8K0ZTfGKJ8ZpG01EbxrvB5b6ldulg3oZcGrXDcAhndXQj
         3kJD1wwpxTgU7bBJGjneAq8d3ywXUC8dAfV6BBsbd0tzDnxgTV0cEekrejfoE/hWVdBQ
         r4W4n//HuyWnBZ/69eAJWxsA+9PidokgFlwAqqKqohmivnQkovGECKZj9oz/EB1GKQ0g
         guTvtGxWt5BQP4vo4VhE/QCLa2TZlEbr6/AQyhPDldzM6ZdA9kWdjAwmTWmY14auUB9B
         f8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUz/bkEPniqnhdtUivaiy3wKRuWpDL53ZLBku3wpoLYYszEsnEfGbL0Bk3GCAOVqoXDjDlJUy8/AF+Qm7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7zASwvvegEOJBj2nQy7Ph85tM4atTNT29HIx8EC7HcgLk33X9
	IP38y/Z0p6Du6z5i4cowmrMUgovmZqSAaqtnvMjLetGhfu1jNtEpR0TSNrQ34NeOSAVffHvJmO1
	LcOJqfSoGB8n7aqpINKZSSmpLMe4nQqWiXDLMuQ==
X-Gm-Gg: ASbGncvg33Q/iHfoLGAwuPcpSxEdkyyOloXCGKL6C/+ip3Bk6jYpFWucEhDLsiwTuOr
	/psFvIMDG/tPONFb8rjCm2v9cxvdD6Ez6Bop8xYUVAmXkG0+OJ9Koop80Z6uCQsf4GbJkdnuHK2
	m3fCOz8HOerH427BDZPp1qFJeq7CvXTofUSn97sONY1FaydtI/KlcgvlV7JQ==
X-Google-Smtp-Source: AGHT+IGPZ6awsiOV6Shdl57C3nogGkA6h04FdU0EYd3ZNKrjClunDFo2+U/KP/CvYAcDoK24o/ABPUhMDZT5OmpR4t8=
X-Received: by 2002:a05:6512:3d17:b0:549:8537:79d6 with SMTP id
 2adb3069b0e04-54c227ff7d3mr3267126e87.48.1744027627635; Mon, 07 Apr 2025
 05:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250406010532.1212894-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250406010532.1212894-1-peng.fan@oss.nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 14:06:55 +0200
X-Gm-Features: ATxdqUE1c5LUH70uItxocQjmtswA_Nx3hD1iJ11QlQXtmWmAC-eVZ9yl2g_6C6Y
Message-ID: <CAMRc=MdgaiJGJt8UainKG=rKTeZjd4sAdaPbQcYEz1pxZGfYKQ@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: codec: ak5386: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 3:06=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
>  of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set GPIO value 1 to power up
> AK5386, and set value 0 to power down.
> Per datasheet for PDN(reset_gpio in the driver):
>  Power Down & Reset Mode Pin
>  =E2=80=9CH=E2=80=9D: Power up, =E2=80=9CL=E2=80=9D: Power down & Reset
>  The AK5386 must be reset once upon power-up.
>
> There is no in-tree DTS using this codec, and the bindings does not
> specify polarity. Per driver and datasheet, the GPIO polarity should be
> active-high which is to power up the codec. So using GPIOD_OUT_LOW
> when get the GPIO descriptor matches GPIOF_OUT_INIT_LOW when using
> of_gpio API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V2:
>  Typo fixes in commit log
>  Drop uneeded gpio check before gpiod_set_value
>  Include more headers
>
>  sound/soc/codecs/ak5386.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
> index 21a44476f48d..6525d50b7ab2 100644
> --- a/sound/soc/codecs/ak5386.c
> +++ b/sound/soc/codecs/ak5386.c
> @@ -6,11 +6,13 @@
>   * (c) 2013 Daniel Mack <zonque@gmail.com>
>   */
>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> -#include <linux/slab.h>
> -#include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
>  #include <sound/soc.h>
>  #include <sound/pcm.h>
>  #include <sound/initval.h>
> @@ -20,7 +22,7 @@ static const char * const supply_names[] =3D {
>  };
>
>  struct ak5386_priv {
> -       int reset_gpio;
> +       struct gpio_desc *reset_gpio;
>         struct regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
>  };
>
> @@ -110,8 +112,7 @@ static int ak5386_hw_params(struct snd_pcm_substream =
*substream,
>          * the AK5386 in power-down mode (PDN pin =3D =E2=80=9CL=E2=80=9D=
).
>          */
>
> -       if (gpio_is_valid(priv->reset_gpio))
> -               gpio_set_value(priv->reset_gpio, 1);
> +       gpiod_set_value(priv->reset_gpio, 1);
>
>         return 0;
>  }
> @@ -122,8 +123,7 @@ static int ak5386_hw_free(struct snd_pcm_substream *s=
ubstream,
>         struct snd_soc_component *component =3D dai->component;
>         struct ak5386_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
>
> -       if (gpio_is_valid(priv->reset_gpio))
> -               gpio_set_value(priv->reset_gpio, 0);
> +       gpiod_set_value(priv->reset_gpio, 0);
>
>         return 0;
>  }
> @@ -177,14 +177,12 @@ static int ak5386_probe(struct platform_device *pde=
v)
>         if (ret < 0)
>                 return ret;
>
> -       priv->reset_gpio =3D of_get_named_gpio(dev->of_node,
> -                                            "reset-gpio", 0);
> +       priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_=
OUT_LOW);
> +       if (IS_ERR(priv->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +                                    "Failed to get AK5386 reset GPIO\n")=
;
>
> -       if (gpio_is_valid(priv->reset_gpio))
> -               if (devm_gpio_request_one(dev, priv->reset_gpio,
> -                                         GPIOF_OUT_INIT_LOW,
> -                                         "AK5386 Reset"))
> -                       priv->reset_gpio =3D -EINVAL;
> +       gpiod_set_consumer_name(priv->reset_gpio, "AK5386 Reset");
>
>         return devm_snd_soc_register_component(dev, &soc_component_ak5386=
,
>                                       &ak5386_dai, 1);
> --
> 2.37.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
