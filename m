Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008042AC17
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655539; cv=none; b=i5antS4z4AdVWnqmVFvU5HyqPR2YXLhNrcHWfH/k8Rd/N+60NBU4Wrv0/VN1Gs/6Y9uqCjf5hGu1FPKa1AVkhl8T0hSij4sRy8lIOtu0oDvveBGXc6N5Pkiv95EyDivTNdHaKJYTChU/uUic5uiiDlKea3Q4TpUf8dlt2o9fAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655539; c=relaxed/simple;
	bh=4PlCJQMTVNuYr5t+lsVIz7ILCsdtfIcwwaQ25lwmHVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/tTfzVQN8s8WwBWkaLFPV1LInBlhHwb5hK7/5xBfu0OpIaxIjwGv+msw0Pv1ULI4NS7YSEnuulWm++x5h1XYLajnLoJm360+J941lRsdsjwQHMZdUBaRaUBx3+yHS+2lk/3/j9BHk9bywQ7md6IJyltS5U1XIaxR0XvZHdITV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLgVKXa2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLgVKXa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747655538; x=1779191538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4PlCJQMTVNuYr5t+lsVIz7ILCsdtfIcwwaQ25lwmHVE=;
  b=nLgVKXa20YIFLOf3MIZ207yxBJivGhH85ahphayQnz6xjd4z+vyd9Rv9
   hQP2lH5VBItY1p4vHUsTyG7wAoYyH5fDLbgpQfV2YnXZdp40GE5k09tdR
   /y7NWOlLnh2x/YZuBydNcucNAc0ix+/vzZVaOseGWeNJWid76EKHFEFa6
   xE+v/M8cUNEsDl/ugfyHxy+YHvfkXUk1iSLCzRt0g1FdOJhTJSH56im/I
   RhfA8JVYrRU+QzWWCWyVrvOOJoRMVQCIJ1ETcNVJAi1pG6gGm0sswH6+l
   7GHINOy3Ix4eks8ANoRa6VckRqYOPoGqFdNz7DkeknG4GcjzgFVOkokc2
   w==;
X-CSE-ConnectionGUID: IwzNsHSkSr+qMXWFCsZb/Q==
X-CSE-MsgGUID: DH2y59HrSUqbHVt8c/Dhww==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60185714"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60185714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:52:17 -0700
X-CSE-ConnectionGUID: 4FKvdPvYQXCkcHTyasvBFQ==
X-CSE-MsgGUID: nsSCFqE3TvOQ35/HFTuy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144341198"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:52:15 -0700
Date: Mon, 19 May 2025 14:52:12 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <aCsbbC4GS3r5MrMf@black.fi.intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
 <aCSOYRJXaiJpch6u@smile.fi.intel.com>
 <aCXjltG40x9mJ25U@black.fi.intel.com>
 <aCXm566Uyyh45MZD@smile.fi.intel.com>
 <aCeP4l1VOVfhtQ09@black.fi.intel.com>
 <aCsLoWtIdfR5a2YS@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCsLoWtIdfR5a2YS@smile.fi.intel.com>

On Mon, May 19, 2025 at 01:44:49PM +0300, Andy Shevchenko wrote:
> On Fri, May 16, 2025 at 10:20:02PM +0300, Raag Jadav wrote:
> > On Thu, May 15, 2025 at 04:06:47PM +0300, Andy Shevchenko wrote:
> > > On Thu, May 15, 2025 at 03:52:38PM +0300, Raag Jadav wrote:
> > > > On Wed, May 14, 2025 at 03:36:49PM +0300, Andy Shevchenko wrote:
> > > > > On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > +int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num)
> > > > > > +{
> > > > > > +	struct resource *r;
> > > > > > +	int ret = -ENXIO;
> > > > > > +
> > > > > > +	r = auxiliary_get_resource(auxdev, IORESOURCE_IRQ, num);
> > > > > > +	if (!r)
> > > > > > +		goto out;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The resources may pass trigger flags to the irqs that need to be
> > > > > > +	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
> > > > > > +	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
> > > > > > +	 */
> > > > > > +	if (r->flags & IORESOURCE_BITS) {
> > > > > > +		struct irq_data *irqd;
> > > > > > +
> > > > > > +		irqd = irq_get_irq_data(r->start);
> > > > > > +		if (!irqd)
> > > > > > +			goto out;
> > > > > > +		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
> > > > > > +	}
> > > > > > +
> > > > > > +	ret = r->start;
> > > > > > +	if (WARN(!ret, "0 is an invalid IRQ number\n"))
> > > > > > +		ret = -EINVAL;
> > > > > > +out:
> > > > > > +	return ret;
> > > > > > +}
> > > > > 
> > > > > Please, do not inherit the issues that the respective platform device API has.
> > > > > And after all, why do you need this? What's wrong with plain fwnode_irq_get()?
> > > > 
> > > > Can you please elaborate? Are we expecting fwnode to be supported by auxiliary
> > > > device?
> > > 
> > > Platform IRQ getter is legacy for the board files, but it has support for fwnode.
> > > Why do you need to inherit all that legacy? What's the point?
> > 
> > This is just to abstract get_resource(IRQ) which has been carved up by the
> > parent device. And since this is an auxiliary child device, I'm not sure if
> > we have a firmware to work with.
> 
> To make get_resource() work, someone has to add those resources to the list.
> The question is, why do we need this for AUX devices? Are you expecting
> several IRQs to be dedicated for several devices (no sharing)? If now, why
> is the fwnode version of IRQ getter not enough?

With PCI type MFDs, MSIX would be a fair possibility, if not now atleast
in the future.

> > Please correct me if I've misunderstood your question.
> 
> For the memory and port resources it might be indeed needed to have a split.
> But then, since it's a lot of the copy from platform code, I would expect
> the common library for both rather than reinventing the wheel. To achieve
> that one might need to abstract away from the certain device container when
> handling resources (no platform_device nor auxiliary_device). Would that
> approach work?

Sure, let me explore this. Thanks for the suggestions.

Raag
