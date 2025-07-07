Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9B427AC34
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871198; cv=none; b=H8TuS6mRNVVllCgicRKctLcjsE4Ydb98ohzF78eWrDkW1gh7FmfzZ0mkH6MXHXqNuSYA6O3j4IwUzHSoe7vy3JTLEkUyJLvCrSfVRafjH95evYHYtzTRXyuuJOjsLY6XsTkhUHly3HuzzO1waEDSH6/kZkqtBgPkOEYyz3qZuQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871198; c=relaxed/simple;
	bh=Em469fJKz9rkiRR0gFrK5W6JZWJxcpDQWQsw4nPHfF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZtdWhuWsB6OT2xtuReb55VTLMn488rX0a01iI+rIaVRHCL7lKMEbYqCxhC9FZVnt09dRfgoO2Z1G1+W5I3kGh9cGZlDWzOXacy6+48iia0g6BfXa9RWwcS1njm1cZ08FYwwW5zYdXLwATdL2tvPwZety3BIlhpjYUVIXGnD6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTjzJMeT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTjzJMeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751871197; x=1783407197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Em469fJKz9rkiRR0gFrK5W6JZWJxcpDQWQsw4nPHfF8=;
  b=CTjzJMeTb4RYd7Ib7wexAIEKAKhl3IKrnNXrELIWql+D9axAZQk8ql1O
   nW6Rt1Df9Cw86f2dECyChfcO2PVexaVjqKkRdpNE1qZOYVA6RR8knRYF7
   O0FvJXGJPnaxW9tlxwlv/Qp1dWhjdbgSHYdlljyfF7WwYEWIgEPKWR520
   FbkqcgCFjmhgVkgeBGHCNy1zDMoaR5ha6Fbu9PIbA1RySFO6bUIYTXNIr
   zlTm2unO/7aF2TsSByisD+LVauKKh+DW9DzHgGD+hMaShh3QjfwRhIKNN
   UWduX8kfU0MlrSXdsKDjsQjqMWRCZJ1zuTQCobH+fG1BAHd+F3PiAtuTD
   Q==;
X-CSE-ConnectionGUID: SadIbz7HRje+86P821kR4Q==
X-CSE-MsgGUID: /WhflrzgQtCKmeLyC1KY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54204626"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="54204626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 23:53:16 -0700
X-CSE-ConnectionGUID: Pk/Sf3k9SgGbdNEBKpg5Xw==
X-CSE-MsgGUID: a20EZDxYRF6CabT1uJsS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="160794453"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jul 2025 23:53:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYfix-0000CR-0q;
	Mon, 07 Jul 2025 06:53:11 +0000
Date: Mon, 7 Jul 2025 14:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pan Deng <pan.deng@intel.com>, mingo@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, tianyou.li@intel.com,
	tim.c.chen@linux.intel.com, yu.c.chen@intel.com, pan.deng@intel.com
Subject: Re: [PATCH 3/4] sched/rt: Split root_domain->rto_count to
 per-NUMA-node counters
Message-ID: <202507071418.sFa0bilv-lkp@intel.com>
References: <2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng@intel.com>

Hi Pan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.16-rc5]
[also build test WARNING on linus/master]
[cannot apply to tip/sched/core peterz-queue/sched/core tip/master tip/auto-latest next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pan-Deng/sched-rt-Optimize-cpupri_vec-layout-to-mitigate-cache-line-contention/20250707-131831
base:   v6.16-rc5
patch link:    https://lore.kernel.org/r/2c1e1dbacaddd881f3cca340ece1f9268029b620.1751852370.git.pan.deng%40intel.com
patch subject: [PATCH 3/4] sched/rt: Split root_domain->rto_count to per-NUMA-node counters
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20250707/202507071418.sFa0bilv-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507071418.sFa0bilv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507071418.sFa0bilv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:496:21: error: unknown type name 'atomic_tp'; did you mean 'atomic_t'?
     496 | int rto_counts_init(atomic_tp **rto_counts)
         |                     ^~~~~~~~~
         |                     atomic_t
   include/linux/types.h:183:3: note: 'atomic_t' declared here
     183 | } atomic_t;
         |   ^
   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:496:5: warning: no previous prototype for function 'rto_counts_init' [-Wmissing-prototypes]
     496 | int rto_counts_init(atomic_tp **rto_counts)
         |     ^
   kernel/sched/rt.c:496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     496 | int rto_counts_init(atomic_tp **rto_counts)
         | ^
         | static 
   kernel/sched/rt.c:501:25: error: unknown type name 'atomic_tp'; did you mean 'atomic_t'?
     501 | void rto_counts_cleanup(atomic_tp *rto_counts)
         |                         ^~~~~~~~~
         |                         atomic_t
   include/linux/types.h:183:3: note: 'atomic_t' declared here
     183 | } atomic_t;
         |   ^
   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:501:6: warning: no previous prototype for function 'rto_counts_cleanup' [-Wmissing-prototypes]
     501 | void rto_counts_cleanup(atomic_tp *rto_counts)
         |      ^
   kernel/sched/rt.c:501:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     501 | void rto_counts_cleanup(atomic_tp *rto_counts)
         | ^
         | static 
   2 warnings and 2 errors generated.


vim +/rto_counts_init +496 kernel/sched/rt.c

   495	
 > 496	int rto_counts_init(atomic_tp **rto_counts)
   497	{
   498		return 0;
   499	}
   500	
 > 501	void rto_counts_cleanup(atomic_tp *rto_counts)
   502	{
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
