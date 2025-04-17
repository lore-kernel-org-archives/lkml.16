Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088FC1B6D08
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904053; cv=none; b=CtTNRtoQBVAST75uQZiyYnJhl6UXt884l/ytfM0HxqJYGzCqJvlHX2Qr21JjnZwgYobzC5pDHa0T0A58Y8iCEkzx+QdxLjOYsccRq1AKVB+fHAcQpi3C/cU9/tsPgcuEaSQQdB3q2gI7bh5zkfI0g5/4sxBbAoYptJpt+ukKgOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904053; c=relaxed/simple;
	bh=LPpZxwUD/ZvaXLJL/1CrEjzJaxCskyY8yTxIvOWqWw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbBzEy2wx5eBPFFu30KUEPpZJfVw79aajpp4Fc11yCvF1J7LZjPPPq1+nu9vbpA/ZD33qHnmXYwLSKoy4BRmKUah3Vf7aw8EyzElc2rHbDpl+dL17voKdSW4rnd5vQmAFOs+TqUvMPeXApwVXhjTWWkzvqh7lWdqMWWAwIKxM38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoBCxEXf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoBCxEXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744904052; x=1776440052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LPpZxwUD/ZvaXLJL/1CrEjzJaxCskyY8yTxIvOWqWw8=;
  b=FoBCxEXfGv4RZuD5UyZYFx/qCsU/q2pQ97+MCSCRFzIVNcOQTLAWD9ou
   m1wDQqo2c3kv4dV5cxwamZv9XwvR0fUo15Q60LeyaVlvVnbX7SO2y4l9A
   /Vc03i44QGCVfAiDVzPzO6ItzPyLVK38939dYF/BVIuxu3D/1v5r47p26
   B+gtPL5YvD5xF7soEGNfjF3t2GgXoLP9+PTKLqoXI2ZN36tGE2R/AFSn6
   ES5XoBubqaDYLNZgg9pXLB9zPMtnFVJ2V0LdZPFSpPWL8d0jTAZwTeoXz
   7N6ySmUNrx03eusTaW1+DInIqjJa3lGTNIpY27Qa39WHcWpUCttc+Tc6a
   A==;
X-CSE-ConnectionGUID: PGZB285XRdSM7Vj33OhWQQ==
X-CSE-MsgGUID: poNFMbN8R8q+6ZlR0Xk49w==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57884244"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57884244"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:34:11 -0700
X-CSE-ConnectionGUID: qj465E5pQWWAkNhWWHa2qw==
X-CSE-MsgGUID: 39QMP6tbQr+5k/HD4S3WAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="136011535"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:34:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5RFf-0000000DEqt-2qlP;
	Thu, 17 Apr 2025 18:34:07 +0300
Date: Thu, 17 Apr 2025 18:34:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Z_6uzH9DsWIh-hIz@mail.minyard.net
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
	OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH] ipmi:si: Move SI type information into an info structure
Message-ID: <aAEfb3y7fCnvPc_F@smile.fi.intel.com>
References: <Z_-d6Pj7ZFuG9gNA@mail.minyard.net>
 <Z__sz8BvIvdyF4dN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__sz8BvIvdyF4dN@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 08:45:51PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 07:09:12AM -0500, Corey Minyard wrote:
> > Andy reported:
> > 
> > Debian clang version 19.1.7 is not happy when compiled with
> > `make W=1` (note, CONFIG_WERROR=y is the default):
> > 
> > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type'
> > +from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> >   268 |         io.si_type      = (enum
> > +si_type)device_get_match_data(&pdev->dev);
> > 
> > The IPMI SI type is an enum that was cast into a pointer that was
> > then cast into an enum again.  That's not the greatest style, so
> > instead create an info structure to hold the data and use that.
> 
> I'm going to test this today or latest tomorrow, below some comments.

I have noticed the commit 37631eee2063 ("ipmi:si: Move SI type information into
an info structure") which is in Linux Next and it compiles for me as expected,
thank you for the prompt fix!

-- 
With Best Regards,
Andy Shevchenko


