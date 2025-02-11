Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF7B1FDA9C;
	Tue, 11 Feb 2025 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294380; cv=none; b=djzgRqwRXzOnSpRLafflJO1FiHRFeweGfxRTreUNkmndk+gm4XnbkPUecSipiZmjEo9KSUzSjhiJV0WcY1Zb1QmWKLdmSrYHiV1/qwqK053HIiHt4qlxINqqyiDqQ5XJuZ3OSfXPXXSyniPbvjtQwszMftmSfcl57SUQrtSAQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294380; c=relaxed/simple;
	bh=IZPB7B9pB5EmnE+s+dDrcMGlv6lnxdK4n4Q/SkwmeHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/swAgCu7oamMp69A0ArCZODmeUmf95dOCWoklt/32fYH0ZCqQpbH+0Exq2dLxQDavQg+o1ySwMEoE8qFnKJgeORgrJNAXYGtKxrvyqaJrOtcS1dbM+e4mtNv3QnmBqfHV4nDhRPVfPkMHyARhCg8V6zdIiaQfzJZk8Sjjd5/pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxQ35Jvy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxQ35Jvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739294378; x=1770830378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IZPB7B9pB5EmnE+s+dDrcMGlv6lnxdK4n4Q/SkwmeHw=;
  b=HxQ35JvyVf2rnKYPoJPalNLeGd1Q9VmCtJLPJq4YM6UDi6RLOon3HEUT
   PsM/0kS3vHWTx7tFw0UbnsQfk3Idv2KmcXMAu3UA0VRnUe7aaMFBercSq
   S+BLdwsiN5ifCeIUfp8Y6n1BnoTcaNkzKoYqciyhFOTqjKpS+9NBR2/d4
   U5coSlexO9bYIgsOD0Pt6jR/FkFHm96/VVKJHFiIYUNzpzwitcWR7IoIx
   WA0h/4hkCuFgqo0s8moq5roiOcATnaFOe/R2ZrW5b4EF9PCA5xYs4FeGC
   o/3gaFvdblJFa0+yjANBNSe0kbZf5tdDcMx4HuYbPOO9WLU5fA1JWTvh0
   Q==;
X-CSE-ConnectionGUID: kW/WpR3NTNWpehhtAqHQKw==
X-CSE-MsgGUID: 4At8vwkeQWmu+TIXNJ31kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50565579"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50565579"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:19:38 -0800
X-CSE-ConnectionGUID: 546fX6IPS/SWbTMH2DDVSw==
X-CSE-MsgGUID: 9olfBPfjSBSxXw+q+o36sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="143423382"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:19:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1thtv2-0000000AZvt-0SIl;
	Tue, 11 Feb 2025 19:19:32 +0200
Date: Tue, 11 Feb 2025 19:19:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 10/14] platform/x86: Add alienware-wmi.h
Message-ID: <Z6uGo2UWit61bD7v@smile.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-11-kuurtb@gmail.com>
 <Z6t-msAAi1lVHzN9@black.fi.intel.com>
 <2c56e2de-02eb-d653-987f-69e674aab3c7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c56e2de-02eb-d653-987f-69e674aab3c7@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 06:51:03PM +0200, Ilpo Järvinen wrote:
> On Tue, 11 Feb 2025, Andy Shevchenko wrote:
> > On Fri, Feb 07, 2025 at 10:46:06AM -0500, Kurt Borja wrote:
> > > Add a header file for alienware-wmi with shared resources to support the
> > > upcoming file split.

...

> > >  static const struct attribute_group *alienfx_groups[] = {
> > >  	&zone_attribute_group,
> > > -	&hdmi_attribute_group,
> > > -	&amplifier_attribute_group,
> > > -	&deepsleep_attribute_group,
> > > +	WMAX_DEV_GROUPS
> > >  	NULL
> > 
> > I don't like this change as it makes code harder to understand (at one glance
> > you can't answer the question "what are the groups that being listed here?".
> 
> Over having #ifdeffery here, I've no problem whatsoever with it (and in 
> fact I suggested goingthis way). It's pretty much boilerplate anyway 
> having to list them yet in another place.

As I said in the reply to the cover letter subthread this is not my main
concern anyway. Let it be then.

-- 
With Best Regards,
Andy Shevchenko


