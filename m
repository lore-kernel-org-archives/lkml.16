Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37914F9E2
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738276604; cv=none; b=rw9k/BraycModF9ngf1fjLf2ph6ntQrQ720V9idfTCoySJU4Uc9tJDUpqde9Gx6MLX98CHIpKTLt4AujvTJCuQsHxiiess+av5pOkOpW5U7VChnKyRy2Wdl+ruliuS81fGXXSTQHo+jiZDqxfPsgaPSpuj9RZb5y/RkL3/WqYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738276604; c=relaxed/simple;
	bh=Mr9VPHEYwzikNGVu6aqPbtT+QJrjqagL80OvMDNpri8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnGFw+QimKNyZMR1grsfxCAxZiJs0FibOb0vDF/eV8iWOBLKPIB+5CYeTLtiW34xd+3OA2OaPghy/dfjbTKpM3YU5WaEUkEyEviCCeTTHkEjNw7288Fm9aClIeM2NRGJ3I+blB7lQQyKd0abswLhJ7gfC1PGsI6dQV5dv+QPiyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MpJ7Mtev; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MpJ7Mtev"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaeec07b705so224949566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738276601; x=1738881401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qtkOqUEVN6b5UWeEcDH0ysGGZIkOzBjcOn25NELvg1U=;
        b=MpJ7MtevdhtqAO+qqC4xaxZx+toOm/3x8bSeOge8TYAK/sqOiFIr4tDoSc/Tyh/ulr
         NYR9SAAKa4KmuD1330HUUVNUbbm3jkZRwzPbjxqbEBs0RvvlVN9WHGaMvOK6YHn9jjgM
         0hpfVr+9Ekb6FaEQQPe1BlQYM6NHitxm+ibnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738276601; x=1738881401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtkOqUEVN6b5UWeEcDH0ysGGZIkOzBjcOn25NELvg1U=;
        b=UWohQ3GggF6DOAVcDesTla9MW8kWpoSwPlGLKadxPscqPHSePgxqAQTi3B0oAYZEEX
         o2bK2YDd9hOJx1izkzjcrWUkpZzv8WS22NsGKD/AehvD1cWQINesDqr+5dDuzDsv7Vz9
         F84GqWPCVKBE2coI7rrfEDmh7+CSWSSDZ5xRJgo4aNdjFq0YlKkBdHGtSwQyI5nJUajc
         /pu/bcnDik5HrC9VzAc+3rZmsiYyH3d1R/SN2CHk2tTZW3pnkG4Nv/9O68OKuVfIKm3X
         TvwyNSYzwVsmKC42FlDF/ZqJnS1kk2H42TgmaHHoOHFVL0XTTUGkfmDn3AHrAearckwJ
         +kGA==
X-Forwarded-Encrypted: i=1; AJvYcCVyP4LLFR7HCk4eZzAOJ1kvEhlp6Ayxgwp02Ix3Kn/UTGrZCrhM14V6sSc6FYchTpFM6LOlk4Pf6G9x/MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz/XtTOIg9kHGhfsZc9f+q6rEqS3Zt0OnqOkE74BJ40oR6DO3Y
	vU2MMh7mcJZ5QTZrhOxN9cyCBO8WlVc+m9CqzB+mA/KrnMYgoOzP74agF3bn0PAUWf4yTPWyg54
	PIwbBvjUgNElCQ51S8vDyDBAKfrmwkCv++8zs
X-Gm-Gg: ASbGncsg1dGkSqX1ea4La5j4d54/rvHsE15Qs+WsYLOVXCu2HFMoL38A8+3DUX6ceO5
	PklzaNxMEG2bLXbkiBaI7NGjw8OEE4vJ3vW+zxnpD4HdlJINpx6kIOggBnnjsSFn7S1QRrMQk8w
	==
X-Google-Smtp-Source: AGHT+IGK/MmCjXxDXhEiQezsh199a5i6aQtdYvIMWHlq14xrKhJrCA+QC1Lu+IJKOTemrrFhRE6a0l8goR0jWG4cB3A=
X-Received: by 2002:a17:907:961a:b0:aac:2128:c89e with SMTP id
 a640c23a62f3a-ab6cfdbc4d3mr976502766b.43.1738276600726; Thu, 30 Jan 2025
 14:36:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com> <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
In-Reply-To: <20250130-kona-gpio-fixes-v1-2-dd61e0c0a9e7@gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 30 Jan 2025 14:36:28 -0800
X-Gm-Features: AWEUYZkcCVICEMmJw__cXZ1_dqEqWHmRCncRycNgghzoMxajsFn3x9qLXBVF970
Message-ID: <CAGt4E5sqd_Aojk+boD5K5EiRfOsiU+jYY5EV0DP6TFut291HnQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: bcm-kona: Make sure GPIO bits are unlocked when
 requesting IRQ
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 09:10, Artur Weber <aweber.kernel@gmail.com> wrote:

> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 77bd4ec93a231472d7bc40db9d5db12d20bb1611..eeaa921df6f072129dbdf1c73d6da2bd7c1fe716 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -69,6 +69,22 @@ struct bcm_kona_gpio {
>  struct bcm_kona_gpio_bank {
>         int id;
>         int irq;
> +       /*
> +        * Used to keep track of lock/unlock operations for each GPIO in the
> +        * bank.
> +        *
> +        * All GPIOs are locked by default (see bcm_kona_gpio_reset), and the
> +        * unlock count for all GPIOs is 0 by default. Each unlock increments
> +        * the counter, and each lock decrements the counter.
> +        *
> +        * The lock function only locks the GPIO once its unlock counter is
> +        * down to 0. This is necessary because the GPIO is unlocked in two
> +        * places in this driver: once for requested GPIOs, and once for
> +        * requested IRQs. Since it is possible for a GPIO to be requested
> +        * as both a GPIO and an IRQ, we need to ensure that we don't lock it
> +        * too early.
> +        */
> +       u8 gpio_unlock_count[GPIO_PER_BANK];
>         /* Used in the interrupt handler */
>         struct bcm_kona_gpio *kona_gpio;
>  };
> @@ -87,14 +103,25 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
>         unsigned long flags;
>         int bank_id = GPIO_BANK(gpio);
>         int bit = GPIO_BIT(gpio);
> +       struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>
> -       raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +       if (bank->gpio_unlock_count[bit] == 0) {
> +               dev_err(kona_gpio->gpio_chip.parent,
> +                       "Unbalanced locks for GPIO %u\n", gpio);
> +               return;
> +       }
>
> -       val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> -       val |= BIT(bit);
> -       bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +       bank->gpio_unlock_count[bit] -= 1;

Not a big deal or a show-stopper, but this could be
          bank->gpio_unlock_count[bit]--;
or, better yet,
          --bank->gpio_unlock_count[bit];

And a bit further down...

> -       raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +       if (bank->gpio_unlock_count[bit] == 0) {
> +               raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +
> +               val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> +               val |= BIT(bit);
> +               bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +
> +               raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +       }
>  }
>
>  static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
> @@ -104,14 +131,20 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>         unsigned long flags;
>         int bank_id = GPIO_BANK(gpio);
>         int bit = GPIO_BIT(gpio);
> +       struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
>
> -       raw_spin_lock_irqsave(&kona_gpio->lock, flags);
> +       if (bank->gpio_unlock_count[bit] == 0) {
> +               raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>
> -       val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> -       val &= ~BIT(bit);
> -       bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
> +               val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
> +               val &= ~BIT(bit);
> +               bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
>
> -       raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +
> +               raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +       }
> +
> +       bank->gpio_unlock_count[bit] += 1;

...this could be
          ++bank->gpio_unlock_count[bit];

>  }
>
>  static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
> @@ -362,6 +395,7 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
>
>         kona_gpio = irq_data_get_irq_chip_data(d);
>         reg_base = kona_gpio->reg_base;
> +
>         raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>
>         val = readl(reg_base + GPIO_INT_MASK(bank_id));
> @@ -384,6 +418,7 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
>
>         kona_gpio = irq_data_get_irq_chip_data(d);
>         reg_base = kona_gpio->reg_base;
> +
>         raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>
>         val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
> @@ -479,15 +514,25 @@ static void bcm_kona_gpio_irq_handler(struct irq_desc *desc)
>  static int bcm_kona_gpio_irq_reqres(struct irq_data *d)
>  {
>         struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +       unsigned int gpio = d->hwirq;
>
> -       return gpiochip_reqres_irq(&kona_gpio->gpio_chip, d->hwirq);
> +       /*
> +        * We need to unlock the GPIO before any other operations are performed
> +        * on the relevant GPIO configuration registers
> +        */
> +       bcm_kona_gpio_unlock_gpio(kona_gpio, gpio);
> +
> +       return gpiochip_reqres_irq(&kona_gpio->gpio_chip, gpio);
>  }
>
>  static void bcm_kona_gpio_irq_relres(struct irq_data *d)
>  {
>         struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> +       unsigned int gpio = d->hwirq;

Since you added a comment to bcm_kona_gpio_irq_reqres(), would it make
sense to add one here too? Just another nitpick and not a big deal
either way.

> +       bcm_kona_gpio_lock_gpio(kona_gpio, gpio);
>
> -       gpiochip_relres_irq(&kona_gpio->gpio_chip, d->hwirq);
> +       gpiochip_relres_irq(&kona_gpio->gpio_chip, gpio);
>  }
>
>  static struct irq_chip bcm_gpio_irq_chip = {
>
> --
> 2.48.1
>

Since I am okay either way with regards to my three nitpicks:

Reviewed-by: Markus Mayer <mmayer@broadcom.com>
