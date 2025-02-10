Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127EB204873
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200113; cv=none; b=owP7dauJz18+5DCGr1k6y5I4IcQavR0NNpj6gs4vghj/kUwNgfkMAAB10g5Un4jLQp7tFoelMAHEKWiZqySMIN0I0reBAT8KOmgzzoB1ula+ymT4hZnsX//JWi9P/mc3Sdq8lYbjRVKgIu6Vj6JnJMXM4N4q+V3M6wILe6ZgREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200113; c=relaxed/simple;
	bh=JBJIhc0W4HyXf64KORxTW6o//4Viq7CVoEM7iY9uBHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvicMM2JspATC2IALGDisQqYxm2hYppZqw/ItiRYvX5okhaGWKZZleqtgpWIx28DXCZyaR4O+5/s8qymu6GiC7sIbJPgzHVuaSRmz3VseLrqgs3p1tW2f8Co9YtRKi3Y4VvE+pKDB07/b73ihSHg8k8NTG7jBbqk0VnAYf9F+Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kP5dd8JS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kP5dd8JS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739200112; x=1770736112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JBJIhc0W4HyXf64KORxTW6o//4Viq7CVoEM7iY9uBHg=;
  b=kP5dd8JS2/GftmM2ptE9c3fta6DGP1EoR4g8CqJDBFrfaqdaKOB2xzUj
   qkrM/iNU1QUz3xxpScu/fGzTeI12kiDc4D9J1tvjcviU0otGqIpq2wjGw
   lEiNQoMmamLDf5xctMMgLxu9o9vjyMXAj2wWziYFfGqvpaiesLe+rXxfU
   irjynA3Kli31cPZwILPKLmzyjPdvwrt6YhqlZjOkxIbQzVGPJJOmmrEwP
   sHtyx03n24FmwRkxIAFScundc2qfOa6HoRnswikOZ2Hj6iWDOaROnUJ8H
   fnNp1r+tVmU8BDIdIvvcWVR340oHJl262CzKfYn92hT48BbakJ5LeT4jZ
   g==;
X-CSE-ConnectionGUID: oN6RwIozQp2Gh5XqI159wQ==
X-CSE-MsgGUID: vmNh0kwsRZ6WANkFV5Qu8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50771334"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50771334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:08:31 -0800
X-CSE-ConnectionGUID: tVoHKz/sR2e/vOXIJyc64Q==
X-CSE-MsgGUID: 7hzJPxtaQimEaqEwLCNB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112847682"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:08:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thVOb-0000000ADJX-422N;
	Mon, 10 Feb 2025 17:08:25 +0200
Date: Mon, 10 Feb 2025 17:08:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: I Hsin Cheng <richard120310@gmail.com>, rostedt@goodmis.org,
	linux@rasmusvillemoes.dk, senozhatsky@chromium.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, shuah@kernel.org
Subject: Re: [PATCH] vsprintf: Drop unused assignment of fmt.state
Message-ID: <Z6oWaZl7DRoW0tDK@smile.fi.intel.com>
References: <20250205172508.55358-1-richard120310@gmail.com>
 <Z6TWEHvBF0HOxKsY@smile.fi.intel.com>
 <Z6n6iWwnpA6wuUMD@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6n6iWwnpA6wuUMD@pathway.suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 02:09:53PM +0100, Petr Mladek wrote:
> On Thu 2025-02-06 17:32:32, Andy Shevchenko wrote:
> > On Thu, Feb 06, 2025 at 01:25:07AM +0800, I Hsin Cheng wrote:
> > > Remove unused assignment of "fmt.state", in both cases the value of
> > > "fmt.state" will be overwritten by either "FORMAT_STATE_PRECISION" or
> > > "FORMAT_STATE_NUM", the value "FORMAT_STATE_NONE" isn't going to be used
> > > after the assignment.

...

> > > struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)
> > 
> > >  			spec->field_width = -spec->field_width;
> > >  			spec->flags |= LEFT;
> > >  		}
> > > -		fmt.state = FORMAT_STATE_NONE;
> > > +
> > >  		goto precision;
> > >  	}
> > >  
> > 
> > While both are kinda redundant, this is not obvious what's stated in the commit
> > message. Yes, `goto qualifier;` is straightforward, but not `goto precision;`.
> > Which makes me think that these assignments can make code robust against
> > potential future changes to allow to catch up the wrong code paths.
> 
> I fully agree with Andy here.
> 
> That said, I see the following right below the two conditions modified
> in this patch:
> 
> 	/* By default */
> 	fmt.state = FORMAT_STATE_NONE;
> 
> A good solution would be to move it up. It will be then obvious
> that we could remove these two initializations. I mean
> to do the following:

Which can't be performed (one need to check the old value first somehow) :-)

-- 
With Best Regards,
Andy Shevchenko


