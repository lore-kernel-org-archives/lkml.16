Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1F262D0C;
	Tue, 11 Feb 2025 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300128; cv=none; b=hRnghWTlC0UB2xgApk0K9hsRcEku0Do3ulnafJcam0OTr0wmHv3TTWusNMiOyxXNDu/17XFId0eHBL/67J2cg06syJtSlQPEiFOzwWHp1oPYgk5ssB2DmI/Q/Sy2o3dpwrYovzFibLhZWUPDemGr1paD21wM3HrJsCf14PNNJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300128; c=relaxed/simple;
	bh=koNP/9yZvMyPbDEVBFW31fkTclw4NFbQAigb7QRBrUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pd5/3eWHV7yLz/1r4NfLEEiC6fCOEXrjLGj1n2jzGdWmRSEGk4LAVVexe/6OnzftwiZtrDt42Zai8wOr1/5eUm7YC7l0iSLIOubkOAYeySBgmv9hvtSZCEQLogqCsHvSHUvr8/ObRT0sxYP78hTtVP6XDPlazdL2ojy5wZhyABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1KKCcwt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1KKCcwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739300127; x=1770836127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=koNP/9yZvMyPbDEVBFW31fkTclw4NFbQAigb7QRBrUc=;
  b=c1KKCcwt9BQ7fG6q+avgaFgdcJ3++IG2A4UtMFNhXE4cMdPjSyco3Haa
   vjPRfg0TLVG+gZD4llJ4QAKmZHouf7e4nHQ9jv7lbIeEZ232R8LottUzk
   XeCJA6aqHeOYAeUXlhlPlb5zEJAjht0CDxYIlsTnozqFos53lRcNVJZVA
   1cZeQfu8paZjOufcEI1u1D1ttxolg6K/cKsbdGwOwCDx32yxOb40WQp+k
   x3kuJqThk+LkDViZAutWKYJ4WUNZGMbsICcI8vQvHeMFNE7PalxXLwyER
   Amj1oahiMCeP6XAFyEHq3UFdUrkZuBjcmN4JGgIZvk9HN45Q3z5o9lKZm
   Q==;
X-CSE-ConnectionGUID: i532HmdQQriRTsczrAA+WQ==
X-CSE-MsgGUID: CvfoEefXRcu9BCQQ6fbk7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43698579"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="43698579"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:55:27 -0800
X-CSE-ConnectionGUID: DDnQjDjlQCqoxwWtn++gOQ==
X-CSE-MsgGUID: 5cRn48ETSiGCkPcS/HY2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112352805"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:55:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1thvPh-0000000AbG4-4Bnc;
	Tue, 11 Feb 2025 20:55:18 +0200
Date: Tue, 11 Feb 2025 20:55:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 05/14] platform/x86: alienware-wmi: Refactor hdmi,
 amplifier, deepslp methods
Message-ID: <Z6udFWtKRz-VH4-7@smile.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-6-kuurtb@gmail.com>
 <Z6t8y7VvZL6UDEck@black.fi.intel.com>
 <D7PT36DCB1P5.2YE8H1MHFAE15@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7PT36DCB1P5.2YE8H1MHFAE15@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 12:51:59PM -0500, Kurt Borja wrote:
> On Tue Feb 11, 2025 at 11:37 AM -05, Andy Shevchenko wrote:
> > On Fri, Feb 07, 2025 at 10:46:01AM -0500, Kurt Borja wrote:

...

> >> +	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
> >
> > Rather introduce pr_fmt() and drop all these prefixes.
> 
> This was not introduced by me so it probably requires a different patch.

Sure, it's just a side note comment.

...

> >> +	if (!ret) {
> >
> > Traditional patter is to check for errors:
> 
> I wanted to change as little as possible the original function, as in my
> opinion this would require a different patch.

Why? This change touches the lines, it's still needs careful checking despite
changes in it. But I can understand your line of thinking here. So, then
consider separate patch.

> >
> > 	if (ret) {
> > 		...do error handling...
> > 	}
> >
> >>  		if (out_data == 1)
> >>  			return sysfs_emit(buf, "[input] gpu unknown\n");
> >
> >>  		else if (out_data == 2)
> >
> > Redundant 'else'.
> >
> >>  			return sysfs_emit(buf, "input [gpu] unknown\n");
> >>  	}
> >> -	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
> >> +
> >> +	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
> >>  	return sysfs_emit(buf, "input gpu [unknown]\n");

-- 
With Best Regards,
Andy Shevchenko


