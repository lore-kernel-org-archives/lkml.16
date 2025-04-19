Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39715A85E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745074708; cv=none; b=dNmhU06x/FMv80p0yzJABgjn1wnj34IldfWwWfRGFjqOPM4pyC+FtxFQzZQTv7Mii57fN5NlUe/KauYCqqBKsPCH5axffhaTFDSEIQcF6EDCkB/Nw4WZc1NdmlsbX3f9OWno35TwtClk9ZMgHYVKMiaYMG9FGPXumrxbyNI4ZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745074708; c=relaxed/simple;
	bh=t1JKrnA/osICaCGxpJ5Img8qs8jepn52cqyYectC4ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R40icqSa2ceUL6OYOoTKMjvf1cEX5n0vgV2b1+fd4L/0yhPBdfaow47lyjLJ0xs5tB7HwDNLH3oYaDD88Vg52IKyFDW2qUk6tpVLaT2Ic17HTH8RJ75qpefRm61rI9cz7LC/XlOP6lHw9mezRGwsoD4oVivn6T3ooJLYhKwii0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmYDOset; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmYDOset"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745074707; x=1776610707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t1JKrnA/osICaCGxpJ5Img8qs8jepn52cqyYectC4ro=;
  b=DmYDOsetmgrQyYPwdOB/lmbP5lX+PZ6HgRmd3OvZXrZZ6fn6hCaL+yfh
   99+M8a1Z64A2KtX3ifkNWp7krmoCWmO3XXsqbiTc4dyheBSDlDMVKIkbS
   QCpwSG89FzXZJARsG2Xw0TvzXo7tin3M2zS65pBFLAwy2nu3GrLAWrzTq
   /MQkRo4GL1C0epnHLLCfWZboCPxZ7W9u/Aa476EJ5GjgB+vlzjRNBDe/1
   cbv/vi6el2+Ko3pcZnGzDKcobw9WrxA4tAqyyU+K7xzUl08/FcqPGk+Gd
   MyPkmjpZaJx86luNjAaZaq4LqY9hx+6xMLFs4znT39+kMl4sV0WOpUjrq
   Q==;
X-CSE-ConnectionGUID: 5CnU41p/TCu1NHWb5pNgTw==
X-CSE-MsgGUID: JoX1pkIsRN6rTdQwllveaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50340332"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="50340332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 07:58:26 -0700
X-CSE-ConnectionGUID: y09sYGf4QqODUfprBLDVMA==
X-CSE-MsgGUID: Q+06b0FMTe+mtijA4d50yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="136207842"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 07:58:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u69eA-0000000DqPj-0RDZ;
	Sat, 19 Apr 2025 17:58:22 +0300
Date: Sat, 19 Apr 2025 17:58:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Corey Minyard <corey@minyard.net>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
	OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH v2] ipmi:si: Move SI type information into an info
 structure
Message-ID: <aAO6DVh2knSoA20x@smile.fi.intel.com>
References: <20250416183614.3777003-2-corey@minyard.net>
 <aAEkdwD888tW2OUY@smile.fi.intel.com>
 <aAElHft1iVqZbhBA@smile.fi.intel.com>
 <aAFqcaFGOoOVRpWO@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAFqcaFGOoOVRpWO@mail.minyard.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 17, 2025 at 03:54:09PM -0500, Corey Minyard wrote:
> On Thu, Apr 17, 2025 at 06:58:21PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 17, 2025 at 06:55:35PM +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 16, 2025 at 01:36:15PM -0500, Corey Minyard wrote:
> > > > Andy reported:
> > > > 
> > > > Debian clang version 19.1.7 is not happy when compiled with
> > > > `make W=1` (note, CONFIG_WERROR=y is the default):
> > > > 
> > > > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type'
> > > > +from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> > 
> > It seems you copied'n'pasted from narrow screen. The lines should kept as is
> > (as long as they are) without an additional line break and plus sign.
> 
> Yep.  Thanks Andy.  Should this wait for for 6.16, or would 6.15 be
> better?

I prefer v6.15, but it's not that critical, and v6.16 would work. So, up to you.

> > > >   268 |         io.si_type      = (enum
> > > > +si_type)device_get_match_data(&pdev->dev);
> > 
> > Ditto.
> > 
> > > > The IPMI SI type is an enum that was cast into a pointer that was
> > > > then cast into an enum again.  That's not the greatest style, so
> > > > instead create an info structure to hold the data and use that.
> > > 
> > > Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


