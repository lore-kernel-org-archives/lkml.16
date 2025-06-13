Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2741EEA47;
	Fri, 13 Jun 2025 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828985; cv=none; b=PYuEkf4culmXJlCrGND3RlizDFQVz9kn8HsAl8Dq2iyEcGd2pyLFTMkA4VLGqhRNx7tJw6SJv6N4HPI35m3ba26sPREqB9aKPIH5cm6U6I5kJj+eZWAn7nbQDGh4jBVZKsneRvnzyCV2JagkPzKUgFvT2RXEIEePIW6zyd89MOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828985; c=relaxed/simple;
	bh=hi30N7hPTdM+W7CSNwd8BBlcNYK6rfxQAwLj1o7h+o8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a2UkM76iJVfYQyUk75RB3u5qWGbZfBI+p0a0i0qe6r+sPnC/PPGJEu7eYSZHAKxK2OBXhd4C6kpMN7DGk6WWh9qxNt4J3QvSG5tYFmCJpqdw/n5AccXy62sCxrgbrLsb47y9OD2vnQDeoonY0kQdfOHiPHEQxcmcKMqLu2FH5nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VjSmWRHV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8A83mT6R; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VjSmWRHV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8A83mT6R"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749828982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl/6EkwsEpqgCUA5P8YrSajTCAuCE0EZwn0pBl3AfZU=;
	b=VjSmWRHVDVG+nz4CIbGQz42VQ8TH8Zf+HXs9/usjzOzyXiZU30Ud+NRBCxX2CdNPI2b02h
	rIcBChhAX6q7ZcrJqPSJoY8NR/tx5a7vTK+mPgr6/4L9/Yfs7b4HTZALqmDspKJtoxKdua
	TM1HP0AeJAgcRicnW3CpQqT6X0v9XrOKOAKyve4+37Z3XiRY/RZBjijwLRx064XbT8x+c4
	aeeQtWhk+bLxYuyn2u5asQd6PZiUV2YkiOPRG/IES26cMEP8YhSr+nTbJz5OV8SKjQJLSB
	rWcnDK0p7W5kxLdDRZyolj4RM+ja7z2noCJQCr3WwudMFwe8WTM2jT8Wfzc2cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749828982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl/6EkwsEpqgCUA5P8YrSajTCAuCE0EZwn0pBl3AfZU=;
	b=8A83mT6RVGbiO5VdlNc0EukD58Nw0/Gu1WWIv8vYi7JqEy6zT0DWmxkUk6/xrizwGDAinN
	+4XaDX7rQr0YGpBQ==
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
Subject: Re: [PATCH v5 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
In-Reply-To: <20250611062238.636753-22-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-22-apatel@ventanamicro.com>
Date: Fri, 13 Jun 2025 17:36:21 +0200
Message-ID: <87frg3irgq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> @@ -211,6 +213,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct rpmi_sysmsi_priv *priv;
> +	struct irq_domain *msi_domain;
> +	struct fwnode_handle *fwnode;
> +	u32 id;
>  	int rc;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -241,6 +246,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
>  	}
>  	priv->nr_irqs = rc;
>  
> +	fwnode = dev_fwnode(dev);
> +	if (is_acpi_node(fwnode)) {
> +		u32 nr_irqs;
> +
> +		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
> +					     &nr_irqs, NULL);
> +		if (rc) {
> +			dev_err(dev, "failed to find GSI mapping\n");
> +			return rc;
> +		}
> +
> +		/* Update with actual GSI range */
> +		if (nr_irqs != priv->nr_irqs)
> +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> +	}
> +
>  	/* Set the device MSI domain if not available */
>  	if (!dev_get_msi_domain(dev)) {
>  		/*
> @@ -250,8 +271,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
>  		 * then we need to set it explicitly before using any platform
>  		 * MSI functions.
>  		 */
> -		if (dev_of_node(dev))
> +		if (is_of_node(fwnode)) {
>  			of_msi_configure(dev, dev_of_node(dev));
> +		} else if (is_acpi_device_node(fwnode)) {
> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);

msi_domain is only used here and so it should be declared in this scope
and not at the top of the function.

> +			dev_set_msi_domain(dev, msi_domain);
> +		}

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
