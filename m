Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB5244678
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749680532; cv=none; b=Yv865ylVJAyfZZ6bcB7bM63rhvwrNWEH8KVbrFlFJpWmp2nAyArcP96YJdDSZV09EtjoWfDUxPY0qdoW++N4BdAat0ZRIClMG2/iaqFQ/yQrmk5k6pt2V8ZItvXnNnd4bTAVUpPuXRxdctB45CLVgysQS0IXWwSaoTBfc0XR6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749680532; c=relaxed/simple;
	bh=J1+vvNnJkt9XAUeHMDEtolpBQ4940dsHU+99an2m8Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbvPWsQFsFVeeyNPq/EdoOcrnHfK1cY1RPNsISe3frOP27yXBaaSaRp5pOxorbbhR8eVU2sfxJlKh4o9N87AuSkUD0acwGyklBVXM0R2MFxfXlvAwvfCCnKt64SKIlBskEARu6KT9Yv7S7d5L0Pm0WCvlFOx7oecEc/qIkEYMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=CQP/2RSc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="CQP/2RSc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3139027b825so304824a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1749680530; x=1750285330; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=CQP/2RSc3bQlG/mG3+ynatwTRxaQ9ozhRhvIv+554F43gDqqnvygxACE//ULcgIXrs
         pM3lyLmbkMGmSZJMn0w43OQL17SsaNEQ8hUTYTVK25caPy9a1ONqCjZwvy/nItNeS2u1
         ZRtpmC7WPYFt1+UYUFPejvvseu0dro91N8WrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749680530; x=1750285330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=e1kcNx39/v6YbRuoVAhTgsnuyX66Z2S/P2znisy2KdOhXSu9iH/pWMgU0/BV3kvqYM
         BSpUy5S7GZXfmbvB7nAE/AGewPdfDpcT2tM6K5T6EbowXRhV4Nfe8hByd5lmVUWrQ8Mh
         02HxBdQ9uvnonYyjPCR4Ao3rHtO+EqdIpe+CSx29z1vEcby3cLPPwiq0qyMds/4F8PgC
         fMpfOaJR57vqlXu7hBF4GFq3C0slU/g/w9UQQUfLDN0lGP50ZAsRgMVCV9+IEBS+zLXs
         lLJwZlKac5FkDdp1TPhIhid7IM2vreNCtNUIgpHx0ethuNnsFZA23gS/9eYfHbmV3Q5b
         oVtA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Gcrjna9E+rdECqnST6Zv4jFZk4RfwhKYv7La0JN3lHr+M5kW86+TDwAxu49Cm1u8JwgnJjevhnAgIBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+UjzXU3Y8ulxdD6Gnk4OjIdDR1RJHnZxp7JOjqvtkdluvmmj
	nh6lH4jxpbYWkewVqu0xXagq0ZOs1SscP9LnCKSz3N+XQ+f2Xd6JtU3PGKMZSqP35XlLBYud/7x
	+Y9lw3fDKA8h58dNt3gCJSajoVdiyOIk4RvP6ufRw5g==
X-Gm-Gg: ASbGnctMxoPWNfFPPsErFaWX38h6f6Dng38LNSctiNuc2WUq4zrTEABKPbJ7HbjNcam
	9/VBHxTwUVterLWprGSu8rSa/9kRvJoBSfM9lTO1RQxGxZxxc8XmNQoE+f42Dk6rx7bPl4lLNU0
	WINjm1Sj8Y0Cda1EuapElW/7JxdO+Xu/ly9OTp1gyzH0fTKl2iKCCAwMZnd+PDJslN3SlSSf/g6
	Tff
X-Google-Smtp-Source: AGHT+IE8FknUC40PscBGYY7OPNelZLLkTFE7qxHwumbpWqTQtgyRPt7nCSuQoA+6xvyngwoaYT3v2ByQ5TtYzKrW9d8=
X-Received: by 2002:a17:90b:2892:b0:312:26d9:d5b6 with SMTP id
 98e67ed59e1d1-313bfba12a1mr1389789a91.3.1749680529907; Wed, 11 Jun 2025
 15:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 12 Jun 2025 07:21:56 +0900
X-Gm-Features: AX0GCFuAPMzR2tj8IuIF1_MflSdk31p_mu_qD7qQzgmBFTWEvU6XX8YEN4mo1dI
Message-ID: <CAFr9PXmeYETV5FSAnEacFCo7LiS3cYBpPqraexLC7=MTzshfNg@mail.gmail.com>
Subject: Re: [PATCH 07/12] gpio: msc313: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 10 Jun 2025 at 21:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-msc313.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -486,7 +486,7 @@ struct msc313_gpio {
>         u8 *saved;
>  };
>
> -static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>         struct msc313_gpio *gpio = gpiochip_get_data(chip);
>         u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> @@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
>                 gpioreg &= ~MSC313_GPIO_OUT;
>
>         writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       return 0;
>  }
>
>  static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
>         gpiochip->direction_input = msc313_gpio_direction_input;
>         gpiochip->direction_output = msc313_gpio_direction_output;
>         gpiochip->get = msc313_gpio_get;
> -       gpiochip->set = msc313_gpio_set;
> +       gpiochip->set_rv = msc313_gpio_set;
>         gpiochip->base = -1;
>         gpiochip->ngpio = gpio->gpio_data->num;
>         gpiochip->names = gpio->gpio_data->names;
>
> --
> 2.48.1
>

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel
