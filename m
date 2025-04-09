Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA83267AEC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212665; cv=none; b=OyCQuaLxQuR7ZnIQIorPwfjwj8FAMt8fsLj/hA0ThmiKm2UPCCh1MflJLpLYrLJOboUnqMsrbypywtdpiS4Gn6jQZcUsFrQSX0X2IMS2r47O6jhG+tZrDJoceX2ZkqMieb9pHPxL7C7RXHuQ78wNcMrPmj54NTUxGB2C9N7JOmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212665; c=relaxed/simple;
	bh=hUEFiiieZcszzZzHIBnNHd7iH5NvppFvtM3AUkX1eJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGYWo0a51IBv1u/6z0GpxT8xye5Qf2MATfyzncjF/xY8/tFwPJiJiCvvlogcDb69ajVjJeyaTAgeRgzsIgV6/RYTf036fa9Pa2MuhGFwIl5sYCFjtb5PcfFHdt08XgeiNxUGKzDVe2de8e3UsFikJ/cODTxVVT1d1nMKFe2t6Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6YirVoR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6YirVoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744212661; x=1775748661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hUEFiiieZcszzZzHIBnNHd7iH5NvppFvtM3AUkX1eJ0=;
  b=a6YirVoRRcTE+cSzXBNrghXNkhnopkGoAvVgn3O45/gwqVeYi15DuttT
   8uq686txoYNoLtkpHaytGiJP2kmVnVpwxX5jmxJ9pl2cM2znUHffnMPKL
   1B3Dv3EtwedtssJ6jQNRZRi6TsVCPNz5ihJaGGuhJyBrSJwZnLj0thFmQ
   4njMR/38odkDo5oebSFcdnkLo/XqaIX/B5d+mQ9MxPd73Q6KZZIZUYXk7
   GDzVm9XOO4sB19EaL70ya1YRDo6OnBM8Q82m18ooziGNP2EAoKvrysBGa
   7AI4pXpW9U3yvw9ubQ7DSeRXV4GKyIcAY8S+WUS+BWJRldsdPRxmiPkBf
   w==;
X-CSE-ConnectionGUID: BV3WILpyQq+kmDPLt6vMug==
X-CSE-MsgGUID: MCQhw6lSTg2Oa6xMTiVd6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45708260"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45708260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:31:00 -0700
X-CSE-ConnectionGUID: xUR8JNgPQPSXOYY+d9JkpA==
X-CSE-MsgGUID: YyuFKMBfSI2cCmxPVrsrUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129164346"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:30:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2XO9-0000000AmLk-22Zp;
	Wed, 09 Apr 2025 18:30:53 +0300
Date: Wed, 9 Apr 2025 18:30:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] [v2] clocksource: atmel_tcb: fix kconfig dependency
Message-ID: <Z_aSrU0oHAvFfyBW@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-2-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 09, 2025 at 02:22:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Build-testing this driver on arm without CONFIG_OF produces a warning:
> 
> drivers/clocksource/timer-atmel-tcb.c:368:34: error: 'atmel_tcb_of_match' defined but not used [-Werror=unused-const-variable=]
>   368 | static const struct of_device_id atmel_tcb_of_match[] = {
>       |                                  ^~~~~~~~~~~~~~~~~~
> 
> Change the dependency to allow build-testing on all architectures but
> instead require CONFIG_OF to be present.

I;m a bit puzzled, maybe due to my misunderstanding of the first line...

>  config ATMEL_TCB_CLKSRC
>  	bool "Atmel TC Block timer driver" if COMPILE_TEST

...^^^ of the dependencies.

> -	depends on ARM && HAS_IOMEM
> -	select TIMER_OF if OF
> +	depends on ARM && OF && HAS_IOMEM

But doesn't this still mean that "all architectures" (from the commit message)
do not apply here (it's all about ARM)?

> +	select TIMER_OF

-- 
With Best Regards,
Andy Shevchenko


