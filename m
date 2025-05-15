Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57E1BC4E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314415; cv=none; b=KeZ6ZsLH5bJECE8+jchfk+65xSjMQY47ox0qgec34cHMmY90V/NbYp71LsmaewxCgk0tMTaTrPq5hYkBdEJiCvdX2WAcQBTNfHmvnUOSbJeujs8xsD90oB3bRKNlPSMMa3uIoX4lOBBfePtEfQjR8YPsHqqSLWcMzHmSZhtDXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314415; c=relaxed/simple;
	bh=iY5+BlIWovxYf/iGvLQru7GPXAbqKfyR+bMXSaRTJWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avTljXWY2AcO2Ujc80OHO2Tzq0lV1NQ21HaASeNL7dDYwgNBITacQ6A6qxoLMoGVtMXFXw5TGgJRa5PC5kJWZ29Z2zg/z8jT8NZHRyp9AT3i6TkuALhzd2nEo0blNqaoJCwMqLehhuC/GhwGASYN6Bh1c92anU1b2estCGS28Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naFWsYkx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naFWsYkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747314414; x=1778850414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iY5+BlIWovxYf/iGvLQru7GPXAbqKfyR+bMXSaRTJWU=;
  b=naFWsYkxB869aB8+D7pBGq4iWN8Hxi2eAjWdfHYJb17ToS9hTt18csGe
   pU2oftMKHjVKxDk8LLOetkwBxz0GjqSiT0fQZEHCind1DXpT4ikv5/NGo
   eW2uXeLbDB8XYopjWxmtJcGTZr2VPe7Rh2JEdG1jv3L83dbtAgabp1+ne
   ZrlsjFUr2Py1NxixWilKlSUJsJLK5K4qxbjRbrVRtddHZkhq3nIrfQVf4
   JlSzxJQYIq6UE/c2f3Atc9iVn/6KRVKHHA1ywZH9z7rAcb03wd/Y0E30s
   zxyHUuXkmGWNHKVe9eDtcYD8NpbUrgRnQm4NqG219cus9CuQvzcGpvkFl
   w==;
X-CSE-ConnectionGUID: pk2uTP3fTAe9yz+DFpFxgQ==
X-CSE-MsgGUID: 2S2ytCHaSPyqwG5mxJR6TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66654107"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="66654107"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:06:52 -0700
X-CSE-ConnectionGUID: FK7s4aVKT9+LBovNnZMYQw==
X-CSE-MsgGUID: nnl9rMvLRsmKcf096lySSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139355706"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:06:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uFYIS-00000001qmt-0JeM;
	Thu, 15 May 2025 16:06:48 +0300
Date: Thu, 15 May 2025 16:06:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <aCXm566Uyyh45MZD@smile.fi.intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
 <aCSOYRJXaiJpch6u@smile.fi.intel.com>
 <aCXjltG40x9mJ25U@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXjltG40x9mJ25U@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 15, 2025 at 03:52:38PM +0300, Raag Jadav wrote:
> On Wed, May 14, 2025 at 03:36:49PM +0300, Andy Shevchenko wrote:
> > On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:

...

> > > +/**
> > > + * auxiliary_get_irq_optional - get an optional IRQ for auxiliary device
> > > + * @auxdev: auxiliary device
> > > + * @num: IRQ number index
> > > + *
> > > + * Gets an IRQ for a auxiliary device. Device drivers should check the return value
> > > + * for errors so as to not pass a negative integer value to the request_irq()
> > > + * APIs. This is the same as auxiliary_get_irq(), except that it does not print an
> > > + * error message if an IRQ can not be obtained.
> > > + *
> > > + * For example::
> > > + *
> > > + *		int irq = auxiliary_get_irq_optional(auxdev, 0);
> > > + *		if (irq < 0)
> > > + *			return irq;
> > > + *
> > > + * Return: non-zero IRQ number on success, negative error number on failure.
> > > + */
> > > +int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num)
> > > +{
> > > +	struct resource *r;
> > > +	int ret = -ENXIO;
> > > +
> > > +	r = auxiliary_get_resource(auxdev, IORESOURCE_IRQ, num);
> > > +	if (!r)
> > > +		goto out;
> > > +
> > > +	/*
> > > +	 * The resources may pass trigger flags to the irqs that need to be
> > > +	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
> > > +	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
> > > +	 */
> > > +	if (r->flags & IORESOURCE_BITS) {
> > > +		struct irq_data *irqd;
> > > +
> > > +		irqd = irq_get_irq_data(r->start);
> > > +		if (!irqd)
> > > +			goto out;
> > > +		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
> > > +	}
> > > +
> > > +	ret = r->start;
> > > +	if (WARN(!ret, "0 is an invalid IRQ number\n"))
> > > +		ret = -EINVAL;
> > > +out:
> > > +	return ret;
> > > +}
> > 
> > Please, do not inherit the issues that the respective platform device API has.
> > And after all, why do you need this? What's wrong with plain fwnode_irq_get()?
> 
> Can you please elaborate? Are we expecting fwnode to be supported by auxiliary
> device?

Platform IRQ getter is legacy for the board files, but it has support for fwnode.
Why do you need to inherit all that legacy? What's the point?

-- 
With Best Regards,
Andy Shevchenko


