Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BF1804A;
	Mon, 12 May 2025 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035268; cv=none; b=kQ+PUWPwsxlr5tCToMCQ8j4L1wiGP9lmXh0UlGquUGBgxc7Q6obE29BCcIZ/GSOkZF7MieydvNlRG5vDpmZOz48/NaxISdeXcUS2lF7azxPvRs3bz7EsUf3k3rHjEyi6fD50+sOhRklAQSP+uD9XcVana5mHbSWRJ5DYX3F4idg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035268; c=relaxed/simple;
	bh=028RP0yDMQgC4nJR+FUCOYUcj4/V6uAUEiZ9iXxV4Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa+ZICsTo2CTw2l70OjrR28x2DHQ+TtTd/lbB+yH3VB02T02U6w5RbWE+0chPbvDnq6mpvv0Nnce8z+tz73XcepEmg44gp6DaOMG+JLA3ZU/eLMCW9Ihr67h59s1e0Q288aZAR7F5Abbapw59GNv0KoWyefJtGkP4b9SOaRT0vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHWwrKyO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHWwrKyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747035266; x=1778571266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=028RP0yDMQgC4nJR+FUCOYUcj4/V6uAUEiZ9iXxV4Xk=;
  b=BHWwrKyOJuLFh3IV+I8/IMqkXYqXmYijuJniq04O+Q3RkozjiZ8LH/6m
   rdeCRdUTCmtZE5hZXwRbu6S4vp+V/6etCFeyS5jkTaEUG2/4XLpJvlx9Y
   qt7iat4n0DsyjmQXqBv9gCo65Dzbhm6iTRFczTYAAc6JIBUiUj3/18j9Y
   7JkBMlbSfJsCp60y1fx+LwZtJIeJzmZsHPH7DaiSUSnB4p5BDCfd22v/R
   H9lM5sWoLM8FtSpF5gQ89MYVec55pu5cxz5WGMv5XI5CBnRnWqBN1YRog
   KMRPm2cTOZv8lWJRTkB6BmywohNNWwH28TwcBzcfS6zqaiCmgqFrzUQny
   A==;
X-CSE-ConnectionGUID: 3HutcHyOQbqBnPAwbM5nBg==
X-CSE-MsgGUID: NPTGSXc2Q+6I3mMNes3+uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52627781"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="52627781"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:34:24 -0700
X-CSE-ConnectionGUID: qoc1OzjqRr+uQOLA1U/SYA==
X-CSE-MsgGUID: Y4XJzRPFQk2CkC5gCJrTRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="136990025"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:34:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENfy-00000000qhH-31ST;
	Mon, 12 May 2025 10:34:14 +0300
Date: Mon, 12 May 2025 10:34:14 +0300
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
Subject: Re: [PATCH v3 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <aCGkdqcLhPVXSSLq@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-22-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-22-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 11, 2025 at 07:09:37PM +0530, Anup Patel wrote:
> 
> Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.

...

	struct fwnode_handle *fwnode;
	...
	fwnode = dev_fwnode(dev);

> +	if (is_acpi_node(dev_fwnode(dev))) {
> +		u32 nr_irqs;
> +
> +		rc = riscv_acpi_get_gsi_info(dev_fwnode(dev), &priv->gsi_base, &id,
> +					     &nr_irqs, NULL);

		...(fwnode, ...)

...and so on...

> +		if (rc) {
> +			dev_err(dev, "failed to find GSI mapping\n");
> +			return rc;
> +		}
> +
> +		/* Update with actual GSI range */
> +		if (nr_irqs != priv->nr_irqs)
> +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> +	}

> -		if (is_of_node(dev_fwnode(dev)))
> +		if (is_of_node(dev_fwnode(dev))) {
>  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +		} else {

		} else if (is_acpi_..._node(...)) {

> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);
> +			dev_set_msi_domain(dev, msi_domain);
> +		}

...

> +#ifdef CONFIG_ACPI
> +	if (!acpi_disabled)

Why?

> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +#endif

-- 
With Best Regards,
Andy Shevchenko


