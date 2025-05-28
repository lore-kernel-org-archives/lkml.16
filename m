Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41374A28
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427378; cv=none; b=rLPOodm/mc4bvKIP1PDm2XbYhxEz9jJDkpxMR345BYfh9pvLm7zmOjjG2v5g5gpiyNjhnIZt5Wval64kLFjliG5IPy9vq6f34cF2Y1HvMYQzP64xW5D+1S8bTnPHtqOK6jGs7Wnwc+ZB3bjx/AwypPJRbEcbj8SpcCsO4FtquDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427378; c=relaxed/simple;
	bh=4pYxOTuaQHO2ph4JvhXpeDEXDuJLt50hEX6YyA8tTZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjAHB9NYKcj79Bz1asc3RDp0NBhHFIda9S5LqF9P0WUf3oe19NcgsKTXOFdirr/uT04NwPU7quNHUkkeB75v9rZwIzM2TRhTPolTypZlEmoPm8JNDr5kiOlo8KYgKH7tx/3zMcB6MfsDIJyz868UIm79T6ALsussq5OBsTdEiBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUTpOA5T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUTpOA5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748427377; x=1779963377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4pYxOTuaQHO2ph4JvhXpeDEXDuJLt50hEX6YyA8tTZU=;
  b=QUTpOA5Tgi0HbU47UQmaoQN9oA2Z5rcM65p1NoGntU2McnEQtWBHYSjj
   CqZnBmiiSNMZBdOaefhwXwLItvQIQDE4G0UvUb5wY5wWC8Qk3Nr+2BGwR
   Q3bxVVhUM3027/85E2V9M9kKwxE458PwbxXhjTBOfGP1QpF7h6/RJkr7D
   ywVlcE+C+DjEtiWXivNghrG2egACWykGc5WJNLidAE7L9cLWgEqGqnIT/
   AIxRufUtZcXCMg5vBuhlp9CU+8APpMXHfs96xetX+eYNSYOklCXBeMADO
   ggxohJsC3aAEHeLGcyAsntL/b3GgdTVvAh5JsNC8+ptKkCtpJa/iDlPhy
   w==;
X-CSE-ConnectionGUID: Yfrfkh1cQZOtbOlTpS/lxw==
X-CSE-MsgGUID: 3ZRoI18XRgCa5n+176oYeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50552498"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50552498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:16:16 -0700
X-CSE-ConnectionGUID: UukijEHMSIWZ6yS+Xmbk4A==
X-CSE-MsgGUID: dh2cMWCgSMi1dXUS1hwIZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="144171151"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:16:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uKDpR-00000001PjW-2sfp;
	Wed, 28 May 2025 13:16:09 +0300
Date: Wed, 28 May 2025 13:16:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Message-ID: <aDbiaepHBSgh1BNZ@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
 <aDbYs7QZRfr2i80A@smile.fi.intel.com>
 <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 28, 2025 at 12:03:43PM +0200, Arnd Bergmann wrote:
> On Wed, May 28, 2025, at 11:34, Andy Shevchenko wrote:
> > On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
> >> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:
> >
> > ...
> >
> >> > +	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)
> >> 
> >> 		   ^
> >> Did you mean X86_PLATFORM_DEVICES here?
> 
> Yes, my mistake.
> 
> > Why do we need to depend on the whole thingy (yes, it will be enabled at the
> > end) if we only talking about Intel?
> 
> I don't understand what you mean with 'the whole thing'. My change
> changed the existing 'select X86_PLATFORM_DEVICES if X86 && ACPI'
> into the corresponding dependency, in order to change it the
> least.

It used to be (for only one or two releases) X86_PLATFORM_DRIVERS_INTEL, but it
doesn't look closer to the mistake above, which I was thinking of. So, Lucas is
right.

> The dependency itself is needed because of
> 
>        select ACPI_WMI if X86 && ACPI
> 
> and this in turn is needed for
> 
>        select ACPI_VIDEO if X86 && ACPI
> 
> >> With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> 
> >> I see several drivers selecting
> >> X86_PLATFORM_DEVICES though. Maybe they should also be translated to
> >> dependencies instead?
> >
> > I think so, selecting that sounds wrong.
> 
> Agreed. Overall, what I'd really like to see is to remove
> all those 'select' of drivers from other subsystems.

Let's start from some low-hanging fruits?

> I think
> ACPI_VIDEO is at the center here, and changing all the
> 'select ACPI_VIDEO if ACPI' instances to
> 'depends on ACPI_VIDEO || !ACPI_VIDEO' would solve a lot of
> the recurring dependency loop problems in drivers/gpu/.
> 
> Actually doing it without regressions is going to be
> nontrivial though, because any change in this area is likely
> to trigger another dependency loop somewhere.

True and I agree this requires more comprehensive testing.

-- 
With Best Regards,
Andy Shevchenko


