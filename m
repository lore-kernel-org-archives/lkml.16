Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3227978D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313567; cv=none; b=fuXksucWIYgxjpeESSg7HiH6eQg9V2rSe5HwrjANWbf8VN8U1WSIE8yDvpYKKD9gnmcOcryIiZ2pOXi7XzBdq2w3YXxeUKTdLbZnkLpiPyHK94BVtDP3vqftKX5Xb9pDKr4I5nVBJseV8h2XjfnPRbI1O2rPryjAoQxCh4x9DOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313567; c=relaxed/simple;
	bh=r5wjZzZJdlRUNc8+awzmIOy8f4SQE+WWNZHaU5l2A44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYKbY7udc+ge7cZ+CrJQXMnFq75VVFp26NXCPOKeH10sBjVcU1/lrOCCFmkLIURdB36vpMR/oix3euuoqfIc4X4o63e4TjVCo2HV4bpCBbxzhNBmVgsPfHZyu2B4tXdpNxFPenaKqIjyw5eYoyXqe411HT8OhKkh2kDlKmg3GLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VY28uras; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VY28uras"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747313565; x=1778849565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r5wjZzZJdlRUNc8+awzmIOy8f4SQE+WWNZHaU5l2A44=;
  b=VY28urasbf/HTY6vLW4Wuk5mau/m1Y/krgu9EjuoojIIcDTxm5C4Ur89
   sK64RGMIPC6fdRR3NwYC16q5dOSoTlKqAAGYjWz5O+WbYESWesNIYt5/v
   nN/Or5RLd+l/hdEjyFx9MRsF/JC0kTRKpN3qe83M11j8/ii5gcoEKENXC
   vUJzAa1j9/50XLJLycgREAyDW60rKnaKMzWqi6k4cUbIlpTZyF+7lUecz
   PyIQ+CiSog120i2qMQHMu9Myd4RCbrZei7BPWz/7BSvi0GYeICCFCrjOk
   f3OIp3uYs76lTddNulisUNtmk65tcAJU6oyNtD48ympgDdc4Qk7vGd07o
   Q==;
X-CSE-ConnectionGUID: lzVBvqRoTWO7QbdJXs5HKw==
X-CSE-MsgGUID: AUFjldMRTV6XYcmqutG9pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60584354"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60584354"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:52:44 -0700
X-CSE-ConnectionGUID: PYgcxN/8R4SdFxS/EDLrYA==
X-CSE-MsgGUID: k374LrxXSLiWziX7G9pQ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138225381"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:52:43 -0700
Date: Thu, 15 May 2025 15:52:38 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <aCXjltG40x9mJ25U@black.fi.intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
 <aCSOYRJXaiJpch6u@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCSOYRJXaiJpch6u@smile.fi.intel.com>

On Wed, May 14, 2025 at 03:36:49PM +0300, Andy Shevchenko wrote:
> On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:
> > With more and more drivers adopting to auxiliary bus infrastructure comes
> > the need for managing resources at auxiliary device level. This is useful
> > for cases where parent device shares variable number and type of resources
> > with auxiliary child device but doesn't require any active involvement in
> > managing them.
> > 
> > This reduces potential duplication of resource APIs that may be required by
> > parent device driver. With this in place parent driver will be responsible
> > for filling up respective resources and its count in auxiliary device
> > structure before registering it, so that the leaf drivers can utilize in
> > their probe function. Lifecycle of these resources will be as long as the
> > auxiliary device exists.
> 
> ...
> 
> > +/**
> > + * auxiliary_get_irq_optional - get an optional IRQ for auxiliary device
> > + * @auxdev: auxiliary device
> > + * @num: IRQ number index
> > + *
> > + * Gets an IRQ for a auxiliary device. Device drivers should check the return value
> > + * for errors so as to not pass a negative integer value to the request_irq()
> > + * APIs. This is the same as auxiliary_get_irq(), except that it does not print an
> > + * error message if an IRQ can not be obtained.
> > + *
> > + * For example::
> > + *
> > + *		int irq = auxiliary_get_irq_optional(auxdev, 0);
> > + *		if (irq < 0)
> > + *			return irq;
> > + *
> > + * Return: non-zero IRQ number on success, negative error number on failure.
> > + */
> > +int auxiliary_get_irq_optional(struct auxiliary_device *auxdev, unsigned int num)
> > +{
> > +	struct resource *r;
> > +	int ret = -ENXIO;
> > +
> > +	r = auxiliary_get_resource(auxdev, IORESOURCE_IRQ, num);
> > +	if (!r)
> > +		goto out;
> > +
> > +	/*
> > +	 * The resources may pass trigger flags to the irqs that need to be
> > +	 * set up. It so happens that the trigger flags for IORESOURCE_BITS
> > +	 * correspond 1-to-1 to the IRQF_TRIGGER* settings.
> > +	 */
> > +	if (r->flags & IORESOURCE_BITS) {
> > +		struct irq_data *irqd;
> > +
> > +		irqd = irq_get_irq_data(r->start);
> > +		if (!irqd)
> > +			goto out;
> > +		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
> > +	}
> > +
> > +	ret = r->start;
> > +	if (WARN(!ret, "0 is an invalid IRQ number\n"))
> > +		ret = -EINVAL;
> > +out:
> > +	return ret;
> > +}
> 
> Please, do not inherit the issues that the respective platform device API has.
> And after all, why do you need this? What's wrong with plain fwnode_irq_get()?

Can you please elaborate? Are we expecting fwnode to be supported by auxiliary
device?

Raag
