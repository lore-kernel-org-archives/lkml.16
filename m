Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29E1D5CDD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674202; cv=none; b=L3iuceEN0Fb5UUTFnpyiK009522pQM+IBN1dEyXZIVaMIx/+uNd43TnSfZQDl9y+3ruIOe+w2YAlrJibeOXv0AE9C373W/YOWSV6GkVbGqyus0lJHAwJiNomwY95TL1NQJCOWD7lBOimaCbLzWRBmL/FlU1uIyL1YxXwQD9cth4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674202; c=relaxed/simple;
	bh=y76NLskFRIrizU7TSbTpqEk/5kmZ7xfX8m1ZrBG+ip4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UE4A3eiF0qRV/8yMXd76ZbKUEfP9DZmxArj74exyqS6/QdD++l7fNPlaCh+S9hes8jzZfqk8OUMgVchcqQeETZ+wRcPfixNZRViI1VrDLZHxhYVZIb0cPyry8lzGvpO9xTfEusyz4zSePx35PFgbGz6kNW+k/Mop+/jEGJsdV2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVUrlvRg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVUrlvRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749674199; x=1781210199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y76NLskFRIrizU7TSbTpqEk/5kmZ7xfX8m1ZrBG+ip4=;
  b=aVUrlvRgMATdwzhA35oVTh120DscPjy9JEPIXDN2D4Nfe3RYV7OcTZGT
   S01x1T+cystG//EEhdHpjwpuA9p+TuOwXrJQlJj4Yz5o7B94/Y7pTZHTn
   U61dJrivfvD/TUSO1SQ98MCMbAokp9IVzEz+lqKjgYqHgQdsjsoWQgz//
   9ain96KH6H7AbnEfKdCubrqFD+/FTxNP9TUDv/xL7hHlLIGXzzJdcthp4
   duS0kAIvflZfb2mgaFZvauArlWPKut4dsQjZA0+vbV6RzwD/RCi0ttYhS
   r5COBY15Nj3nAT5pGHU5W7pEwpfHj5tgweIXnPzS9ulwb5ua2zznP/IZA
   g==;
X-CSE-ConnectionGUID: sT06J3RmQ1KjwvqvJa80NA==
X-CSE-MsgGUID: T5cyaUg4Rs6UQwyt8OVFBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51698677"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51698677"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 13:36:38 -0700
X-CSE-ConnectionGUID: /J6E4BKXT3mpYupSRDDuTQ==
X-CSE-MsgGUID: x7KDSdLJSly47VFDFhw0mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="184510866"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2025 13:36:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPSBQ-000Aqs-3B;
	Wed, 11 Jun 2025 20:36:28 +0000
Date: Thu, 12 Jun 2025 04:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Martin <dave.martin@arm.com>, fenghuay@nvidia.com,
	peternewman@google.com, Babu Moger <Babu.Moger@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	shameerali.kolothum.thodi@huawei.com, bobo.shaobowang@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Xin Hao <xhao@linux.alibaba.com>, baolin.wang@linux.alibaba.com,
	lcherian@marvell.com, amitsinght@marvell.com,
	Ingo Molnar <mingo@redhat.com>,
	David Hildenbrand <david@redhat.com>, H Peter Anvin <hpa@zytor.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Jamie Iles <quic_jiles@quicinc.com>, dfustini@baylibre.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] x86/resctrl: Optimize code in rdt_get_tree()
Message-ID: <202506120440.lz9OAoXE-lkp@intel.com>
References: <20250611021547.2766889-3-tan.shaopeng@jp.fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611021547.2766889-3-tan.shaopeng@jp.fujitsu.com>

Hi Shaopeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on brauner-vfs/vfs.all linus/master v6.16-rc1 next-20250611]
[cannot apply to tip/auto-latest bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shaopeng-Tan/x86-resctrl-Remove-unnecessary-cpumask_nth_andnot/20250611-104547
base:   tip/master
patch link:    https://lore.kernel.org/r/20250611021547.2766889-3-tan.shaopeng%40jp.fujitsu.com
patch subject: [PATCH 2/2] x86/resctrl: Optimize code in rdt_get_tree()
config: x86_64-randconfig-002-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120440.lz9OAoXE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120440.lz9OAoXE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120440.lz9OAoXE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/resctrl/rdtgroup.c: In function 'rdt_get_tree':
>> fs/resctrl/rdtgroup.c:2684:1: warning: label 'out_ctx' defined but not used [-Wunused-label]
    2684 | out_ctx:
         | ^~~~~~~


vim +/out_ctx +2684 fs/resctrl/rdtgroup.c

7168ae330e8105 James Morse  2025-05-15  2583  
7168ae330e8105 James Morse  2025-05-15  2584  static int rdt_get_tree(struct fs_context *fc)
7168ae330e8105 James Morse  2025-05-15  2585  {
7168ae330e8105 James Morse  2025-05-15  2586  	struct rdt_fs_context *ctx = rdt_fc2context(fc);
7168ae330e8105 James Morse  2025-05-15  2587  	unsigned long flags = RFTYPE_CTRL_BASE;
7168ae330e8105 James Morse  2025-05-15  2588  	struct rdt_mon_domain *dom;
7168ae330e8105 James Morse  2025-05-15  2589  	struct rdt_resource *r;
7168ae330e8105 James Morse  2025-05-15  2590  	int ret;
7168ae330e8105 James Morse  2025-05-15  2591  
7168ae330e8105 James Morse  2025-05-15  2592  	cpus_read_lock();
7168ae330e8105 James Morse  2025-05-15  2593  	mutex_lock(&rdtgroup_mutex);
7168ae330e8105 James Morse  2025-05-15  2594  	/*
7168ae330e8105 James Morse  2025-05-15  2595  	 * resctrl file system can only be mounted once.
7168ae330e8105 James Morse  2025-05-15  2596  	 */
7168ae330e8105 James Morse  2025-05-15  2597  	if (resctrl_mounted) {
7168ae330e8105 James Morse  2025-05-15  2598  		ret = -EBUSY;
7168ae330e8105 James Morse  2025-05-15  2599  		goto out;
7168ae330e8105 James Morse  2025-05-15  2600  	}
7168ae330e8105 James Morse  2025-05-15  2601  
7168ae330e8105 James Morse  2025-05-15  2602  	ret = rdtgroup_setup_root(ctx);
7168ae330e8105 James Morse  2025-05-15  2603  	if (ret)
7168ae330e8105 James Morse  2025-05-15  2604  		goto out;
7168ae330e8105 James Morse  2025-05-15  2605  
7168ae330e8105 James Morse  2025-05-15  2606  	ret = rdt_enable_ctx(ctx);
7168ae330e8105 James Morse  2025-05-15  2607  	if (ret)
7168ae330e8105 James Morse  2025-05-15  2608  		goto out_root;
7168ae330e8105 James Morse  2025-05-15  2609  
7168ae330e8105 James Morse  2025-05-15  2610  	ret = schemata_list_create();
b67b139e5b652e Shaopeng Tan 2025-06-11  2611  	if (ret)
b67b139e5b652e Shaopeng Tan 2025-06-11  2612  		goto out_schemata_free;
7168ae330e8105 James Morse  2025-05-15  2613  
7168ae330e8105 James Morse  2025-05-15  2614  	ret = closid_init();
7168ae330e8105 James Morse  2025-05-15  2615  	if (ret)
7168ae330e8105 James Morse  2025-05-15  2616  		goto out_schemata_free;
7168ae330e8105 James Morse  2025-05-15  2617  
7168ae330e8105 James Morse  2025-05-15  2618  	if (resctrl_arch_mon_capable())
7168ae330e8105 James Morse  2025-05-15  2619  		flags |= RFTYPE_MON;
7168ae330e8105 James Morse  2025-05-15  2620  
7168ae330e8105 James Morse  2025-05-15  2621  	ret = rdtgroup_add_files(rdtgroup_default.kn, flags);
7168ae330e8105 James Morse  2025-05-15  2622  	if (ret)
7168ae330e8105 James Morse  2025-05-15  2623  		goto out_closid_exit;
7168ae330e8105 James Morse  2025-05-15  2624  
7168ae330e8105 James Morse  2025-05-15  2625  	kernfs_activate(rdtgroup_default.kn);
7168ae330e8105 James Morse  2025-05-15  2626  
7168ae330e8105 James Morse  2025-05-15  2627  	ret = rdtgroup_create_info_dir(rdtgroup_default.kn);
7168ae330e8105 James Morse  2025-05-15  2628  	if (ret < 0)
7168ae330e8105 James Morse  2025-05-15  2629  		goto out_closid_exit;
7168ae330e8105 James Morse  2025-05-15  2630  
7168ae330e8105 James Morse  2025-05-15  2631  	if (resctrl_arch_mon_capable()) {
7168ae330e8105 James Morse  2025-05-15  2632  		ret = mongroup_create_dir(rdtgroup_default.kn,
7168ae330e8105 James Morse  2025-05-15  2633  					  &rdtgroup_default, "mon_groups",
7168ae330e8105 James Morse  2025-05-15  2634  					  &kn_mongrp);
7168ae330e8105 James Morse  2025-05-15  2635  		if (ret < 0)
7168ae330e8105 James Morse  2025-05-15  2636  			goto out_info;
7168ae330e8105 James Morse  2025-05-15  2637  
7168ae330e8105 James Morse  2025-05-15  2638  		ret = mkdir_mondata_all(rdtgroup_default.kn,
7168ae330e8105 James Morse  2025-05-15  2639  					&rdtgroup_default, &kn_mondata);
7168ae330e8105 James Morse  2025-05-15  2640  		if (ret < 0)
7168ae330e8105 James Morse  2025-05-15  2641  			goto out_mongrp;
7168ae330e8105 James Morse  2025-05-15  2642  		rdtgroup_default.mon.mon_data_kn = kn_mondata;
7168ae330e8105 James Morse  2025-05-15  2643  	}
7168ae330e8105 James Morse  2025-05-15  2644  
7168ae330e8105 James Morse  2025-05-15  2645  	ret = rdt_pseudo_lock_init();
7168ae330e8105 James Morse  2025-05-15  2646  	if (ret)
7168ae330e8105 James Morse  2025-05-15  2647  		goto out_mondata;
7168ae330e8105 James Morse  2025-05-15  2648  
7168ae330e8105 James Morse  2025-05-15  2649  	ret = kernfs_get_tree(fc);
7168ae330e8105 James Morse  2025-05-15  2650  	if (ret < 0)
7168ae330e8105 James Morse  2025-05-15  2651  		goto out_psl;
7168ae330e8105 James Morse  2025-05-15  2652  
7168ae330e8105 James Morse  2025-05-15  2653  	if (resctrl_arch_alloc_capable())
7168ae330e8105 James Morse  2025-05-15  2654  		resctrl_arch_enable_alloc();
7168ae330e8105 James Morse  2025-05-15  2655  	if (resctrl_arch_mon_capable())
7168ae330e8105 James Morse  2025-05-15  2656  		resctrl_arch_enable_mon();
7168ae330e8105 James Morse  2025-05-15  2657  
7168ae330e8105 James Morse  2025-05-15  2658  	if (resctrl_arch_alloc_capable() || resctrl_arch_mon_capable())
7168ae330e8105 James Morse  2025-05-15  2659  		resctrl_mounted = true;
7168ae330e8105 James Morse  2025-05-15  2660  
7168ae330e8105 James Morse  2025-05-15  2661  	if (resctrl_is_mbm_enabled()) {
7168ae330e8105 James Morse  2025-05-15  2662  		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
7168ae330e8105 James Morse  2025-05-15  2663  		list_for_each_entry(dom, &r->mon_domains, hdr.list)
7168ae330e8105 James Morse  2025-05-15  2664  			mbm_setup_overflow_handler(dom, MBM_OVERFLOW_INTERVAL,
7168ae330e8105 James Morse  2025-05-15  2665  						   RESCTRL_PICK_ANY_CPU);
7168ae330e8105 James Morse  2025-05-15  2666  	}
7168ae330e8105 James Morse  2025-05-15  2667  
7168ae330e8105 James Morse  2025-05-15  2668  	goto out;
7168ae330e8105 James Morse  2025-05-15  2669  
7168ae330e8105 James Morse  2025-05-15  2670  out_psl:
7168ae330e8105 James Morse  2025-05-15  2671  	rdt_pseudo_lock_release();
7168ae330e8105 James Morse  2025-05-15  2672  out_mondata:
7168ae330e8105 James Morse  2025-05-15  2673  	if (resctrl_arch_mon_capable())
7168ae330e8105 James Morse  2025-05-15  2674  		kernfs_remove(kn_mondata);
7168ae330e8105 James Morse  2025-05-15  2675  out_mongrp:
7168ae330e8105 James Morse  2025-05-15  2676  	if (resctrl_arch_mon_capable())
7168ae330e8105 James Morse  2025-05-15  2677  		kernfs_remove(kn_mongrp);
7168ae330e8105 James Morse  2025-05-15  2678  out_info:
7168ae330e8105 James Morse  2025-05-15  2679  	kernfs_remove(kn_info);
7168ae330e8105 James Morse  2025-05-15  2680  out_closid_exit:
7168ae330e8105 James Morse  2025-05-15  2681  	closid_exit();
7168ae330e8105 James Morse  2025-05-15  2682  out_schemata_free:
7168ae330e8105 James Morse  2025-05-15  2683  	schemata_list_destroy();
7168ae330e8105 James Morse  2025-05-15 @2684  out_ctx:
7168ae330e8105 James Morse  2025-05-15  2685  	rdt_disable_ctx();
7168ae330e8105 James Morse  2025-05-15  2686  out_root:
7168ae330e8105 James Morse  2025-05-15  2687  	rdtgroup_destroy_root();
7168ae330e8105 James Morse  2025-05-15  2688  out:
7168ae330e8105 James Morse  2025-05-15  2689  	rdt_last_cmd_clear();
7168ae330e8105 James Morse  2025-05-15  2690  	mutex_unlock(&rdtgroup_mutex);
7168ae330e8105 James Morse  2025-05-15  2691  	cpus_read_unlock();
7168ae330e8105 James Morse  2025-05-15  2692  	return ret;
7168ae330e8105 James Morse  2025-05-15  2693  }
7168ae330e8105 James Morse  2025-05-15  2694  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
