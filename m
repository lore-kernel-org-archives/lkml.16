Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B31D218AAF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424891; cv=none; b=XpTS1v26DipWHvdf8FoX5Kn4v8cbAqBUk3qSUD8uxv9dFZGYPGM+4nOglzghIB9Y/yHGMTcd2bj63QzZk9URnuF4bmuZcU6JA82OZ2G8hZoJZM/IP6tcfobwqRbMN+gmEx59Id1SwETBUWhspKheeRBPDpJoMUOEMY4ZS2XpQak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424891; c=relaxed/simple;
	bh=831o/0tq+xxG8bYFWyAIG7pC+lO6xj5Q2fEFNJn6MBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uphPzMPU9tYjati2/+FHraDvetzPHZLpLvUaUHi+5R6wUpxwicwdMJpyELo+hHQLBHHuwoCxUS4ToEoyYNZ1Rjmn5HytGZswk1jKkUGfyw1PY02/G6B5JVlr3bYTQ+pPtoOx/x2o2TR2Vt4BYrOuyjVR8+3w6FOcfb+AhOKHQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crQufSHr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crQufSHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748424891; x=1779960891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=831o/0tq+xxG8bYFWyAIG7pC+lO6xj5Q2fEFNJn6MBg=;
  b=crQufSHrOe7MZ6Jpo0G8e+eCPNZOHLIfjU3qqcdLXEQxV2Zt29LerehP
   mEBuwJTblzKDHNzuIr1x+5dzLFEljWpiIeqBvaCjmK16eqQ90yzu+xle6
   1blCUJwXwL0LslPeTuCD2FrO7YAO9/BxppsvrnaP8IZ9b54xOGqgZH10F
   OrcRq97OscX+4sSdryicrEV7WdjxJYP6dZpIOdge9dtq0e4uoQCIj5Q3H
   MYA/YA2Wr2tBS7EO6YylZDuzCoaP99Ib1uO44J92EQ8lltG+tTLSVtNUR
   6ATH+C5A+GpLz/kkdspDxdKCiVtNlTBRRWYX0biIx3fKQgD5nV9xUVgVS
   w==;
X-CSE-ConnectionGUID: xfCR/mnCSQqXCNGqsWG6cA==
X-CSE-MsgGUID: 3FrsWqHQTdWeuul904pQJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50437827"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50437827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:34:50 -0700
X-CSE-ConnectionGUID: +xoKY/ybQhW1HOYwA0lBJg==
X-CSE-MsgGUID: 4cyIKe+NRE2uGPCtkAHl7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143641016"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 02:34:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uKDBL-00000001PEa-19lW;
	Wed, 28 May 2025 12:34:43 +0300
Date: Wed, 28 May 2025 12:34:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Message-ID: <aDbYs7QZRfr2i80A@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:

...

> > +	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)
> 
> 		   ^
> Did you mean X86_PLATFORM_DEVICES here?

Why do we need to depend on the whole thingy (yes, it will be enabled at the
end) if we only talking about Intel?

> With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> I see several drivers selecting
> X86_PLATFORM_DEVICES though. Maybe they should also be translated to
> dependencies instead?

I think so, selecting that sounds wrong.

-- 
With Best Regards,
Andy Shevchenko


