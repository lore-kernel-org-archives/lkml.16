Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04052701A4;
	Tue, 27 May 2025 11:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345640; cv=none; b=k8tMo7eWNYVmP+RnDhH8LFt0s40QwXC3PrJZ8FmeFxlSOv4xr7YkkktD/7BvLsv9i/rymIus3gkx5CHwST+i/kaJY43rK2AEBjszd65uxobGRJJAhe8FHx164aEdi/QVA8681tai5C37f7xJGDLnGYyugh4+FKM9ahYNChMTyK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345640; c=relaxed/simple;
	bh=FhE857sNlui17Q6Yip1QmHEqZKc56oFYs8TlkWSU6A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8HcYc8aOzEGf1oTTYddnQKpIaQgggSQWTKUJPQ6q3pag1HYDuOehz9RdH3PlpTpuEsec7fGddJ7l8bowOfF8ZiyeNrJqpvyBe2Z45wEyiBXPabOTPmx+o9yw7vpfyfsQqki+sGA40yWpyj5rqJP4ORZ8hLxbO3n+J4lvY9Ln4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heYFPjK0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heYFPjK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748345638; x=1779881638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FhE857sNlui17Q6Yip1QmHEqZKc56oFYs8TlkWSU6A0=;
  b=heYFPjK0Bm22LlBx2JTljZoVMks8JKQ3pGpqEgWtzw6rLNuPiuSXcEWv
   Bs3rkDS5KRccLsL/u5chZ5jHGODC1Heq3QuqEInkZaMtpGli7Da4/fbTr
   Bn1TWTj6C5yWHvGpFK3F30Y7iUeJiRNfddBkZVYUEOcZORqZYmna5p5fk
   +i17NhvQPNM7eUCYjda/Zf5PWQvDdzQGRQ1oTSI1c6f8pShtN6vP8uvtt
   sks5usfgZRUYic+w5GMIREviAZbaWKdIXu1HOfDPphmARmpnQfisyuHHG
   ENgylLO6ExJu6bRdJTDX5J7VEfhz5hFUKroU0y636YoHH+QsG3mZBWyiM
   Q==;
X-CSE-ConnectionGUID: QP4nazT9S9eOH51MrGBc0g==
X-CSE-MsgGUID: ZRbVaIfUSROtcmZIPYjXug==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61385026"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="61385026"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:33:57 -0700
X-CSE-ConnectionGUID: Cub3cRe+ROW5XmgHsdWjRg==
X-CSE-MsgGUID: tbehL1KcSUqP7EwsbrOvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="165971321"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:33:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJsZ1-000000019UT-2iJS;
	Tue, 27 May 2025 14:33:47 +0300
Date: Tue, 27 May 2025 14:33:47 +0300
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
Subject: Re: [PATCH v4 13/23] irqchip: Add driver for the RPMI system MSI
 service group
Message-ID: <aDWjG9jAJ7kSaC9b@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-14-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-14-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 25, 2025 at 02:17:00PM +0530, Anup Patel wrote:
> The RPMI specification defines a system MSI service group which
> allows application processors to receive MSIs upon system events
> such as graceful shutdown/reboot request, CPU hotplug event, memory
> hotplug event, etc.
> 
> Add an irqchip driver for the RISC-V RPMI system MSI service group
> to directly receive system MSIs in Linux kernel.

...

> +#include <linux/device.h>

Perhaps I missed something, but devm_kzalloc() is in device/devres.h. Do you
need it for something else?

> +#include <linux/dev_printk.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>

> +#include <vdso/bits.h>

Just make it linux/bits.h as vdso is for user space libvdso and related.

But

+ asm/byteorder.h

...

> +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);

Declare temporary variable for hwirq and do irqd_to_hwirq() only once.

> +	int ret;
> +
> +	ret = rpmi_sysmsi_set_msi_state(priv, irqd_to_hwirq(d), 0);
> +	if (ret) {
> +		dev_warn(priv->dev, "Failed to mask hwirq %lu (error %d)\n",
> +			 irqd_to_hwirq(d), ret);
> +	}
> +	irq_chip_mask_parent(d);
> +}

...

> +static void rpmi_sysmsi_irq_unmask(struct irq_data *d)

Ditto.

...

> +static void rpmi_sysmsi_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
> +{
> +	arg->desc = desc;
> +	arg->hwirq = (u32)desc->data.icookie.value;

Hmm... Why do you need an explicit casting?

> +}

...

> +	if (WARN_ON(fwspec->param_count < 1))

+ bug.h

> +		return -EINVAL;

+ errno.h (but actually you need err.h due to PTR_ERR() et al.)

...

> +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rpmi_sysmsi_priv *priv;
> +	int rc;

Be consistent with variable naming for the same (semantically) stuff.

> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = dev;

> +	platform_set_drvdata(pdev, priv);

How is being used?

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
> +		if (rc)
> +			return dev_err_probe(dev, rc, "Failed to get number of system MSIs\n");
> +		else
> +			return dev_err_probe(dev, -ENODEV, "No system MSIs found\n");
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

		if (dev_of_node(dev))
			of_msi_configure(dev, dev_of_node(dev));

> +		if (!dev_get_msi_domain(dev)) {
> +			mbox_free_channel(priv->chan);
> +			return -EPROBE_DEFER;
> +		}
> +	}
> +
> +	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> +					  &rpmi_sysmsi_template,
> +					  priv->nr_irqs, priv, priv)) {
> +		mbox_free_channel(priv->chan);
> +		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");
> +	}
> +
> +	dev_info(dev, "%u system MSIs registered\n", priv->nr_irqs);
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


