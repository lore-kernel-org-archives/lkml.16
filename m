Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E246F1F5846
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124254; cv=none; b=mb1Sj4/o5/DqtVXZlNt4pFG2TQSFkcoeWilWVEXUYnwSI4TdFUqqI6JKJnJeV1kyJIJn2B7rLwCZkuoMpry6UdDxD3WCLfWm7yM6O6u8cCvP8vJs0nSkpYYmbWVA7NUhQeaQSlVONtaDcG7yfh0llESQJdIusE8RxKnp/xnN518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124254; c=relaxed/simple;
	bh=imtAOFZMBRvPjAgJXNDOSRzTq4ZuJVm6bCoHiyVH9wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9J8Iil/YyOzpvZnR83wNt0jn7ZzryfSHX27XF1xhtI0+U0ckr8k8Uuc7sQbRFxAc6U4JScaR+NRG1stIrA4d47R+TwzRFGDB+zQdC7XGzS93ZlcaUDLgrEAzLxujej81E4sd3Fdz2FOW2c2Urnm0C13lPO0d7o7sy121jV2UvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afi0zDL4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afi0zDL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747124253; x=1778660253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imtAOFZMBRvPjAgJXNDOSRzTq4ZuJVm6bCoHiyVH9wo=;
  b=afi0zDL4diDRkatB6Lt5ALjG0opT72T/e06IxqUqadDU/wIlzFDEYUMb
   PI3FFUQdKA7cNb1vU+OwMLB3MamvHA6jrGmSDyKCIG7CjstV6FLLcgs4Q
   2fl5ku+fQ4IfMVAIw8IT9iesYASS0ZBVC1vOcMpwhHJ04vXk9JvDQwFzn
   G6ClLuBiH9G5iF7JkX++6q19LZmDrruu+jTnDT1ad8TLwLoLW2pbR0916
   fnJMribCVdSvW6LfLHp8R+8espDIzxT8KCcJtYPuvMpnWVcaW8Y+I51PO
   HeMgc23weXRSPpAzCYfrASAMD0TVHSyva0avL/N2yTObXMb0Ctb8Qm79H
   A==;
X-CSE-ConnectionGUID: 9Zj48KoGScKESUhXDnx1EQ==
X-CSE-MsgGUID: vUrvm5r6TImv1l9olYBuig==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66363902"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="66363902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 01:17:32 -0700
X-CSE-ConnectionGUID: vXc74lFkRdmwNh6MCJ0KDA==
X-CSE-MsgGUID: ETTnXM+uQSiDbZERlP22sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138116109"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2025 01:17:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEkpL-000Frf-0Y;
	Tue, 13 May 2025 08:17:27 +0000
Date: Tue, 13 May 2025 16:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/memcontrol-v1.c:1105:23: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202505131641.826RQ1yc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9565e23cd89d4d5cd4388f8742130be1d6f182d
commit: e548ad4a7cbf765f3ab74f6aa1aecc2df390a0b2 mm: memcg: move charge migration code to memcontrol-v1.c
date:   10 months ago
config: m68k-randconfig-r121-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131641.826RQ1yc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505131641.826RQ1yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131641.826RQ1yc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol-v1.c:1105:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:1105:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol-v1.c:1105:23: sparse:    struct task_struct *
   mm/memcontrol-v1.c:413:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol-v1.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, include/linux/memcontrol.h):
   include/linux/spinlock.h:406:9: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   include/linux/spinlock.h:391:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   include/linux/spinlock.h:391:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +1105 mm/memcontrol-v1.c

  1058	
  1059	int mem_cgroup_can_attach(struct cgroup_taskset *tset)
  1060	{
  1061		struct cgroup_subsys_state *css;
  1062		struct mem_cgroup *memcg = NULL; /* unneeded init to make gcc happy */
  1063		struct mem_cgroup *from;
  1064		struct task_struct *leader, *p;
  1065		struct mm_struct *mm;
  1066		unsigned long move_flags;
  1067		int ret = 0;
  1068	
  1069		/* charge immigration isn't supported on the default hierarchy */
  1070		if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
  1071			return 0;
  1072	
  1073		/*
  1074		 * Multi-process migrations only happen on the default hierarchy
  1075		 * where charge immigration is not used.  Perform charge
  1076		 * immigration if @tset contains a leader and whine if there are
  1077		 * multiple.
  1078		 */
  1079		p = NULL;
  1080		cgroup_taskset_for_each_leader(leader, css, tset) {
  1081			WARN_ON_ONCE(p);
  1082			p = leader;
  1083			memcg = mem_cgroup_from_css(css);
  1084		}
  1085		if (!p)
  1086			return 0;
  1087	
  1088		/*
  1089		 * We are now committed to this value whatever it is. Changes in this
  1090		 * tunable will only affect upcoming migrations, not the current one.
  1091		 * So we need to save it, and keep it going.
  1092		 */
  1093		move_flags = READ_ONCE(memcg->move_charge_at_immigrate);
  1094		if (!move_flags)
  1095			return 0;
  1096	
  1097		from = mem_cgroup_from_task(p);
  1098	
  1099		VM_BUG_ON(from == memcg);
  1100	
  1101		mm = get_task_mm(p);
  1102		if (!mm)
  1103			return 0;
  1104		/* We move charges only when we move a owner of the mm */
> 1105		if (mm->owner == p) {
  1106			VM_BUG_ON(mc.from);
  1107			VM_BUG_ON(mc.to);
  1108			VM_BUG_ON(mc.precharge);
  1109			VM_BUG_ON(mc.moved_charge);
  1110			VM_BUG_ON(mc.moved_swap);
  1111	
  1112			spin_lock(&mc.lock);
  1113			mc.mm = mm;
  1114			mc.from = from;
  1115			mc.to = memcg;
  1116			mc.flags = move_flags;
  1117			spin_unlock(&mc.lock);
  1118			/* We set mc.moving_task later */
  1119	
  1120			ret = mem_cgroup_precharge_mc(mm);
  1121			if (ret)
  1122				mem_cgroup_clear_mc();
  1123		} else {
  1124			mmput(mm);
  1125		}
  1126		return ret;
  1127	}
  1128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
