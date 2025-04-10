Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8A205E31
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269980; cv=none; b=V1I7G7eAKlCY+2FoHQ/zfKIqWsvyfRaDiGqaD+Bah/Qg3FH4SoYqXqlnU1nbqCOaZJflwRulR7q2RyUejDGcdWTgAtPIV3nPPdzljoZaY4JRdZAk1G6UTP0SlQRWyOY6kO5yCAhhiPx794qtRjnIKYyIRUlNfxsiP2JdrWJYTrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269980; c=relaxed/simple;
	bh=0xlIXYUBUvG3wGtvpTNW3LrzwtVDKeMirqEaW1TlAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVFL9LmbgJ7vGO13J3pK3Etb4qyGzSrRppANp9UZztg0TBFlD9m2ziWRhqTFGR9tGHMIZm1YaeFnYl44gd87IVWps6X7bemH5BY3CEnEP3YX5mkpyhvoeU/O79rPpv1/JqUvnT1nM3Zchp7z6ydUZc4r7+LeKJKT2bIre3hU5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGviBbw8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGviBbw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744269978; x=1775805978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0xlIXYUBUvG3wGtvpTNW3LrzwtVDKeMirqEaW1TlAFo=;
  b=DGviBbw8sBvw0vceXX0toN+COHKkTEP8j+xrVS7D1lw196oFplaM9E8x
   7oRC11fJWVIEv31csn5PV/XClOXSqrSpU6B8hFGX2NOf7zsnoGiCTvOjn
   qQ36NIIRwOrfOaEZKiQ/98VB5R4If+GB0T7CV5X9SkFBSbOWKD2vRHGzz
   qtDgo69A/qCyFxjvTavb+4lPLqoOFmqI53FZjoloizMaxn0bGWXHeikAW
   H6HkP2ZjT3MdQPgWjCGTxm4BttPrf/SdDc/hIU1QjT6bedKAis9hxWjE1
   yXTD70zzJIuUlKqwZdaKvmQOjfAoh4IH4SDxuhWSOxczSoyCcrJLw54eU
   Q==;
X-CSE-ConnectionGUID: wvCzcG0YRnG9zbcl8v68Rw==
X-CSE-MsgGUID: RNwfhaB/TSa7qWNgxR9NHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45866232"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45866232"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:26:18 -0700
X-CSE-ConnectionGUID: 1/99+IAFTrGcGsjkrZjS/w==
X-CSE-MsgGUID: r5Dfg6khRFazoUjhz2nKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133683537"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2025 00:26:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2mIe-0009lV-2c;
	Thu, 10 Apr 2025 07:26:12 +0000
Date: Thu, 10 Apr 2025 15:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: yiru zhang <yiru.zhang@mediatek.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yiru zhang <yiru.zhang@mediatek.com>
Subject: Re: [PATCH] [Patch v2]Add ETE devarch condition in
 etm4_init_iomem_access
Message-ID: <202504101502.T3kUYupS-lkp@intel.com>
References: <20250409032917.7580-1-yiru.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409032917.7580-1-yiru.zhang@mediatek.com>

Hi yiru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yiru-zhang/Add-ETE-devarch-condition-in-etm4_init_iomem_access/20250409-113037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250409032917.7580-1-yiru.zhang%40mediatek.com
patch subject: [PATCH] [Patch v2]Add ETE devarch condition in etm4_init_iomem_access
config: arm64-randconfig-004-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101502.T3kUYupS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101502.T3kUYupS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101502.T3kUYupS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/hwtracing/coresight/coresight-etm4x-core.c:6:
   drivers/hwtracing/coresight/coresight-etm4x-core.c: In function 'etm4_init_iomem_access':
>> include/linux/kern_levels.h:5:18: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'long unsigned int' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:473:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/once_lite.h:31:4: note: in expansion of macro 'printk'
       func(__VA_ARGS__);    \
       ^~~~
   include/linux/once_lite.h:11:2: note: in expansion of macro 'DO_ONCE_LITE_IF'
     DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   include/linux/printk.h:640:2: note: in expansion of macro 'DO_ONCE_LITE'
     DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
     ^~~~~~~~~~~~
   include/linux/printk.h:659:2: note: in expansion of macro 'printk_once'
     printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~
   include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
    #define KERN_WARNING KERN_SOH "4" /* warning conditions */
                         ^~~~~~~~
   include/linux/printk.h:659:14: note: in expansion of macro 'KERN_WARNING'
     printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                 ^~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1143:3: note: in expansion of macro 'pr_warn_once'
      pr_warn_once("Unknown ETM architecture: %x\n",
      ^~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1143:44: note: format string is defined here
      pr_warn_once("Unknown ETM architecture: %x\n",
                                              ~^
                                              %lx


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
