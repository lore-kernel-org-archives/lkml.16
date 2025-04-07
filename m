Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC40254AEF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050986; cv=none; b=LF2Yee8u+Yals2SJds85MFtOViXoFfKjlFyx7hFl4ZNYRIDG7Q4F+eJjMfIgy4ddDoKOf0D2q01vbR+rFHkdlJT6SkJ90NVQ5z7C1TIZtwY4Qp9WSMIeT37yHIcU/LopPjhYuaHEwIGxLIt5WrCFxR03w9LU8Qe6k+1CrDy8+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050986; c=relaxed/simple;
	bh=clu5ak3B8TVqiA5LPfOQC49/MbbUVBN2G57mLhXE6vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQcsdlyn86jV4DEcNRA4hkHzddTdiIe8MhenKNLD/QXsyK0+ZououALbTn98WEkQqi3wEMudLPLMNWpd5AFEveDAHD391i5eUM+pfBZod7/XotSa9MS+JF6AH7Jm1HC9o5FYPr5w2YnVVoQyzDfD7JUixZbzl/QV7FdwsQt2LgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHfAUcus; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHfAUcus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744050985; x=1775586985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=clu5ak3B8TVqiA5LPfOQC49/MbbUVBN2G57mLhXE6vc=;
  b=WHfAUcus4yOP986nggLI7/QUbrEFhDgCfdUA0l23LAfeRAGKA6Gy7+TJ
   Y/HHYs/rdGr5kSu1vJsUjCHVsXjmzxLylsLDYwaAraxz1gNSPzVQoaEaF
   A1v1rJ+BYShDl5UchsADcdMDQPFXsmG5BbsW07ABCU1M6Sl6OqNhVS7Fe
   Spx3ruywcHTq8dvfMbe2UhZFVrPiBvGQurt8spW9HBj6gy1SX3J4zp7Tw
   lAt4oqUtY71jTtOBcsEmbExw4lxAnRXARlssdI12+qekD61tceMeyLS8g
   vH0s0ZeQpUOmChZJTzOGx4wk6ZkzuSRL6ypvHygQ4pVeV/ygkIKZ7S+l2
   A==;
X-CSE-ConnectionGUID: GuUrc0O/SqG4eai9IQk4/w==
X-CSE-MsgGUID: jo/2lxsYStaQnvwTgwHdvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45342811"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45342811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:36:25 -0700
X-CSE-ConnectionGUID: 8PUsYf4lQYqYrTM0PUUWaA==
X-CSE-MsgGUID: kU95a8bLS0W3vMbxHtA+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128015400"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2025 11:36:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1rKV-0003hv-0e;
	Mon, 07 Apr 2025 18:36:19 +0000
Date: Tue, 8 Apr 2025 02:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Ian King <colin.king@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] md/raid6 algorithms: scale test duration for speedier
 boots
Message-ID: <202504080240.huURqAeM-lkp@intel.com>
References: <20250407143105.60-1-colin.king@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407143105.60-1-colin.king@intel.com>

Hi Colin,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Colin-Ian-King/md-raid6-algorithms-scale-test-duration-for-speedier-boots/20250407-225435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250407143105.60-1-colin.king%40intel.com
patch subject: [PATCH] md/raid6 algorithms: scale test duration for speedier boots
config: i386-buildonly-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250408/202504080240.huURqAeM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080240.huURqAeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080240.huURqAeM-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/raid6/algos.o: in function `raid6_choose_gen':
>> lib/raid6/algos.c:191: undefined reference to `__udivdi3'
>> ld: lib/raid6/algos.c:209: undefined reference to `__udivdi3'
   ld: lib/raid6/algos.c:223: undefined reference to `__udivdi3'


vim +191 lib/raid6/algos.c

   156	
   157	static inline const struct raid6_calls *raid6_choose_gen(
   158		void *(*const dptrs)[RAID6_TEST_DISKS], const int disks)
   159	{
   160		unsigned long perf;
   161		const unsigned long max_perf = 2500;
   162		int start = (disks>>1)-1, stop = disks-3;	/* work on the second half of the disks */
   163		const struct raid6_calls *const *algo;
   164		const struct raid6_calls *best;
   165		const u64 ns_per_mb = 1000000000 >> 20;
   166		u64 n, ns, t, ns_best = ~0ULL;
   167	
   168		for (best = NULL, algo = raid6_algos; *algo; algo++) {
   169			if (!best || (*algo)->priority >= best->priority) {
   170				if ((*algo)->valid && !(*algo)->valid())
   171					continue;
   172	
   173				if (!IS_ENABLED(CONFIG_RAID6_PQ_BENCHMARK)) {
   174					best = *algo;
   175					break;
   176				}
   177	
   178				preempt_disable();
   179				t = local_clock();
   180				for (perf = 0; perf < max_perf; perf++) {
   181					(*algo)->gen_syndrome(disks, PAGE_SIZE, *dptrs);
   182				}
   183				ns = local_clock() - t;
   184				preempt_enable();
   185	
   186				if (ns < ns_best) {
   187					ns_best = ns;
   188					best = *algo;
   189				}
   190				n = max_perf * PAGE_SIZE * ns_per_mb * (disks - 2);
 > 191				pr_info("raid6: %-8s gen() %5llu MB/s (%llu ns)\n", (*algo)->name, (ns > 0) ? n / ns : 0, ns);
   192			}
   193		}
   194	
   195		if (!best) {
   196			pr_err("raid6: Yikes! No algorithm found!\n");
   197			goto out;
   198		}
   199	
   200		raid6_call = *best;
   201	
   202		if (!IS_ENABLED(CONFIG_RAID6_PQ_BENCHMARK)) {
   203			pr_info("raid6: skipped pq benchmark and selected %s\n",
   204				best->name);
   205			goto out;
   206		}
   207	
   208		n = max_perf * PAGE_SIZE * ns_per_mb * (disks - 2);
 > 209		pr_info("raid6: using algorithm %s gen() %llu MB/s (%llu ns)\n",
   210			best->name, (ns_best > 0) ? n / ns_best : 0, ns_best);
   211	
   212		if (best->xor_syndrome) {
   213			preempt_disable();
   214			t = local_clock();
   215			for (perf = 0; perf < max_perf; perf++) {
   216				best->xor_syndrome(disks, start, stop,
   217						   PAGE_SIZE, *dptrs);
   218			}
   219			ns = local_clock() - t;
   220			preempt_enable();
   221	
   222			n = max_perf * PAGE_SIZE * ns_per_mb * (disks - 2);
   223			pr_info("raid6: .... xor() %llu MB/s, rmw enabled (%llu ns)\n", (ns > 0) ? n / ns : 0, ns);
   224		}
   225	out:
   226		return best;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
