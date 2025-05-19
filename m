Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0EC3D561
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651497; cv=none; b=hhtx97Rfd16tHPdspHY4/X9NFaTJD1E4L49f7tsruyMNmDSxE16bphcp4eVJRxAJ4EJxmE20tY2X1SuA1s2RSBcpuS1AT3I8FvLeP1FcXYs2sPzpx6tlPvzshZwfNZ1ndsd3j40XQaNMEKbVjmnec/+MMDBeqs9YPhnDJ+ijC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651497; c=relaxed/simple;
	bh=gaeeg4AZ+lnFMTRX9LYEB5rgp1XvsIMBR3topG8ZD4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2L6spu6CqkrK78YtlmLOt1Rmbtlk22pym7NpJoCbEND8XqQwDQWOGKNABSuA4hYbSezUPReyqEdNeg5vsgVqbb0E1zdaJ0gzOL6bV1fPl9xBeYk3qw94ii0A6gmp+9VOrpBGIhkjyrDlgMNQORFrJ7xY7+pcurrUdwpLyFOIlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLg+rtqU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLg+rtqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747651496; x=1779187496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gaeeg4AZ+lnFMTRX9LYEB5rgp1XvsIMBR3topG8ZD4g=;
  b=DLg+rtqUW6oWbcfz3neLPCqSPsAMcLYf//w/Zb2Fnd1vwdpPoMj3CThv
   oeT88bRYJlzA4j0i6nuQw7VkJnLZ3BsJquffYWN2el+x6PQ72/XWjwqU3
   HpQ8VDPtl0TnlI1H0z7nf/arESyq+RvFgtbDxhhItrDIDwBAo3Oyxeph9
   ilRAKTqNsTOrB9VdF5q4wLt+oDQn47VwcmPs6GJEbwbpZ4u75Zg9wPzkw
   LbES/B7Exy0U2A5hgoxanWCqJKgZG2h3RzXooZO0p1raPIKgmRpYd0wYu
   uL1zAYioHH80KTm2cY3lfxXhQ3SiUUXvOmb3M8r0JR/L/IWgzSooPgHft
   g==;
X-CSE-ConnectionGUID: e/oOcomLTFqblZ753ZiiaQ==
X-CSE-MsgGUID: B0/4Yf42S2OETX6hlVo2KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="72052719"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="72052719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 03:44:55 -0700
X-CSE-ConnectionGUID: 93unAF41QoqD8Rv98q8pCQ==
X-CSE-MsgGUID: zeaOZt91Suu/XqNIkeU2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139177306"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 03:44:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGxzG-00000002zP1-07li;
	Mon, 19 May 2025 13:44:50 +0300
Date: Mon, 19 May 2025 13:44:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <aCsLoWtIdfR5a2YS@smile.fi.intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
 <aCSOYRJXaiJpch6u@smile.fi.intel.com>
 <aCXjltG40x9mJ25U@black.fi.intel.com>
 <aCXm566Uyyh45MZD@smile.fi.intel.com>
 <aCeP4l1VOVfhtQ09@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCeP4l1VOVfhtQ09@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 16, 2025 at 10:20:02PM +0300, Raag Jadav wrote:
> On Thu, May 15, 2025 at 04:06:47PM +0300, Andy Shevchenko wrote:
> > On Thu, May 15, 2025 at 03:52:38PM +0300, Raag Jadav wrote:
> > > On Wed, May 14, 2025 at 03:36:49PM +0300, Andy Shevchenko wrote:
> > > > On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:

...

> > > > > +int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num)
> > > > > +{
> > > > > +	struct resource *r;
> > > > > +	int ret = -ENXIO;
> > > > > +
> > > > > +	r = auxiliary_get_resource(auxdev, IORESOURCE_IRQ, num);
> > > > > +	if (!r)
> > > > > +		goto out;
> > > > > +
> > > > > +	/*
> > > > > +	 * The resources may pass trigger flags to the irqs that need to be
> > > > > +	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
> > > > > +	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
> > > > > +	 */
> > > > > +	if (r->flags & IORESOURCE_BITS) {
> > > > > +		struct irq_data *irqd;
> > > > > +
> > > > > +		irqd = irq_get_irq_data(r->start);
> > > > > +		if (!irqd)
> > > > > +			goto out;
> > > > > +		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
> > > > > +	}
> > > > > +
> > > > > +	ret = r->start;
> > > > > +	if (WARN(!ret, "0 is an invalid IRQ number\n"))
> > > > > +		ret = -EINVAL;
> > > > > +out:
> > > > > +	return ret;
> > > > > +}
> > > > 
> > > > Please, do not inherit the issues that the respective platform device API has.
> > > > And after all, why do you need this? What's wrong with plain fwnode_irq_get()?
> > > 
> > > Can you please elaborate? Are we expecting fwnode to be supported by auxiliary
> > > device?
> > 
> > Platform IRQ getter is legacy for the board files, but it has support for fwnode.
> > Why do you need to inherit all that legacy? What's the point?
> 
> This is just to abstract get_resource(IRQ) which has been carved up by the
> parent device. And since this is an auxiliary child device, I'm not sure if
> we have a firmware to work with.

To make get_resource() work, someone has to add those resources to the list.
The question is, why do we need this for AUX devices? Are you expecting
several IRQs to be dedicated for several devices (no sharing)? If now, why
is the fwnode version of IRQ getter not enough?

> Please correct me if I've misunderstood your question.

For the memory and port resources it might be indeed needed to have a split.
But then, since it's a lot of the copy from platform code, I would expect
the common library for both rather than reinventing the wheel. To achieve
that one might need to abstract away from the certain device container when
handling resources (no platform_device nor auxiliary_device). Would that
approach work?

-- 
With Best Regards,
Andy Shevchenko


