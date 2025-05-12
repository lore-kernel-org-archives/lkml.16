Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667F481DD;
	Mon, 12 May 2025 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747034910; cv=none; b=iCXPMEYWJO8JsyLxFE4ClfDiM8iztFvFZ9UoYMNbSjz0TlyU8h5Kh1Nq6307lXD5ZEo/VOKGUW+KYaATLBGZuOWKU5R18tAgtLXzOK0/YITnLxZ0ghf4hOOJudTOhykSht1kfjg2GcE4ILwohcGOfQweNPGmcbrIuKPfvFaf8EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747034910; c=relaxed/simple;
	bh=OpwhBIBLUR7KZYGf1JS5ByHHeMy5ALtXFWlVVlrs1UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKu6VgG4ShDitzuDggmta80ZyUxYYIfwCQRmJsb1FbnqQ8gvsTGeTYQHeHGZcy3FP+4ouDC4xgITcZbDvRfHDgnAOqnYtbocUWEFj13UhaGxtsZkezsgl1zlZDo9w/GuQo+jQflAsA0k0z7bldElSSoPSW7yeXeS/7sJ5eFWHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvUAUn66; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvUAUn66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747034909; x=1778570909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OpwhBIBLUR7KZYGf1JS5ByHHeMy5ALtXFWlVVlrs1UM=;
  b=lvUAUn66tcYJLEbyElPOhMToOgI7ekNstVe7B8vohOpB7CBE7BO5HG2Q
   hsVevILU+a0S74Xz7kF6+BbOcUFymYX5k6cAOF5TDelv7m7aUpkn4e5Z7
   2uI2pAvP3MkO9KGeXc97VQASh4jiyQugfTmPTMVhpQjWuFLlodnbdQK0S
   Siw2LwbsSZqet+GKn8qDAz6irAbWk5VYjXUR46VXaLmLDuOdT7Ucb2qKl
   P1o4SKQMMBbaewsho5N0y7wpYTtpX9ZwVG0Ngmp5qndYVa7c3npWaoVKS
   ivTzGKyH9IFT6PTLmkBABUh78uV7lgOgrYsKk6c9MgQpVMtjtQAylM2hY
   w==;
X-CSE-ConnectionGUID: 5eXr2JAiSLmFt4W+KE9fFg==
X-CSE-MsgGUID: 1WLns+zpRvaTk5QOGBo+1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48742597"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48742597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:28:28 -0700
X-CSE-ConnectionGUID: 5/o3CDCpRq2+Y+cxe+xc2g==
X-CSE-MsgGUID: d8OohKBWTZ+rtZbLD8aoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142246382"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:28:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENaD-00000000qbV-3rOo;
	Mon, 12 May 2025 10:28:17 +0300
Date: Mon, 12 May 2025 10:28:17 +0300
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
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCGjEdNVH3ughITd@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-21-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> mailbox driver.

...

> -		if (is_of_node(dev_fwnode(dev)))
> +		if (is_of_node(dev_fwnode(dev))) {
>  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +		} else {

You probably want to have this as

		} else if (is_acpi_..._node()) { // you should decide if it is data, device or any type of ACPI node you match with

> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);
> +			dev_set_msi_domain(dev, msi_domain);
> +		}
>  	}

...

> +#ifdef CONFIG_ACPI
> +	if (!acpi_disabled)

Hmm... Why do you need this check? What for?

> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +#endif

-- 
With Best Regards,
Andy Shevchenko


