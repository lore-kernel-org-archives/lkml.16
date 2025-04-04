Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCBFCA6F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771620; cv=none; b=morwKSkaPuzsAlTBHIGC9CMT3WkhlOkBI/AmVGawc4oLzQPGn5GbMJ9kVMUwVfp9MFL6ZV6Ez79ptK8Lj5uWaUoJiLAMLBybYStXPuuj2ztTtSyVvHDmTTHUd1dxut1yfGcuUhCbnXAfKli2BS5Qoufq5ZmTmV3OTTOvdqrBdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771620; c=relaxed/simple;
	bh=paWnuA2/OlnputegLvkrnDVVL3qXwkPlKVLOwytIpWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk0nZ471SrvMQa3vpDHeLoaW9jlhEx8TyYaolyN4JDyKAgxX0GWvzyrztG1p7Sgxx+32O3/rrPB/XkAxEpuuXloQnB8vfceW55COP+qWpN8fnP5EJFFvRjOOTE2hCXAKLMhjzY43lUxC+z2cr1SnTMEU4asz6HftJlQDmZ4GN8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIvitMNK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIvitMNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743771618; x=1775307618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=paWnuA2/OlnputegLvkrnDVVL3qXwkPlKVLOwytIpWg=;
  b=OIvitMNKf156uHGlnEgE7ALQwkq4CiooW2Kc3D9OoQu5RantlbKSQObo
   OX65lBgZXHWGoIRGiwgOg7PaaED3kpslUujHUR2DRSYgFiiyJ6kZEbkaa
   t2erKdYOcN6KxKWnyUBRFXJg63WFlbKMDAQEZQ3duMI8XDXYr4Bw5ivzD
   U4ITgMjD4eSTTv0unLcyJnGxhx7KgjV4Ks5LUTFx+OlIEvnXrWLCR9wwJ
   hIktgP3aHx1lp8TJFV+MJMVl/X96yogpAkIxs+Ut9rH926TMc4mn51fpB
   nvLzeYnXdFT7npXMAkDf3f5PdrbThnA1qWzYfTSidC91GDYsJG0zWU2ro
   w==;
X-CSE-ConnectionGUID: aNwXVIe5Tr69Y0ZM3KMlYw==
X-CSE-MsgGUID: uTGVfEBhTpCWU3hYRuihXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62608223"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="62608223"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:00:15 -0700
X-CSE-ConnectionGUID: SfkldhwtRc6/8OFIn2WR0A==
X-CSE-MsgGUID: Xx668pnKR/S//nFr0gpmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132427704"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:00:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0geZ-000000098Zr-09NW;
	Fri, 04 Apr 2025 16:00:11 +0300
Date: Fri, 4 Apr 2025 16:00:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-_X2j0yzyLCS3r2@smile.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-_ESekESYYvMHeR@black.fi.intel.com>
 <Z-_QwB1cExN1emMF@smile.fi.intel.com>
 <Z-_SIbfBdMXXkkWG@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_SIbfBdMXXkkWG@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 04, 2025 at 03:35:45PM +0300, Raag Jadav wrote:
> On Fri, Apr 04, 2025 at 03:29:52PM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 04, 2025 at 02:36:41PM +0300, Raag Jadav wrote:
> > > On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > > > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:

...

> > > > > 2. Should we allow auxiliary drivers to manage their own resources
> > > > >    (MEM, IO, IRQ etc)?
> > > > 
> > > > The resources are all shared by the "parent" device, that's what makes
> > > > aux drivers work, they need to handle this as there is no unique way to
> > > > carve up the resources here.
> > > > 
> > > > So I don't know how you would do this, sorry.
> > > 
> > > Perhaps we can carve it up in mfd_add_devices() using start and end members
> > > and error out if they overlap.
> > 
> > I don't think we want a flag day. If anything, it should be a new call.
> 
> Yes, I mean in mfd_add_auxiliary_device() (as in this patch).
> 
> > > Can't we still have a struct resource that is unique to that specific
> > > auxiliary device?
> > 
> > Oh, believe me, you won't do that. Save yourself from _a lot_ of troubles with
> > different cases when the shared resources are required.
> 
> I think we already have ignore_resource_conflicts flag as part of mfd_cell,
> no?

It's not so easy, and it's not the only thing that's needed. You can dive into
it and see how the request of the resource work. Also note the hardware that
has common registers. Again, using regmap solves most of these issues if not all.

-- 
With Best Regards,
Andy Shevchenko


