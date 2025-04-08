Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3D263F2C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102093; cv=none; b=qpxvb0Pg4hnDDfWeocwJ3YfWbXd5AgUDSAhGPnxF+I11UwITTkHp6RPMziNln1gu8ZS8NWkH4Nr/6P/vXPPYWZ7rDQHhF11Q+WPhdP96oqv6LrvN1UEjGxuwYZNKiKJOJRGI0JpANcFA90upzd/5Q9cunjmFhZCkag2evuKMeR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102093; c=relaxed/simple;
	bh=pPDZXAl+n83OgTG8wqkCh1xzr29gNLTH8LwtUQUJo9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGJOGQqaP0BHXnhZvRVjYC2F7tnWJMpf/RzZCmGc3wCoA02qBBCJjRYauZpWu34PPJ2QLcfUMGofpuN8zuuBasv77brQLQKD9c7v7bCAfxgwO5jAqX1zclNZB6LshLgc8Sh+ggFZKQG90OIT0XUcfBMBnwSN9v55b1RxGlX+3/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktdRQGpq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktdRQGpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744102092; x=1775638092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pPDZXAl+n83OgTG8wqkCh1xzr29gNLTH8LwtUQUJo9g=;
  b=ktdRQGpq8Va507PqlBnVDe0DEb6wtIDj6ipfytvIp5MjZiqquQKJBXJJ
   bsW04oIbdPRNroCvUhPpeWbDli5hx6y4SRTtyePSZL40QL3pZvfKyWLZM
   gjbr1uXa48yrTLfuso85r5dk+fnSVwA1KSTjcqy4ZZ0PiHLNuuGmgCKxk
   crrhlk/QUx6dkisyV9FyCACQEmnbeHkfvBKHazbdYE4U7EN3cfn6zNFmn
   Gw0xbTorhAA+dCUAtnqJeZKpea5g19u+TNujqbFlqlTkYQ9+Ci5A7x8j9
   DhijCzVe9whx8w+DwMk6TvEHngLjte8jL//Gb+Wr3YoG0hUgl7ncw9FdV
   Q==;
X-CSE-ConnectionGUID: V6FpZqi2RvqLtXOjxwY2qQ==
X-CSE-MsgGUID: j4sWZSW9TbKCXTZv+Cc2gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45641149"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45641149"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:48:11 -0700
X-CSE-ConnectionGUID: 4fDSiAloSFWOPjykVx0wrQ==
X-CSE-MsgGUID: VQV3nGtOS7G+XzBwttWmBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="129153624"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:48:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u24co-0000000ALLr-3hfP;
	Tue, 08 Apr 2025 11:48:06 +0300
Date: Tue, 8 Apr 2025 11:48:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <Z_TixhOQM-DFoG-2@smile.fi.intel.com>
References: <20250407074614.1665575-1-raag.jadav@intel.com>
 <Z_OQgqt0Wg17N05j@smile.fi.intel.com>
 <Z_OQqgSjHxq6kwDp@smile.fi.intel.com>
 <Z_TYq5J0CPFvdm7e@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_TYq5J0CPFvdm7e@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 11:04:59AM +0300, Raag Jadav wrote:
> On Mon, Apr 07, 2025 at 11:45:30AM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 11:44:50AM +0300, Andy Shevchenko wrote:
> > > On Mon, Apr 07, 2025 at 01:16:14PM +0530, Raag Jadav wrote:
> > > > Extend MFD subsystem to support auxiliary child device. This is useful
> > > > for MFD usecases where parent device is on a discoverable bus and doesn't
> > > > fit into the platform device criteria. Purpose of this implementation is
> > > > to provide discoverable MFDs just enough infrastructure to register
> > > > independent child devices with their own memory and interrupt resources
> > > > without abusing the platform device.
> > > > 
> > > > Current support is limited to just PCI type MFDs, but this can be further
> > > > extended to support other types like USB in the future.
> > > 
> > > > PS: I'm leaning towards not doing any of the ioremap or regmap on MFD
> > > > side and think that we should enforce child devices to not overlap.
> > > 
> > > Yes, but we will have the cases in the future, whatever,
> > > for the first step it's okay.
> > > 
> > > > If there's a need to handle common register access by parent device,
> > > > then I think it warrants its own driver which adds auxiliary devices
> > > > along with a custom interface to communicate with them, and MFD on
> > > > AUX is not the right solution for it.
> > 
> > And yes, I still consider enforcing regmap is the right step to go.
> 
> Unless there's an explicit need for it, I think we should leave that
> choice to the individial drivers instead of forcing them to revamp.
> But let's see what Lee and Greg have to say about this.

Doing that is call to inherit all issues with shared resources and locking
as I already said.

-- 
With Best Regards,
Andy Shevchenko


