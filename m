Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328F1D63FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120479; cv=none; b=diZmuyqMtJlHN5PLEDyL1jzt9dgF9xNCzJ25j/Y0dAIqWUbgj4piKcjQpIX8EvlQ4XVcoar79OfFJwHY1JoRRMqCRN/tRCmgcUvC4gN4APmieFPaCISASxtEg2sP8BPfQW80igqno1ujMpaOmseLldOfzbFIOp7RTp7rJiwX/0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120479; c=relaxed/simple;
	bh=b5g0dme1oNZcQ0RJfVPOMuX2htls8JlEODcOXHFaMbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+l5M1632lslW+bWbdzFmROWC3KfEw2austcbgrfv4Kt4hKOwUC/BeCj6HlAgURHBUVvFWDYn8D723YveRC03jyvNGf9E6ppbAWjo1xfJzPi52tEWns343OxqdiNCoErdd5B7A/QFzZVBVe60ARFkrvQ+RYZb2R5EHI2x56CU2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUskq5th; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUskq5th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120478; x=1775656478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5g0dme1oNZcQ0RJfVPOMuX2htls8JlEODcOXHFaMbI=;
  b=bUskq5thtCUgSBDf3n35sb2ft+qfoCG9RE6M3k4bP0CxdEnpkwFIwmpi
   3N2iDnNTIkhC6G1Epjqkdl7HRFoHww9EJxjVDTw6yNjUSN/vbg6nB38wA
   /JG+lXtOevVdZPImj/jwOmyAhbdG5RpULzdiRGIojVa4Wsy9i394PrP2m
   71Nh0xruS3MEBkgHYMv5Xp9syZOnlLp4Ze5RK/Plst0J2gJ+vWdO1Tmmr
   Tn/no/1qW9i6Uk5X3X3bLVBScZQk/bwS5YdPfBgJptZvHPSH0ZoD09dLr
   py9OgtLNRIALwoI0+w1S4aGz8sYzAeyCPHv5l8oqFppUOWAL57HenGJwZ
   A==;
X-CSE-ConnectionGUID: knm0x2j/QxuL7arP87WKVg==
X-CSE-MsgGUID: X6MB29IyRDiNQZPFAnW+yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45688460"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45688460"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:54:37 -0700
X-CSE-ConnectionGUID: uuqPY7g5Rma7730Eh7Fpyw==
X-CSE-MsgGUID: ATp0HWOFScmYj+8BfkrIYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128797055"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:54:36 -0700
Date: Tue, 8 Apr 2025 16:54:32 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <Z_UqmHJsnQaZcL01@black.fi.intel.com>
References: <20250407074614.1665575-1-raag.jadav@intel.com>
 <Z_OQgqt0Wg17N05j@smile.fi.intel.com>
 <Z_TXDg67AtWzNXbg@black.fi.intel.com>
 <Z_Tig8ElS5e_UN6I@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Tig8ElS5e_UN6I@smile.fi.intel.com>

On Tue, Apr 08, 2025 at 11:46:59AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 08, 2025 at 10:58:06AM +0300, Raag Jadav wrote:
> > On Mon, Apr 07, 2025 at 11:44:50AM +0300, Andy Shevchenko wrote:
> > > On Mon, Apr 07, 2025 at 01:16:14PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > PS: I'm leaning towards not doing any of the ioremap or regmap on MFD
> > > > side and think that we should enforce child devices to not overlap.
> > > 
> > > Yes, but we will have the cases in the future, whatever,
> > > for the first step it's okay.
> > 
> > I've always found such devices to have a parent specific functionality
> > that fall under a specific subsystem instead of needing a generic MFD for
> > it. But I'd love to be surprised.
> 
> We have very "nice" MFD user, which blows up all issues with shared resources
> and so on, look at drivers/mfd/sm501.c. The most problematic part there is
> request_region().

Indeed. But considering the regions are for configuration and low speed
I/O, I'm wondering if IORESOURCE_MUXED could be of any use here?

> > > > If there's a need to handle common register access by parent device,
> > > > then I think it warrants its own driver which adds auxiliary devices
> > > > along with a custom interface to communicate with them, and MFD on
> > > > AUX is not the right solution for it.
> 
> ...
> 
> > > > -static const struct device_type mfd_dev_type = {
> > > > -	.name	= "mfd_device",
> > > > +enum mfd_dev {
> > > > +	MFD_AUX_DEV,
> > > > +	MFD_PLAT_DEV,
> > > > +	MFD_MAX_DEV
> > > > +};
> > > > +
> > > > +static const struct device_type mfd_dev_type[MFD_MAX_DEV] = {
> > > > +	[MFD_AUX_DEV]	= { .name = "mfd_auxiliary_device" },
> > > > +	[MFD_PLAT_DEV]	= { .name = "mfd_platform_device" },
> > > >  };
> > > 
> > > This is likely an ABI breakage if anything looks in sysfs for mfd_device.
> > 
> > I have no insight on the usecase here. Can you please elaborate?
> 
> drivers/base/core.c
> 
>         if (dev->type && dev->type->name)
> 		add_uevent_var(env, "DEVTYPE=%s", dev->type->name);
> 
> You broke ABI, it's no go.

Sure, let me see what can be done here. Thanks for pointing it out.

> > > > +/*
> > > > + * Common structure between MFD parent and auxiliary child device.
> > > > + * To be used by leaf drivers to access child device resources.
> > > > + */
> > > > +struct mfd_aux_device {
> > > > +	struct auxiliary_device auxdev;
> > > 
> > > > +	struct resource	mem;
> > > > +	struct resource	irq;
> > > > +	/* Place holder for other types */
> > > > +	struct resource	ext;
> > > 
> > > Why this can't be simply a VLA?
> > 
> > Because it requires resouce identification, and with that we're back to
> > platform style get_resource() and friends.
> 
> Yes, and it can be done by calling resource_type() over each and checked
> respectively. So, why do you need them to open code?

You mean something like we originally had in v1? I thought the idea was
to not deal with that level of complexity?

Raag
