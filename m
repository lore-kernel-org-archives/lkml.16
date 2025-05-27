Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471219D07A;
	Tue, 27 May 2025 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346098; cv=none; b=H2pdqofn1mKZUYk0l/uFlrFbfRcGKG73U87icduQUXY6khgPsxxK6v0qx1vctTwZd1SFUp9FiqDMWElijiY8vNSr7zgE3g3S22/ZJqoPMxf2C/VeRMHKaspiUCRnU1K5X4Zo+KivMjYT5FEyh3aNroYx5LHPrTtlA30ZoLZeGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346098; c=relaxed/simple;
	bh=W5E3Xu6pVeg4WGDqRtohIYctx/gK/C6GG/OwK5hM5A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrU7sGgYd8csN2xcPnEFVVw14FySm5AcSla0UsuW7QgGYMnurZbCLttMa1G1FPO1zQpOUW52JxNHkCmpRFwZszi9C8b1P+XBWhTWNimO9Lc45AHm4MFMLNYSRjH9JmIP5xQ+9z+423Vlow+r0He4G3S1kECOSACsxCZCCdUakL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bbuyqjym; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bbuyqjym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748346096; x=1779882096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W5E3Xu6pVeg4WGDqRtohIYctx/gK/C6GG/OwK5hM5A4=;
  b=BbuyqjympMNyPwv2MjJ+Y0uT24Zjuqe27Er6nWmWLUy4W2Xnx7RAecrT
   JmTVqm9OkhGwps1/MW3r+iNUjdZkcGbTFgauoQx5PYbUf+VcFwqZgHnwz
   hUQKEE3QQNc3lJnYKCFGgY9vSb4rr/k0GcKATRcDqbgmsr+XWgNb3rkMh
   W55PvZULxrc4wQY+IlIqrPuBrrD40rY0TXzYS9Dtz+0axDuyEIEbdSJtI
   rMTcWGCnOCEO8/gOmsaKykm9186BEEFt+pZzxFFHGiaS29ZkhFN4933Mt
   5F6Z0wk9QpH/hD4D21vlbtIE+V4P5HhCgOK91NkFCRXuwXfnyPu2+vZYr
   g==;
X-CSE-ConnectionGUID: hmcyEDVTRUShTqj4PJv1vA==
X-CSE-MsgGUID: YjOZKVT5RGmUL1k0ZbVgbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61385808"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="61385808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:41:35 -0700
X-CSE-ConnectionGUID: Bs/edGu0Tde6lrxtkstj2A==
X-CSE-MsgGUID: XtLu7GQ6T3+4Ynx8hbYSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143749122"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:41:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJsgQ-000000019Z8-21f1;
	Tue, 27 May 2025 14:41:26 +0300
Date: Tue, 27 May 2025 14:41:26 +0300
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
Subject: Re: [PATCH v4 06/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-7-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-7-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 25, 2025 at 02:16:53PM +0530, Anup Patel wrote:
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

+ property.h (if not done yet)

> -	int ret;
> +	int i, ret;

Why is 'i' signed?

> -	if (!dev || !dev->of_node) {
> -		pr_debug("%s: No owner device node\n", __func__);
> +	if (!dev || !dev->fwnode) {

Do not dereference fwnode directly. Use dev_fwnode.

> +		pr_debug("%s: No owner %s\n", __func__, !dev ? "device" : "fwnode");

Use positive conditional.

__func__ is redundant it debug messages. With Dynamic Debug enabled it may be
switched at run-time.

>  		return ERR_PTR(-ENODEV);
>  	}
>  
> -	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
> -					 index, &spec);
> +	ret = fwnode_property_get_reference_args(dev->fwnode, "mboxes",

	struct fwnode_handle *fwnode = dev_fwnode(dev);

> +						 "#mbox-cells", 0, index, &fwspec);
>  	if (ret) {
>  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
>  		return ERR_PTR(ret);
>  	}

> +	memset(&spec, 0, sizeof(spec));
> +	if (dev->of_node) {

What is this check for?

> +		spec.np = to_of_node(fwspec.fwnode);
> +		spec.args_count = fwspec.nargs;
> +		for (i = 0; i < spec.args_count; i++)
> +			spec.args[i] = fwspec.args[i];
> +	}
> +
>  	mutex_lock(&con_mutex);
>  
>  	chan = ERR_PTR(-EPROBE_DEFER);
> -	list_for_each_entry(mbox, &mbox_cons, node)
> -		if (mbox->dev->of_node == spec.np) {
> +	list_for_each_entry(mbox, &mbox_cons, node) {
> +		if (mbox->fw_xlate && mbox->dev->fwnode == fwspec.fwnode) {
> +			chan = mbox->fw_xlate(mbox, &fwspec);
> +			if (!IS_ERR(chan))
> +				break;
> +		} else if (mbox->of_xlate && mbox->dev->of_node == spec.np) {
>  			chan = mbox->of_xlate(mbox, &spec);
>  			if (!IS_ERR(chan))
>  				break;
>  		}


		if (!IS_ERR(...))
			break;

is common.


> +	}

...

> +fw_mbox_index_xlate(struct mbox_controller *mbox,
> +		    const struct fwnode_reference_args *sp)

One line?

-- 
With Best Regards,
Andy Shevchenko


