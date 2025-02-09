Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6330B1DFE3A
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 19:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739128170; cv=none; b=ZXkUhTTrDec3OYCVohZHWs/Uy6BGmVt9OMZSxLFUnsoAGSuJxNctxsGkfwk2JFSoBpy73Rm7gbG8e6JEbJIn+oAUdF+BFVlVyLefj4Cvp371T4NILAprBdLt0bL4Lta5UUvBm0DfQ6cj4T8Lari53VROitDkqU/kH4lPfH2tI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739128170; c=relaxed/simple;
	bh=bNV9eSBmv1NATXayXW10Wo9JnQ9IhK9w8zfW+zKVdII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSep6n+8qgVrcDSQZ5UiO6FeOcmHCSrgg4CGpO7NCoHo3jWBi/8PhUC0Er+yURG8Tq0+I7y0J+1lIlzWPgITzI0rK3IgNDvpL1vKNusX4bSul8Pu+OhaqIAB3xSDS4AEQVQrYu7c/sQn24cHKLd+NhCc7OBC236k2FFdnLbckqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hY9VRYae; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hY9VRYae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739128169; x=1770664169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bNV9eSBmv1NATXayXW10Wo9JnQ9IhK9w8zfW+zKVdII=;
  b=hY9VRYaeG7Q6WGLAwC5rMXwloQvYrbm/3MvY/XaLNVSfUUseU7bPxD9F
   gTmB3FXDmunbSrZdVrgPQvbIwKe+C18r/ovlUIHiJKEbhfRe+PyvH/NmZ
   Sevwc41DtFC91b57eVbxdh1QeCzouCP2Y4axAHOMMy32wT9JUlaESymB1
   vyJHYFElTbyxDaYd8asDzJ01MB2S30+sfNuvHdz6SuGWvLIpaOQLzIUtI
   w6xlr4vOQX1TMBwllw3rwarmYEv1oG59owvFwlosXSFcVfWMZZNiJlyQi
   rbhN6vfZs0j7Vij5v/XCfKSjxedR7GQbg/XQvjgFej2qDRj+Mp0moI+7j
   A==;
X-CSE-ConnectionGUID: 7LlMTT7/T92hQfd6AJxtlA==
X-CSE-MsgGUID: uHPh44F9Rk6P6qjDy859tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39618500"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39618500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 11:09:28 -0800
X-CSE-ConnectionGUID: nu/O7I36RmSiu3jXzKGSAw==
X-CSE-MsgGUID: KPgzawIeSKK6hVy2MVv/yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="111928564"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2025 11:09:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thCgF-0011oN-02;
	Sun, 09 Feb 2025 19:09:23 +0000
Date: Mon, 10 Feb 2025 03:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jinyang He <hejinyang@loongson.cn>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH v2 1/1] [PATCH] loongson: Fix idle VS timer enqueue
Message-ID: <202502100258.jJThV6DP-lkp@intel.com>
References: <20250208101924.20743-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208101924.20743-2-marco.crivellari@suse.com>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Crivellari/loongson-Fix-idle-VS-timer-enqueue/20250208-182213
base:   linus/master
patch link:    https://lore.kernel.org/r/20250208101924.20743-2-marco.crivellari%40suse.com
patch subject: [PATCH v2 1/1] [PATCH] loongson: Fix idle VS timer enqueue
config: loongarch-randconfig-r054-20250209 (https://download.01.org/0day-ci/archive/20250210/202502100258.jJThV6DP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100258.jJThV6DP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/reset.c:37:2-3: Unneeded semicolon
   arch/loongarch/kernel/reset.c:57:2-3: Unneeded semicolon
   arch/loongarch/kernel/reset.c:78:2-3: Unneeded semicolon

vim +37 arch/loongarch/kernel/reset.c

    22	
    23	void machine_halt(void)
    24	{
    25	#ifdef CONFIG_SMP
    26		preempt_disable();
    27		smp_send_stop();
    28	#endif
    29		local_irq_disable();
    30		clear_csr_ecfg(ECFG0_IM);
    31	
    32		pr_notice("\n\n** You can safely turn off the power now **\n\n");
    33		console_flush_on_panic(CONSOLE_FLUSH_PENDING);
    34	
    35		while (1) {
    36			asm volatile("idle 0" : : : "memory");
  > 37		};
    38	}
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
