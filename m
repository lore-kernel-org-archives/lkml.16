Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FA1990D8;
	Wed, 11 Jun 2025 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656134; cv=none; b=OxpV/B7e4QG7yanDIdI4Hcsl8MTsa467m68wd9NWKPrrRG25DxOL2uZq3UFR5dsWKqJk3LvBC8BMDxQiDfikY1SKyAEq41Thgw+i5Ar0luikl83XW5A1y7NDxiiOdtAGuNS25teX0yYdhhlGfr3scouxgBPLo9CXhEXKaF+7aPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656134; c=relaxed/simple;
	bh=wtS78pPmQeKtNXLAVDUqcIovJ+ivy0sR/W7vIR6YqYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FP/6rF4U2xTaw1jKT3VOAvXHvroj+LOwnUSlcijbOeaEYdglIvuZNb9zCaT9n3yAXbm831I4LXaw9YhRbOAF0p7Rq9zChy4F1YZRvVPE0swnxfeT4xdJy/MztLuOUh6aE2s9dfPtQGiSL1vSjSVDVC3Wp7riP3Ey2gYXm1iKtcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dt5WqDfY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dt5WqDfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749656132; x=1781192132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wtS78pPmQeKtNXLAVDUqcIovJ+ivy0sR/W7vIR6YqYU=;
  b=dt5WqDfYeLg41V+GWfLAWbHTM9D6lV1e4GSE500spaTrV3ECHgnPNp+k
   qgBCFcrrLubgQ8w7EIB8DegGx2avGE5ghgAHcggva8KxlsHQ7Y+zi0eC4
   UA+bjr+5/KpC5DgjjmwcjJ+kLtV3nyzbw9es299bEa2bS/snLSDK/s01N
   8BSbTXQnBHYfrxOqzFLTH6UiLtlJ1czC4e0EY+jmqRfNuhBWBmHox5j8K
   q65j2gm6GtYCkumpYolxU+Zc6fQ/5F4PJlWU8Hdr2+FLa4eghlOOuQ8FK
   vVGeAQIySDfX6UK6ABOLTkgHZkd7ml2s7NoTXIU06Me69TqDzD9mvk+LO
   g==;
X-CSE-ConnectionGUID: Q+AEINx7QVGkeM4pCQi9lA==
X-CSE-MsgGUID: ljuUb7rISSimvtZ6gH7SMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55600016"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55600016"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:35:31 -0700
X-CSE-ConnectionGUID: 3p/wA2aPQdyG41GuMigxwA==
X-CSE-MsgGUID: Go7CJ2mwSm+nXLNn8eq13A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147118627"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:35:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPNU0-00000005gZ7-2TyD;
	Wed, 11 Jun 2025 18:35:20 +0300
Date: Wed, 11 Jun 2025 18:35:20 +0300
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
Subject: Re: [PATCH v5 05/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aEmiOFwofEJyXm4R@smile.fi.intel.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-6-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611062238.636753-6-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 11, 2025 at 11:52:20AM +0530, Anup Patel wrote:
> Introduce optional fw_node() callback which allows a mailbox controller
> driver to provide controller specific mapping using fwnode.
> 
> The Linux OF framework already implements fwnode operations for the
> Linux DD framework so the fw_xlate() callback works fine with device
> tree as well.

...

>  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
>  {
> +	struct fwnode_reference_args fwspec;

Define

	struct fwnode_handle *fwnode;


>  	struct device *dev = cl->dev;

This better to be just a declaration.

>  	struct mbox_controller *mbox;
>  	struct of_phandle_args spec;
>  	struct mbox_chan *chan;
> +	unsigned int i;
>  	int ret;

With the above the below will look like...

> -	if (!dev || !dev->of_node) {
> -		pr_debug("%s: No owner device node\n", __func__);
> +	if (!dev || !dev_fwnode(dev)) {
> +		pr_debug("No owner %s\n", dev ? "fwnode" : "device");
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> -	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
> -					 index, &spec);
> +	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "mboxes",
> +						 "#mbox-cells", 0, index, &fwspec);
>  	if (ret) {
>  		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
>  		return ERR_PTR(ret);
>  	}

...this

	dev = cl->dev;
	if (!dev) {
		pr_debug("No owner device\n");
		return ERR_PTR(-ENODEV);
	}

	fwnode = dev_fwnode(dev);
	if (!fwnode) {
		dev_dbg(dev, "No owner fwnode\n");
		return ERR_PTR(-ENODEV);
	}

	ret = fwnode_property_get_reference_args(fwnode, "mboxes",
						 "#mbox-cells", 0, index, &fwspec);
	if (ret) {
		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);

You may save a few bytes by doing it as

		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");

		return ERR_PTR(ret);
	}

> +	spec.np = to_of_node(fwspec.fwnode);
> +	spec.args_count = fwspec.nargs;
> +	for (i = 0; i < spec.args_count; i++)
> +		spec.args[i] = fwspec.args[i];
> +
>  	scoped_guard(mutex, &con_mutex) {
>  		chan = ERR_PTR(-EPROBE_DEFER);
> -		list_for_each_entry(mbox, &mbox_cons, node)
> -			if (mbox->dev->of_node == spec.np) {
> +		list_for_each_entry(mbox, &mbox_cons, node) {

> +			if (mbox->fw_xlate && dev_fwnode(mbox->dev) == fwspec.fwnode) {

We have a helper device_match_fwnode()

> +				chan = mbox->fw_xlate(mbox, &fwspec);
> +				if (!IS_ERR(chan))
> +					break;
> +			} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {

No need to check OF node (again). Instead refactor as

			if (device_match_fwnode(...)) {
				if (fw_xlate) {
					...
				} else if (of_xlate) {
					...
				}
			}

>  				chan = mbox->of_xlate(mbox, &spec);
>  				if (!IS_ERR(chan))
>  					break;
>  			}
> +		}
>  
> -		of_node_put(spec.np);
> +		fwnode_handle_put(fwspec.fwnode);
>  
>  		if (IS_ERR(chan))
>  			return chan;


-- 
With Best Regards,
Andy Shevchenko


