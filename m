Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67000433CE
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176470; cv=none; b=Bwk2LjD0bJgE5uvdoXCkTmJ6sdbYaPlmn8ydgkZbf+MCe8xl94hNP8J/5Fq6/2Qb2ASvhBUit2g0Dqu8Z7eFm+8X6n9krHVRd71F/lWwnujVrCSy/i5BDSdYlwzoviABKoITY61Y9zzdtYQONX18p/+1AUC9z1bp2exEMPLtoPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176470; c=relaxed/simple;
	bh=2WG4bzLM0334WSlqrhVdYZzYXTW+40a41pe4HG588w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ej7LHNNxl3p9jeZgsWygMAVKtCCSe/vUvBIgw/N9rRWh+1bT7MggImJbldiobMTtTnPGTesmrIskLHykU2mIqnwBFvrEYlJRxndRBwTfFqzJBFXDf29dufK1tdqq9xoafgTeuJJHO8Lm0C/wH/Zp91nrFz/E4pclc1AfbvyPaSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: RyEuSbbTRm2uiie7qjU5fA==
X-CSE-MsgGUID: hdbxT4QBR1+9RJF/p6YGgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47999221"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47999221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:01:08 -0700
X-CSE-ConnectionGUID: 4C2o5XUfTi2iHyrlsKlAYw==
X-CSE-MsgGUID: 52WFijvbTdyzFNN4xJTBoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135560432"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:01:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1uAmGW-000000028Mq-05RD;
	Fri, 02 May 2025 12:01:04 +0300
Date: Fri, 2 May 2025 12:01:03 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>, Purva Yeshi <purvayeshi550@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] mfd: lpc_ich: Fix ARRAY_SIZE usage for
 apl_gpio_resources
Message-ID: <aBSJz4Nvyzh4c9AO@smile.fi.intel.com>
References: <20250322131841.31711-1-purvayeshi550@gmail.com>
 <174377238828.330559.7652024137546009839.b4-ty@kernel.org>
 <aAqKcn25bkrjIiLF@black.fi.intel.com>
 <20250501120725.GJ1567507@google.com>
 <aBRLqGDpV8Y63JaJ@surfacebook.localdomain>
 <20250502072732.GB3865826@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502072732.GB3865826@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 02, 2025 at 08:27:32AM +0100, Lee Jones wrote:
> On Fri, 02 May 2025, Andy Shevchenko wrote:
> > Thu, May 01, 2025 at 01:07:25PM +0100, Lee Jones kirjoitti:
> > > On Thu, 24 Apr 2025, Andy Shevchenko wrote:
> > > > On Fri, Apr 04, 2025 at 02:13:08PM +0100, Lee Jones wrote:
> > > > > On Sat, 22 Mar 2025 18:48:41 +0530, Purva Yeshi wrote:

[...]

> > > > > Applied, thanks!
> > > > > 
> > > > > [1/1] mfd: lpc_ich: Fix ARRAY_SIZE usage for apl_gpio_resources
> > > > >       commit: 87e172b0fdd3aa4e3d099884e608dbc70ee3e663
> > > > 
> > > > Can this be reverted ASAP, please? See below why.
> > > > 
> > > > There is no problem with the code. The original author of the change
> > > > haven't proved otherwise.
> > > > 
> > > > The change made it much worse to read and maintain. By the way, it actually
> > > > _added_ the problem as far as I can see with my small test program.
> > > > 
> > > > Let's just calculate based on the sizeof(struct foo) taken as 10 for
> > > > simplicity and array size as 4x2. The full size of the array is
> > > > 4 * 2 * 10 bytes. The size of the entry in outer array will be 2 * 10 bytes.
> > > > Now, what ARRAY2D_SIZE do is (4 * 2 * 10 / 10 / (2 * 10 / 10) == 4, and
> > > > that's WRONG! This will make a out-of-boundary accesses possible.
> > > > 
> > > > If smatch can't parse something, it's problem of smatch. No need to "fix"
> > > > the working and robust code. The original code even allows (in theory) to have
> > > > different amount of resources per entry, however it's quite unlikely to happen.
> > > > But at bare minimum it shows the entry taken along with _its_ ARRAY_SIZE()
> > > > and not something common over the outer array.
> > > 
> > > Done.
> > 
> > I still see it as commit
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?h=for-mfd-next&id=c6c07f8ea2cbb0dca0e529f9ed16df71276515a4
> 
> -ENOPUSH
> 
> Try again.

Thanks, now it's not there.

-- 
With Best Regards,
Andy Shevchenko


