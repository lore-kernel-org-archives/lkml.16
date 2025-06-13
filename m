Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E760433A8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782731; cv=none; b=kVjvJBtnZ0549pOHXb7tQxV9flekMejr2m5HlSrBiW4CXoJ+N8ekInKNUCc6FESV2QomHvOD5mGGh+Si5yuUJTCmfI24Lk9sEEO8sUOqPpDvAbWsfLxIj2zr2uorHd3ycCBTB/kDGEYLmr5i1TPCyO2hm2obQhZ0aOdOXup9RC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782731; c=relaxed/simple;
	bh=miblcId/NPyA5kzsTz5DnjwS4MVBoOnovkz4wtECiY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GgpldWFS8GFqD4FkAj7UtFg0rWgciKi9ONHWMpR5qlWre7TxCjfN3/PCrc6m2pNHRjYTCOGPsj6DOZ95ciAPh6vbZQlnPq7Wbg27hpgDuyhSEFETockvTw7giznflvVr++c5JdGE3Y0AChZVs1Apd0T/h1a8q8XR90CUfhYzTyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuZUZzlH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuZUZzlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749782731; x=1781318731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=miblcId/NPyA5kzsTz5DnjwS4MVBoOnovkz4wtECiY0=;
  b=OuZUZzlH6HtIIEj/XFM0e3vZWtR3szNm8f0FN0+ekdVr8hUomkG3EZG/
   pVATkdNrFiVDQUWM2E7uyxNLG//rkNMSNr+sWW8eCggYAjStI3tu5TR3i
   ygIkYYvL6plold1TRQgfp9iZiIRPds0LOVu5IOzxDhbmzEkUvQSAmCsR7
   ICJrPI3dgoCC3g3OBzaAX8+Ef42hOe75WY4NZTyzKuclnaU+chZhEtzSZ
   goNF33w1MSCSSb3UZlB4SECWdNUR7OO3j9jubU6JrhBX8XIza5pRrRVJf
   NBUQOCOC+R8cTZJd80hByqemltGnL0bdldow5hyUyXpYO8CzFhC4wb8vi
   g==;
X-CSE-ConnectionGUID: KPn4HeKkQXKko7jHeoSUAQ==
X-CSE-MsgGUID: rbUyU5dLRLKH8BKuVb3I5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51859785"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51859785"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 19:45:30 -0700
X-CSE-ConnectionGUID: QC/tXVs6TqWMXWuhV8oWsQ==
X-CSE-MsgGUID: ZrzBduPESXiPmRHyk9Z7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152603888"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 19:45:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPuQ1-000CA0-2x;
	Fri, 13 Jun 2025 02:45:25 +0000
Date: Fri, 13 Jun 2025 10:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pohsun Su <pohsuns@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Robert Lin <robelin@nvidia.com>
Subject: arch/xtensa/include/uapi/asm/swab.h:24: undefined reference to
 `__udivdi3'
Message-ID: <202506131034.JEmrFDve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27605c8c0f69e319df156b471974e4e223035378
commit: b42d781e0350c969ef8155b800e33400f5f8b8a6 clocksource/drivers/timer-tegra186: Fix watchdog self-pinging
date:   4 weeks ago
config: xtensa-randconfig-r052-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131034.JEmrFDve-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131034.JEmrFDve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131034.JEmrFDve-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `readl_relaxed':
>> arch/xtensa/include/uapi/asm/swab.h:24: undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `readl_relaxed':
   drivers/clocksource/timer-tegra186.c:240: undefined reference to `__udivdi3'


vim +24 arch/xtensa/include/uapi/asm/swab.h

8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  19  
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  20  static inline __attribute_const__ __u32 __arch_swab32(__u32 x)
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  21  {
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  22      __u32 res;
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  23      /* instruction sequence from Xtensa ISA release 2/2000 */
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07 @24      __asm__("ssai     8           \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  25  	    "srli     %0, %1, 16  \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  26  	    "src      %0, %0, %1  \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  27  	    "src      %0, %0, %0  \n\t"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  28  	    "src      %0, %1, %0  \n"
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  29  	    : "=&a" (res)
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  30  	    : "a" (x)
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  31  	    );
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  32      return res;
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  33  }
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  34  #define __arch_swab32 __arch_swab32
8903709b054a8d arch/xtensa/include/asm/swab.h Harvey Harrison 2009-01-07  35  

:::::: The code at line 24 was first introduced by commit
:::::: 8903709b054a8dafe4e8c6d9a6444034d7aba36f xtensa: introduce swab.h

:::::: TO: Harvey Harrison <harvey.harrison@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
