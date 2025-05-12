Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2D20326;
	Mon, 12 May 2025 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032628; cv=none; b=UkRJf5/8+dQ5aOvuA6Hv50Wk/B59a4GE1EQZ+0sItEnYCn7VQCgNzfJ91w+xTSWhAHOxD6lFm7HdZBO8NSJ5g5NeyToR9XfOmx555gkJ6rH5NpkfFwDbZLDOOk+pztsD5iiKcnYc1/vNwjMGUjPsx+L1pJForpJRClEqWRQq2Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032628; c=relaxed/simple;
	bh=rpwMv2y5lJIMTCuyi92paGgTBZ+I6o4sAEGRlxKoMIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2CyAYuAGooVjbLYI1ul6vxIK3Y1zbf5rDcxdQ9XAivWVgDLbKvA+Ig7iLD4++VqTMbHpio7RebZ6y90mp7XkiTa/JcuQBMRldJND3lupo9AN7ZaqASlY2Zh8CqTszy3Hul8IwwSmhst9qUbb21lWR0dmKeMETa4FGpGJ2NHWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAWpT7mN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAWpT7mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747032628; x=1778568628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rpwMv2y5lJIMTCuyi92paGgTBZ+I6o4sAEGRlxKoMIk=;
  b=WAWpT7mNg7JO+KCUVi4jumtAB0ZnhQ0EKWwZd30j66xciMDu2OEZP5f4
   6l/CWkqUKZMYZHVb6IoqMoFKNzAqHy0UYhpcyJ4npg/UF+lDcfVRsX68o
   2tGVWVQbLlAAYm9AykJXBOrEPQ+AO0se4g4iHFp1Q5qEagfPhhSvjry5P
   yPxHxZidRqQ5jP/OcsCbhFBlhQCPkCzm8/XsidsYEfUM3N0r6QhTP+i67
   kYH+Accf7vRL2tSaXRcp54KZNlDy8WTzS7ffTabsOvhvzlUw8OFAKdfyh
   7PeUGUlTCsfLAblixpwMG5LitLcIVrYCbooOwW+idvzSMlv75ofuFi6HF
   w==;
X-CSE-ConnectionGUID: Pq8jc8F+STmWFn/fuMVbVQ==
X-CSE-MsgGUID: BsMPO52XTsqj9ePCYnyTYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52626346"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="52626346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:50:27 -0700
X-CSE-ConnectionGUID: zTNUU3H2QJ+U/O/rAvYgXA==
X-CSE-MsgGUID: N9xxRReTSjSo9U4ytmnxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142488645"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 23:50:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEMzR-00000000q6E-1z14;
	Mon, 12 May 2025 09:50:17 +0300
Date: Mon, 12 May 2025 09:50:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
Message-ID: <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-14-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 11, 2025 at 07:09:29PM +0530, Anup Patel wrote:
> The RPMI specification defines a system MSI service group which
> allows application processors to receive MSIs upon system events
> such as graceful shutdown/reboot request, CPU hotplug event, memory
> hotplug event, etc.
> 
> Add an irqchip driver for the RISC-V RPMI system MSI service group
> to directly receive system MSIs in Linux kernel.

...

> +/*
> + * Copyright (C) 2025 Ventana Micro Systems Inc.
> + */

It can occupy a single line instead of 3 LoCs.

...

> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cpu.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqchip.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/smp.h>

+ types.h

Actually this one is most clean, the rest of the patches where the new code
is introduced has semi-random list of the inclusions, please, follow the IWYU
principle.

...

> +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
> +	int ret;
> +
> +	ret = rpmi_sysmsi_set_msi_state(priv, d->hwirq, 0);

Please, use the respective getter and the type:

	irq_hw_number_t hwirq = irqd_to_hwirq(d);

Ditto for all other similar cases.

> +	if (ret) {
> +		dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n",
> +			 (u32)d->hwirq, ret);

No, this is wrong in two ways: usage of specified for signed value and
passing the unsigned; using explicit casting to something unsigned.
Instead ofa the explicit casting, find the best formatting specifier
and use it.

Ditto for  all your code.

> +	}
> +	irq_chip_mask_parent(d);
> +}

...

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

Can rc be negative holding an error code? If so, why does the code shadow that?

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
> +	}
> +
> +	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> +					  &rpmi_sysmsi_template,
> +					  priv->nr_irqs, priv, priv))
> +		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
> +
> +	dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
> +	return 0;
> +}

...

> +/** RPMI system MSI service IDs */

Why does this have a kernel-doc marker?

> +enum rpmi_sysmsi_service_id {
> +	RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION = 0x01,
> +	RPMI_SYSMSI_SRV_GET_ATTRIBUTES = 0x2,
> +	RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES = 0x3,
> +	RPMI_SYSMSI_SRV_SET_MSI_STATE = 0x4,
> +	RPMI_SYSMSI_SRV_GET_MSI_STATE = 0x5,
> +	RPMI_SYSMSI_SRV_SET_MSI_TARGET = 0x6,
> +	RPMI_SYSMSI_SRV_GET_MSI_TARGET = 0x7,

Please, be consistent in the style of values.

> +	RPMI_SYSMSI_SRV_ID_MAX_COUNT,

No comma in the terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko


