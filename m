Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69F275108
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226217; cv=none; b=bE3r8kyGj7toEEH3g7BM5EnYem0WP/HChwlFKVPaG6noHCXy0T7mvvVBo5IkBAyoJ4V/4TCT5X0u5gcFpN+LSi4u9h3GTl8jkyxr+fn9MMXX8e6fpWsuaIA5fvby2H/pPqZ0OPGBeQLurVEU0AZJStwv+z2LumbJYdNWXmPtsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226217; c=relaxed/simple;
	bh=eufx3So/bAnO7PD8ZJ8HOzPMI3sdrcaT1YO7Rhkhv4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtehAoXLg0RFrKwCA1SxNv2XN8E44p5+rDg2ElKjMK+ZJrFZjcqeCyuX7HOX7V7NLzUCX1xwGAJmhARAf4GZKt5flMIDivsGpCrm1mXQvmWW/uze5TTJVKx1W2PjEyRkkkTzApiWGL2EC/dyoMHgljhkMRMq3pcW+AHRhlSfNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8hxmmL/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8hxmmL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747226215; x=1778762215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eufx3So/bAnO7PD8ZJ8HOzPMI3sdrcaT1YO7Rhkhv4I=;
  b=h8hxmmL/t99NPhcG1d87Yx4+DfERiWR+zit6XH65NlPnTNkFDw01G/Cs
   Ya87PvILkIbabKStjHU2EIn8u1Z7T8ygn+CrEcNy1KLcAEyl5LzbOr7iS
   oXN6g2S7Xj8pNb+iUcbXdZh2L8uJFHdY7WCOWyWrjM1AH5ePGEBuk1cda
   OHDDN6gAF1c7B4cmIKZ67G99hTbre6wVZsU/aSW2hPHXrxY2NQV0xIZXR
   htVIg8xRV/l3Tx8SHV8k4hQ+Yjym4YyqtM6od1KV5w9kKj2ZWhIpBnoe1
   UYGZzsFdpyvdlAiZ9GELTy9j61ZOIbgdki95lwRa9IeDQVBiICB1ZqgYc
   Q==;
X-CSE-ConnectionGUID: AgRr2w+8RAiVG4sHXtNkOg==
X-CSE-MsgGUID: TD2xw8yPQXiTHST+092D1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49285751"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49285751"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:36:55 -0700
X-CSE-ConnectionGUID: A70/DbwxQd+xnTlEAGu4wQ==
X-CSE-MsgGUID: ZW3wGdvkShqN/PUiS37UWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="161319859"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:36:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uFBLt-00000001YCg-46UG;
	Wed, 14 May 2025 15:36:49 +0300
Date: Wed, 14 May 2025 15:36:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <aCSOYRJXaiJpch6u@smile.fi.intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514122432.4019606-2-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:
> With more and more drivers adopting to auxiliary bus infrastructure comes
> the need for managing resources at auxiliary device level. This is useful
> for cases where parent device shares variable number and type of resources
> with auxiliary child device but doesn't require any active involvement in
> managing them.
> 
> This reduces potential duplication of resource APIs that may be required by
> parent device driver. With this in place parent driver will be responsible
> for filling up respective resources and its count in auxiliary device
> structure before registering it, so that the leaf drivers can utilize in
> their probe function. Lifecycle of these resources will be as long as the
> auxiliary device exists.

...

> +/**
> + * auxiliary_get_irq_optional - get an optional IRQ for auxiliary device
> + * @auxdev: auxiliary device
> + * @num: IRQ number index
> + *
> + * Gets an IRQ for a auxiliary device. Device drivers should check the return value
> + * for errors so as to not pass a negative integer value to the request_irq()
> + * APIs. This is the same as auxiliary_get_irq(), except that it does not print an
> + * error message if an IRQ can not be obtained.
> + *
> + * For example::
> + *
> + *		int irq = auxiliary_get_irq_optional(auxdev, 0);
> + *		if (irq < 0)
> + *			return irq;
> + *
> + * Return: non-zero IRQ number on success, negative error number on failure.
> + */
> +int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num)
> +{
> +	struct resource *r;
> +	int ret = -ENXIO;
> +
> +	r = auxiliary_get_resource(auxdev, IORESOURCE_IRQ, num);
> +	if (!r)
> +		goto out;
> +
> +	/*
> +	 * The resources may pass trigger flags to the irqs that need to be
> +	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
> +	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
> +	 */
> +	if (r->flags & IORESOURCE_BITS) {
> +		struct irq_data *irqd;
> +
> +		irqd = irq_get_irq_data(r->start);
> +		if (!irqd)
> +			goto out;
> +		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
> +	}
> +
> +	ret = r->start;
> +	if (WARN(!ret, "0 is an invalid IRQ number\n"))
> +		ret = -EINVAL;
> +out:
> +	return ret;
> +}

Please, do not inherit the issues that the respective platform device API has.
And after all, why do you need this? What's wrong with plain fwnode_irq_get()?

-- 
With Best Regards,
Andy Shevchenko


