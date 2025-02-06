Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B5E17C21C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738821276; cv=none; b=kkmclI355bOZ44uROjtsxOQgpzVEqTUw+i5xApyytvVe/rYy3WBLTjv9EV35hsvIc2lww5qpehd+MjxEFITaSpzSLsG58uk+mZJ3iNUMq8PtpBlofpXO8n5rXSrR3dqp2HFlhAOX9IiPiqqVBIuBi3ZBklHBdOXUXX43kKGHnj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738821276; c=relaxed/simple;
	bh=hxO0MHyT9WiNUsRLepe5euuvLM2ruwV1IamtJckXB0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NK6s4Y8+MX7GnIwmukKow0PGLSZDNH2me5E+uf+0EQsW8jZ+qs8xwAXzUwUvXrbAKY6YzDNA7jq9Z6XaeRDJkIUA+6Yr/SeRGaouQ/uk2nf4Vcb9I8VNrsoBjawW0wpJPNfRzWj+5FCvdzQ78hSEZUDMd00K//83Li3/UIehpUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpitYBRc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpitYBRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738821275; x=1770357275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxO0MHyT9WiNUsRLepe5euuvLM2ruwV1IamtJckXB0Q=;
  b=fpitYBRcD7IUcXzLUcZd5VnlwxGcLd4Xed7/gkI5moVxmjHHM7B+zaeP
   gVWeYY1TVZm5nwseEpP+u2jvB5l4rvNj7pGiUoLJw5C3oIUx8y9qZcfTV
   jM0x96uVAjKtcIzxZGbnUUbGieCIWk3YqPzHhY+dLQUEvDwCwBv7+AHUo
   1RkUynO9GFBCQ46T9LzBM3zEJy+UKJKj1JEvBTJX1dM/Kr/S6fLxCGD+7
   /njmT9EnCOw31faIbyafGDxMbQsZOQkFy+U0Y/3gRGYFslMjT9Lg+mjtf
   Vcii4vwKuaJP7ZOEGTVZpNPkz5kFUScQ2NisNNu1OfIP5m0MmzTy2nWjL
   g==;
X-CSE-ConnectionGUID: pDay4hCiQu+Qa2mRbJXzRg==
X-CSE-MsgGUID: 8xTueyiPRkel8uO4hWSCdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43165456"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="43165456"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 21:54:34 -0800
X-CSE-ConnectionGUID: kpA8EjUbR1azAhJjrrQMtw==
X-CSE-MsgGUID: fgP3kw2pSA2pq2PrHq9Zbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116308906"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2025 21:54:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfuqM-000wVF-08;
	Thu, 06 Feb 2025 05:54:30 +0000
Date: Thu, 6 Feb 2025 13:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Bakker <xc-racer2@live.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/samsung/aries_wm8994.c:525:34: warning:
 'samsung_wm8994_of_match' defined but not used
Message-ID: <202502061308.YT3aNI3x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: 7a3a7671fa6c7e90aff5f4242add2a40587b85ef ASoC: samsung: Add driver for Aries boards
date:   4 years, 8 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250206/202502061308.YT3aNI3x-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061308.YT3aNI3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061308.YT3aNI3x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/aries_wm8994.c:525:34: warning: 'samsung_wm8994_of_match' defined but not used [-Wunused-const-variable=]
     525 | static const struct of_device_id samsung_wm8994_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~


vim +/samsung_wm8994_of_match +525 sound/soc/samsung/aries_wm8994.c

   524	
 > 525	static const struct of_device_id samsung_wm8994_of_match[] = {
   526		{
   527			.compatible = "samsung,fascinate4g-wm8994",
   528			.data = &fascinate4g_variant,
   529		},
   530		{
   531			.compatible = "samsung,aries-wm8994",
   532			.data = &aries_variant,
   533		},
   534		{ /* sentinel */ },
   535	};
   536	MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
