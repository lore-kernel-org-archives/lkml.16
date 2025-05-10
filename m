Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1506244679
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901773; cv=none; b=tdYsJwo/rr6tgdFXclAlp4EufEzkRi0kYMB52l5tjcjk+NfutPEOE6bbDPr+BDcaFQLchQjgD8xqDpO6vZq4x0teEipU2I5yQCKztr0ZBzFJccnOH1PCfn7yYYpsS2KW6NhSZttBfnYbF0ecj5NB33WQN+naxyXVAGJjaH0Agcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901773; c=relaxed/simple;
	bh=sn/Bk+ioxgpnfSbChJ29su52n768bR6tck/4LkDDLv4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E51V0Ojw4qPX6RhyFOULcBX8yh+Y+OnVYixE6JmoYEqC2VrRVktBa+sAz05KPB/MufKG714z3VZwJvrgntvT7DxbNMmvJIGA4Oe/9VD8YNatf8WQX/7reVh0HucJk75agm4lRUjxyWaBod//8Lmo/dO2KBQRVQTbL6FXraBdaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id ad2ab1b7-2dcc-11f0-96ba-005056bdd08f;
	Sat, 10 May 2025 21:29:15 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 May 2025 21:29:14 +0300
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
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
Message-ID: <aB-a-tH6AGUfBZVB@surfacebook.localdomain>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>

Fri, May 09, 2025 at 12:45:31PM +0800, Peng Fan (OSS) kirjoitti:
> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.

Why not? These are mostly trivial ones and they fix the warning, they may
potentially be the fixes between -rc1 and -rc2,

> This is an effort to make irq_chip immutable to elimnate the kernel
> warning "not an immutable chip, please consider fixing!"

> The major changes 
> - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> - add IMMUTABLE flag
> - add GPIOCHIP_IRQ_RESOURCE_HELPERS

No need to list the implementation details of IMMUTABLE flag. Just a summary
line is enough.

> For davinci, two patches are made, 1st is to update irq chip data, 2nd
> make irq_chip immutable.
> For xgene-sb, two functions are added, because previous driver directly
> use irq_chip_unmask_parent and irq_chip_mask_parent.
> 
> In some patches, I use irqd_to_hwirq(d) to get hwirq; in others, I
> direclty use d->hwirq to align with previous code.
> 
> Some Kconfig entries do not select GPILIB_IRQCHIP, but I tried
> to build pxa_defconfig lpc18xx_defconfig and multi_v7_defconfig,
> GPIOLIB_IRQCHIP is y.
> Not sure we should select GPIOLIB_IRQCHIP for them, because if
> deselect GPIOLIB_IRQCHIP, there will be build failure.

-- 
With Best Regards,
Andy Shevchenko


