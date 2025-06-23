Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E558230BCB;
	Mon, 23 Jun 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670067; cv=none; b=hv7sVJGJXPFNuGDs54V9/4NfN6yIu/1vInAS1nEu8MCmhsEpHXlSp4URwN8+BKpQkkzEitonO68sgxdQEPr0kPcMFtGDzUH3LUg4vQ0SRZF1Pbg/KGhtgj38SfwAj6yV5BLZvYozFx3i7YEVDQbRb8HSWUbzg8234JNM3sp0Y0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670067; c=relaxed/simple;
	bh=eIeY3heN+gnrpZQU6Tbcw37VApX8DZLMbgNPQw+j5oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b94k48Mja8JBcxkupEgRrPFFEeR6LgElEFtBeXABQyWCSIHdfgCAxdADgTPpH2oTrr+WkLdP3lYkFhSQBQEezvdj85dF+AFet1f7222ofomsxtsUgVpH3Z5Sjn7/DPXifRFS1e+5PdjWDuZts18rS0h/wgydFfPuaIjCQ02haxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9+TxHmB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9+TxHmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750670066; x=1782206066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eIeY3heN+gnrpZQU6Tbcw37VApX8DZLMbgNPQw+j5oI=;
  b=M9+TxHmB9wMgmsHBBpmUDchcKOU6YAl3mI8DuUGWfIicDk19tplmuc1v
   73lH+yr47P0JZkrvf3oxSye32TQ9TrT+l0wmH0ko8ND85Y1swOhHzskYq
   o4u+ZXEURzBD7KwqocIhCCiseqejnqr31hfGeEPBsVvgyc4s9V5hr7Xrj
   BGKTGIrehIqSjGclcx6oYOf+D/mGYtjBgLu67CNoRak3IjaJwFb687tnv
   HkguNDEAYNeb3g2e66UTmQCHafHM16G4FZec7/HT3i6fM5Dy+uwoG3gXq
   RpEjbxd2UyYTw9600vohNowxr+y1hOFyJD0monrkhGARvE6zI7XHrZ9Cr
   w==;
X-CSE-ConnectionGUID: lRLPUT1fTqSYrRuoXbqzGw==
X-CSE-MsgGUID: YSNtN8uSR6GjswPq2vbwzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="75401274"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="75401274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:14:18 -0700
X-CSE-ConnectionGUID: e4ekD39qTday9sIFTi7Scg==
X-CSE-MsgGUID: 9gtBh0Q9Tb6PnnFaBaRxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155846754"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:14:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTdFf-000000097Qy-3DMk;
	Mon, 23 Jun 2025 12:14:07 +0300
Date: Mon, 23 Jun 2025 12:14:07 +0300
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
Subject: Re: [PATCH v6 14/23] ACPI: property: Add support for cells property
Message-ID: <aFka3y1494LIzyUA@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-15-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-15-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 18, 2025 at 05:43:49PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> Currently, ACPI doesn't support cells property when
> fwnode_property_get_reference_args() is called. ACPI always expects
> the number of arguments to be passed. However, the above mentioned
> call being a common interface for OF and ACPI, it is better to have
> single calling convention which works for both. Hence, add support
> for cells property on the reference device to get the number of
> arguments dynamically.

...

> +static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
> +					       const char *nargs_prop)
> +{
> +	const union acpi_object *obj;

> +	if (!nargs_prop)
> +		return 0;

This check is implied by the call. No need to duplicate.

> +	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
> +		return 0;
> +
> +	return obj->integer.value;
> +}

...

> +			if (nargs_prop)

Again, if you don't won't to reassign the existing value, it's better to have
this data be collected in the temporary variable of the same semantics. Then
you will choose one when it's needed, no need to have this dup check (again!).

> +				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
> +
>  			element++;
>  
>  			ret = acpi_get_ref_args(idx == index ? args : NULL,

...

> +			if (nargs_prop) {

Ditto.

> +				device = to_acpi_device_node(ref_fwnode);
> +				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
> +			}

-- 
With Best Regards,
Andy Shevchenko


