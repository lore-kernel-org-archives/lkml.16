Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724C82561B3;
	Thu, 17 Apr 2025 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911632; cv=none; b=M5sXenb5S2rKZEBRGGEVwMLAj0qPZ7OiesaTUmb+FeY/0ovNmSF+LA+PL0n2PvyzZgJKCDsH8fSXFOIZ+gB4478qU6h5nDzoKZnTzBmHn6yCBLewcNUr7MMA7iOvbOxqGGMdM9IXeOYi4wnnURqBmih20vwEVL8sY4J+Ncx5kRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911632; c=relaxed/simple;
	bh=RByqbqR2sj3JXiwCVh4ka5KQANsreeUtATPY5BTiidA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIr0Hr1UoMe+nkf36r5y61VRA3pif0VU3aUeA2DEp7qw5i5RBsmXJEPvU5rt7l0oEH0q0YzgYWS0ZvW37qL01RKVdDlT1O0ude0e5e3XcqoOM1K10juaXTmsv7T+dJQCRKROPdOEny2ASQD0YQVZHnJYvhkQfVGz/f0gROVPQ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQbwQfnz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQbwQfnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744911631; x=1776447631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RByqbqR2sj3JXiwCVh4ka5KQANsreeUtATPY5BTiidA=;
  b=hQbwQfnzwH+dwEccxRzCG6BO3sWkzsxi7RpBxqlfc+8r8Y1x7FFtqVUs
   DvmYlwAplSzq5uRnjs/dUH9CLNlFU3jHdJm8ZUQJllf3LHwDpY5wcur82
   /ddw7H7E4dotmhdKasm9x6SGkcYkIn2aO8Tc5Tg49lVK3ym4vP3P1C8Zt
   u19CPiXeX0Pfqbk59GWEh8IL6Zhv9PRAYN8EodHEVCG8O+/mK3F9TA3GZ
   +i+Q+d6yyTUbrvO3vIBTe3jnc+OwKxZj5V5YoMwYWBiT1tP0FLXi/5JTv
   pO+4eXU1edrUPtZmrZ5H29svZ/k8+fa6PTEHgzgRFgbHUi8BjZWW3u0qm
   Q==;
X-CSE-ConnectionGUID: wiYkhklGSY6McJ8PyuyzJw==
X-CSE-MsgGUID: t4of64igQsuZIZ9oi0BLzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50329945"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50329945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:40:30 -0700
X-CSE-ConnectionGUID: 1yoxHOMfRtyNrJUAZJ4bZg==
X-CSE-MsgGUID: rqaG4ukmS1C66Xp19uaKmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131859981"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:40:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5TDs-0000000DGnI-2wrA;
	Thu, 17 Apr 2025 20:40:24 +0300
Date: Thu, 17 Apr 2025 20:40:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 08/10] gpio: aggregator: handle runtime registration
 of gpio_desc in gpiochip_fwd
Message-ID: <aAE9CJebvNitZkph@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-8-f40776bd06ee@bootlin.com>
 <aAE8mY2YjWt4PB1o@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAE8mY2YjWt4PB1o@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 17, 2025 at 08:38:33PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 04:08:16PM +0200, Thomas Richard wrote:

...

> > +	unsigned int ndescs = 0, i;
> 
> Slightly better (from maintenance perspective) to decouple assignment as it's
> not a standalone function that just counts them. So it means some code may
> appear in between and in long-term someone might screw up with the initial
> value for that.
> 
> >  	int error;
> 
> 	ndescs = 0;
> 
> > +	for (i = 0; i < chip->ngpio; i++)
> > +		if (fwd->descs[i])
> > +			ndescs++;

Btw, note with a mask for them you can just have a bitmap_weight() call instead of all this.

	ndescs = bitmap_weight(valid_mask);

-- 
With Best Regards,
Andy Shevchenko


