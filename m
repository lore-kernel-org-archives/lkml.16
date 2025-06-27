Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415AA2E266A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035155; cv=none; b=BTSJA5QklBZjLEAEhqCHpxBypeBUL3ewo30maqYdYYfssxC+HnK7VG06mzuWMnAZ/YRRNAdcYmdCVd42NIPpVQXySWMQkcEhI14oSEtRSDShjzERwPE7AVWYdWD77xSM/jMYgDnZXbCE241XnO+YNclIkQNoOjAzkKZXz15Ssrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035155; c=relaxed/simple;
	bh=QPy46Z72FTzq+V2GfoYOLOyi0wckMaAML2irBAyl1ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZtsn4pqC3DdFyIvgoyQW/LG2TeDDpOkY1lye2Tvf+zuDHPT3zXorrAbDHkb8QbxlchNBpWhGej5gi/I+A6zDBtcGCa/du8HZgdXbqhEc2rNoa4vRUlB96pdSyH63A+HfVphE2ntrB1b5xWVUUPOIHVOsTG9kqfp2aNk+O1Huo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4/JIDyr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4/JIDyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751035153; x=1782571153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPy46Z72FTzq+V2GfoYOLOyi0wckMaAML2irBAyl1ms=;
  b=d4/JIDyrY0VB2CLwg+uLiFby04NA3Nof99qdBxUt70/a1IU9VnxPz9Vg
   b9sXWtPnDTScK/wy3W1HJG6Wed7pu6GrU0Kl+jdGLb5hByvjJKSLvM0JX
   AFyDQjDuCZ9TORodwIkpl2xyXIIPuQ6dW/I2c/0C3nEFgzzfXEOGTVugi
   C6BtWp7DQiSatnWKUtmT1tln9924AFXGQhTlkz0N2eMud9Izt4+txn9YG
   5bJJ5JPjOS1t+CMUmKcd8k5pDc6uOpAffUypxJuJ4EwMm+dHs8KkdcCgu
   ulNHOU7IVjXUAliITs3X7542yi4LFJCSglz8kjT/ehZaBmujt1XOplC7N
   w==;
X-CSE-ConnectionGUID: 0xQGp7AUQuWeOLx2lYrSrA==
X-CSE-MsgGUID: Yayg3EWNSO2cqZq6DQxBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53292097"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53292097"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:39:13 -0700
X-CSE-ConnectionGUID: O2Y63WpuR3284kIVvQ7/xw==
X-CSE-MsgGUID: I4EkIJmjTOSL2pqP3ryBIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183857844"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 07:39:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVAEO-000WG1-23;
	Fri, 27 Jun 2025 14:39:08 +0000
Date: Fri, 27 Jun 2025 22:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202506272222.ohKcICfH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67a993863163cb88b1b68974c31b0d84ece4293e
commit: d310fb40096896abe1928b88224129bf7122532f sched_ext: Clean up scx_root usages
date:   6 weeks ago
config: powerpc64-randconfig-r113-20250627 (https://download.01.org/0day-ci/archive/20250627/202506272222.ohKcICfH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506272222.ohKcICfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272222.ohKcICfH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:3339:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3339:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:3339:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3394:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3394:49: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3394:49: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3451:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3451:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3451:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3510:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3510:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3510:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3529:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3529:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3529:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3641:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3641:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3641:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3720:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3720:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3720:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3772:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3772:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3772:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3799:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3799:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3799:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3812:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3812:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3812:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3941:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3941:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3941:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3956:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3956:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3956:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:5057:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5057:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5057:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5099:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5099:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5099:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5209:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5209:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5209:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5971:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5971:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5971:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6080:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6080:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6080:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6352:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6352:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6352:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6485:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6485:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6485:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7332:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7332:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7332:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:245:24: sparse: sparse: Using plain integer as NULL pointer
>> kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:766:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2241:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2241:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2252:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2252:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2441:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2441:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1295:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1697:15: sparse: sparse: dereference of noderef expression

vim +736 kernel/sched/ext_idle.c

   717	
   718	/*
   719	 * Update the idle state of a CPU to @idle.
   720	 *
   721	 * If @do_notify is true, ops.update_idle() is invoked to notify the scx
   722	 * scheduler of an actual idle state transition (idle to busy or vice
   723	 * versa). If @do_notify is false, only the idle state in the idle masks is
   724	 * refreshed without invoking ops.update_idle().
   725	 *
   726	 * This distinction is necessary, because an idle CPU can be "reserved" and
   727	 * awakened via scx_bpf_pick_idle_cpu() + scx_bpf_kick_cpu(), marking it as
   728	 * busy even if no tasks are dispatched. In this case, the CPU may return
   729	 * to idle without a true state transition. Refreshing the idle masks
   730	 * without invoking ops.update_idle() ensures accurate idle state tracking
   731	 * while avoiding unnecessary updates and maintaining balanced state
   732	 * transitions.
   733	 */
   734	void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
   735	{
 > 736		struct scx_sched *sch = scx_root;
   737		int cpu = cpu_of(rq);
   738	
   739		lockdep_assert_rq_held(rq);
   740	
   741		/*
   742		 * Trigger ops.update_idle() only when transitioning from a task to
   743		 * the idle thread and vice versa.
   744		 *
   745		 * Idle transitions are indicated by do_notify being set to true,
   746		 * managed by put_prev_task_idle()/set_next_task_idle().
   747		 */
   748		if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
   749			SCX_CALL_OP(SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
   750	
   751		/*
   752		 * Update the idle masks:
   753		 * - for real idle transitions (do_notify == true)
   754		 * - for idle-to-idle transitions (indicated by the previous task
   755		 *   being the idle thread, managed by pick_task_idle())
   756		 *
   757		 * Skip updating idle masks if the previous task is not the idle
   758		 * thread, since set_next_task_idle() has already handled it when
   759		 * transitioning from a task to the idle thread (calling this
   760		 * function with do_notify == true).
   761		 *
   762		 * In this way we can avoid updating the idle masks twice,
   763		 * unnecessarily.
   764		 */
   765		if (static_branch_likely(&scx_builtin_idle_enabled))
   766			if (do_notify || is_idle_task(rq->curr))
   767				update_builtin_idle(cpu, idle);
   768	}
   769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
