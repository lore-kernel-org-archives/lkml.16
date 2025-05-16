Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40CE28136C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423210; cv=none; b=eC1KwpSRSV2wxNGN6xzJpQrQ8QkHThMkTsWRPDDvmn+eawrEsWifNalbQwkQCGBkmpNLL9YWMqurzYAl1uWKkcFDeuaY+ZwPMFsttn8M0bQpN5x/4h5oS54qdjplZJbxB7c5jgBtAxaJuzwilTYkVQ/9FtrwCgAPSA1TS2wvtic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423210; c=relaxed/simple;
	bh=yGk5vfAjLaJh07HlSBEUFFWjBHzsGIhNlLk3gY9zhjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6hD7LnNeAhOg1YfwSkVGdheI90d8Z/vddEoj/K+M4+N/ENjsSMwzSpcPZwak2RecayjE1WeAcrMQCdQdpEHHTv49ILxHmwiK3/36JeE75W+MRcNcG1vT3QkOytI9BaJdYCqtxblfzcQNshiyAA1POgZAXEbHl+IjWNHxceq1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBNPyR9/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBNPyR9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747423208; x=1778959208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yGk5vfAjLaJh07HlSBEUFFWjBHzsGIhNlLk3gY9zhjo=;
  b=UBNPyR9/VeiOzEA+iQYrBODobD+B85E5DkvKrjZIEU5vs7zxlKRKhFnZ
   pzTshGUj6d3VMB5tb53CUWDnlclTS0XzcXTRJ41JWMGgW+lxdlUJhyX6S
   Y1bfuunNRMehI8hhsTwy2n3PZm3ytct0ldYmVO+eZtcf1taaKwjqL3He+
   cQBPhQ7lBJFZBPiCCMvFZJxqzChjERRJyUtiWVIFhKflhPhHCZGHVnCeb
   coOhY5j5P4+RptwLACS4rhJkA1W0Hayy2J63lkQMJiYiMd3on6NBW1NPK
   SPuZbwFrEXxKRNe3VMqhBgD+sZHluVN3ZwWVyMixdGcnZypY7GYUlBfAZ
   w==;
X-CSE-ConnectionGUID: j3zJ+cLUTZWBnqedtP81eA==
X-CSE-MsgGUID: luJVD/YFRjq/nAgSvvn8Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49390985"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49390985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 12:20:07 -0700
X-CSE-ConnectionGUID: /ckJGpuoRjCOQwyI3n98lg==
X-CSE-MsgGUID: cSqBlaGkQoCa3Ca60B9SQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="138627383"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 12:20:05 -0700
Date: Fri, 16 May 2025 22:20:02 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <aCeP4l1VOVfhtQ09@black.fi.intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
 <aCSOYRJXaiJpch6u@smile.fi.intel.com>
 <aCXjltG40x9mJ25U@black.fi.intel.com>
 <aCXm566Uyyh45MZD@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXm566Uyyh45MZD@smile.fi.intel.com>

On Thu, May 15, 2025 at 04:06:47PM +0300, Andy Shevchenko wrote:
> On Thu, May 15, 2025 at 03:52:38PM +0300, Raag Jadav wrote:
> > On Wed, May 14, 2025 at 03:36:49PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > +/**
> > > > + * auxiliary_get_irq_optional - get an optional IRQ for auxiliary device
> > > > + * @auxdev: auxiliary device
> > > > + * @num: IRQ number index
> > > > + *
> > > > + * Gets an IRQ for a auxiliary device. Device drivers should check the return value
> > > > + * for errors so as to not pass a negative integer value to the request_irq()
> > > > + * APIs. This is the same as auxiliary_get_irq(), except that it does not print an
> > > > + * error message if an IRQ can not be obtained.
> > > > + *
> > > > + * For example::
> > > > + *
> > > > + *		int irq = auxiliary_get_irq_optional(auxdev, 0);
> > > > + *		if (irq < 0)
> > > > + *			return irq;
> > > > + *
> > > > + * Return: non-zero IRQ number on success, negative error number on failure.
> > > > + */
> > > > +int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num)
> > > > +{
> > > > +	struct resource *r;
> > > > +	int ret = -ENXIO;
> > > > +
> > > > +	r = auxiliary_get_resource(auxdev, IORESOURCE_IRQ, num);
> > > > +	if (!r)
> > > > +		goto out;
> > > > +
> > > > +	/*
> > > > +	 * The resources may pass trigger flags to the irqs that need to be
> > > > +	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
> > > > +	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
> > > > +	 */
> > > > +	if (r->flags & IORESOURCE_BITS) {
> > > > +		struct irq_data *irqd;
> > > > +
> > > > +		irqd = irq_get_irq_data(r->start);
> > > > +		if (!irqd)
> > > > +			goto out;
> > > > +		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
> > > > +	}
> > > > +
> > > > +	ret = r->start;
> > > > +	if (WARN(!ret, "0 is an invalid IRQ number\n"))
> > > > +		ret = -EINVAL;
> > > > +out:
> > > > +	return ret;
> > > > +}
> > > 
> > > Please, do not inherit the issues that the respective platform device API has.
> > > And after all, why do you need this? What's wrong with plain fwnode_irq_get()?
> > 
> > Can you please elaborate? Are we expecting fwnode to be supported by auxiliary
> > device?
> 
> Platform IRQ getter is legacy for the board files, but it has support for fwnode.
> Why do you need to inherit all that legacy? What's the point?

This is just to abstract get_resource(IRQ) which has been carved up by the
parent device. And since this is an auxiliary child device, I'm not sure if
we have a firmware to work with.

Please correct me if I've misunderstood your question.

Raag
