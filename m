Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C71FF5F5;
	Mon,  3 Feb 2025 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575520; cv=none; b=Req013q1s1c/rdoko/lsQh8Ssvc9iDN0lqMoJV4Wgc1z+eNGwr5rHHFoSiDSlgQB5+KVL4c3J1WBr5Y7ZKWkeA3YBlA3YIbCqoqgbb7F00rcSJ3JJ2imVGSRXKTMJ44La0GADIwmdRxyVS4GCezYlOY7QfXkDiwj3DGXz5GHO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575520; c=relaxed/simple;
	bh=yzcEf9XDeWs1+TWet4F73GS6w+CZnG1Zty9st7dcxC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNgr0KhGSLoZImM38EHabYRENzsLix2HU+u5n+UXEQbFRM80g2N6WlhBNT9RtmQA7URHBMap3VWUprs0Acgy33xOSwSLYCUB3d7JXkExysEa9Z9Xt1XuCLk84TAa5RrRlIwHGMXsZEE5gJ1ZO+kKA16pEry1sFM6xBgWLVFb4g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6UivAan; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6UivAan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738575519; x=1770111519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yzcEf9XDeWs1+TWet4F73GS6w+CZnG1Zty9st7dcxC8=;
  b=S6UivAanUui0kyUBtdxVOVzwBNe3he+i86gNTihChWhpLJFXHbbOW0O9
   SMTbqICaJxHtGDK1RfPzcE8XXUprbBFhJcDFDNo/hc9rQa+9c16BsqtTE
   r/J4ICRxnhkfT92BSrXrv9YE9fFkN1zftt+71uWAPeo4sKyAub1cNirKv
   5Q/VKrVnZIa2lXsins8gh4CdaBI3WjAnLC9PkWGG1kTudO0E0baRvtZen
   AW5n3ccrF72VDQBHHMXL+rHMBdUjJIPzfDAqHojmjKS3OmEsgRiCc3Wpo
   2u/jX8lcwA1gTV3Fl1SAih5o0K9vnhQ1GAjhlEtk+qcZKqlZnRBQBcqib
   w==;
X-CSE-ConnectionGUID: 8nQdq75OSoOdOwKAk0x2Sg==
X-CSE-MsgGUID: fjv6gH2uR3KM2zzqis8wiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="56490770"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56490770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:38:38 -0800
X-CSE-ConnectionGUID: Mq/u/9GNRaa9iE7TfMDyKA==
X-CSE-MsgGUID: 2wZUv19MQAWqsA9gvk0/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="141110698"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:38:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tesuS-00000007mqV-1ub0;
	Mon, 03 Feb 2025 11:38:28 +0200
Date: Mon, 3 Feb 2025 11:38:28 +0200
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <Z6COlL_5n2AfRADL@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-17-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-17-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 02:19:05PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

...

> +	if (!is_of_node(dev->fwnode)) {

Please, use dev_fwnode(),

But why do you need this? Can't the below simply become a no-op without
this check?

> +		rc = riscv_acpi_get_gsi_info(dev->fwnode, &priv->gsi_base, &id,

Ditto.

> +					     &priv->nr_irqs, NULL);
> +		if (rc) {
> +			dev_err(dev, "failed to find GSI mapping\n");
> +			return rc;
> +		}
> +	}

...

>  		 * then we need to set it explicitly before using any platform
>  		 * MSI functions.
>  		 */
> -		if (is_of_node(dev->fwnode))
> +		if (is_of_node(dev->fwnode)) {
>  			of_msi_configure(dev, to_of_node(dev->fwnode));
> +		} else {
> +			struct irq_domain *msi_domain;
> +
> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);

> +			if (msi_domain)

Hmm... The OF case above assumes this check is not needed. Why is it special
otherwise?

> +				dev_set_msi_domain(dev, msi_domain);
> +		}
>  
>  		if (!dev_get_msi_domain(dev))

Even here you have a check for NULL, so I believe the conditional is simply
redundant.

...

> +#ifdef CONFIG_ACPI

> +	if (!acpi_disabled)

Why?

> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +#endif

...

> +#ifdef CONFIG_ACPI

Drop this ugly ifdeffery along with ACPI_PTR(). They are more harmful than
useful.

...

> +static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
> +	{ "RSCV0006", 0 },

Drop ', 0' part as it may be converted to a pointer in the future.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
> +#endif

-- 
With Best Regards,
Andy Shevchenko


