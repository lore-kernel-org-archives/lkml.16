Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1121D596
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690276; cv=none; b=dAWInIcem8TsayznVxVovnd9YQ1ObRVQZily75NfjLyKN7ur+X4AYd+5aZuQ1GSJmY4McJxDblZhAI5YB7PzNuHN2l7AsLgw1FN9Gwb6cg0hmBZINLxfK7c1/IZTiNkYeuJjPPKahvylsDChWxXPXMJBf64FEo+GOdo1mSBAi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690276; c=relaxed/simple;
	bh=Z2kloeD65mtLb61P58nCIQmYcl4gXp2DjEyRHPS0Yzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUhD0wsbXilT/Pnh/Iktitm/Xv8XV05D7AoHl0siDx/3NQ42R19WCkIum8ifjGms6vlAoAi2cllhRC5PVaACgnXTVWMlBIszn8+DyrhnFaINd0dcaSnMyqg/2FNlwhzhGZRsKGYqiuENrvk8Lk/plsc70oJaP0bSZuQ2nNyiNKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEI/E+wI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEI/E+wI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746690275; x=1778226275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z2kloeD65mtLb61P58nCIQmYcl4gXp2DjEyRHPS0Yzk=;
  b=EEI/E+wIHFEXPedmIooMjXlsUZxEAfmR3kP7RgFixPDxmjZNSPAjKUZr
   rykS/XdpaFOo10uvb4veCErUeH6zmbB8VcowEl05GOtVmPSMmSKaAz66G
   o4nqMswrXsgzqDUtCvE7sToZKam64NI7ADQin/7GQCmAapdlsxiwDg3qf
   PAwUU5ESZjUwMqRVxZ6mZZEVYZ34MZSzmKnKDwqppWAQyn/1Cs48mXSmU
   3zLyH/Mf80Owe8bfbDBJOqsw9gJ8rk7+YNWWegcOT8R9rOiOty2s1f9Jh
   NG17NmbokDS7aaqFUX5AnLDpvdOIds7GxPYedGlEovpA4DT1Inw/OXgkm
   A==;
X-CSE-ConnectionGUID: hLWA9FOnSF+vB3sR1/AgEg==
X-CSE-MsgGUID: uvZmwPx3Tcilfx4aXGPNWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59120947"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59120947"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 00:44:34 -0700
X-CSE-ConnectionGUID: umm/huDVQGGhkGviOtpLZw==
X-CSE-MsgGUID: 3lx3D90BQ1iG8OnuR8tu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="173410747"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2025 00:44:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCvvi-000Al9-0i;
	Thu, 08 May 2025 07:44:30 +0000
Date: Thu, 8 May 2025 15:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dhaval Giani <dhaval.giani@amd.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: Re: [PATCH 3/3] sched/fair: Test that the average lag across the
 system is zero
Message-ID: <202505081552.vqYbpmQi-lkp@intel.com>
References: <20250422-b4-eevdf-tests-v1-post-v1-3-5b174f040f55@gianis.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-b4-eevdf-tests-v1-post-v1-3-5b174f040f55@gianis.ca>

Hi Dhaval,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dhaval-Giani-AMD/sched-fair-Add-a-test-to-test-that-a-task-selected-to-run-has-positive-lag/20250423-081648
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250422-b4-eevdf-tests-v1-post-v1-3-5b174f040f55%40gianis.ca
patch subject: [PATCH 3/3] sched/fair: Test that the average lag across the system is zero
config: i386-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250508/202505081552.vqYbpmQi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081552.vqYbpmQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081552.vqYbpmQi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/eevdf-tests.o: in function `test_eevdf_cfs_rq_zero_lag':
>> kernel/sched/eevdf-tests.c:150: undefined reference to `__udivdi3'


vim +150 kernel/sched/eevdf-tests.c

    98	
    99	/*
   100	 * we do, what we need to do
   101	 */
   102	#define __node_2_se(node) \
   103		rb_entry((node), struct sched_entity, run_node)
   104	
   105	static bool test_eevdf_cfs_rq_zero_lag(struct cfs_rq *cfs, struct list_head *tg_se)
   106	{
   107		u64 cfs_avg_vruntime;
   108		u64 calculated_avg_vruntime;
   109	
   110		u64 total_vruntime = 0;
   111		u64 nr_tasks = 0;
   112	
   113		struct sched_entity *se;
   114		struct rb_node *node;
   115		struct rb_root *root;
   116	
   117		cfs_avg_vruntime = avg_vruntime(cfs);
   118	
   119		/*
   120		 * Walk through the rb tree -> look at the se->vruntime value and add it
   121		 */
   122	
   123		total_vruntime = 0;
   124		nr_tasks = 0;
   125	
   126		root = &cfs->tasks_timeline.rb_root;
   127	
   128		for (node = rb_first(root); node; node = rb_next(node)) {
   129			se = __node_2_se(node);
   130			WARN_ON_ONCE(__builtin_add_overflow(total_vruntime,
   131						se->vruntime, &total_vruntime));
   132			/*
   133			 * if it is a task group, add to a list to look at later
   134			 */
   135			if (!entity_is_task(se))
   136				list_add_tail(&se->tg_entry, tg_se);
   137			nr_tasks++;
   138		}
   139	
   140		if (cfs->curr) {
   141			WARN_ON_ONCE(__builtin_add_overflow(total_vruntime,
   142						cfs->curr->vruntime, &total_vruntime));
   143			nr_tasks++;
   144		}
   145	
   146		/* If there are no tasks, there is no lag :-) */
   147		if (!nr_tasks)
   148			return true;
   149	
 > 150		calculated_avg_vruntime = total_vruntime / nr_tasks;
   151	
   152		return (calculated_avg_vruntime == cfs_avg_vruntime);
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
