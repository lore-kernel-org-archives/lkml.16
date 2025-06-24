Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720213A86C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780302; cv=none; b=kdCq/hROKBGqlQDwPf1I+KZGYiL9q0kYKxlrpYzR/QjaX6C8Zcc+2Onef0OSeniwT/Sz1CcNwuDqMn0+X7/qIAvNkpnnpUjaAJf3zt4800XZxXdRq4JwOIFOkpTAHY8+tXPuwE2krPDYZ3J/43jLDMar/2WP1vTczWtFgxJssNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780302; c=relaxed/simple;
	bh=qKs1GOhh/uabY3+/WUpvB3P/Z8lQE4COMzZX2GDKdHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S52Rgqh3wHaFX306QLbYLPv65ePxa0ChI65ruT0byHKkkRYgIBGU2TngVK4Yp/0jBtESvedOmxaXAiOrXvEg23OQjG62g5j949w3K8RSSmAI/b4FLONd4FKIpKQe88bYYOXpcvv18RejuC3ChzdMrXAd/BLhBPZMl5wwqq9WQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTUglLsl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTUglLsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750780300; x=1782316300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qKs1GOhh/uabY3+/WUpvB3P/Z8lQE4COMzZX2GDKdHM=;
  b=WTUglLsl9LM0TGn4L02mQVuQwfiM0JINnmO3NrXKJnAo8D8mW8QvFtrl
   NyRwobivcRkxdPN2OV6MAyuPYB2Zo5ew+PODCCsNUBdyY9/8QVWg2WXQh
   5uguACczp0FhCX8VQ15q3wyxiGdFjN4kGpbg+0XEGdswGENZCt4eHUO4P
   rhBiLRK/FtmkRV8GJxv8mFtZ2sXZDeHU4ipThSg57EZJXX/5WlYOA+4OK
   ADNGqGaIohDgA/hxDQS2nQLxFCk1IQAd7/OF1VjQZJZPTb3hPh0xHLfUM
   2zjWhZpmehkBFNVnQqoAy1YYFVTwM+fmgBtHfGCSnoEjayG17I0vGmdxj
   w==;
X-CSE-ConnectionGUID: 8A0RQkLJTaqhxLNe0mV6Cw==
X-CSE-MsgGUID: 8Uz6q9sZSxm/AWNF2sxqVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53162922"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="53162922"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 08:51:39 -0700
X-CSE-ConnectionGUID: JYf779btRRexXcIZhi4pVA==
X-CSE-MsgGUID: 9LfSLyXLTbGHQ6ih9SEUAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="152476394"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jun 2025 08:51:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU5vq-000SHi-3B;
	Tue, 24 Jun 2025 15:51:34 +0000
Date: Tue, 24 Jun 2025 23:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Add clocksource
 support
Message-ID: <202506242304.M75bDdRW-lkp@intel.com>
References: <20250623-topic-ti-dm-clkevt-v6-16-v1-2-b00086761ee1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-topic-ti-dm-clkevt-v6-16-v1-2-b00086761ee1@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/clocksource-drivers-timer-ti-dm-Fix-property-name-in-comment/20250624-032923
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250623-topic-ti-dm-clkevt-v6-16-v1-2-b00086761ee1%40baylibre.com
patch subject: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Add clocksource support
config: arm64-randconfig-002-20250624 (https://download.01.org/0day-ci/archive/20250624/202506242304.M75bDdRW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506242304.M75bDdRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506242304.M75bDdRW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: omap_dm_timer_setup_clocksource+0x634 (section: .text) -> sched_clock_register (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
