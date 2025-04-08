Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481EC21931E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099094; cv=none; b=muDVATs04mUJuGc4tNehMVWNpfhJCb/a5y4JwNi+acptmbwpGrKwVQL1z04jvogGaHh+Tv1V5BwUIJ7Zxu28XTc5cERy32F5yZIgoxTHYfwApklIj1btr3nI2k+5ZhyWqu1nhE8ot0BI/uPkLT9PUgzjY6xZILoy1aqOfFGT3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099094; c=relaxed/simple;
	bh=NYsavnI/UfdEt+Q1VowIu/E6JxLGxXNS9SLj83N1hoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHNpWM9ll56c2VWa6g7hotmd0H56u7V+5ep4luPEa/wWLzL8rItRBkCy+QC/F7vPuSz9GOlbwplUw0pUNMaH6T43lz/fppMD802VHvVFHcEvxEFRvZFpGLa4T/uVvKdufrUKM+aN4onKxgQFc3h4ENApMEVXSkpIOwtFmSg5yis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJB90ZMJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJB90ZMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744099092; x=1775635092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NYsavnI/UfdEt+Q1VowIu/E6JxLGxXNS9SLj83N1hoI=;
  b=lJB90ZMJXKNdipPc/PQd6Cs6cp+Ofwk6JDR8LDSgCyGBIAyfE2IS9091
   Il1dDtB/Mpv4aRWHxXAZCTZC2C7asW4kGR5n05o1vI6/aJUOLa1qp+eZV
   YNV8vK7JdUtiwcIVBfHcipRcwIuUG6eNriTXnPyk8RfSh+fA4qmwAx4fx
   ugH14+BWZgkof9QcxYpwQD1xnxi2M8nG/8v5/skm+YJyNNmkeARaU7Kso
   ul9u8RXSKWO80+bCo+A4lsbRxCca9QsnHcnilpb77xvnrN7arbY1eTba/
   AvkJyybM0qBqGaALX0KaHwdOemdLbqYftps+SNfe4o8dMjxNTxOlx2DfK
   A==;
X-CSE-ConnectionGUID: D4lZcqI9RlKcg6ui1NUI2w==
X-CSE-MsgGUID: msvLYuq6TrKSBbf2N0LAPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45651520"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45651520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 00:58:12 -0700
X-CSE-ConnectionGUID: QP2YyV8fSxaPMfEtUnMWQg==
X-CSE-MsgGUID: RDmS4KDTTXy8jF5EJJavWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="133390649"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 00:58:09 -0700
Date: Tue, 8 Apr 2025 10:58:06 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <Z_TXDg67AtWzNXbg@black.fi.intel.com>
References: <20250407074614.1665575-1-raag.jadav@intel.com>
 <Z_OQgqt0Wg17N05j@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_OQgqt0Wg17N05j@smile.fi.intel.com>

On Mon, Apr 07, 2025 at 11:44:50AM +0300, Andy Shevchenko wrote:
> On Mon, Apr 07, 2025 at 01:16:14PM +0530, Raag Jadav wrote:
> > Extend MFD subsystem to support auxiliary child device. This is useful
> > for MFD usecases where parent device is on a discoverable bus and doesn't
> > fit into the platform device criteria. Purpose of this implementation is
> > to provide discoverable MFDs just enough infrastructure to register
> > independent child devices with their own memory and interrupt resources
> > without abusing the platform device.
> > 
> > Current support is limited to just PCI type MFDs, but this can be further
> > extended to support other types like USB in the future.
> 
> > PS: I'm leaning towards not doing any of the ioremap or regmap on MFD
> > side and think that we should enforce child devices to not overlap.
> 
> Yes, but we will have the cases in the future, whatever,
> for the first step it's okay.

I've always found such devices to have a parent specific functionality
that fall under a specific subsystem instead of needing a generic MFD for
it. But I'd love to be surprised.

> > If there's a need to handle common register access by parent device,
> > then I think it warrants its own driver which adds auxiliary devices
> > along with a custom interface to communicate with them, and MFD on
> > AUX is not the right solution for it.
> 
> ...
> 
> > -static const struct device_type mfd_dev_type = {
> > -	.name	= "mfd_device",
> > +enum mfd_dev {
> > +	MFD_AUX_DEV,
> > +	MFD_PLAT_DEV,
> > +	MFD_MAX_DEV
> > +};
> > +
> > +static const struct device_type mfd_dev_type[MFD_MAX_DEV] = {
> > +	[MFD_AUX_DEV]	= { .name = "mfd_auxiliary_device" },
> > +	[MFD_PLAT_DEV]	= { .name = "mfd_platform_device" },
> >  };
> 
> This is likely an ABI breakage if anything looks in sysfs for mfd_device.

I have no insight on the usecase here. Can you please elaborate?

> > +static int mfd_remove_devices_fn(struct device *dev, void *data)
> > +{
> > +	if (dev->type == &mfd_dev_type[MFD_AUX_DEV])
> > +		return mfd_remove_auxiliary_device(dev);
> 
> > +	else if (dev->type == &mfd_dev_type[MFD_PLAT_DEV])
> 
> Redundant 'else'
> 
> > +		return mfd_remove_platform_device(dev, data);
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +#ifndef MFD_AUX_H
> > +#define MFD_AUX_H
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/ioport.h>
> 
> > +#include <linux/types.h>
> 
> How is this one being used?

Ah, since it's not so easy to come across a file without a type, I've grown
a habit of throwing this in without a thought. Thanks for catching it.

> > +#define auxiliary_dev_to_mfd_aux_dev(auxiliary_dev) \
> > +	container_of(auxiliary_dev, struct mfd_aux_device, auxdev)
> 
> Missing container_of.h and better to define after the data type as it can be
> converted to static inline, if required.

Sure.

> > +/*
> > + * Common structure between MFD parent and auxiliary child device.
> > + * To be used by leaf drivers to access child device resources.
> > + */
> > +struct mfd_aux_device {
> > +	struct auxiliary_device auxdev;
> 
> > +	struct resource	mem;
> > +	struct resource	irq;
> > +	/* Place holder for other types */
> > +	struct resource	ext;
> 
> Why this can't be simply a VLA?

Because it requires resouce identification, and with that we're back to
platform style get_resource() and friends.

> > +};
> > +
> > +#endif
> 
> ...
> 
> > +/* TODO: Convert the platform device abusers and remove this flag */
> > +#define MFD_AUX_TYPE	INT_MIN
> 
> INT_MIN?! This is a bit unintuitive. BIT(31) sounds better to me.
> Or even a plain (decimal) number as PLATFORM_DEVID_* done, for example.

I thought a specific number would rather raise more questions, but sure.

Raag
