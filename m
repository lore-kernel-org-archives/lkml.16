Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7281EE7BE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099507; cv=none; b=DT2k1gcbCPYViJot41OmJsO0kw+OWceFryqXqNcC030/7iZGZDWyyVARI0JHXoLhPF60YO7S+lo0Fl3ZvttJOFp0VA5ninAUMqObdVfHAZkEb/a1wlJFhQ4FOMuFkpvqdxodbQFJsx2DdDv0FfxQvY5iMc5+DEN46GH+ZRgmKHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099507; c=relaxed/simple;
	bh=w2lCtd5Q5SafcD4jWGACwK8qM6Vcsr8SYyg8qVl57oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2QoL5AIvku75ufngrbUqmPEtZIJwPUVlX62ApERn3pMzG5tQ9bykDCzDehrZKOwEzuZ1V9CvTK7CaCR8vrJSuW0oRoIUEOGvTbsiZzIzExksQe4ghor/6eop1kr+I87zOFHPiFviOG05DYjGEjveE+uj44n/zLsioK9zt4fuHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnZ2qE0I; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnZ2qE0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744099505; x=1775635505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w2lCtd5Q5SafcD4jWGACwK8qM6Vcsr8SYyg8qVl57oI=;
  b=gnZ2qE0ID98PH2bvWDiAtJaYRXlaOLtb6SEpxoBTsugez20V7vzhw8uw
   SAq64aANLR2jKyBOPP01OQxakQt3P9bHycrwiEDqwETQwN2DjohoeP10c
   FFdUcMtM9jrJf1GGLYr3zdKeFRW+q0HS2t4gS0nvqyWWu+0NFbbcgvTcS
   ryJVCOLaBtCWNN8YiyNCr2n1G5SVHYFX3K28zTiVgD5JhAUfgpjFSy22S
   EjsE4jLOIYV6KEz58Z8/cSwAgaJeAyl4bgiUa/oZb95oQ2RjszHD/6QlV
   RKSVn3GfplwAtXaCryY3+QJl/fnaUN/hB+A4U7rEe30+YPE4hgKijc4K0
   g==;
X-CSE-ConnectionGUID: I9G5nxNnQ0KlRYiAp5aIvA==
X-CSE-MsgGUID: aPaUhv/BS/K13InV3sr9zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45232044"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45232044"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:05:05 -0700
X-CSE-ConnectionGUID: x5DfdbooSU6kX6PKSIBu1w==
X-CSE-MsgGUID: SGIkkVlvTze+rvhMf2cF1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128698137"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:05:02 -0700
Date: Tue, 8 Apr 2025 11:04:59 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <Z_TYq5J0CPFvdm7e@black.fi.intel.com>
References: <20250407074614.1665575-1-raag.jadav@intel.com>
 <Z_OQgqt0Wg17N05j@smile.fi.intel.com>
 <Z_OQqgSjHxq6kwDp@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_OQqgSjHxq6kwDp@smile.fi.intel.com>

On Mon, Apr 07, 2025 at 11:45:30AM +0300, Andy Shevchenko wrote:
> On Mon, Apr 07, 2025 at 11:44:50AM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 01:16:14PM +0530, Raag Jadav wrote:
> > > Extend MFD subsystem to support auxiliary child device. This is useful
> > > for MFD usecases where parent device is on a discoverable bus and doesn't
> > > fit into the platform device criteria. Purpose of this implementation is
> > > to provide discoverable MFDs just enough infrastructure to register
> > > independent child devices with their own memory and interrupt resources
> > > without abusing the platform device.
> > > 
> > > Current support is limited to just PCI type MFDs, but this can be further
> > > extended to support other types like USB in the future.
> > 
> > > PS: I'm leaning towards not doing any of the ioremap or regmap on MFD
> > > side and think that we should enforce child devices to not overlap.
> > 
> > Yes, but we will have the cases in the future, whatever,
> > for the first step it's okay.
> > 
> > > If there's a need to handle common register access by parent device,
> > > then I think it warrants its own driver which adds auxiliary devices
> > > along with a custom interface to communicate with them, and MFD on
> > > AUX is not the right solution for it.
> 
> And yes, I still consider enforcing regmap is the right step to go.

Unless there's an explicit need for it, I think we should leave that
choice to the individial drivers instead of forcing them to revamp.
But let's see what Lee and Greg have to say about this.

Raag
