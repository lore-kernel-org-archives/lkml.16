Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4454B1CAA92
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750922676; cv=none; b=dsYftLE0r1v0/kWytM8S7+zTU2ex47E29i+gvPXNS3t9916aq8eYVWMYPNv0AV3fifxda9Bwo83P5mp6l5KeJOvEZaxYr3MAyv3ajHCgCKKt73JV3UuNX+CmVwKc8jguYjSTSDJP80+92hh7FgxyrE85Y3isrVW9KLK3MmuPkdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750922676; c=relaxed/simple;
	bh=2QrNwUHeGamcNyYUWy4uxRcLPANAsy/Q46G98MPt/iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CQ+jLPldHlSgOHE2roNSxnmbP1xojYvpPdXw68bkkeGI3BlOTUvkFmTd771yUaXOAZXHDAVUzUvCHc4NO3MBeFV45/JuvRpaxhgoSZneroV+olwv0tdtMoLoYgFvcr8BK2Bees5WHFMI0EgC5VTB9xw4FFUDkqsLOCmtI9EG8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/QryomF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/QryomF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750922675; x=1782458675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2QrNwUHeGamcNyYUWy4uxRcLPANAsy/Q46G98MPt/iE=;
  b=i/QryomFlfniswEFopbv5EHHoOQWJDSRUYpRYVRzZWwm6EeJUstyrM06
   ez7cd6RA3EzK8XrTEawj2LB4pwMWq9ClWarMHKcMhGaooBdAWnOKbltn+
   +E5OSEDdA8lDFiiGA5Hi9N48PW/6YUBGoqDnQyIrgx6nxb75afZFlY6Ar
   1Y7GKhC0qEXGmDhOKGJQjB1SHBa9/UKDEuyScbmhsPpR+J+6607Cfw52s
   Ey17BQY3aO/C8WwIjy6gfjTYJTk77x73nu4gm52NirqrfBLdEBmCKac1+
   XJpZvtjKvvcw5s/rk/2v5CnZfupnBu1PDl6lUuWKcGPHB3Z9QWCEEujOF
   g==;
X-CSE-ConnectionGUID: +c9ghGwiQIChkEKc3ny1/A==
X-CSE-MsgGUID: eKuaw+ZjTmWlfDlwpFs+wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53172293"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53172293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 00:24:34 -0700
X-CSE-ConnectionGUID: +L2C8cO8TMuNLwovUrfTLA==
X-CSE-MsgGUID: cTojaAzTSR+LAYFo9ukG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="183469809"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jun 2025 00:24:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUgyE-000TqU-0F;
	Thu, 26 Jun 2025 07:24:30 +0000
Date: Thu, 26 Jun 2025 15:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Baisong Zhong <zhongbaisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not
 used
Message-ID: <202506261522.HBJlm3rl-lkp@intel.com>
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
head:   ee88bddf7f2f5d1f1da87dd7bedc734048b70e88
commit: 28f152cd0926596e69d412467b11b6fe6fe4e864 sched/rt: fix build error when CONFIG_SYSCTL is disable
date:   3 years, 3 months ago
config: csky-randconfig-r001-20230826 (https://download.01.org/0day-ci/archive/20250626/202506261522.HBJlm3rl-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261522.HBJlm3rl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261522.HBJlm3rl-lkp@intel.com/

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
