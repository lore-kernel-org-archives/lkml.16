Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71E156236;
	Mon, 23 Jun 2025 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668318; cv=none; b=graYlWsZLoTFwPy2w1QdcKQJd80lXqrChkD3zlW9YfqaqWM9dsfKc0aeK11qaFTiMINROw/nvvxtAUemOQxHXgZRxJxxgKUiIpcZHRvgAAp7SOim2+Mi8jU+OytswY5eUMVZOP8yWKAFYWM2VOW392kNa7HAgSOBNDIyvG58bEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668318; c=relaxed/simple;
	bh=czCnr454L0Rdgtenujc5uQtXulaQ8IYmBZKADIw/Euw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyF+YvVd+IIMo1OC3uVeKozL103WkFdYI7xdOke8CHqEF9LulSuVsFO5692eKdArKsFSUplDFUprenf2wXpb+UoBUCgOFD3RkGtWDYnAQLx+p1aXvn4qTSzYZLO+M9c1LGiBDeW/Dv56gzST0XCpa+HbGPetKznbIX4KW7L4hms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+161uPZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+161uPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668317; x=1782204317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=czCnr454L0Rdgtenujc5uQtXulaQ8IYmBZKADIw/Euw=;
  b=M+161uPZpKUDCmMnczoYlKeoUteJ0dUkmwv+iXSrVr5x+ODPi1mLIkFN
   CIRU/MlhBKbMgLjfU2xXJYuYrKlIOCVTTi4590F8JSKG4sY0HzYtF/Zry
   PwAxg2N5DAqRXQtEvs6Rew8tzcR/rSLe70yWB2CuJs/acXHm8d8Mr2H/k
   gI9uEht7cY0AIW2AnsTOfX0Z6YSaqP14DuID4II9cCm6p+RYU1Zmhu06N
   B4nJjbf6tHBmEZnJVWoCZhw5OHMHUF31hY5r/XAkYH6b4aBzXBUgFvjHn
   Trt9ZA5heC30tkR24h/867uhvrnLQ3hlUfuP2NHpdr8Z7f7sti8afx2io
   g==;
X-CSE-ConnectionGUID: aplOaf2vSPGBOsfTXYpRWA==
X-CSE-MsgGUID: Sa61Gde3S0mFgHt9D3JWOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="55498544"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="55498544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:45:16 -0700
X-CSE-ConnectionGUID: a/sJG7yBTmO0RoMIxh1VOw==
X-CSE-MsgGUID: sQ1iTc6BQKKm1IEI9yq6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155547323"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:45:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTcna-0000000973l-0JQc;
	Mon, 23 Jun 2025 11:45:06 +0300
Date: Mon, 23 Jun 2025 11:45:05 +0300
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
Subject: Re: [PATCH v6 05/23] mailbox: Allow controller specific mapping
 using fwnode
Message-ID: <aFkUETH_R30-CNOX@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-6-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-6-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 18, 2025 at 05:43:40PM +0530, Anup Patel wrote:
> Introduce optional fw_node() callback which allows a mailbox controller
> driver to provide controller specific mapping using fwnode.
> 
> The Linux OF framework already implements fwnode operations for the
> Linux DD framework so the fw_xlate() callback works fine with device
> tree as well.

...

> +	fwnode = dev_fwnode(dev);
> +	if (!fwnode) {
> +		dev_dbg(dev, "No owner fwnode\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "mboxes",

Why not using fwnode directly here?

> +						 "#mbox-cells", 0, index, &fwspec);
>  	if (ret) {
> -		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
> +		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
>  		return ERR_PTR(ret);
>  	}

...

Otherwise looks like a good solution to get rid of OF-centric code from mailbox
in the future.

-- 
With Best Regards,
Andy Shevchenko


