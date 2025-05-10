Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A9244679
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 18:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901693; cv=none; b=S3QM4hZH7OxxZqub5dLHpPJPBOLKH0Rpr5lE7BoGZ72Cp3D1Zy/QvjbdJIBuNR8FkedPNvXRiKnQ0G3YfB6iaA9YuqAeIo7uCYhjYPRQbGz7VM7HXEReV3KTxzsllVFVzon8Xd+gTFc7/Njjck3i9zTrHC2fb6JWqfy90xVEL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901693; c=relaxed/simple;
	bh=9gVwUnLYR1pYhWx6NRL9eT+D/v3yyrCVvAMryYWu6aQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMAEzM5mMpWfkN/k0On6hRTWjjS+42hEIriV/qHul/0O8kOIzfBd4hjfZ6kHCIOl/4+sqe5zbr6s7Aaf451hIw4v8rWN0gbliy2g5ZEGSrD+Xz/FWhcneujHNRnhQ8OTymICjFh1VidsFe7l8DohjkZbYs6TdkY2l6ZPx5K1Ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 5c52b789-2dcc-11f0-96ba-005056bdd08f;
	Sat, 10 May 2025 21:27:01 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 May 2025 21:26:58 +0300
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 8/9] gpio: timberdale: Make irq_chip immutable
Message-ID: <aB-acnUBnidSw7r4@surfacebook.localdomain>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
 <20250509-gpio-v1-8-639377c98288@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-gpio-v1-8-639377c98288@nxp.com>

Fri, May 09, 2025 at 12:45:39PM +0800, Peng Fan (OSS) kirjoitti:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Kernel warns about mutable irq_chips:
> "not an immutable chip, please consider fixing!"
> 
> Constify timbgpio_irqchip, flag the irq_chip as IRQCHIP_IMMUTABLE,
> add the new helper functions, and call the appropriate gpiolib functions.

...

>  	struct timbgpio *tgpio = irq_data_get_irq_chip_data(d);
>  	int offset = d->irq - tgpio->irq_base;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	unsigned long flags;

While at it, replace direct accesses to IRQ data `irq` member.

  	int offset = hwirq - tgpio->irq_base;

...

>  static void timbgpio_irq_enable(struct irq_data *d)
>  {
>  	struct timbgpio *tgpio = irq_data_get_irq_chip_data(d);
>  	int offset = d->irq - tgpio->irq_base;
> +	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	unsigned long flags;

Ditto.

> +	gpiochip_enable_irq(&tgpio->gpio, hwirq);
> +
>  	spin_lock_irqsave(&tgpio->lock, flags);
>  	tgpio->last_ier |= 1UL << offset;
>  	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);

>  }

-- 
With Best Regards,
Andy Shevchenko


