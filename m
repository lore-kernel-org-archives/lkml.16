Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175EC36124
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499739; cv=none; b=P1v02yTDYlrT9nFtVYBxlgqRK0tCORL4XDphsta5JRioIWawwrdON1HlqE+ZOmLfOPhrw2j8yhCkPS7q2vIXrTg65Whl4JKXY1MGnkHShlHG94IgTl4iVnY0izDmXieTD0z8DEtaCDuFWxjXjJFJ4Wa8iKcRf45x0VEd70bRDII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499739; c=relaxed/simple;
	bh=mJP7nxFLpxg5r/QXtfCaThWnz5kxHgb9BSvWCQ1zunI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXhEeHzOBXhxZeusb6Vai++9zrIHlQORsJyLW8bF0JFE0GEIOr484R767jmGxWGnp23CBnIbZL1gyK9QSy86QDH3WDk1nTjXTtUh2p2tP6bhLHLh4II6HPrM1v1H6SEKEPQcuzw+Zr3SsHyoYUaxjTohGoaKfAYqEbznORZRznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8v4I0Re; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8v4I0Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747499738; x=1779035738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mJP7nxFLpxg5r/QXtfCaThWnz5kxHgb9BSvWCQ1zunI=;
  b=n8v4I0ReKxogeBD6ado7NQIcDTwCAVT/3rtYDj/qucOT3Wf828b3pMF1
   ZOzirnqywskhaCSeZ1zOAt7tCk1COXvV0URdcJ/5NewEAFC4GxrD4rKz3
   e1ZXl/rez7Y8BMWWa0Zk2JAmE1Jklqw0cKsrZxKcUghdgrfbDrW2FjYGm
   mP46kF6q1i6nNssPrZVz/p0d5m8uZk8NIEK8EpCmHzxRWbdM1QCS4Xkui
   aMrJTGiKSrVC/q/afFfIILXF38QyhfA7v6QI/8S/vFSDLfEahM+9LhKdv
   kTEjdZcdgQvuVRt4HCXNLTsY4Ye/ReGzPPuexB5UIrE86dIOUBFBIvF8A
   w==;
X-CSE-ConnectionGUID: ut7z6Lg7QZOJtHKTmgHGkg==
X-CSE-MsgGUID: 3wsRqdKqQM2I7nn5l8qnwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49436249"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="49436249"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:35:38 -0700
X-CSE-ConnectionGUID: qwfMmGorSASzBKU1Q3nxrw==
X-CSE-MsgGUID: fHwahmxxQkuPrhg23r/upA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="139371840"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:35:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGKVZ-00000002Tl8-30Nb;
	Sat, 17 May 2025 19:35:33 +0300
Date: Sat, 17 May 2025 19:35:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] genirq: Bump the size of the local variable for
 sprintf()
Message-ID: <aCi61d4gYWeC5zbn@smile.fi.intel.com>
References: <20250515085516.2913290-1-andriy.shevchenko@linux.intel.com>
 <0e79e48c-f466-41f7-bb60-03f45f6b0628@kernel.org>
 <aCcAP3eIn5XmNALA@smile.fi.intel.com>
 <79bd93c0-52b6-45cf-9e65-1e3636b5d95e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79bd93c0-52b6-45cf-9e65-1e3636b5d95e@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 16, 2025 at 12:23:17PM +0200, Jiri Slaby wrote:
> On 16. 05. 25, 11:07, Andy Shevchenko wrote:
> > On Fri, May 16, 2025 at 06:45:04AM +0200, Jiri Slaby wrote:
> > > On 15. 05. 25, 10:55, Andy Shevchenko wrote:

...

> > > > -	char name [10];
> > > > +	char name [12];
> > > 
> > > The max irq is ~ 512000, if I am counting correctly, so 7 B should be
> > > actually enough for everybody ;).
> > 
> > GCC can't proved it. And FWIW, on current Debian unstable (GCC 14?) I can't
> > reproduce this. In any case this doesn't increase stack usage AFAICT, the array
> > already have reserved 12 or 16 bytes.
> 
> Yes, sure, I am not disputing the fix.
> 
> > > But well, can we silence the warning in a better way? I doubt that...
> > 
> > With the above said, I think it's pretty much close to the best way.
> > But if you find anything better, I also would like to learn.
> 
> Perhaps next in row would be using snprintf(), but dunno if it's better at
> all.

Try it. I believe you will get the same result. The problem is not in 'n' or
'n'-less variant, the problem is that GCC can't prove the limits of the input
value.

-- 
With Best Regards,
Andy Shevchenko


