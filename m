Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6381D17555
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048245; cv=none; b=kMhxl1UU6MlttsmocyEbrs+UBSHdRMDQjyPVnalY62lxIfLkKDMt9LXD7j74d6zT+GQlnm31YT14Pjyk1nuaHz1yxSLLjuSmghH+Xft1abmZyi19eUf54sY76sZZ2YODXdQqE2Gsad5rETp+CpayFh1PCsqCdxTu6SJN9uDt984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048245; c=relaxed/simple;
	bh=3R86o/WscK7lM10ya42CG/B/k+oINWTHPif2orUE+Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpaanotR00ontvqDulGzlAXUob0MqmjFRHgrv7QkbSYt8sNUmHrV2QpbMNBEgdJ39oGpBw3Q0OsaFmPUKqzvotJ9tRCl+1abQydlH4nNBnEQI+HUr0u2mhHbq9igYlfHEdpSrgv2UCqt3lfmMG4fEu7XXfhronArQ9NdOuuHOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxxXulPc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxxXulPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747048243; x=1778584243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3R86o/WscK7lM10ya42CG/B/k+oINWTHPif2orUE+Ls=;
  b=dxxXulPcjRyfWQF41vC7UB4rqGXWrbbM860MdsVvoT+n/PLSHHh4TS80
   5S55xHmnUV0TvAWqZ/5sjdfGT18JcoWleJb4bpUnE4fMmI+TiVkhzSaaY
   OO61xQ5gUNkuetyeusejPC8fR3/V5KwEwDgKtfR3Nm93dbhWj9hgJA/GY
   izf0AbX7ecdSvVzQJW4DDE2eI7SuLk9aCKf4P2Q2MJlgXFOoluxt2LsQq
   LS19mZsltmjLlxAIas68HZb5HZSyRj0h38FEl+7xr2QcBO+36PvmIWRJB
   vpOS/MxIvQUqfWb/0SNO9kmooSy1ANIhqOTZdOYICoN9uAnO8xbPVG3o/
   g==;
X-CSE-ConnectionGUID: euRq3RC0QEOfOjPaaj7L/Q==
X-CSE-MsgGUID: WhY0VGRYTn21GBHFG16G0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="51490679"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="51490679"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 04:10:42 -0700
X-CSE-ConnectionGUID: 1UCgEBFkSHGY0UulsJovMg==
X-CSE-MsgGUID: K/xs96yhS+SPaLa7FRIoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="142546267"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 04:10:40 -0700
Date: Mon, 12 May 2025 14:10:37 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, david.m.ertman@intel.com,
	ira.weiny@intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: core: Support auxiliary device
Message-ID: <aCHXLarju7hOXL40@black.fi.intel.com>
References: <20250428060207.3170325-1-raag.jadav@intel.com>
 <20250501125028.GM1567507@google.com>
 <aBVArb-zJ_aqicHW@black.fi.intel.com>
 <aCHL8WWV-Wt7OrII@black.fi.intel.com>
 <2025051221-gulf-schematic-26e1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025051221-gulf-schematic-26e1@gregkh>

On Mon, May 12, 2025 at 12:36:24PM +0200, Greg KH wrote:
> On Mon, May 12, 2025 at 01:22:41PM +0300, Raag Jadav wrote:
> > On Sat, May 03, 2025 at 01:01:23AM +0300, Raag Jadav wrote:
> > > On Thu, May 01, 2025 at 01:50:28PM +0100, Lee Jones wrote:
> > > > On Mon, 28 Apr 2025, Raag Jadav wrote:
> > > > 
> > > > > Extend MFD subsystem to support auxiliary child device. This is useful
> > > > > for MFD usecases where parent device is on a discoverable bus and doesn't
> > > > > fit into the platform device criteria. Purpose of this implementation is
> > > > > to provide discoverable MFDs just enough infrastructure to register
> > > > > independent child devices without abusing the platform device.
> > > > > 
> > > > > Current support is limited to just PCI type MFDs, but this can be further
> > > > > extended to support other types like USB in the future.
> > > > > 
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > ---
> > > > > 
> > > > > v2: Introduce a shared struct mfd_aux_device
> > > > >     Introduce auxiliary device opt-in flag
> > > > > 
> > > > > v3: Fix device_type ABI breakage (Andy)
> > > > >     Aesthetic adjustments (Andy)
> > > > > 
> > > > > v4: s/mfd_aux/maux
> > > > >     Allow num_resources for child device (Andy)
> > > > >     Fix build warning (Andy)
> > > > > 
> > > > >  drivers/mfd/Kconfig      |   2 +-
> > > > >  drivers/mfd/Makefile     |   2 +-
> > > > >  drivers/mfd/mfd-aux.c    | 156 +++++++++++++++++++++++++++++++
> > > > 
> > > > This looks like mostly duplicated platform device code.
> > > > 
> > > > If you are _certain_ that it needs to exist, you need to push it out to
> > > > the auxiliary subsystem and remove any traces of it being MFD related.
> > > > 
> > > > If it's needed by MFD, it'll be needed by other auxiliary users.  Even
> > > > if not now, sometime in the future.
> > > 
> > > Greg, if you are okay with this, please let me know. Or perhaps suggest
> > > a better alternative.
> > 
> > Greg, any guidance on this?
> 
> I don't know what to say, I don't see the code here that is being
> quoted, sorry.  If this should be in the aux code, add it and submit a
> patch that uses it so we can see what you are referring to.
> 
> confused,

Apologies for snipping the context in attempt to reduce noise.

Original patch[1] with Lee's recommendation to move all the resource()
helpers from MFD to auxiliary subsystem, or perhaps an alternative way
to manage resources for the usecase.

[1] https://lore.kernel.org/r/20250428060207.3170325-1-raag.jadav@intel.com

I can still send out a v5 if it doesn't help. Let me know.

Raag
