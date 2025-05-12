Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024328F3;
	Mon, 12 May 2025 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076284; cv=none; b=WTmQuToKmGhL570L9N3PVQscZqpnvvDZ8a/02Tiv7U9O1yctGb1eOQFP467G3PG3wK1DsyxElJQAGV7GdfOtTD+G2qnMO/qmKQ0ezlF62Q4O92YRIDoJNXbMXa9qZ0LV36GyyHRlkyWzn/ucv2WLJavZoEPqwaGYHraYz5W/kLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076284; c=relaxed/simple;
	bh=a081WB6SxuONkR4u0GsO43F/0PwYW6jnwgGxUEMwCRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jHBcpXTeulE3ZIF2H9j3ZY2q78XOZRUACbVjL6w2MBOQYKD6doR+zQ3x+Kaq6eV6sEH+/KHHDRP5hp9Fzxs6+IBAaT0Ofg9YAaY6MSevh25DiHCPpvF/okEMBu3C/F2R5WWx/2865ssYGn5dDZ7x52BPjAZEGM8ieDkh4sApRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b8gt1O+U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GqeDIyvt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b8gt1O+U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GqeDIyvt"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747076281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=It3ZkHrF/ybpGgsvf1rdjtabzTDxdApsEcKThmxYw7Q=;
	b=b8gt1O+Ubizxvw2Y7EAMWPCcwCLx+KT8VQOEQpRB3EvAazfK305nMMrvh5ASb+h7es1++S
	ZNV//+OoK4drZ2UUr1NXKNHCrdF5funXgqU4kgwBUKGRmbGz6mzzuHOagtRJLcwlXQsyE0
	kywSlW9ysEuKZCpNx6EClRXlEEetSvz/hTfy+aQVvinXq94scSlvJSumRK8RqT2jtgw3b1
	ZKJ/QrbWqgaIy4ERPNumhI9rxcC15FYxFqmeq3mBs/JTBEyu0lblB36ssUW/x+c0Mk+I/5
	Rdsy2yLhc/z0EMtSW87iqU9vR/TD6/By7nkMGu7kQ8Z8+uktQW2BuWevKAuVig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747076281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=It3ZkHrF/ybpGgsvf1rdjtabzTDxdApsEcKThmxYw7Q=;
	b=GqeDIyvt8XSPdNBmK6crbulLG7Eo1g4InPC38SDVZr0ZAaDfsB8Rx30LfMcntJlFopChS2
	RMcD7XFZEA+9wECw==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>, Rahul Pathak <rpathak@ventanamicro.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra
 <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, Samuel
 Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
In-Reply-To: <20250511133939.801777-14-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com>
Date: Mon, 12 May 2025 20:58:00 +0200
Message-ID: <87zffhk66f.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 11 2025 at 19:09, Anup Patel wrote:
> +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rpmi_sysmsi_priv *priv;
> +	int rc;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	/* Setup mailbox client */
> +	priv->client.dev		= priv->dev;
> +	priv->client.rx_callback	= NULL;
> +	priv->client.tx_block		= false;
> +	priv->client.knows_txdone	= true;
> +	priv->client.tx_tout		= 0;
> +
> +	/* Request mailbox channel */
> +	priv->chan = mbox_request_channel(&priv->client, 0);
> +	if (IS_ERR(priv->chan))
> +		return PTR_ERR(priv->chan);
> +
> +	/* Get number of system MSIs */
> +	rc = rpmi_sysmsi_get_num_msi(priv);
> +	if (rc < 1) {
> +		mbox_free_channel(priv->chan);
> +		return dev_err_probe(dev, -ENODEV, "No system MSIs found\n");
> +	}
> +	priv->nr_irqs = rc;
> +
> +	/* Set the device MSI domain if not available */
> +	if (!dev_get_msi_domain(dev)) {
> +		/*
> +		 * The device MSI domain for OF devices is only set at the
> +		 * time of populating/creating OF device. If the device MSI
> +		 * domain is discovered later after the OF device is created
> +		 * then we need to set it explicitly before using any platform
> +		 * MSI functions.
> +		 */
> +		if (is_of_node(dev_fwnode(dev)))
> +			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +
> +		if (!dev_get_msi_domain(dev))
> +			return -EPROBE_DEFER;

This leaks the channel.

> +	}
> +
> +	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> +					  &rpmi_sysmsi_template,
> +					  priv->nr_irqs, priv, priv))
> +		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");

Ditto.

Thanks,

        tglx
