Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CA421C9EE
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733495; cv=none; b=jPdnBbnNz2yZhcXW5ROPAz1chA9tiZqw3SjIUce/At75Y+qPpmFToGzqIlImjGpnJNc9ZJT2VN3yIhsirMTS9lxDV3q1n4lVrv4AbFhHXe2llN9CZTa0du/+YLOUgfo1ToYtBhErwVNyR/jCiO/hPq3F3yrMer6Akr3MnVWgzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733495; c=relaxed/simple;
	bh=/kmXi86AjWcoQH0fy7Ig4oBVuguid/ijFy9kzC28OeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GzZaFPbpJHsmyRtbWYsZze06Ok14f661JHtnIH+PQNjWUMqori6OfFsiugpOugbOPM4EKMCjLnTrUNLehb3G/TOvgQpc2F2IspkM8/VCrIbdlZLNpk8iJ2xXTpSDGtjAzwt9yPHEnnhQi1XQKFwMNEahsIncd+Hz3zMS+T7n5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UN9PAt6b; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN9PAt6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747733494; x=1779269494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/kmXi86AjWcoQH0fy7Ig4oBVuguid/ijFy9kzC28OeE=;
  b=UN9PAt6bRM7djY4crHwHX/mCF/d0lffZq166KanbwDn+8pdzUxjVp0cL
   9fDQiW21u/mylgXALt/4sRhHNqWpT4/HFO4QtPNSV7GLWSNzf9eNL+Vui
   oHeyOA+jEHSy12KCGAnFMLtS1peMrPenrmjY0dRgXKVQT7AE0vYeXsyLl
   Olw2Ht5bPN+QoPBpgb8djIDU3q6drq8KIcQUwtq1vhzjUTqtRLluW8f+k
   JWtMPMfzr8YeWvBoItBqpusc6gSLC8kcBPTgjk9hzA3/bmwaJs8JcEb5+
   jIQJOJKqFcrjZDLOrt6nZSd2lwDcr48zRBFX7YqK/VnjOzLUNjl6YRUGY
   Q==;
X-CSE-ConnectionGUID: LJ3Q98K/TXC2yEIJeOo4eQ==
X-CSE-MsgGUID: 2ysTZq0WRm6n66uzUPIM8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49793538"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49793538"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:31:33 -0700
X-CSE-ConnectionGUID: QIQO1ewlRD6YuIi6n9deDQ==
X-CSE-MsgGUID: GmJqCW7ZTuCER/L8hZ/9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144886471"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2025 02:31:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHJJZ-000MOW-1I;
	Tue, 20 May 2025 09:31:13 +0000
Date: Tue, 20 May 2025 17:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202505201742.5rpaA9Qr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
commit: 2c9e5d4a008293407836d29d35dfd4353615bd2f bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
date:   1 year ago
config: powerpc64-randconfig-r121-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201742.5rpaA9Qr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201742.5rpaA9Qr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201742.5rpaA9Qr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/core.c:241:49: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:1997:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2002:48: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2268:77: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:321:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:348:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:382:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through include/linux/rbtree_latch.h, include/linux/bpf.h, include/linux/filter.h):
>> include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *
>> include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +74 include/linux/rbtree.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  67  
d72da4a4d973d8 Peter Zijlstra 2015-05-27  68  static inline void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent,
d72da4a4d973d8 Peter Zijlstra 2015-05-27  69  				    struct rb_node **rb_link)
d72da4a4d973d8 Peter Zijlstra 2015-05-27  70  {
d72da4a4d973d8 Peter Zijlstra 2015-05-27  71  	node->__rb_parent_color = (unsigned long)parent;
d72da4a4d973d8 Peter Zijlstra 2015-05-27  72  	node->rb_left = node->rb_right = NULL;
d72da4a4d973d8 Peter Zijlstra 2015-05-27  73  
d72da4a4d973d8 Peter Zijlstra 2015-05-27 @74  	rcu_assign_pointer(*rb_link, node);
d72da4a4d973d8 Peter Zijlstra 2015-05-27  75  }
d72da4a4d973d8 Peter Zijlstra 2015-05-27  76  

:::::: The code at line 74 was first introduced by commit
:::::: d72da4a4d973d8a0a0d3c97e7cdebf287fbe3a99 rbtree: Make lockless searches non-fatal

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
