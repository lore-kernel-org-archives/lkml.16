Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53240201266
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811285; cv=none; b=PSn9EgaZX+F2T/FWwGWMNGtEx1OSUPUT9vArkizV8ya53i9WfT1G7USaV/8Fe4KH4ORKP1gR+Z/eGrlu+2DXJF8WOwcLhkAkq8c2l1GuWygzUxO35MGIXN7hwQYaKoAma8+axxigsb7lIIhPtFFGN4JtzXs1dwvGrbewD89B1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811285; c=relaxed/simple;
	bh=+swuqaf0lJxZrTM35AiSOW0sWIVEV0cXKaMle4kmxI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwyctU6kOujNipeuKw6gPmFXDoqQDpFIy+oyOgPFv4Iyn7ucF9FRGpCDYN53SAMXkic2cswwuq8pU98x2NfMbmXP4ofHXX2kwwGWHVE1/zKw7bY4oCxQ25PzJH8fOjdZ3WT8I6o5ndYicGyY111b8XpbcwMQUSlPvNM4JMJlPKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhjX5arh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhjX5arh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811283; x=1776347283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+swuqaf0lJxZrTM35AiSOW0sWIVEV0cXKaMle4kmxI8=;
  b=bhjX5arhtspaPEVDY50EF/fkI9SLW+2bsB7lnR+jIHnDr5yFdIjjCE1O
   VioH+hHnwPHWL+A313ju5ooC12HTVX8f0zBmS0nrU0LwfcQ4kqRQxMRYn
   IN8DDEWb+HLGlLdyTkvNIFHm0C38RTVHzxJX06+FXUc1706HR/0ppezHz
   txlr62wl2b0kst77G6qSEqV9GXN2T9eEYCfrafvxrgFe7Yw4oy/dwY/p+
   1w5y7Ie/JdKYP4WP4wF1/zvKByeQmjust6z4fWCXsULxvNa9HVth2a/GB
   XhdkX5B5lbSHsBOheyOAHRnvuyY0k47I61cKL5emf/zq55zUSlkIovu8c
   Q==;
X-CSE-ConnectionGUID: sw5pUjRrTy6Lhbyaavipdw==
X-CSE-MsgGUID: RL7G9wToRaicOoiIfrXwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71750795"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="71750795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:48:02 -0700
X-CSE-ConnectionGUID: g4x2vE8nSjKDwzCsoo6QPA==
X-CSE-MsgGUID: MDTMqWFARk+Ynu1oj+Qk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="167657845"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Apr 2025 06:48:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u537P-000Jp2-0H;
	Wed, 16 Apr 2025 13:47:59 +0000
Date: Wed, 16 Apr 2025 21:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Baisong Zhong <zhongbaisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not
 used
Message-ID: <202504162121.Q3qxvByw-lkp@intel.com>
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
head:   1a1d569a75f3ab2923cb62daf356d102e4df2b86
commit: 28f152cd0926596e69d412467b11b6fe6fe4e864 sched/rt: fix build error when CONFIG_SYSCTL is disable
date:   3 years ago
config: csky-randconfig-r001-20230826 (https://download.01.org/0day-ci/archive/20250416/202504162121.Q3qxvByw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504162121.Q3qxvByw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504162121.Q3qxvByw-lkp@intel.com/

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
