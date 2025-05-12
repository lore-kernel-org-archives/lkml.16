Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F55257436;
	Mon, 12 May 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039446; cv=none; b=p41qb4KA/qUntD2oFpkcgqORB4BimTM7jSY8nD+sNV9wxqj9iZAkTUhu2KwYc0/tO9qZXeOV9VBf7eKd/NrsqjNBnj+bsRIkfr2133lv9gdl57Gm1AgT6rb/uIMjRsVpITDTNozaMCvK8WPSRIB07aJsaGsvWCcp9gjwcYx9ZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039446; c=relaxed/simple;
	bh=aO0nrrJS8HORN2b0dkbOEnZb76TM/1Rz49FnYj/O6R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d82B4qJN2DNjm0NHVNDIWalk5xp0rhLa1dIbn7F1hBwemRlb4ZOlkYocKURv4P7EXjLkPezEZSLbaOZIX8g3sf2O9VdaccnGaNesjZlTQuYgt9hQt+gH6E/3R6OqIKZ8wXxRtfu+pZVB6ENwYwj5sWu+RKDjx9jBwlS/KIZmLX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUp0IBgq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUp0IBgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747039445; x=1778575445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aO0nrrJS8HORN2b0dkbOEnZb76TM/1Rz49FnYj/O6R4=;
  b=IUp0IBgqWpQpPRkxkVT3VFolzu+GMmnOKZKxN0EZn10+3wK7c9tB80of
   IQJC8dk3e2wMf2/2IpOneynGxeLBC8FcDWQMTOoD5Yb+NyBcJd14NG6ak
   chdSqk4pE+XszP26nJF5xp5hNNjxAzHMoyOklEl+0iO0WqJpnNX1Me159
   M0vn/myo/vuPEuF4f7J0UEShnbKJtuhRne+yHLrft2ndKQfjnjucna74b
   ZGUZzyNwA7e9/YoD2pl1Smv7hnGVBc4nQy0HEl4hqUOCbWGSbgkqGOqXX
   Q2Gj1cVNp7I0xvt4D6/6OXu7vBu4kGUpZ5XJA9NGid3tO+uUotokM5jTl
   Q==;
X-CSE-ConnectionGUID: 7JmZqgajTD+b2mFLsFXJOQ==
X-CSE-MsgGUID: 34tskvRBRWyYWjS6+E3ohQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48901664"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48901664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:44:04 -0700
X-CSE-ConnectionGUID: sVxN3AVHRf2RESn32JKGZQ==
X-CSE-MsgGUID: nsx9lkCuRn6kBHgYj8UcUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137205262"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:43:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEOlO-00000000rhm-1X7N;
	Mon, 12 May 2025 11:43:54 +0300
Date: Mon, 12 May 2025 11:43:54 +0300
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
Subject: Re: [PATCH v3 14/23] ACPI: property: Refactor
 acpi_fwnode_get_reference_args()
Message-ID: <aCG0ykZt-DcEG2kr@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-15-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-15-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 11, 2025 at 07:09:30PM +0530, Anup Patel wrote:
> 
> Currently acpi_fwnode_get_reference_args() calls the public function
> __acpi_node_get_property_reference() which ignores the nargs_prop
> parameter. To fix this, make __acpi_node_get_property_reference() to
> call the static acpi_fwnode_get_reference() so that callers of
> fwnode_get_reference_args() can still pass a valid property name to
> fetch the number of arguments.

...

> +static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
> +					  const char *prop, const char *nargs_prop,

Why prop and not propname?

> +					  unsigned int args_count, unsigned int index,
> +					  struct fwnode_reference_args *args)

...

> -	ret = acpi_data_get_property(data, propname, ACPI_TYPE_ANY, &obj);
> +	ret = acpi_data_get_property(data, prop, ACPI_TYPE_ANY, &obj);

Ditto.

Sounds like an unneeded churn.

>  	if (ret)
>  		return ret == -EINVAL ? -ENOENT : -EINVAL;

-- 
With Best Regards,
Andy Shevchenko


