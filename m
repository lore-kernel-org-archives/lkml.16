Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9F26461F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102026; cv=none; b=FDnhJUfjkkv745T5auGaawaIDPKRvsZ2gMERsMreka2jn+rEVJzuC9zIUPtR1trU5KuzK7pmccnKjOxBZPCqjo5s6I8D0bdLN0vmLSNfhKeNHeK0Se4jDZ+VTerfp3HjafHj6+JpWrFgAnPCks/68V+gyFkgo7cJNQCF72K/M4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102026; c=relaxed/simple;
	bh=19EHsdE1bZ+YVYDU1b7eM0iQEptWpKohr3JWObLGJU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbj2FWFSk/DnyiIOemt7NdIHfGgzERw51Nr2OBdOYtoufsFARHURiXnLCCNzBaxwCUWakxObw2Th7UdWCt+nzqsv/hgqJSLmmGVMEftVCS6ZIgmt2T6k1881WHPCCKTsB+w9gzMYRf7hoeyAozydDVtMl5Apczo0S8IEPmbGsKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FT4NDH3Z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FT4NDH3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744102025; x=1775638025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=19EHsdE1bZ+YVYDU1b7eM0iQEptWpKohr3JWObLGJU0=;
  b=FT4NDH3ZQy8+0DvkKFndPMAZW8mHyynuk4one+UaATJLONRkXXdgdi8F
   AydzYNK9rTkbIvixUX1vR0Dkt2EKzPtQdeh6FOWPPFzv4c8okwLyCHcUr
   w5vwQ1vsb0MYf8yHObn26j7+eupCyR1wXlMuO8d2SRTApMP6JGWSXiLmj
   HaE0ssmJ9cfa13HqgijdgkIZCRRj0dB0WI9JCZ9oUQ/UqC6QN+st2OoQh
   RyHSAACXei76+LdTvpqmV2XrDA4EUw8TRruuXv3Yc4tzfvotin8OwzzSA
   XEP1IScyYR5H3TjUgk9GncZIOrKJd72UIEznqfetPqTiFcwrU7m63fgPq
   A==;
X-CSE-ConnectionGUID: /lxp0reaScG5mWxtNeN9uA==
X-CSE-MsgGUID: ahMaDdhVTN6sbj4/XJfDKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56501614"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="56501614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:47:04 -0700
X-CSE-ConnectionGUID: VvT5D5EVQI2xekrHRoD8+Q==
X-CSE-MsgGUID: OR77LEDTRhGT7AMDsqhqTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="165432588"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:47:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u24bk-0000000ALJg-0PSk;
	Tue, 08 Apr 2025 11:47:00 +0300
Date: Tue, 8 Apr 2025 11:46:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <Z_Tig8ElS5e_UN6I@smile.fi.intel.com>
References: <20250407074614.1665575-1-raag.jadav@intel.com>
 <Z_OQgqt0Wg17N05j@smile.fi.intel.com>
 <Z_TXDg67AtWzNXbg@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_TXDg67AtWzNXbg@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 10:58:06AM +0300, Raag Jadav wrote:
> On Mon, Apr 07, 2025 at 11:44:50AM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 01:16:14PM +0530, Raag Jadav wrote:

...

> > > PS: I'm leaning towards not doing any of the ioremap or regmap on MFD
> > > side and think that we should enforce child devices to not overlap.
> > 
> > Yes, but we will have the cases in the future, whatever,
> > for the first step it's okay.
> 
> I've always found such devices to have a parent specific functionality
> that fall under a specific subsystem instead of needing a generic MFD for
> it. But I'd love to be surprised.

We have very "nice" MFD user, which blows up all issues with shared resources
and so on, look at drivers/mfd/sm501.c. The most problematic part there is
request_region().

> > > If there's a need to handle common register access by parent device,
> > > then I think it warrants its own driver which adds auxiliary devices
> > > along with a custom interface to communicate with them, and MFD on
> > > AUX is not the right solution for it.

...

> > > -static const struct device_type mfd_dev_type = {
> > > -	.name	= "mfd_device",
> > > +enum mfd_dev {
> > > +	MFD_AUX_DEV,
> > > +	MFD_PLAT_DEV,
> > > +	MFD_MAX_DEV
> > > +};
> > > +
> > > +static const struct device_type mfd_dev_type[MFD_MAX_DEV] = {
> > > +	[MFD_AUX_DEV]	= { .name = "mfd_auxiliary_device" },
> > > +	[MFD_PLAT_DEV]	= { .name = "mfd_platform_device" },
> > >  };
> > 
> > This is likely an ABI breakage if anything looks in sysfs for mfd_device.
> 
> I have no insight on the usecase here. Can you please elaborate?

drivers/base/core.c

        if (dev->type && dev->type->name)
		add_uevent_var(env, "DEVTYPE=%s", dev->type->name);

You broke ABI, it's no go.

...

> > > +/*
> > > + * Common structure between MFD parent and auxiliary child device.
> > > + * To be used by leaf drivers to access child device resources.
> > > + */
> > > +struct mfd_aux_device {
> > > +	struct auxiliary_device auxdev;
> > 
> > > +	struct resource	mem;
> > > +	struct resource	irq;
> > > +	/* Place holder for other types */
> > > +	struct resource	ext;
> > 
> > Why this can't be simply a VLA?
> 
> Because it requires resouce identification, and with that we're back to
> platform style get_resource() and friends.

Yes, and it can be done by calling resource_type() over each and checked
respectively. So, why do you need them to open code?

> > > +};

-- 
With Best Regards,
Andy Shevchenko


