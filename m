Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C1D2D978C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026381; cv=none; b=dooy5Gu8QwzfejFpeN9L8z4OiHUkajr5E3ui8aweyClVxaw69FduFShMWVleiNAIeMRlKxXY9GJJCM/0DYN6mC3iuRsfz2wPaNKaF2jTPvuvA+rIuevCnCPO26p9JXI4iqUxrSCDptXzXGscZQb1zWIm2fnvqIhsY64+MnK3xAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026381; c=relaxed/simple;
	bh=PKL3fMKbuI+dL8WOBgknCDy8FhDpyp6Lhh+5tK3DtPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J85Gohmgirx/jbhclts1X3NHRSB+DMWZvL06D9kZefnOo/+Qx6uXRmVjvUr8t88Go3Yue/mLtbkIWv5vw86AkTKXldPEKfd1SAFAeZX5atu39l71HVSmfuL7HOjv1AdDSb1NY3MS689dkhtPN1wZOk8Y+NdLn1fQTgpGpDDgPu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gM6WDwq2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gM6WDwq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751026378; x=1782562378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PKL3fMKbuI+dL8WOBgknCDy8FhDpyp6Lhh+5tK3DtPE=;
  b=gM6WDwq2cY+ZAuZQRPBE6rlzsFCryAqlguKpBvxZkwZhGSSFakWFQtQQ
   qnsJNc2p4QCTRbosARTczlBP8MnaDFr/bEcuscdVs6Bv3YfhjoF1coLVI
   D7Zu+bv/+2NjuHO/uyyKq5q1XbsXsCFQDlg931pFKfxrudRXN13gXUPBb
   pOnuG5cyIvFqH84Q75PZaDJ0SDanzTJEsBLgBDin6T6Q0PvpLC+XP23Pl
   p3roRodz8mMN0YSJdUQZqK9yC/hHacsdsTCXsd1equ/iAVglHksVJsl/L
   djs7ySa/deU3vj0utmWwycrJ++f41mIGFzOaZhGif930Hy8u796KKyZju
   Q==;
X-CSE-ConnectionGUID: xu0dALC0Tb2WOUjEGATP4w==
X-CSE-MsgGUID: PFH3CybSS2+4POfi/0SviQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53486788"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53486788"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:12:57 -0700
X-CSE-ConnectionGUID: 5eVWvi21RIK3Fy7SkoC8pA==
X-CSE-MsgGUID: S85c+Q+jSbK+rhpw1nc8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="176470846"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2025 05:12:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV7wr-000W9O-20;
	Fri, 27 Jun 2025 12:12:53 +0000
Date: Fri, 27 Jun 2025 20:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:4743:33: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202506272035.5Ew6nQH6-lkp@intel.com>
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
commit: c201ea1578d3b9eed29494ba3dc2abbccf62c4c8 sched_ext: Move event_stats_cpu into scx_sched
date:   8 weeks ago
config: powerpc64-randconfig-r113-20250627 (https://download.01.org/0day-ci/archive/20250627/202506272035.5Ew6nQH6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506272035.5Ew6nQH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272035.5Ew6nQH6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:3264:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3264:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3264:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3264:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3264:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3264:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3264:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3282:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3282:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3282:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3282:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3282:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3282:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3282:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3326:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3326:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:3326:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3434:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:3434:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3434:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:3503:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3503:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3503:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3503:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3503:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3503:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3503:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3523:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_ext_ops *ops @@     got struct sched_ext_ops [noderef] __rcu * @@
   kernel/sched/ext.c:3523:50: sparse:     expected struct sched_ext_ops *ops
   kernel/sched/ext.c:3523:50: sparse:     got struct sched_ext_ops [noderef] __rcu *
   kernel/sched/ext.c:3525:23: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3525:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3525:23: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3525:23: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3525:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3525:23: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3525:23: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3527:29: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3527:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3527:29: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3527:29: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3527:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3527:29: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3527:29: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3630:20: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3630:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3630:20: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3630:20: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3630:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3630:20: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3630:20: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3702:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3702:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3702:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3702:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3702:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3702:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3702:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3765:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3765:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3765:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3765:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3765:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3765:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3765:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3769:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3769:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3769:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3769:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3769:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3769:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3769:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3780:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3780:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3780:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3780:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3780:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3780:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3780:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3809:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3809:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3809:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3809:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3809:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3809:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3809:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3918:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3918:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3918:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3918:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3918:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3918:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3918:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3934:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:3934:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3934:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3934:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:3934:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:3934:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:3934:13: sparse:     got unsigned long [noderef] __rcu *
>> kernel/sched/ext.c:4743:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4743:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4743:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:5057:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5057:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5057:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5057:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5057:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5057:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5057:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5104:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5104:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5104:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5104:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5104:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5104:13: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5104:13: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5127:30: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5127:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5127:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5127:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5127:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5127:30: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5127:30: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5161:21: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext.c:5161:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5161:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5161:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5161:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext.c:5161:21: sparse:     expected unsigned long const volatile *addr
   kernel/sched/ext.c:5161:21: sparse:     got unsigned long [noderef] __rcu *
   kernel/sched/ext.c:5185:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5185:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5185:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5197:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5197:25: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5197:25: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5951:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5951:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5951:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6331:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6331:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6331:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6464:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6464:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6464:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7305:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7305:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7305:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:245:24: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/ext_idle.c:747:13: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/sched/ext_idle.c:747:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext_idle.c:747:13: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned long const volatile *addr @@     got unsigned long [noderef] __rcu * @@
   kernel/sched/ext_idle.c:766:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@

vim +4743 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo      2024-06-18  4740  
1a2469403eb26c Tejun Heo      2025-04-04  4741  static void scx_disable_workfn(struct kthread_work *work)
f0e1a0643a59bf Tejun Heo      2024-06-18  4742  {
17108735b47d12 Tejun Heo      2025-04-29 @4743  	struct scx_sched *sch = scx_root;
17108735b47d12 Tejun Heo      2025-04-29  4744  	struct scx_exit_info *ei = sch->exit_info;
f0e1a0643a59bf Tejun Heo      2024-06-18  4745  	struct scx_task_iter sti;
f0e1a0643a59bf Tejun Heo      2024-06-18  4746  	struct task_struct *p;
0b304617936094 Tejun Heo      2025-04-09  4747  	int kind, cpu;
f0e1a0643a59bf Tejun Heo      2024-06-18  4748  
17108735b47d12 Tejun Heo      2025-04-29  4749  	kind = atomic_read(&sch->exit_kind);
f0e1a0643a59bf Tejun Heo      2024-06-18  4750  	while (true) {
f0e1a0643a59bf Tejun Heo      2024-06-18  4751  		/*
f0e1a0643a59bf Tejun Heo      2024-06-18  4752  		 * NONE indicates that a new scx_ops has been registered since
f0e1a0643a59bf Tejun Heo      2024-06-18  4753  		 * disable was scheduled - don't kill the new ops. DONE
f0e1a0643a59bf Tejun Heo      2024-06-18  4754  		 * indicates that the ops has already been disabled.
f0e1a0643a59bf Tejun Heo      2024-06-18  4755  		 */
f0e1a0643a59bf Tejun Heo      2024-06-18  4756  		if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
f0e1a0643a59bf Tejun Heo      2024-06-18  4757  			return;
17108735b47d12 Tejun Heo      2025-04-29  4758  		if (atomic_try_cmpxchg(&sch->exit_kind, &kind, SCX_EXIT_DONE))
f0e1a0643a59bf Tejun Heo      2024-06-18  4759  			break;
f0e1a0643a59bf Tejun Heo      2024-06-18  4760  	}
f0e1a0643a59bf Tejun Heo      2024-06-18  4761  	ei->kind = kind;
f0e1a0643a59bf Tejun Heo      2024-06-18  4762  	ei->reason = scx_exit_reason(ei->kind);
f0e1a0643a59bf Tejun Heo      2024-06-18  4763  
f0e1a0643a59bf Tejun Heo      2024-06-18  4764  	/* guarantee forward progress by bypassing scx_ops */
8c6ee862467e86 Tejun Heo      2025-04-04  4765  	scx_bypass(true);
f0e1a0643a59bf Tejun Heo      2024-06-18  4766  
1a7ff7216c8b4d Tejun Heo      2025-04-04  4767  	switch (scx_set_enable_state(SCX_DISABLING)) {
1a7ff7216c8b4d Tejun Heo      2025-04-04  4768  	case SCX_DISABLING:
f0e1a0643a59bf Tejun Heo      2024-06-18  4769  		WARN_ONCE(true, "sched_ext: duplicate disabling instance?");
f0e1a0643a59bf Tejun Heo      2024-06-18  4770  		break;
1a7ff7216c8b4d Tejun Heo      2025-04-04  4771  	case SCX_DISABLED:
f0e1a0643a59bf Tejun Heo      2024-06-18  4772  		pr_warn("sched_ext: ops error detected without ops (%s)\n",
17108735b47d12 Tejun Heo      2025-04-29  4773  			sch->exit_info->msg);
1a7ff7216c8b4d Tejun Heo      2025-04-04  4774  		WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
f0e1a0643a59bf Tejun Heo      2024-06-18  4775  		goto done;
f0e1a0643a59bf Tejun Heo      2024-06-18  4776  	default:
f0e1a0643a59bf Tejun Heo      2024-06-18  4777  		break;
f0e1a0643a59bf Tejun Heo      2024-06-18  4778  	}
f0e1a0643a59bf Tejun Heo      2024-06-18  4779  
f0e1a0643a59bf Tejun Heo      2024-06-18  4780  	/*
f0e1a0643a59bf Tejun Heo      2024-06-18  4781  	 * Here, every runnable task is guaranteed to make forward progress and
f0e1a0643a59bf Tejun Heo      2024-06-18  4782  	 * we can safely use blocking synchronization constructs. Actually
f0e1a0643a59bf Tejun Heo      2024-06-18  4783  	 * disable ops.
f0e1a0643a59bf Tejun Heo      2024-06-18  4784  	 */
a50c365f996d89 Tejun Heo      2025-04-04  4785  	mutex_lock(&scx_enable_mutex);
f0e1a0643a59bf Tejun Heo      2024-06-18  4786  
f0e1a0643a59bf Tejun Heo      2024-06-18  4787  	static_branch_disable(&__scx_switched_all);
f0e1a0643a59bf Tejun Heo      2024-06-18  4788  	WRITE_ONCE(scx_switching_all, false);
f0e1a0643a59bf Tejun Heo      2024-06-18  4789  
f0e1a0643a59bf Tejun Heo      2024-06-18  4790  	/*
160216568cddc9 Tejun Heo      2024-09-27  4791  	 * Shut down cgroup support before tasks so that the cgroup attach path
1a2469403eb26c Tejun Heo      2025-04-04  4792  	 * doesn't race against scx_exit_task().
f0e1a0643a59bf Tejun Heo      2024-06-18  4793  	 */
8195136669661f Tejun Heo      2024-09-04  4794  	scx_cgroup_lock();
160216568cddc9 Tejun Heo      2024-09-27  4795  	scx_cgroup_exit();
160216568cddc9 Tejun Heo      2024-09-27  4796  	scx_cgroup_unlock();
f0e1a0643a59bf Tejun Heo      2024-06-18  4797  
f0e1a0643a59bf Tejun Heo      2024-06-18  4798  	/*
61eeb9a90522da Tejun Heo      2024-08-30  4799  	 * The BPF scheduler is going away. All tasks including %TASK_DEAD ones
61eeb9a90522da Tejun Heo      2024-08-30  4800  	 * must be switched out and exited synchronously.
f0e1a0643a59bf Tejun Heo      2024-06-18  4801  	 */
160216568cddc9 Tejun Heo      2024-09-27  4802  	percpu_down_write(&scx_fork_rwsem);
160216568cddc9 Tejun Heo      2024-09-27  4803  
1a2469403eb26c Tejun Heo      2025-04-04  4804  	scx_init_task_enabled = false;
160216568cddc9 Tejun Heo      2024-09-27  4805  
967da578325d85 Tejun Heo      2024-10-10  4806  	scx_task_iter_start(&sti);
a8532fac7b5d27 Tejun Heo      2024-08-30  4807  	while ((p = scx_task_iter_next_locked(&sti))) {
f0e1a0643a59bf Tejun Heo      2024-06-18  4808  		const struct sched_class *old_class = p->sched_class;
69d5e722be949a Peter Zijlstra 2024-10-30  4809  		const struct sched_class *new_class =
69d5e722be949a Peter Zijlstra 2024-10-30  4810  			__setscheduler_class(p->policy, p->prio);
f0e1a0643a59bf Tejun Heo      2024-06-18  4811  		struct sched_enq_and_set_ctx ctx;
f0e1a0643a59bf Tejun Heo      2024-06-18  4812  
69d5e722be949a Peter Zijlstra 2024-10-30  4813  		if (old_class != new_class && p->se.sched_delayed)
69d5e722be949a Peter Zijlstra 2024-10-30  4814  			dequeue_task(task_rq(p), p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
69d5e722be949a Peter Zijlstra 2024-10-30  4815  
61eeb9a90522da Tejun Heo      2024-08-30  4816  		sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
f0e1a0643a59bf Tejun Heo      2024-06-18  4817  
69d5e722be949a Peter Zijlstra 2024-10-30  4818  		p->sched_class = new_class;
f0e1a0643a59bf Tejun Heo      2024-06-18  4819  		check_class_changing(task_rq(p), p, old_class);
f0e1a0643a59bf Tejun Heo      2024-06-18  4820  
f0e1a0643a59bf Tejun Heo      2024-06-18  4821  		sched_enq_and_set_task(&ctx);
f0e1a0643a59bf Tejun Heo      2024-06-18  4822  
f0e1a0643a59bf Tejun Heo      2024-06-18  4823  		check_class_changed(task_rq(p), p, old_class, p->prio);
1a2469403eb26c Tejun Heo      2025-04-04  4824  		scx_exit_task(p);
f0e1a0643a59bf Tejun Heo      2024-06-18  4825  	}
967da578325d85 Tejun Heo      2024-10-10  4826  	scx_task_iter_stop(&sti);
160216568cddc9 Tejun Heo      2024-09-27  4827  	percpu_up_write(&scx_fork_rwsem);
f0e1a0643a59bf Tejun Heo      2024-06-18  4828  
3a9910b5904d29 Changwoo Min   2025-01-09  4829  	/*
3a9910b5904d29 Changwoo Min   2025-01-09  4830  	 * Invalidate all the rq clocks to prevent getting outdated
3a9910b5904d29 Changwoo Min   2025-01-09  4831  	 * rq clocks from a previous scx scheduler.
3a9910b5904d29 Changwoo Min   2025-01-09  4832  	 */
3a9910b5904d29 Changwoo Min   2025-01-09  4833  	for_each_possible_cpu(cpu) {
3a9910b5904d29 Changwoo Min   2025-01-09  4834  		struct rq *rq = cpu_rq(cpu);
3a9910b5904d29 Changwoo Min   2025-01-09  4835  		scx_rq_clock_invalidate(rq);
3a9910b5904d29 Changwoo Min   2025-01-09  4836  	}
3a9910b5904d29 Changwoo Min   2025-01-09  4837  
f0e1a0643a59bf Tejun Heo      2024-06-18  4838  	/* no task is on scx, turn off all the switches and flush in-progress calls */
a50c365f996d89 Tejun Heo      2025-04-04  4839  	static_branch_disable(&__scx_enabled);
17108735b47d12 Tejun Heo      2025-04-29  4840  	bitmap_zero(sch->has_op, SCX_OPI_END);
d73249f88743df Andrea Righi   2025-02-14  4841  	scx_idle_disable();
f0e1a0643a59bf Tejun Heo      2024-06-18  4842  	synchronize_rcu();
f0e1a0643a59bf Tejun Heo      2024-06-18  4843  
f0e1a0643a59bf Tejun Heo      2024-06-18  4844  	if (ei->kind >= SCX_EXIT_ERROR) {
344576fa6a69ce Tejun Heo      2024-08-07  4845  		pr_err("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
17108735b47d12 Tejun Heo      2025-04-29  4846  		       sch->ops.name, ei->reason);
f0e1a0643a59bf Tejun Heo      2024-06-18  4847  
344576fa6a69ce Tejun Heo      2024-08-07  4848  		if (ei->msg[0] != '\0')
17108735b47d12 Tejun Heo      2025-04-29  4849  			pr_err("sched_ext: %s: %s\n", sch->ops.name, ei->msg);
62d3726d4cd66f Tejun Heo      2024-09-23  4850  #ifdef CONFIG_STACKTRACE
f0e1a0643a59bf Tejun Heo      2024-06-18  4851  		stack_trace_print(ei->bt, ei->bt_len, 2);
62d3726d4cd66f Tejun Heo      2024-09-23  4852  #endif
344576fa6a69ce Tejun Heo      2024-08-07  4853  	} else {
344576fa6a69ce Tejun Heo      2024-08-07  4854  		pr_info("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
17108735b47d12 Tejun Heo      2025-04-29  4855  			sch->ops.name, ei->reason);
f0e1a0643a59bf Tejun Heo      2024-06-18  4856  	}
f0e1a0643a59bf Tejun Heo      2024-06-18  4857  
17108735b47d12 Tejun Heo      2025-04-29  4858  	if (sch->ops.exit)
18853ba782bef6 Andrea Righi   2025-04-22  4859  		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, NULL, ei);
f0e1a0643a59bf Tejun Heo      2024-06-18  4860  
8a010b81b3a50b David Vernet   2024-06-18  4861  	cancel_delayed_work_sync(&scx_watchdog_work);
8a010b81b3a50b David Vernet   2024-06-18  4862  
f0e1a0643a59bf Tejun Heo      2024-06-18  4863  	/*
17108735b47d12 Tejun Heo      2025-04-29  4864  	 * scx_root clearing must be inside cpus_read_lock(). See
17108735b47d12 Tejun Heo      2025-04-29  4865  	 * handle_hotplug().
f0e1a0643a59bf Tejun Heo      2024-06-18  4866  	 */
17108735b47d12 Tejun Heo      2025-04-29  4867  	cpus_read_lock();
17108735b47d12 Tejun Heo      2025-04-29  4868  	RCU_INIT_POINTER(scx_root, NULL);
17108735b47d12 Tejun Heo      2025-04-29  4869  	cpus_read_unlock();
f0e1a0643a59bf Tejun Heo      2024-06-18  4870  
17108735b47d12 Tejun Heo      2025-04-29  4871  	/*
17108735b47d12 Tejun Heo      2025-04-29  4872  	 * Delete the kobject from the hierarchy synchronously. Otherwise, sysfs
17108735b47d12 Tejun Heo      2025-04-29  4873  	 * could observe an object of the same name still in the hierarchy when
17108735b47d12 Tejun Heo      2025-04-29  4874  	 * the next scheduler is loaded.
17108735b47d12 Tejun Heo      2025-04-29  4875  	 */
17108735b47d12 Tejun Heo      2025-04-29  4876  	kobject_del(&sch->kobj);
f0e1a0643a59bf Tejun Heo      2024-06-18  4877  
f0e1a0643a59bf Tejun Heo      2024-06-18  4878  	free_percpu(scx_dsp_ctx);
f0e1a0643a59bf Tejun Heo      2024-06-18  4879  	scx_dsp_ctx = NULL;
f0e1a0643a59bf Tejun Heo      2024-06-18  4880  	scx_dsp_max_batch = 0;
f0e1a0643a59bf Tejun Heo      2024-06-18  4881  
a50c365f996d89 Tejun Heo      2025-04-04  4882  	mutex_unlock(&scx_enable_mutex);
f0e1a0643a59bf Tejun Heo      2024-06-18  4883  
1a7ff7216c8b4d Tejun Heo      2025-04-04  4884  	WARN_ON_ONCE(scx_set_enable_state(SCX_DISABLED) != SCX_DISABLING);
f0e1a0643a59bf Tejun Heo      2024-06-18  4885  done:
8c6ee862467e86 Tejun Heo      2025-04-04  4886  	scx_bypass(false);
f0e1a0643a59bf Tejun Heo      2024-06-18  4887  }
f0e1a0643a59bf Tejun Heo      2024-06-18  4888  

:::::: The code at line 4743 was first introduced by commit
:::::: 17108735b47d125b7649c9b6d4be94cdffc863b9 sched_ext: Use dynamic allocation for scx_sched

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
