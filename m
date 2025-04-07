Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BEA22839A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015497; cv=none; b=ZXWmH2CzM+4A4h6MeegLFzU7ZvW+y8NpQoJIBTXavPRKc4jgWDgVCGIcWtYM2OFY4ltAg5VPQvKSKdr9yjQUwsUSbG7QJeIYjZPtGDr1Qj0hj+OelqXlhzl2k0AK34JBe0wS/pG0gcqLGZvmEZnZYPtf0k1u9XNCknkwz+vybhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015497; c=relaxed/simple;
	bh=UwG4iB0QJTrTL3JA9VwY8ryDwSX0/0MQ9rGG+WV6dfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYBevdv2uxV6MOdaFlvRiz6MH5TqaWbPh4CSSWmIu6L6mqOp0ylilm+W//zLXiDjKtG9wThtuGykkHQIeNy9kOYcRHprRQlxo91fYuJnWq+BdK6r8hhsuXoMRz0PxtbHLMGUiK1De/DkJWmP2IeXlCSWecTUG6ix/uM602PVP10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDyhRm7z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDyhRm7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744015495; x=1775551495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UwG4iB0QJTrTL3JA9VwY8ryDwSX0/0MQ9rGG+WV6dfw=;
  b=kDyhRm7zCPBXQfvja0/FRhRZsJDXmxIsJ+pd/BYJkr18K6ZpvM59Q1Pl
   PC2ZnIeoyENkAkMBIyjwhGJyn6VvruCb3OGkn0RM9xpE2p6TngGCtduQX
   5R9CYi5Y5AWnoiw+Doth0U7II6M4cCnhuZVeFULtx6oxZy7fo6N0K89hn
   IBknbWiBDk0Uq4Rbv0nXBptDS5Pp2pIFdlbryBERFQ1MqXD+CZfJRvtU+
   q6WBHtOT1WvluAUGFy3IgFa5g7KzS7hmV+tdc7k2z7bZ55/xs+yL9+4NW
   b3RljX3STBhzvDXWBJqhlgWcASuG7pgLYi1jgZBzkXy1/aA5wl08H5Xck
   A==;
X-CSE-ConnectionGUID: x7MHx3eCQa2M9Qu7Gy53Vw==
X-CSE-MsgGUID: lwVs543/T/GQ2G8q3Wm/EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="55575079"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="55575079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:44:54 -0700
X-CSE-ConnectionGUID: oXOIbh4aTziRJyDAzdTpvw==
X-CSE-MsgGUID: HGVje88PRheS7velL4c+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="158853432"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:44:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1i66-0000000A0VG-1NSC;
	Mon, 07 Apr 2025 11:44:50 +0300
Date: Mon, 7 Apr 2025 11:44:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <Z_OQgqt0Wg17N05j@smile.fi.intel.com>
References: <20250407074614.1665575-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407074614.1665575-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 01:16:14PM +0530, Raag Jadav wrote:
> Extend MFD subsystem to support auxiliary child device. This is useful
> for MFD usecases where parent device is on a discoverable bus and doesn't
> fit into the platform device criteria. Purpose of this implementation is
> to provide discoverable MFDs just enough infrastructure to register
> independent child devices with their own memory and interrupt resources
> without abusing the platform device.
> 
> Current support is limited to just PCI type MFDs, but this can be further
> extended to support other types like USB in the future.

> PS: I'm leaning towards not doing any of the ioremap or regmap on MFD
> side and think that we should enforce child devices to not overlap.

Yes, but we will have the cases in the future, whatever,
for the first step it's okay.

> If there's a need to handle common register access by parent device,
> then I think it warrants its own driver which adds auxiliary devices
> along with a custom interface to communicate with them, and MFD on
> AUX is not the right solution for it.

...

> -static const struct device_type mfd_dev_type = {
> -	.name	= "mfd_device",
> +enum mfd_dev {
> +	MFD_AUX_DEV,
> +	MFD_PLAT_DEV,
> +	MFD_MAX_DEV
> +};
> +
> +static const struct device_type mfd_dev_type[MFD_MAX_DEV] = {
> +	[MFD_AUX_DEV]	= { .name = "mfd_auxiliary_device" },
> +	[MFD_PLAT_DEV]	= { .name = "mfd_platform_device" },
>  };

This is likely an ABI breakage if anything looks in sysfs for mfd_device.

...

> +static int mfd_remove_devices_fn(struct device *dev, void *data)
> +{
> +	if (dev->type == &mfd_dev_type[MFD_AUX_DEV])
> +		return mfd_remove_auxiliary_device(dev);

> +	else if (dev->type == &mfd_dev_type[MFD_PLAT_DEV])

Redundant 'else'

> +		return mfd_remove_platform_device(dev, data);
> +
> +	return 0;
> +}

...

> +#ifndef MFD_AUX_H
> +#define MFD_AUX_H
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/ioport.h>

> +#include <linux/types.h>

How is this one being used?

> +#define auxiliary_dev_to_mfd_aux_dev(auxiliary_dev) \
> +	container_of(auxiliary_dev, struct mfd_aux_device, auxdev)

Missing container_of.h and better to define after the data type as it can be
converted to static inline, if required.

> +/*
> + * Common structure between MFD parent and auxiliary child device.
> + * To be used by leaf drivers to access child device resources.
> + */
> +struct mfd_aux_device {
> +	struct auxiliary_device auxdev;

> +	struct resource	mem;
> +	struct resource	irq;
> +	/* Place holder for other types */
> +	struct resource	ext;

Why this can't be simply a VLA?

> +};
> +
> +#endif

...

> +/* TODO: Convert the platform device abusers and remove this flag */
> +#define MFD_AUX_TYPE	INT_MIN

INT_MIN?! This is a bit unintuitive. BIT(31) sounds better to me.
Or even a plain (decimal) number as PLATFORM_DEVID_* done, for example.

-- 
With Best Regards,
Andy Shevchenko


