Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B286433D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689969; cv=none; b=N+I5wMQCZOI1cB0Dr/whywLR4xvC69MftyqBT2luUwR3Kpyt0kAFyuULDIO0VNIpYnVD3C/R99PjYfvvrD4Ypyf0vYoqoT5OVE7/NCzg1uVgOfmvtsJT4XUmZBuxJgDMTj5h3d3HU5x5QHv5id6ZRZPvg1mpbXXYekP/HEDoSlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689969; c=relaxed/simple;
	bh=hIxZ8DXbteEySXel5MzoSaZF1xDhFewUBhiOqfvIxLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MO9ez3zcp9MJlPe+7M6PzSIpcVGb9WivkYyoJYbZWNA4+KotpovRdCGHDiSRhRRxk6G+fVIGsWq5IyEtjS4ntA/QqxKcXK0dq2PtMkixcF9Z713x8QwlqvemU06RJOqjda6W4vTmIWRcVsmXkwmKYf5youQm2i2lDhVqxrb29IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqmfwKh6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqmfwKh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743689968; x=1775225968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hIxZ8DXbteEySXel5MzoSaZF1xDhFewUBhiOqfvIxLM=;
  b=IqmfwKh6Ujxtofr4tFP071C/eU+nrPUa7WICD4cJbFHqUx3GBwbIAGuH
   h9hc4Ttk53vkU8v6xnolMkR83Kl/jVciIiM4UQLigbebRzx1GgyBkjha4
   Sb7ZKuny4EktLMMjJ5GbV8JPui7JR6F1HcZIO79EO07vHdwJOdEzvA8f7
   KaXXM9SBnqnIWSiC3V/xqQetAhAiEOwIjKaHPm6fQvmLjDQaSQRkQlgSV
   C1mfe0KOr7KttW1/kRZ1m0RFVkKjIyYgeMP9OUrTgXTPJFkAv+/u/wyFf
   HrlQOZAVeYigrvU0KoJSMx4flHDbckUH73A1YNOFYkEceUqvQImifyBB2
   g==;
X-CSE-ConnectionGUID: PL3wTvyQTS2Gn+k7vw+TLA==
X-CSE-MsgGUID: oDcTxToUT1aGC4QhQpXTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70471409"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="70471409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:19:27 -0700
X-CSE-ConnectionGUID: WGTUO9I3RJugZ+moxd3ysw==
X-CSE-MsgGUID: dCuTS7AVQsOL+p23m/gdfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127306515"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:19:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0LPf-00000008prL-0ejI;
	Thu, 03 Apr 2025 17:19:23 +0300
Date: Thu, 3 Apr 2025 17:19:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-6Y6lbLSbe46-uQ@smile.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-6YU24dhxF5PRaw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6YU24dhxF5PRaw@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 05:16:51PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> > On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:

...

> > > 2. Should we allow auxiliary drivers to manage their own resources
> > >    (MEM, IO, IRQ etc)?
> > 
> > The resources are all shared by the "parent" device, that's what makes
> > aux drivers work, they need to handle this as there is no unique way to
> > carve up the resources here.
> > 
> > So I don't know how you would do this, sorry.
> 
> I think we should simply enforce the requirement that MFD on AUX bus must use
> regmap. This will solve the serialisation and common access to the resources.

That said, make an additional API call like

dev_mfd_add_aux_devices() which should enforce new infrastructure and convert
drivers one by one. Also with that you may add a warning to the existing (PCI)
drivers that are using old API

	if (dev_is_pci(parent))
		dev_warn(parent, "Uses old API, please switch to ...\n");

-- 
With Best Regards,
Andy Shevchenko


