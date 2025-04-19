Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED5B2AE84
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745076515; cv=none; b=JqY0U2OzXD6pNKr3/W/zHszERbMBhMkOC4jR1OcKUKayR8fvb0l59xmPQ8Sk+P0OoGTawMYk/C+2kGCGDceMsvFK+6gxMC2gMIebElhUhV+RZwAJv620QmYbZKXDMQDy9CWd2KVqgx4XsuP+4Oi98uftEEmtgXO/MChPf8ECFNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745076515; c=relaxed/simple;
	bh=pABPv75wiqrLcMp7mjLYW9/9ogpae32WVy3x8ftWrrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tb/hhE1fF/FZutnOzunWoJdmB7AkQtB+54A6iCURBxC6qQh9UZVLIPTY+56JrmWLjYOyP4HHg7xVnR23/ISnTrM3fk0xHQG+tLpdsjncsgd1GERrbW1qlZzai1M1GRGQPSLCdN43gDMShDWyYuwiJ9KRi/+QHiasaBW27sp/Nso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acdEuHE2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acdEuHE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745076514; x=1776612514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pABPv75wiqrLcMp7mjLYW9/9ogpae32WVy3x8ftWrrU=;
  b=acdEuHE2FNuC9qP5SSBIoaoiATA5i3yvjcF7cF3t+arc31FehKAvwJLj
   rdtCsQ8pTbUij37fYJI2w4g5hYC30hBHHufb8EweiR1RvfGhi0eedZdD+
   P5/FcsCdrjhjyg8qAl4R7/+A8uFXKncmMHjQ+2PCNRYtJjcy5ucvp/xMl
   VgQYU4SS1t7ZEBGooG8v1EdMEWJbw36mkEAGz+AzALXp/Dw2tptOhjow1
   Zfp100RR0uZ4x9PSS3umFkqnGjm0u+8F8E2FHVQpqpcvwTP0VqHK3vnSy
   COGxFyCQxtXtAaoeDlqCVBiBq6a1bsUMzikPlqhCcLXqJ9Ahy/nqnNgdk
   w==;
X-CSE-ConnectionGUID: 2Z2qLWF8T8mFAUcgCNZxyg==
X-CSE-MsgGUID: 3jPVyVspQ4iX70ZX9qa+ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50341834"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="50341834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:28:33 -0700
X-CSE-ConnectionGUID: 1KFl0vGjRfeoOoHkp2PuoA==
X-CSE-MsgGUID: maJYOSkATTOqB24ZWpQ2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="136212189"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 08:28:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u6A7I-0000000DqqO-3TdA;
	Sat, 19 Apr 2025 18:28:28 +0300
Date: Sat, 19 Apr 2025 18:28:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, lee@kernel.org,
	mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: core: Support auxiliary device
Message-ID: <aAPBHBplhmZ_D0jC@smile.fi.intel.com>
References: <20250418123433.2586383-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418123433.2586383-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 18, 2025 at 06:04:33PM +0530, Raag Jadav wrote:
> Extend MFD subsystem to support auxiliary child device. This is useful
> for MFD usecases where parent device is on a discoverable bus and doesn't
> fit into the platform device criteria. Purpose of this implementation is
> to provide discoverable MFDs just enough infrastructure to register
> independent child devices with their own memory and interrupt resources
> without abusing the platform device.
> 
> Current support is limited to just PCI type MFDs, but this can be further
> extended to support other types like USB in the future.
>  create mode 100644 include/linux/mfd/aux.h

...

>  config MFD_CORE
>  	tristate
> +	select AUXILIARY_BUS
>  	select IRQ_DOMAIN

>  	default n

Can be dropped. It's the default 'default' and with user invisible
configuration, it makes even less sense.

...

> +/*
> + * Common structure between MFD parent and auxiliary child device.
> + * To be used by leaf drivers to access child device resources.
> + */
> +struct mfd_aux_device {
> +	struct auxiliary_device auxdev;
> +	struct resource	mem;
> +	struct resource	irq;
> +	/* Place holder for other types */
> +	struct resource	ext;

I don't like it. It's no-scalable solution, just make it VLA. Each resource
already has type in case one needs to extract an exact one, also this won't
work in case of the two resources for memory or IRQ needed.

> +};

...

> +/* TODO: Convert the platform device abusers and remove this flag */
> +#define MFD_AUX_TYPE	BIT(31)

Yeah, LKP wants this to be signed... Or 'id' to be unsigned.

-- 
With Best Regards,
Andy Shevchenko


