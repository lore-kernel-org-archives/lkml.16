Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D668228CA9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015537; cv=none; b=q+ZmO/S/3nTLbDwJNte+x92FmG01CFEKm6kg0+wwnoXfI0pK1bD2DwhitjjOa9cCmhM0uew4Kw1EWL0QDQNBv4jNTgJJbqZPnRIJNEauMxyYw/MNwDc7i0Gh3P/uSRzvHHVWGzZVhQDRTgOVFMU4M51wnVsezOA3Y9aZ74P69Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015537; c=relaxed/simple;
	bh=RzkcvHAP1aYw8ZCAQFimc4mVSz+3yZemToyEIMf4fEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSz6ZzVES7MlIk+t3HoL0jxy6+seh4FQUINteenzAY1GVu/GHmd5lkgqzdaY68/RxBngOCW89XyxriPxL2oqy8VqCFXr+c/WbzuZ8ZQkXVzHzjPE8r1W4TseOR9z0CPoaW+R+W0mP709MJoBrxZ+fO/YJ/8MEHkUtLEA9zpYSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrhgdmLh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrhgdmLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744015537; x=1775551537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RzkcvHAP1aYw8ZCAQFimc4mVSz+3yZemToyEIMf4fEM=;
  b=QrhgdmLhwPe3PNaCI4hYwfsfsjDE0Bmk/O2EzjmHKHI+U+PiyEw6aG99
   zEMIpSWKxsWRAbfYVXssHQ5hirtwPZLuu/j7f2J0B1LBuw+mQJPeUu7OV
   FUIHqaaeKYL6nlpp75u88xnyrbLRRw+8gPmbtQl1yoDiIHL45sJ4xBQs8
   AsrEAlbWVaW0v2g0e9VF+2ahpw0APmaEUJOtw/Gq0VAO2HoW9RTSF3RSd
   IEZpeIr7cIneC/ONpIHJvLRCdjm6WKMg5ENze+0j9jR77g8vw473pErPS
   oYPZCiIzlgMSX8SIsvSpkQuyalmL6aEwPg2B04St53Ql24mh8yiH5Nrzr
   w==;
X-CSE-ConnectionGUID: o0DsgOybR6+Ttv1Db4AjeA==
X-CSE-MsgGUID: pbH71/U/T0SV6l3HBGHSHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="62785556"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62785556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:45:35 -0700
X-CSE-ConnectionGUID: X7/LZ+NXQ3WH048VKkZZkA==
X-CSE-MsgGUID: +t4qE1CvQn6SktZMwNBodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132626221"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:45:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1i6k-0000000A0W3-3ggt;
	Mon, 07 Apr 2025 11:45:30 +0300
Date: Mon, 7 Apr 2025 11:45:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <Z_OQqgSjHxq6kwDp@smile.fi.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

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
> 
> > If there's a need to handle common register access by parent device,
> > then I think it warrants its own driver which adds auxiliary devices
> > along with a custom interface to communicate with them, and MFD on
> > AUX is not the right solution for it.

And yes, I still consider enforcing regmap is the right step to go.

-- 
With Best Regards,
Andy Shevchenko


