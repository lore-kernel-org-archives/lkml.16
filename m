Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE7221FAF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843043; cv=none; b=bPwdfBE4bQZUI3+80QdFwE3koQmjE32SaAo6dbWoomLqLEjiQiz+e4Wcuklr47FGBZlAK4NIrD6N5rzn3QPcw2u/4urpfAh5I5mjuNJ6AuEDhfozfvqhPv4XZTALrSo41PcHsOEl8qTR4cF+dk/Dq5fPFx528AwEKZ/bsTK5AgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843043; c=relaxed/simple;
	bh=cu+NuJemimQYmwhNsSM3z/pVnmIZv/JSAilKNPCIcvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iUsb2XnepYOqMUJaq6uvd3/KoDtmRMRmIj5+CzgO5saQiq67LcxoTSpBzkbUTjuYbRsyVOHUSM3mnmll6zlZZdAOtk2WZ/FVtoy7iLtHLaBdQyJfXiKfnURw4B6NgNmVz350m+eGA5ppXhncTNmNas9qj2tJJbIFFELRCYOV1OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLs6pzax; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLs6pzax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747843038; x=1779379038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cu+NuJemimQYmwhNsSM3z/pVnmIZv/JSAilKNPCIcvY=;
  b=FLs6pzaxFx6o5PGPUBO6eD2bYGQghWXF6jbNwwur9pAb0FznejKKYPTI
   +KMHfHNRDJ+/zisa5tXSR6UFUUPQIfbF5t+yEowbCLlxFeLXtyi/SGd4Z
   dmEpsStoDIhJjb3kGr4hYNlOZyWPBWb2x2kF590+ZHtF391GMelOI+4LF
   lVsq/qPmyNRR3Z7gy40i9KZ7V/A4OYEDZjY2dIJvtwby2pXpXdOF9X4K4
   QSqKzzkKyU3NzFF9MYeXWFGLrjRZvrlcf1UxYJT/fk256my/K+R0Fw1gk
   D/o7+rPIbr3nOCrdN5wJEpvyRNmEaHbfLJM8cxSaUWvEbTrG2+5+ik88a
   w==;
X-CSE-ConnectionGUID: YxLhxAdtS4S7xM+XwRUgBg==
X-CSE-MsgGUID: w3KBIYrFTjqF62/C9xIOaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49088879"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49088879"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:57:17 -0700
X-CSE-ConnectionGUID: thJYo7RuQ3aTMXIseYI9RA==
X-CSE-MsgGUID: T4hGK9ZRRlOgA33Gev9T1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="145391427"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 May 2025 08:57:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHlof-000OPw-2T;
	Wed, 21 May 2025 15:57:13 +0000
Date: Wed, 21 May 2025 23:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Baisong Zhong <zhongbaisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not
 used
Message-ID: <202505212328.gm09NHiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baisong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
commit: 28f152cd0926596e69d412467b11b6fe6fe4e864 sched/rt: fix build error when CONFIG_SYSCTL is disable
date:   3 years, 2 months ago
config: csky-randconfig-r001-20230826 (https://download.01.org/0day-ci/archive/20250521/202505212328.gm09NHiP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212328.gm09NHiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212328.gm09NHiP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/rt.c:309:6: warning: no previous prototype for 'unregister_rt_sched_group' [-Wmissing-prototypes]
     309 | void unregister_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:311:6: warning: no previous prototype for 'free_rt_sched_group' [-Wmissing-prototypes]
     311 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:313:5: warning: no previous prototype for 'alloc_rt_sched_group' [-Wmissing-prototypes]
     313 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:716:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     716 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +/max_rt_runtime +9 kernel/sched/rt.c

d505b8af58912a Huaixin Chang  2020-04-25  @9  static const u64 max_rt_runtime = MAX_BW;
ce0dbbbb30aee6 Clark Williams 2013-02-07  10  

:::::: The code at line 9 was first introduced by commit
:::::: d505b8af58912ae1e1a211fabc9995b19bd40828 sched: Defend cfs and rt bandwidth quota against overflow

:::::: TO: Huaixin Chang <changhuaixin@linux.alibaba.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
