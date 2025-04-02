Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED801426C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743558181; cv=none; b=bh91ccE8nmpoVlQPRYNlRWDz7Cw2/1E7mnxMbRVpBPSQ4a9GZ3i24ueEWtomejk/HiQg0Ni7HX1UI3LE9GWYBhcwF/zgcxNTfXpcZ/IiUeDAM/zqezQ+kGd5jAfQEw3xZur6VjPUyc8kHm/Ux3qdsnQp0YXu9OBabG5wewXvs6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743558181; c=relaxed/simple;
	bh=EP0QjyDeDMzQWEnJguROgR5Anzq1XpYtA9f9+0L+768=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBcxgFvkeMbsgWisE3KdW2/+Hf4eu2fY00gQuE+eOG5TSdJoUUkKBRSpfZ35nhbJGqK4squJIHigjnjyXRnZbtDuLXM+NnTHfz+iEiItO/NOdRNqp5zFmSFlwCMBXSPzd86a0tUEduChVpXEXaRtySsCTNrzRV0AxlgQbJ+AztM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+YGj8P9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+YGj8P9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743558179; x=1775094179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EP0QjyDeDMzQWEnJguROgR5Anzq1XpYtA9f9+0L+768=;
  b=U+YGj8P9HG29q09lELHHI73AKM3eOcJ3h1tmBhulMeY1uIu7mlMgoUKd
   qWyroAEOTaim4g2duf05WoG5UuI9+nf7uzFUVTKhyqadCHPuDjan55Pk/
   y/S3+VArXAgpZpSkq5kVXU9ocINfaK+ZgEkrlLUUZSA1b0quAh+QNXLFm
   4yXAkY/Za9JdRkAJ1QAAP/fLUF352mmqHx/0Qc82MuvBp7/wfbhBpZTw0
   PpsAnsnvXAwBDOW4vR87vQypVUoCyOn+o2iKmfeHxdsPgkEYJddsMPJTW
   3WvWufQgnZy04aPhFElDHQ28hX/SGfFZYbpFKCEugk2p+K+3FuKphK/ji
   w==;
X-CSE-ConnectionGUID: qKv5quGCQrSYt1fZQ+oPSA==
X-CSE-MsgGUID: zc4LlDhPS3a3GjjMz+yzZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56273287"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="56273287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 18:42:58 -0700
X-CSE-ConnectionGUID: 1WAlJT2SSrqQ8o7IosuoUA==
X-CSE-MsgGUID: 4UwRKH4KQVua9mT7djmmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="127377326"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Apr 2025 18:42:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzn82-000AKI-0j;
	Wed, 02 Apr 2025 01:42:54 +0000
Date: Wed, 2 Apr 2025 09:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: drivers/firmware/smccc/kvm_guest.c:106:2-3: Unneeded semicolon
Message-ID: <202504020941.VEeL6nVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   91e5bfe317d8f8471fbaa3e70cf66cae1314a516
commit: 44ff44cadbd144ee1159f5687a852c49c4290262 smccc: kvm_guest: Fix kernel builds for 32 bit arm
date:   4 weeks ago
config: arm-randconfig-r053-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020941.VEeL6nVJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020941.VEeL6nVJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/smccc/kvm_guest.c:106:2-3: Unneeded semicolon

vim +106 drivers/firmware/smccc/kvm_guest.c

86edf6bdcf0571 Shameer Kolothum 2025-02-21   57  
44ff44cadbd144 Shameer Kolothum 2025-03-06   58  #ifdef CONFIG_ARM64
86edf6bdcf0571 Shameer Kolothum 2025-02-21   59  void  __init kvm_arm_target_impl_cpu_init(void)
86edf6bdcf0571 Shameer Kolothum 2025-02-21   60  {
86edf6bdcf0571 Shameer Kolothum 2025-02-21   61  	int i;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   62  	u32 ver;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   63  	u64 max_cpus;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   64  	struct arm_smccc_res res;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   65  	struct target_impl_cpu *target;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   66  
86edf6bdcf0571 Shameer Kolothum 2025-02-21   67  	if (!kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER) ||
86edf6bdcf0571 Shameer Kolothum 2025-02-21   68  	    !kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS))
86edf6bdcf0571 Shameer Kolothum 2025-02-21   69  		return;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   70  
86edf6bdcf0571 Shameer Kolothum 2025-02-21   71  	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID,
86edf6bdcf0571 Shameer Kolothum 2025-02-21   72  			     0, &res);
86edf6bdcf0571 Shameer Kolothum 2025-02-21   73  	if (res.a0 != SMCCC_RET_SUCCESS)
86edf6bdcf0571 Shameer Kolothum 2025-02-21   74  		return;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   75  
86edf6bdcf0571 Shameer Kolothum 2025-02-21   76  	/* Version info is in lower 32 bits and is in SMMCCC_VERSION format */
86edf6bdcf0571 Shameer Kolothum 2025-02-21   77  	ver = lower_32_bits(res.a1);
86edf6bdcf0571 Shameer Kolothum 2025-02-21   78  	if (PSCI_VERSION_MAJOR(ver) != 1) {
86edf6bdcf0571 Shameer Kolothum 2025-02-21   79  		pr_warn("Unsupported target CPU implementation version v%d.%d\n",
86edf6bdcf0571 Shameer Kolothum 2025-02-21   80  			PSCI_VERSION_MAJOR(ver), PSCI_VERSION_MINOR(ver));
86edf6bdcf0571 Shameer Kolothum 2025-02-21   81  		return;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   82  	}
86edf6bdcf0571 Shameer Kolothum 2025-02-21   83  
86edf6bdcf0571 Shameer Kolothum 2025-02-21   84  	if (!res.a2) {
86edf6bdcf0571 Shameer Kolothum 2025-02-21   85  		pr_warn("No target implementation CPUs specified\n");
86edf6bdcf0571 Shameer Kolothum 2025-02-21   86  		return;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   87  	}
86edf6bdcf0571 Shameer Kolothum 2025-02-21   88  
86edf6bdcf0571 Shameer Kolothum 2025-02-21   89  	max_cpus = res.a2;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   90  	target = memblock_alloc(sizeof(*target) * max_cpus,  __alignof__(*target));
86edf6bdcf0571 Shameer Kolothum 2025-02-21   91  	if (!target) {
86edf6bdcf0571 Shameer Kolothum 2025-02-21   92  		pr_warn("Not enough memory for struct target_impl_cpu\n");
86edf6bdcf0571 Shameer Kolothum 2025-02-21   93  		return;
86edf6bdcf0571 Shameer Kolothum 2025-02-21   94  	}
86edf6bdcf0571 Shameer Kolothum 2025-02-21   95  
86edf6bdcf0571 Shameer Kolothum 2025-02-21   96  	for (i = 0; i < max_cpus; i++) {
86edf6bdcf0571 Shameer Kolothum 2025-02-21   97  		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID,
86edf6bdcf0571 Shameer Kolothum 2025-02-21   98  				     i, &res);
86edf6bdcf0571 Shameer Kolothum 2025-02-21   99  		if (res.a0 != SMCCC_RET_SUCCESS) {
86edf6bdcf0571 Shameer Kolothum 2025-02-21  100  			pr_warn("Discovering target implementation CPUs failed\n");
86edf6bdcf0571 Shameer Kolothum 2025-02-21  101  			goto mem_free;
86edf6bdcf0571 Shameer Kolothum 2025-02-21  102  		}
86edf6bdcf0571 Shameer Kolothum 2025-02-21  103  		target[i].midr = res.a1;
86edf6bdcf0571 Shameer Kolothum 2025-02-21  104  		target[i].revidr = res.a2;
86edf6bdcf0571 Shameer Kolothum 2025-02-21  105  		target[i].aidr = res.a3;
86edf6bdcf0571 Shameer Kolothum 2025-02-21 @106  	};

:::::: The code at line 106 was first introduced by commit
:::::: 86edf6bdcf0571c07103b8751e9d792a4b808e97 smccc/kvm_guest: Enable errata based on implementation CPUs

:::::: TO: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
