Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AEE1E1E04
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769801; cv=none; b=C/zpm07BCKUevXTbjpFJcEi6mT9BQvZrZoyWB/qiAPW5dTC0//He1Sok00bd+DtjJmRb0L7WS4rju9ziNsGW+pU0HnCETTQihg7ECeQ49GeS1HPt+zlY76RdSqsfMnqRNXQZTBXvjTMvEV8tuZ6QMKXXdto3NgwSedpGom0Un7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769801; c=relaxed/simple;
	bh=/4agX8fw0y/K8HkBbAiNToSBeHnF4hBirnxr3iPlU4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhtAyHWMAUJfD+uXiDg8AYTpoC5jvfu6DgoK7dlm4k7pH1L4RPc4jf7ENJk1ZNZfGG8+Xd0xbXL4FHsEdWCf3xRH0zQvb6HYdJ1v34lwK3W1SuAoVxOT83tpHFChtBvVeZ6GAFjVdtPWlhVN69RZJ6H2qZY/+w8laPnPiZxke7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhByPnpd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhByPnpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743769799; x=1775305799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/4agX8fw0y/K8HkBbAiNToSBeHnF4hBirnxr3iPlU4o=;
  b=MhByPnpdi0h9rehOGsPQqqKUEHAUqZrFd9QfwNHOJejIe6CXYPs58ohO
   xFe1bhl3m5bpALZ0yo1/ES32/6+eoeLNRlowtIasC39i/Cg3JjpxQ6L3r
   nmoicqlVuzGpMrdeRH8OUPnysOgeyIL34AyudwFjFoBKvyldT3LX8BQBU
   /FTorpk5LYhaH/saewNpl1QnOuKpW3UzYrEb/9xrNBzXka0ukdEUdYwOO
   ywaIYqmwLSMw1uGhR041EoSWAchCJqSvRzG5vwLtTEaU/zwxs35DhmM7k
   RI2yGrwkCj+uVBLKNMccYqUxZLyt1IhcszpudehGa8XzhtUMvZjbTMAvl
   w==;
X-CSE-ConnectionGUID: kUg/3hqTTkW02YGVk1wKyA==
X-CSE-MsgGUID: 6i3iT0ZHTUiCk8eHXKGu9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62747775"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="62747775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:29:57 -0700
X-CSE-ConnectionGUID: kESmZ1oTSfuV7WuMPLKczw==
X-CSE-MsgGUID: arDn9nj7TKSqifMZ7TvCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127242139"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:29:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0gBF-0000000982G-1GL2;
	Fri, 04 Apr 2025 15:29:53 +0300
Date: Fri, 4 Apr 2025 15:29:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-_QwB1cExN1emMF@smile.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
 <Z-_ESekESYYvMHeR@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_ESekESYYvMHeR@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 04, 2025 at 02:36:41PM +0300, Raag Jadav wrote:
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
> Perhaps we can carve it up in mfd_add_devices() using start and end members
> and error out if they overlap.

I don't think we want a flag day. If anything, it should be a new call.

> Can't we still have a struct resource that is unique to that specific
> auxiliary device?

Oh, believe me, you won't do that. Save yourself from _a lot_ of troubles with
different cases when the shared resources are required.

-- 
With Best Regards,
Andy Shevchenko


