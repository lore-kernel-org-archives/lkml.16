Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B08E2512DE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688313; cv=none; b=jAI8Sv4EjvgSnMW9fz3HLNWjlJuUTgoLruis6gEPqNEeWU0lRTA+27wdKDp1qxPTdCAe5DCxxFGA657IEMrjvJUTsL181YWTPk0i1l8giY7eBpPkVQPX1m3ZOsNqDKRuT9LtMsg/G3ICFYvHdcT1nh+7ybdtKTPkumvtBuD6Oh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688313; c=relaxed/simple;
	bh=iGpVZjmUMX0RfaMUsfu3n4YNfr73p2VaBaGKXJgmVWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iAUW/USz3BDiMKFTCMJMN1gztV3KME6p+T/C/Fj7vf3KI1RMYaybg0bIl0ymfRfnc5ITv4/GUNxv1SAw0uND84cxVQd/iUeo6dz1nLhuw64fbto3LBC1GFa11j8ClfQ8vsO7SFFWK3QCqNSmlpk2euS0tMCJwr5DKox0nyk491g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BP+uuzVd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BP+uuzVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750688311; x=1782224311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGpVZjmUMX0RfaMUsfu3n4YNfr73p2VaBaGKXJgmVWI=;
  b=BP+uuzVdC7hZ00A9KmCDuq44WlA/jd2fqkVIDg7W5p92rZXRbUa9CTzW
   v80LrbtzsVqgTMDjlYG/4PDeEW6PUwB7LvA+oZzBfdUa+4AAwrMlBxuES
   b9ly1P1kEYIvNF7i+jIVKP3MxE8pdzx2aS0pd703yNwT1xT4iUIri+IbW
   EH65egDSZj1gdfVG9JS/Qey7hpNAv93NxynyrFnKpS5zgr/WOMkQucQ1w
   jXWszk1gr/uyFqHsTAVL/fqFc3zh+A/MCXpQdDRiFtAclk/ygqGcvSWzT
   wlKCN6ScF/fwTXEi0JZFwVcrXs0ODrxLr7Tv9RSE+D7N6Jz16wkzxiR2P
   A==;
X-CSE-ConnectionGUID: j66/EOcMT+2+4kV60O5FHA==
X-CSE-MsgGUID: O6xiPWF3Ruq2e/eB2RQZfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="75430594"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="75430594"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:18:30 -0700
X-CSE-ConnectionGUID: MEJxLyWcTdefusaIHYJYDw==
X-CSE-MsgGUID: u/EE1Aa/S42Bd1d2lddT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152132332"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2025 07:18:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTi0A-000Ozm-0E;
	Mon, 23 Jun 2025 14:18:26 +0000
Date: Mon, 23 Jun 2025 22:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2048:12: warning: stack
 frame size (1184) exceeds limit (1024) in 'arm_smmu_atc_inv_master'
Message-ID: <202506232202.d7l6AowE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: 6de80d619203c672e5c011e8715bd965d27b69cf iommu/arm-smmu-v3: Add struct arm_smmu_impl_ops
date:   10 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250623/202506232202.d7l6AowE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232202.d7l6AowE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232202.d7l6AowE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:12:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2066:5: warning: stack frame size (1232) exceeds limit (1024) in 'arm_smmu_atc_inv_domain' [-Wframe-larger-than]
    2066 | int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2141:13: warning: stack frame size (1216) exceeds limit (1024) in '__arm_smmu_tlb_inv_range' [-Wframe-larger-than]
    2141 | static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1259:28: warning: stack frame size (1232) exceeds limit (1024) in 'arm_smmu_alloc_cd_ptr' [-Wframe-larger-than]
    1259 | static struct arm_smmu_cd *arm_smmu_alloc_cd_ptr(struct arm_smmu_master *master,
         |                            ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1320:13: warning: stack frame size (1184) exceeds limit (1024) in 'arm_smmu_cd_writer_sync_entry' [-Wframe-larger-than]
    1320 | static void arm_smmu_cd_writer_sync_entry(struct arm_smmu_entry_writer *writer)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2048:12: warning: stack frame size (1184) exceeds limit (1024) in 'arm_smmu_atc_inv_master' [-Wframe-larger-than]
    2048 | static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
         |            ^
   10 warnings generated.


vim +/arm_smmu_atc_inv_master +2048 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2047  
1d5f34f0002f9f drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jason Gunthorpe       2024-06-25 @2048  static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
1d5f34f0002f9f drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jason Gunthorpe       2024-06-25  2049  				   ioasid_t ssid)
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2050  {
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2051  	int i;
9e773aee8c3e1b drivers/iommu/arm-smmu-v3.c                 Rob Herring           2020-02-24  2052  	struct arm_smmu_cmdq_ent cmd;
93f9f7958f12a1 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei              2021-08-17  2053  	struct arm_smmu_cmdq_batch cmds;
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2054  
1d5f34f0002f9f drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jason Gunthorpe       2024-06-25  2055  	arm_smmu_atc_inv_to_cmd(ssid, 0, 0, &cmd);
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2056  
56ae8866f3b408 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Nicolin Chen          2024-08-29  2057  	arm_smmu_cmdq_batch_init(master->smmu, &cmds);
cdf315f907d46a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-04-01  2058  	for (i = 0; i < master->num_streams; i++) {
cdf315f907d46a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-04-01  2059  		cmd.atc.sid = master->streams[i].id;
eff19474b1bd60 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei              2021-08-11  2060  		arm_smmu_cmdq_batch_add(master->smmu, &cmds, &cmd);
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2061  	}
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2062  
eff19474b1bd60 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Zhen Lei              2021-08-11  2063  	return arm_smmu_cmdq_batch_submit(master->smmu, &cmds);
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2064  }
9ce27afc0830fc drivers/iommu/arm-smmu-v3.c                 Jean-Philippe Brucker 2019-04-17  2065  

:::::: The code at line 2048 was first introduced by commit
:::::: 1d5f34f0002f9f56d0ca153022cfdead07d45dc6 iommu/arm-smmu-v3: Thread SSID through the arm_smmu_attach_*() interface

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
