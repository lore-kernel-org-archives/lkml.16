Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7621B9F1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932601; cv=none; b=XE+6KMNWwkF4vw79t8d+BtJ7WTtQSyYwlKW+JB7mbpfuQLiBQRPZUpQqzJcDjKYSFIz3uCeVsC0fWQbOhzzCxZJg3pUDCZiY+l8igkcHIblcm7NjU2sFBvDJSmZqkJx43r04e9LvLied4UcAkliKvpFz1sqbl86ebgMKP+98gz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932601; c=relaxed/simple;
	bh=GjPeJtHKOXQwQBGGikOX9UYAW2VR/QOiOlM1WMfrLYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCW1JUh+CuwHIyaLD3SraTuIL9nhabrChK0rA1W+SNTICw3hkFoHEaO8kxqN2ma06ZyIo3XdXdHuo9HnV1TGLzJKMLURwj8sQrw5D/K8w9vV710CLrfIMHtV4y3K8fNWaUgq0cKSbbXxChTQaeft133ACI1QaVMSFu47cayeEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnlPQB0V; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnlPQB0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750932600; x=1782468600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GjPeJtHKOXQwQBGGikOX9UYAW2VR/QOiOlM1WMfrLYU=;
  b=QnlPQB0VfcS3w63NZt6/8dKpKCjQ33fm+NgtkZBo/AEoyCnNfpeTqDNq
   Qc6ArVrr3pz96QdNmaB0oEmhArwR9KIIVcmy1I+G5+MTu3fUtFAplbwK7
   QcjqkIDcbEadGZLYw7whl9V71EVNofGO5ER4wLm1KmJAIUQyLc5i8vOng
   jJWKg48Z9aHEmiWMXzD3nHvDZ39gQz9SNs3BGTUaApaSqi6rOYng+m+Ag
   XVFoY9Tf39ole0xW6nBfU78ccoiEGUjT2AI7MwYLF+bJB9BvH3FGmV59w
   cHahh+DJIVZY8sLIAsSPQjrFyD1MWdIxH6W/g1ip7Dgi+8fy8DD2a7VkS
   g==;
X-CSE-ConnectionGUID: DMikMsEPQGOaMXGVOUtC1A==
X-CSE-MsgGUID: heJf5ynpT7yvIsefpYuwog==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52449908"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="52449908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 03:09:59 -0700
X-CSE-ConnectionGUID: DM3dLgcDTuqjzwasTmx+6Q==
X-CSE-MsgGUID: dpx6FarjQW6hGDGrQhFUOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="157039982"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jun 2025 03:09:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUjYJ-000Two-1k;
	Thu, 26 Jun 2025 10:09:55 +0000
Date: Thu, 26 Jun 2025 18:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250616 14/19]
 kernel/sched/ext.c:3712:10: error: incompatible pointer types returning
 'struct cgroup_hdr *' from a function with result type 'struct cgroup *'
Message-ID: <202506261829.It6MPDTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
head:   78f053980ba50a0becae798ab7d07527d97e790d
commit: 803cca907129bd7f15b4d9e16fe9585d1f69782c [14/19] cgroup: Avoid -Wflex-array-member-not-at-end warnings
config: x86_64-buildonly-randconfig-005-20250626 (https://download.01.org/0day-ci/archive/20250626/202506261829.It6MPDTn-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261829.It6MPDTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261829.It6MPDTn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:61:
>> kernel/sched/ext.c:3712:10: error: incompatible pointer types returning 'struct cgroup_hdr *' from a function with result type 'struct cgroup *' [-Werror,-Wincompatible-pointer-types]
    3712 |                 return &cgrp_dfl_root.cgrp;
         |                        ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/ext.c:7407:17: error: incompatible pointer types initializing 'struct cgroup *' with an expression of type 'struct cgroup_hdr *' [-Werror,-Wincompatible-pointer-types]
    7407 |         struct cgroup *cgrp = &cgrp_dfl_root.cgrp;
         |                        ^      ~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +3712 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  3700  
8195136669661f Tejun Heo 2024-09-04  3701  #ifdef CONFIG_EXT_GROUP_SCHED
8195136669661f Tejun Heo 2024-09-04  3702  static struct cgroup *tg_cgrp(struct task_group *tg)
8195136669661f Tejun Heo 2024-09-04  3703  {
8195136669661f Tejun Heo 2024-09-04  3704  	/*
8195136669661f Tejun Heo 2024-09-04  3705  	 * If CGROUP_SCHED is disabled, @tg is NULL. If @tg is an autogroup,
8195136669661f Tejun Heo 2024-09-04  3706  	 * @tg->css.cgroup is NULL. In both cases, @tg can be treated as the
8195136669661f Tejun Heo 2024-09-04  3707  	 * root cgroup.
8195136669661f Tejun Heo 2024-09-04  3708  	 */
8195136669661f Tejun Heo 2024-09-04  3709  	if (tg && tg->css.cgroup)
8195136669661f Tejun Heo 2024-09-04  3710  		return tg->css.cgroup;
8195136669661f Tejun Heo 2024-09-04  3711  	else
8195136669661f Tejun Heo 2024-09-04 @3712  		return &cgrp_dfl_root.cgrp;
8195136669661f Tejun Heo 2024-09-04  3713  }
8195136669661f Tejun Heo 2024-09-04  3714  

:::::: The code at line 3712 was first introduced by commit
:::::: 8195136669661fdfe54e9a8923c33b31c92fc1da sched_ext: Add cgroup support

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
