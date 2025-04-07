Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C3255244
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031801; cv=none; b=OEntqlFeNfDHD6V3esf9mMmgZJqYQbQ/HbO+PMbar5YpoYFgbZkh+0AouM3DI7wZPpAmcsFGbx84VXbFwF3RKKqnQ2R2Y4Omzie6jh/E+/xF7h2cNSe/DExtb33sqJinUILd00J2rI0xXladpCJoS8BHdtvruWENulljef640U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031801; c=relaxed/simple;
	bh=sFiXCOjce2Arik6LJN+4blzXwIJFWZxpXEbeG/RlRZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mx4pyV8xGQEev58uJA5RFmmJYrTZsYmAnktqG+g1fkKbAKHOTx2H3wO6EX2fvoJL+9jUI0/EZToeM9+jNAcSioqqFri6B6eYemzJVybXhMubLqKdTSfA3bw71EXT7Iq2UnAfxsgtv+xD9mtFyhiEic97ySPVEFsJ+P242/FmIXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9klFOGN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9klFOGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744031800; x=1775567800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sFiXCOjce2Arik6LJN+4blzXwIJFWZxpXEbeG/RlRZA=;
  b=I9klFOGNpFOTAth5ikpIiA8s6bjsaSinP4y+HfnJxdPZ9R95QoKN10mT
   bnXXImJJt+LZyekOHAAM2aQNvvjtErNSW+nTzYQWiA+z74LDyyud3xUJT
   mrb2Synbxsz489dSG4a32VpF+R51fmGBDpy8GmW72gNvgAgZo9D7EkFQF
   Lx7wfl8w8aVclUe7yzNRsUVCUGj2ZIH+g5fGG3gMC61Wkw0Dz5ZzR+nZ+
   eb4zZAsokchrWXCi4m757PsXaHUFfrLFQZOeoKjUOVRQfJeeLPx8BAgSo
   F3Ql4YZh7T2fj++x0htRM+Q7AH/QTUKvHCbt0wNyJsg882IyhMalIwY1J
   g==;
X-CSE-ConnectionGUID: Tv/0LaQJTF6ULH7M4TpGUw==
X-CSE-MsgGUID: z/paNY3WTqGTwEDc5XY7Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44560189"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44560189"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:16:39 -0700
X-CSE-ConnectionGUID: nm+WR+MkQ0690w1hCuAelQ==
X-CSE-MsgGUID: 6J8LletqQjut895dvahgAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132088892"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Apr 2025 06:16:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1mL5-0003Qd-1S;
	Mon, 07 Apr 2025 13:16:35 +0000
Date: Mon, 7 Apr 2025 21:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: include/linux/hrtimer.h:348:9: sparse: sparse: dereference of
 noderef expression
Message-ID: <202504072155.5UAZjYGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: 04257da0c99c9d4ff7c5bb93046482e1f7d34938 hrtimers: Make callback function pointer private
date:   2 days ago
config: powerpc-randconfig-r112-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072155.5UAZjYGU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250407/202504072155.5UAZjYGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504072155.5UAZjYGU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/xilinx_uartps.c: note: in included file (through include/linux/pm.h, include/linux/device.h, include/linux/platform_device.h):
>> include/linux/hrtimer.h:348:9: sparse: sparse: dereference of noderef expression
>> include/linux/hrtimer.h:348:9: sparse: sparse: dereference of noderef expression

vim +348 include/linux/hrtimer.h

4346f65426cbce Oliver Hartkopp 2008-04-30  327  
8f02e3563bb582 Nam Cao         2024-10-31  328  /**
8f02e3563bb582 Nam Cao         2024-10-31  329   * hrtimer_update_function - Update the timer's callback function
8f02e3563bb582 Nam Cao         2024-10-31  330   * @timer:	Timer to update
8f02e3563bb582 Nam Cao         2024-10-31  331   * @function:	New callback function
8f02e3563bb582 Nam Cao         2024-10-31  332   *
8f02e3563bb582 Nam Cao         2024-10-31  333   * Only safe to call if the timer is not enqueued. Can be called in the callback function if the
8f02e3563bb582 Nam Cao         2024-10-31  334   * timer is not enqueued at the same time (see the comments above HRTIMER_STATE_ENQUEUED).
8f02e3563bb582 Nam Cao         2024-10-31  335   */
8f02e3563bb582 Nam Cao         2024-10-31  336  static inline void hrtimer_update_function(struct hrtimer *timer,
8f02e3563bb582 Nam Cao         2024-10-31  337  					   enum hrtimer_restart (*function)(struct hrtimer *))
8f02e3563bb582 Nam Cao         2024-10-31  338  {
2ea97b76d6712b Thomas Gleixner 2025-02-07  339  #ifdef CONFIG_PROVE_LOCKING
8f02e3563bb582 Nam Cao         2024-10-31  340  	guard(raw_spinlock_irqsave)(&timer->base->cpu_base->lock);
8f02e3563bb582 Nam Cao         2024-10-31  341  
8f02e3563bb582 Nam Cao         2024-10-31  342  	if (WARN_ON_ONCE(hrtimer_is_queued(timer)))
8f02e3563bb582 Nam Cao         2024-10-31  343  		return;
8f02e3563bb582 Nam Cao         2024-10-31  344  
8f02e3563bb582 Nam Cao         2024-10-31  345  	if (WARN_ON_ONCE(!function))
8f02e3563bb582 Nam Cao         2024-10-31  346  		return;
2ea97b76d6712b Thomas Gleixner 2025-02-07  347  #endif
8f02e3563bb582 Nam Cao         2024-10-31 @348  	timer->function = function;
8f02e3563bb582 Nam Cao         2024-10-31  349  }
8f02e3563bb582 Nam Cao         2024-10-31  350  

:::::: The code at line 348 was first introduced by commit
:::::: 8f02e3563bb5824eb01c94f2c75f1dcee2d05625 hrtimers: Introduce hrtimer_update_function()

:::::: TO: Nam Cao <namcao@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
