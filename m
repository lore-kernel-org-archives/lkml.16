Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2DC4EB38
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986486; cv=none; b=MRO69P6nwM5SOwzWzGU7dg+GQmVjGxwfEWLbyqANtb1NEEoHxntnPE92xikqWG8m8oI+LyFIzL3RGct10UEXX1rVytN+YUjyE7Amle2BmNcFWtG87d/nohOKGqEK8jRi68AI5Au2YkmDf9e3/Ep/x42bIC8kF+y3SkGt5y7OLi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986486; c=relaxed/simple;
	bh=RiCHL5E/X9fW/mAJPBDMEK6WODsKqu512xjMd12s/IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISo15EREVTjxHDrAykEAPG3h38pY0oPptp+OFkgwxEDhUC19vg9XFxS3YmfsqqJ1bb+M2NCupiA1RA9olocQLUluZvbeYu0zTywS2EXvukDFzGTSvcQ3dkjyKH+UKH9EjITsNvn85GAUNI78A65aazBGeSr7htIceYmANhBm/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DW0WokrE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DW0WokrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750986484; x=1782522484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RiCHL5E/X9fW/mAJPBDMEK6WODsKqu512xjMd12s/IA=;
  b=DW0WokrEXLGBkByoY5Qqwour9aLDxIvRnKieZ6/+CSNI6oqM+JO2yapw
   08vAVwzhwVH8nZh29HGoBYE6EZcg+HEUgN85EtWXRjMAabPb5Hpm3w7Pt
   zDF/Me0pMOe6b6gFoaGEP3g84m3ZV8fROrPqs038z701g79cgNMOFYYky
   CNwDcL9VkL8vzqOJ9KBsq3z+eJkBkQYCrAx/SSC295bsPRqZ/vmIM1+Kz
   Bv7Qb0i01cCRi5JVHcdAGFbQv5Tj8j0Sd2vLw87BUw1aRGbcD0ORLvZqu
   Mptfd5UsByd52r75+I1QfkXTJ9dRvnaCiyVXWiiNOJT5TYDSg5+gNJlkd
   Q==;
X-CSE-ConnectionGUID: t5diX2nDQruD9CXbEbSOqw==
X-CSE-MsgGUID: o8uVsfbhRs2Kux0jDGPCTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63985363"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="63985363"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 18:08:03 -0700
X-CSE-ConnectionGUID: M0uvYER8QMOW0f7P7tPBDg==
X-CSE-MsgGUID: Cs2/1JBxTx6yEpzk+CF06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="152960019"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2025 18:08:02 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUxZQ-0000bL-0H;
	Fri, 27 Jun 2025 01:08:00 +0000
Date: Fri, 27 Jun 2025 03:07:00 +0200
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: drivers/perf/apple_m1_cpu_pmu.c:404:7: warning: variable 'user' set
 but not used
Message-ID: <202506270340.rgP7askD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f02769e7f272d6f42b9767f066c5a99afd2338f3
commit: 75ecffc361bbc85696c084f3d3c73eb207386e3f drivers/perf: apple_m1: Refactor event select/filter configuration
date:   4 months ago
config: arm64-randconfig-2002-20250627 (https://download.01.org/0day-ci/archive/20250627/202506270340.rgP7askD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270340.rgP7askD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270340.rgP7askD-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:162:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     162 |         [M1_PMU_PERFCTR_UNKNOWN_f7]                             = ONLY_2_4_6,
         |                                                                   ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
     132 |         [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
      25 | #define ANY_BUT_0_1                     GENMASK(9, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:163:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     163 |         [M1_PMU_PERFCTR_UNKNOWN_f8]                             = ONLY_2_TO_7,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:26:23: note: expanded from macro 'ONLY_2_TO_7'
      26 | #define ONLY_2_TO_7                     GENMASK(7, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
     132 |         [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
      25 | #define ANY_BUT_0_1                     GENMASK(9, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:164:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     164 |         [M1_PMU_PERFCTR_UNKNOWN_fd]                             = ONLY_2_4_6,
         |                                                                   ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:22: note: expanded from macro 'ONLY_2_4_6'
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:132:35: note: previous initialization is here
     132 |         [0 ... M1_PMU_PERFCTR_LAST]                             = ANY_BUT_0_1,
         |                                                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:25:23: note: expanded from macro 'ANY_BUT_0_1'
      25 | #define ANY_BUT_0_1                     GENMASK(9, 2)
         |                                         ^~~~~~~~~~~~~
   include/linux/bits.h:34:2: note: expanded from macro 'GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:169:32: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     169 |         [PERF_COUNT_HW_CPU_CYCLES]              = M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:170:34: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     170 |         [PERF_COUNT_HW_INSTRUCTIONS]            = M1_PMU_PERFCTR_INST_ALL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:171:40: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     171 |         [PERF_COUNT_HW_BRANCH_INSTRUCTIONS]     = M1_PMU_PERFCTR_INST_BRANCH,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:172:35: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     172 |         [PERF_COUNT_HW_BRANCH_MISSES]           = M1_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:168:2: note: previous initialization is here
     168 |         PERF_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:44:34: note: expanded from macro 'PERF_MAP_ALL_UNSUPPORTED'
      44 |         [0 ... PERF_COUNT_HW_MAX - 1] = HW_OP_UNSUPPORTED
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:39:28: note: expanded from macro 'HW_OP_UNSUPPORTED'
      39 | #define HW_OP_UNSUPPORTED               0xFFFF
         |                                         ^~~~~~
>> drivers/perf/apple_m1_cpu_pmu.c:404:7: warning: variable 'user' set but not used [-Wunused-but-set-variable]
     404 |         bool user, kernel;
         |              ^
>> drivers/perf/apple_m1_cpu_pmu.c:404:13: warning: variable 'kernel' set but not used [-Wunused-but-set-variable]
     404 |         bool user, kernel;
         |                    ^
>> drivers/perf/apple_m1_cpu_pmu.c:405:5: warning: variable 'evt' set but not used [-Wunused-but-set-variable]
     405 |         u8 evt;
         |            ^
   39 warnings generated.


vim +/user +404 drivers/perf/apple_m1_cpu_pmu.c

75ecffc361bbc8 Oliver Upton 2025-03-05  400  
a639027a1be1d6 Marc Zyngier 2022-02-08  401  /* arm_pmu backend */
a639027a1be1d6 Marc Zyngier 2022-02-08  402  static void m1_pmu_enable_event(struct perf_event *event)
a639027a1be1d6 Marc Zyngier 2022-02-08  403  {
a639027a1be1d6 Marc Zyngier 2022-02-08 @404  	bool user, kernel;
a639027a1be1d6 Marc Zyngier 2022-02-08 @405  	u8 evt;
a639027a1be1d6 Marc Zyngier 2022-02-08  406  
a639027a1be1d6 Marc Zyngier 2022-02-08  407  	evt = event->hw.config_base & M1_PMU_CFG_EVENT;
a639027a1be1d6 Marc Zyngier 2022-02-08  408  	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
a639027a1be1d6 Marc Zyngier 2022-02-08  409  	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
a639027a1be1d6 Marc Zyngier 2022-02-08  410  
a639027a1be1d6 Marc Zyngier 2022-02-08  411  	m1_pmu_disable_counter_interrupt(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  412  	m1_pmu_disable_counter(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  413  	isb();
a639027a1be1d6 Marc Zyngier 2022-02-08  414  
75ecffc361bbc8 Oliver Upton 2025-03-05  415  	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
a639027a1be1d6 Marc Zyngier 2022-02-08  416  	m1_pmu_enable_counter(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  417  	m1_pmu_enable_counter_interrupt(event->hw.idx);
a639027a1be1d6 Marc Zyngier 2022-02-08  418  	isb();
a639027a1be1d6 Marc Zyngier 2022-02-08  419  }
a639027a1be1d6 Marc Zyngier 2022-02-08  420  

:::::: The code at line 404 was first introduced by commit
:::::: a639027a1be1d68437e1c2cac6ed16306c84ab3c drivers/perf: Add Apple icestorm/firestorm CPU PMU driver

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
