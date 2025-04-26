Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499D122615
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745668143; cv=none; b=SZkgNLYekMHcjEf8JcJC+nIzsiSxv8tyI0V+XkSi+5Hu4MaWr360j19UH5oASKm2LDvukKdqt86RmYctqE4rb2HmByqGGEmmNLhlDvSS+6y7oSJDtH1h+CVz4cuahnC/3yiA27tl2S37vTCkSSq4yJk4rXdHfL4L03dxsNHE0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745668143; c=relaxed/simple;
	bh=9qY009RV75gqbE+jedcoHrBfx5CXmKwBngAS1X7fotI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dAEMrufnvHRGTvReU69yi8YC72lWw5VAE4mOU2Y+IVWdkr1jEkT6KWNriAKjKe41zfrXBSK6DyL8ZXFdQR8ZLmkd2R9h+TkAVrZvwPxuMMBPFgBDN8iYNciVkIwIUMGDHiG+UAWqLQqLIQH0PW+q+ke1OQ4r1PuotWdt0CaDT/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KU2t9Kw+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KU2t9Kw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745668140; x=1777204140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qY009RV75gqbE+jedcoHrBfx5CXmKwBngAS1X7fotI=;
  b=KU2t9Kw+fvDazhZysctW2ZsqWDY0/nfIotXk+7skZ1YoJo58+fNjgexW
   l7Qb9rKaXGDsHoXixM3rxDa/l1eiFLANFwGTyqO/62T/QHa/T+pl9UNVe
   +7gJ+UpUfUIEHSttr/ZXcYyDLRJ6ZNlBfFDzqvN/nMNdQR73Jkx5KxOJ1
   Zh3dmEdcY88Etfki/7I7onQh11G8iLAzoNFPfH7MYOIXHq7PTacXjPwDu
   ZGbLE+FeZZbP1eTG8wS1QwcPUBoiJH85ryWXzLs5wOAQvjYaJHYkzF9BP
   cZdet55EVpYqnFyDr+wESa03WmRuhdFEZrR2Y8bdHijcfiS+3AebXCR4h
   A==;
X-CSE-ConnectionGUID: xZMMO3glQRKuH8VpGuLQpg==
X-CSE-MsgGUID: pUtUowX3Q4+9bd8e/BKVGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="64845772"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="64845772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 04:48:59 -0700
X-CSE-ConnectionGUID: d1B1/+U/R7+zf63cNUhacg==
X-CSE-MsgGUID: SzZrDdoRRPODvMWF8ShVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="134049929"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2025 04:48:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8e1g-0005oT-0J;
	Sat, 26 Apr 2025 11:48:56 +0000
Date: Sat, 26 Apr 2025 19:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: kernel/cgroup/dmem.c:21: warning: Cannot understand          * @ref:
 References keeping the region alive.
Message-ID: <202504261939.1yj5iNwS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: b168ed458ddecc176f3b9a1f4bcd83d7a4541c14 kernel/cgroup: Add "dmem" memory accounting cgroup
date:   4 months ago
config: riscv-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261939.1yj5iNwS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261939.1yj5iNwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261939.1yj5iNwS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/dmem.c:21: warning: Cannot understand          * @ref: References keeping the region alive.
    on line 21 - I thought it was a doc line
>> kernel/cgroup/dmem.c:30: warning: Cannot understand          * @region_node: Linked into &dmem_cgroup_regions list.
    on line 30 - I thought it was a doc line
>> kernel/cgroup/dmem.c:36: warning: Cannot understand          * @pools: List of pools linked to this region.
    on line 36 - I thought it was a doc line
>> kernel/cgroup/dmem.c:48: warning: Cannot understand          * @unregistered: Whether the region is unregistered by its caller.
    on line 48 - I thought it was a doc line
   kernel/cgroup/dmem.c:300: warning: Excess function parameter 'dev' description in 'dmem_cgroup_state_evict_valuable'
   kernel/cgroup/dmem.c:300: warning: Excess function parameter 'index' description in 'dmem_cgroup_state_evict_valuable'
   kernel/cgroup/dmem.c:635: warning: Function parameter or struct member 'region' not described in 'dmem_cgroup_try_charge'
   kernel/cgroup/dmem.c:635: warning: Excess function parameter 'dev' description in 'dmem_cgroup_try_charge'


vim +21 kernel/cgroup/dmem.c

    18	
    19	struct dmem_cgroup_region {
    20		/**
  > 21		 * @ref: References keeping the region alive.
    22		 * Keeps the region reference alive after a succesful RCU lookup.
    23		 */
    24		struct kref ref;
    25	
    26		/** @rcu: RCU head for freeing */
    27		struct rcu_head rcu;
    28	
    29		/**
  > 30		 * @region_node: Linked into &dmem_cgroup_regions list.
    31		 * Protected by RCU and global spinlock.
    32		 */
    33		struct list_head region_node;
    34	
    35		/**
  > 36		 * @pools: List of pools linked to this region.
    37		 * Protected by global spinlock only
    38		 */
    39		struct list_head pools;
    40	
    41		/** @size: Size of region, in bytes */
    42		u64 size;
    43	
    44		/** @name: Name describing the node, set by dmem_cgroup_register_region */
    45		char *name;
    46	
    47		/**
  > 48		 * @unregistered: Whether the region is unregistered by its caller.
    49		 * No new pools should be added to the region afterwards.
    50		 */
    51		bool unregistered;
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
