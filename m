Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F099F24BC06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689841; cv=none; b=U/YRj9DJeXEFCKLTcvk59Q6IPoZkVp3NxEH1UkXuNwm5+XBCjH5/VbMnLr8a+oq9FhfYG1zBB79Grdcqj1ar5lCJA29l1wS2LL3s9d6HcvwW15U4Nj/JByxblswP1Pqjng79OoF0S9NUrvgzkYsKtpoyyfoBtJNUU2m8hSwPvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689841; c=relaxed/simple;
	bh=3s67qkqoQqNkuesiE7hgp2pDfwLSFJPyKnMd3yiQubY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKXaiW2mwv/gTqtz/JeDmxTj5n0It8b4cMSkGpg1rwR4LrPODxO3cPVhglKGv2aw70uqH6KRAoiXk5O9l922U5MOxFL4WD6KTkvsvWRl+wv/aY5zeNhYAl7ykElnFE4rdMvbhFofb+zuhQuSiJP9uTYl7TT1vkJLUrdfQF7AktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMb5NLUK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMb5NLUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743689840; x=1775225840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3s67qkqoQqNkuesiE7hgp2pDfwLSFJPyKnMd3yiQubY=;
  b=OMb5NLUKfUboyvq07uJxmfGxg2hIHTY6b4E/D4UNwIeEt5bmnc73KJUT
   yn6weh04E98YoHlLuyHO9XhifwpOX670iEL9qI9QyL69gNvO+A0zTJswX
   kq7g0j+e8glARjQJ17klFAzyvXsQxDAB7mebjNLILXXT4ygbFAeB4JgI9
   EG1U67Oy52wPUoSJczKaU6cqQFk3Fz6n3GBwxdgqHULFNFMAo9ylFFIPg
   3oqGIcNc/KhbZb98yfvuzhmh+lP/GXIrkCUPbWRCFyt+MLV5H0eFi3V8R
   noSXk52p8bp7BjaUCjzdqb70+6kVc8yRFnKdSaPgwqNr/FEh2+HUq8YY2
   w==;
X-CSE-ConnectionGUID: 4U4cQZyPSg2pm77TtnXcRA==
X-CSE-MsgGUID: vunuSRmZRFeK5NB0dJj3ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44356646"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44356646"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:16:58 -0700
X-CSE-ConnectionGUID: MGDt3Qi+QqaxeBZTezr1WA==
X-CSE-MsgGUID: 6ergrmBORR6/r0o3/TDBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131736007"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:16:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0LND-00000008pol-3dxJ;
	Thu, 03 Apr 2025 17:16:51 +0300
Date: Thu, 3 Apr 2025 17:16:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <Z-6YU24dhxF5PRaw@smile.fi.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 03:02:47PM +0100, Greg KH wrote:
> On Thu, Apr 03, 2025 at 04:30:53PM +0530, Raag Jadav wrote:

...

> > 2. Should we allow auxiliary drivers to manage their own resources
> >    (MEM, IO, IRQ etc)?
> 
> The resources are all shared by the "parent" device, that's what makes
> aux drivers work, they need to handle this as there is no unique way to
> carve up the resources here.
> 
> So I don't know how you would do this, sorry.

I think we should simply enforce the requirement that MFD on AUX bus must use
regmap. This will solve the serialisation and common access to the resources.

-- 
With Best Regards,
Andy Shevchenko


