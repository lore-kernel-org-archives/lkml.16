Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8A154C17
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825562; cv=none; b=gHjtsp0Z+cBSdpemkouQEBwTALCcgPQgo37P4tO46/yh35qnby0utHRGgu/pFLLQGX71Ca6I0a2qUdTcRdZWAml71kqJ2cNOaIwY5f5BI6i4rGc+Y/WZGT+6RVAH51w4/pKMTLPSuqZudmPtxJLuNdkqhYzKQ3K9IWU16TvO4wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825562; c=relaxed/simple;
	bh=5kHFo+V9DJIddaMgMFYm4EJg+ZcCk/tBSs8csBR+egs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVdb6AQbaxdR2F4sKiaCV7v75dEEzkGtXB0qB0vYy+mNylS6zZ60HDjJQY3UYmuSE9Xz/nJDw1eLZO2NVz0LMS5NcxzzG6akTZvW29tDWgC58ymF9irnT+CLe7ked6prbyG3Ohz/xdfcqfOPh10kihigQusrQ8RWy4PIUWvvQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFm4sFGp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFm4sFGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744825561; x=1776361561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kHFo+V9DJIddaMgMFYm4EJg+ZcCk/tBSs8csBR+egs=;
  b=cFm4sFGp1A+IZvoLv9zBG0wB0DAMCwDLv+8dl5guuB206UIixrlKPOEi
   QMHw7dTuygBG9lBWJdcWzEyTDoKUDeJdYt9p0mGFUhlv2E3qnZ+4DJG8P
   9URqRy5cneMjFs4Lh72ffBb9JTdEjgkPm0170bKBiBAdWSPUuSRsTJkNr
   4/4SgCLmEZM/phBdoklA6s4o1ZsMtOFzFX/2wi04g3xByPpu8rtTzJHXk
   qC6FGlLBFnUdAE1lWpQ6kscBhsCMgFbNhsXPzgj6+su7w84ITAq0r+oor
   5NgoXZn4MjpGu6ohJZHj0slXapxv0mLm1SdcdRmTfvAGANL8yyV8PQqAx
   w==;
X-CSE-ConnectionGUID: jWaro73HRGiYm2Z6r5GWRg==
X-CSE-MsgGUID: iwjp56ARSgquK5cFGU/rWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46517466"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46517466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:45:56 -0700
X-CSE-ConnectionGUID: VpcMh4JERfyv0DJt4f8EcA==
X-CSE-MsgGUID: PFvb/YazQaOppcESy+/Smw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="161589079"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:45:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u56pb-0000000Cvdi-1oVM;
	Wed, 16 Apr 2025 20:45:51 +0300
Date: Wed, 16 Apr 2025 20:45:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Z_6uzH9DsWIh-hIz@mail.minyard.net
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
	OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH] ipmi:si: Move SI type information into an info structure
Message-ID: <Z__sz8BvIvdyF4dN@smile.fi.intel.com>
References: <Z_-d6Pj7ZFuG9gNA@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-d6Pj7ZFuG9gNA@mail.minyard.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 07:09:12AM -0500, Corey Minyard wrote:
> Andy reported:
> 
> Debian clang version 19.1.7 is not happy when compiled with
> `make W=1` (note, CONFIG_WERROR=y is the default):
> 
> ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type'
> +from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>   268 |         io.si_type      = (enum
> +si_type)device_get_match_data(&pdev->dev);
> 
> The IPMI SI type is an enum that was cast into a pointer that was
> then cast into an enum again.  That's not the greatest style, so
> instead create an info structure to hold the data and use that.

I'm going to test this today or latest tomorrow, below some comments.

...

>  	u8 slave_addr;
> -	enum si_type si_type;
> +	struct ipmi_match_info si_info;

	const struct ipmi_match_info *si_info;

?

I understand that right now there is no benefit, but my suggestion is scalable
and prevents from sudden values rewrites. Also that's how other drivers do, but
of course not all of them.

>  	struct device *dev;

...

> -	else if ((new_smi->io.si_type != SI_BT) && (!new_smi->io.irq))
> +	else if ((new_smi->io.si_info.type != SI_BT) && (!new_smi->io.irq))

While at it, drop unneeded parentheses (at least in the second part).

>  		enable = 1;

...

>  static int ipmi_pci_probe_regspacing(struct si_sm_io *io)
>  {
> -	if (io->si_type == SI_KCS) {
> +	if (io->si_info.type == SI_KCS) {
>  		unsigned char	status;
>  		int		regspacing;

It looks like the above conditional is for the whole function, if this is
the case, I would go with an additional patch to drop the indentation level.

	unsigned char	status;
	int		regspacing;
	...
	if (io->si_info.type != SI_KCS)
		return ...

...

>  #ifdef CONFIG_OF

I would clean up this ugly ifdeffery as well, but it can be done after this
patch.

> +static struct ipmi_match_info kcs_info = { .type = SI_KCS };
> +static struct ipmi_match_info smic_info = { .type = SI_SMIC };
> +static struct ipmi_match_info bt_info = { .type = SI_BT };
> +
>  static const struct of_device_id of_ipmi_match[] = {
> -	{ .type = "ipmi", .compatible = "ipmi-kcs",
> -	  .data = (void *)(unsigned long) SI_KCS },
> -	{ .type = "ipmi", .compatible = "ipmi-smic",
> -	  .data = (void *)(unsigned long) SI_SMIC },
> -	{ .type = "ipmi", .compatible = "ipmi-bt",
> -	  .data = (void *)(unsigned long) SI_BT },
> +	{ .type = "ipmi", .compatible = "ipmi-kcs", .data = &kcs_info },
> +	{ .type = "ipmi", .compatible = "ipmi-smic", .data = &smic_info },
> +	{ .type = "ipmi", .compatible = "ipmi-bt", .data = &bt_info },
>  	{},

...and this line should not have a trailing comma.

>  };
>  MODULE_DEVICE_TABLE(of, of_ipmi_match);

...

> +	io.si_info	= *((struct ipmi_match_info *)
> +			    device_get_match_data(&pdev->dev));

This ugly casting won't be needed if you use const pointer as suggested above.

	io.si_info	= *((struct ipmi_match_info *)
			    device_get_match_data(&pdev->dev));

...

>  	switch (tmp) {
>  	case 1:
> -		io.si_type = SI_KCS;
> +		io.si_info.type = SI_KCS;
>  		break;
>  	case 2:
> -		io.si_type = SI_SMIC;
> +		io.si_info.type = SI_SMIC;
>  		break;
>  	case 3:
> -		io.si_type = SI_BT;
> +		io.si_info.type = SI_BT;
>  		break;
>  	case 4: /* SSIF, just ignore */
>  		return -ENODEV;

I haven't looked where tmp comes from, but maybe that's a candidate to be in
the info structure to begin with?

-- 
With Best Regards,
Andy Shevchenko


