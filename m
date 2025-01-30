Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2081494B2
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738221412; cv=none; b=UopPDxYKaoLrd+yeOlMnLV1lfpWOlb3EUdmyFCMhLncpZltmhDCoQIIXqzdLIqsmuqV0p194eEEtz2A3I/DcqkdKZA+M4eYHVM0Ux1HI6pOd5h9OX6vGTkRgAtbi2eBPOlJ+PmbGYd6o6q9W/86vFz3UiF6+Cd5Gxd4yUqOthN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738221412; c=relaxed/simple;
	bh=STKj42w3ThVvhE7S78bzZc7iZ56XQW3rrDGJpqQd5kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tedq+wfpbL8yFjUIyo4+jjD7liDgH+XpWE1LKMLE6oevCKX/OUXw92mHMvplvQzsQchpX29FLrXrWNKbB8AyD2GWNvbrPsDkt2unR4/66VKNIubqzIblLZXwvziL56v/1w+H8fB660UdhL2B4z6u5ZNgPoEFu2nLVDr3xGdUMC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqsULyr5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqsULyr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738221409; x=1769757409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STKj42w3ThVvhE7S78bzZc7iZ56XQW3rrDGJpqQd5kA=;
  b=mqsULyr5X43CTJUdjx6FLoJQonkcUcuCg7Z/yQjG7eAFMi8LwWafDYIw
   I0dPiN4nFbt/0IgCfTltWRRI47qPGtth2i/5Omj9RUI8LdDMszPMWW+JE
   VvDKKsdXFPb3O1/MAF0gzQCl80S8A0Z7BWu27/mjqJMnGnX4OsnBNVeoD
   PWSd6lqz6rfRPK9xOi6h5/3JVRrYleXDBUCh1leyXn5j1tCipvuTfYnx4
   QDAvbER1/Vcb/ua5CsizdlCyugNTLBpU7d7JNVWM3pse+Xyufq8Fz1wrF
   opYrPjcpMpgynqd0XGaI1ss0PG6BgWxxzdRVi9zwPMbqcfSUIW6YRkz+6
   g==;
X-CSE-ConnectionGUID: efIV6snOSY2PtOfo1CobSA==
X-CSE-MsgGUID: c4BtHH3ERSiT3z3Nr8GnWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38861055"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38861055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 23:16:49 -0800
X-CSE-ConnectionGUID: aQMkg7TPRwKCvFNqoJNQ/w==
X-CSE-MsgGUID: khd8tAg9TnGa2+nILqkEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109225297"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2025 23:16:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdOn7-000jo5-0Y;
	Thu, 30 Jan 2025 07:16:45 +0000
Date: Thu, 30 Jan 2025 15:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/kthread.c:861:13: warning: variable 'ret' set but not used
Message-ID: <202501301528.t0cZVbnq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72deda0abee6e705ae71a93f69f55e33be5bca5c
commit: 4d13f4304fa43471bfea101658a11feec7b28ac0 kthread: Implement preferred affinity
date:   3 weeks ago
config: csky-randconfig-r022-20220420 (https://download.01.org/0day-ci/archive/20250130/202501301528.t0cZVbnq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301528.t0cZVbnq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301528.t0cZVbnq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kthread.c: In function 'kthread_affine_preferred':
>> kernel/kthread.c:861:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     861 |         int ret;
         |             ^~~


vim +/ret +861 kernel/kthread.c

   855	
   856	int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
   857	{
   858		struct kthread *kthread = to_kthread(p);
   859		cpumask_var_t affinity;
   860		unsigned long flags;
 > 861		int ret;
   862	
   863		if (!wait_task_inactive(p, TASK_UNINTERRUPTIBLE) || kthread->started) {
   864			WARN_ON(1);
   865			return -EINVAL;
   866		}
   867	
   868		WARN_ON_ONCE(kthread->preferred_affinity);
   869	
   870		if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
   871			return -ENOMEM;
   872	
   873		kthread->preferred_affinity = kzalloc(sizeof(struct cpumask), GFP_KERNEL);
   874		if (!kthread->preferred_affinity) {
   875			ret = -ENOMEM;
   876			goto out;
   877		}
   878	
   879		mutex_lock(&kthreads_hotplug_lock);
   880		cpumask_copy(kthread->preferred_affinity, mask);
   881		WARN_ON_ONCE(!list_empty(&kthread->hotplug_node));
   882		list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
   883		kthread_fetch_affinity(kthread, affinity);
   884	
   885		/* It's safe because the task is inactive. */
   886		raw_spin_lock_irqsave(&p->pi_lock, flags);
   887		do_set_cpus_allowed(p, affinity);
   888		raw_spin_unlock_irqrestore(&p->pi_lock, flags);
   889	
   890		mutex_unlock(&kthreads_hotplug_lock);
   891	out:
   892		free_cpumask_var(affinity);
   893	
   894		return 0;
   895	}
   896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
