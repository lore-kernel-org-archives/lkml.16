Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8E91DE2CC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766609; cv=none; b=ETw80MTwOuhYASjic1HbzNlbnqvGmUKnJOGYRbO25fHnVnO/YcSrGo1ewYE/M6pyKgbI26LzHboGsyFefeWlU5B2cYTLcSzBeyyO6YQoCF966ZB0upAlaGxVxU2Zisn502ZO7d+Q3yuVFiYqN/8SNW8K7IHYdjRHwnjpjhq+vhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766609; c=relaxed/simple;
	bh=2R0SU56fHG2qv4/IOZgvDNrfJALxaJEYBx69YFjuIU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=habpsE0/7XeJCm8j0lJeUDoWv3WmF3bo0bRo42YMwZ0yyLz+AY6+U2/nju/gJTCihXZIBYg9mhwz/lPhBoQXOPpOQjpYYJDjx7lE4jSGFLPEYdYWuZ5WmoHjrrC6/+nkt/mAgIA8HBvH7RFp4la6G1MoASA7zmclpNFGdM8pjI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLv7bI+s; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLv7bI+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743766608; x=1775302608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2R0SU56fHG2qv4/IOZgvDNrfJALxaJEYBx69YFjuIU0=;
  b=lLv7bI+sj2skoCXxE98qyXV6DURrFnrfsy/H0fp//EEUcoxvud4byE6+
   YUIzDsGPQaU2Q357/8R+pghzXVCbhv3LIY8TqVm2xiOosB6p5vm6PExyp
   NQqQ9OYPSs010wMjlxFhivIN2/glijxvTld3MjtB9iMsc7eN6FH8gwjsx
   U+cof5jr/lYKCTyExsWCKwnGEMtQ+H+Sdl4zvELnRdQpfbwXFsk86qP0K
   09BEonlg8xEEf3iZIltJSw+7yTgSFe5LOVRIxjWNO38PDeNRS0uTrnaxD
   yRHdhp0C6LN32dk2K8SQj2b5FkT/RNcOX1B5w7uKKf59lMvFmfYomdl8A
   g==;
X-CSE-ConnectionGUID: UGmPHOR1SMiy9nk+UigZpQ==
X-CSE-MsgGUID: C+UPRLzUTD2ZVTSLpfQGFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45220885"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45220885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:36:46 -0700
X-CSE-ConnectionGUID: czSbiM0sTqmFr2LKnLEIUg==
X-CSE-MsgGUID: dDnMGDd3RNSMcxKazZrKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127815705"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:36:44 -0700
Date: Fri, 4 Apr 2025 14:36:41 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-_ESekESYYvMHeR@black.fi.intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
 <2025040336-ethically-regulate-3594@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025040336-ethically-regulate-3594@gregkh>

On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:
> > Extend MFD subsystem to support auxiliary child device. This is useful for
> > MFD usecases where parent device is on a discoverable bus and doesn't fit
> > into the platform device criteria. Current support is limited to just PCI
> > devices, but this can be further extended to support other types like USB
> > in the future.

...

> > 2. Should we allow auxiliary drivers to manage their own resources
> >    (MEM, IO, IRQ etc)?
> 
> The resources are all shared by the "parent" device, that's what makes
> aux drivers work, they need to handle this as there is no unique way to
> carve up the resources here.
> 
> So I don't know how you would do this, sorry.

Perhaps we can carve it up in mfd_add_devices() using start and end members
and error out if they overlap.

Can't we still have a struct resource that is unique to that specific
auxiliary device?

Raag
