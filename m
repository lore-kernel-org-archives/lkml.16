Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1101C2C9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307854; cv=none; b=mJ4YD9EIWfTIa1Qi3rRK3fT37ZvnetjDIukK4vBSLGel6OtaBJQsCZFjq/Say2wXiVKXd4uQrVjEfKnQ/lpH1PpY+UjZqe2If5M2edrwb2TarDzx0VjQtXbbeIVx6uxMVQSB9FGpNICPvesHSmt9kUUN4JfIO6ZRpiWrxiMj5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307854; c=relaxed/simple;
	bh=Dcblf3rP0VSvMo8m6duc6axe6PdbXnCW8pPpIQCirQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EaLNuBPSWDFEcWdHDblWRqbN6+5oROBEqJmsgia96//Uh0y/jtZO7LYGyys/FwkYy/oWZP+aOUt4+yRR6UXxX70+HIWjq3gZElzEsH3X3M+Wcb3aV7JK98Rme+LGVeyixn57jvcyvG1P/vKk3vX64WtGgce0XqOIrHmab3c8Wi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dmn9GImV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dmn9GImV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747307853; x=1778843853;
  h=date:from:to:cc:subject:message-id;
  bh=Dcblf3rP0VSvMo8m6duc6axe6PdbXnCW8pPpIQCirQY=;
  b=Dmn9GImVkEIP0iF1oxEzbpgJOGgJPjEkMpZ23sk6tUJFSquHPLV6b5v3
   SehHQl6/Eug0m7p5DpwuyHUCx9vrQs0gZxgc1Amz6rLBDKia1TrzCPvKx
   3XXNgMiTKIwwMGSrPxnL0S6jDrPGbhYvRMiOUj/Req98jxBoEJrUOk/ZE
   bjg8twd7kIaxXgof2SNu+pwn6l1g6NyoaqkizRHM+EZ0Nt+pPt/kGlfy+
   4UFjtAFQ4ZdDEWKQxaDTOctlt4dtCFPkHvCutQ4R7trzoej93koL6hnr0
   e2OmIULCS72l6EP2yxIXNWyS/IuaKwFEsNEZYHFlGkdkGQHfiRdP4hPYS
   w==;
X-CSE-ConnectionGUID: hjovG3oCR6KlcKi2Sj7lYA==
X-CSE-MsgGUID: YVcrmMA9QDeS/jz4l/gLOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36855852"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="36855852"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:17:32 -0700
X-CSE-ConnectionGUID: WgZCSrGNQbaENVMzdFfbUg==
X-CSE-MsgGUID: 0sHAVgdQSciGEY0Ka0ozfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143542131"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2025 04:17:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFWae-000IJN-30;
	Thu, 15 May 2025 11:17:28 +0000
Date: Thu, 15 May 2025 19:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/core] BUILD SUCCESS WITH WARNING
 58eb5721a445ea0af310d1410d7117a1910627bc
Message-ID: <202505151934.tuMwr7bw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
branch HEAD: 58eb5721a445ea0af310d1410d7117a1910627bc  genirq/manage: Use the correct lock guard in irq_set_irq_wake()

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202505151057.xbyXAbEn-lkp@intel.com

    kernel/irq/debugfs.c:233:26: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-123-20250515
    `-- kernel-irq-debugfs.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination

elapsed time: 1461m

configs tested: 124
configs skipped: 8

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250514    gcc-13.3.0
arc                   randconfig-002-20250514    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                        multi_v7_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250514    clang-21
arm                   randconfig-002-20250514    clang-21
arm                   randconfig-003-20250514    gcc-7.5.0
arm                   randconfig-004-20250514    gcc-7.5.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250514    clang-17
arm64                 randconfig-002-20250514    gcc-5.5.0
arm64                 randconfig-003-20250514    gcc-5.5.0
arm64                 randconfig-004-20250514    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250514    gcc-13.3.0
csky                  randconfig-002-20250514    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250514    clang-21
hexagon               randconfig-002-20250514    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250514    clang-20
i386        buildonly-randconfig-002-20250514    gcc-12
i386        buildonly-randconfig-003-20250514    clang-20
i386        buildonly-randconfig-004-20250514    clang-20
i386        buildonly-randconfig-006-20250514    gcc-12
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250514    gcc-14.2.0
loongarch             randconfig-002-20250514    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250514    gcc-7.5.0
nios2                 randconfig-002-20250514    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250514    gcc-12.4.0
parisc                randconfig-002-20250514    gcc-10.5.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250514    clang-17
powerpc               randconfig-002-20250514    gcc-5.5.0
powerpc               randconfig-003-20250514    gcc-7.5.0
powerpc64             randconfig-001-20250514    gcc-10.5.0
powerpc64             randconfig-002-20250514    clang-19
powerpc64             randconfig-003-20250514    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250514    gcc-7.5.0
riscv                 randconfig-002-20250514    gcc-14.2.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250514    clang-21
s390                  randconfig-002-20250514    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250514    gcc-11.5.0
sh                    randconfig-002-20250514    gcc-9.3.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250514    gcc-8.5.0
sparc                 randconfig-002-20250514    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250514    gcc-14.2.0
sparc64               randconfig-002-20250514    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250514    gcc-12
um                    randconfig-002-20250514    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250514    clang-20
x86_64      buildonly-randconfig-002-20250514    gcc-12
x86_64      buildonly-randconfig-003-20250514    gcc-12
x86_64      buildonly-randconfig-004-20250514    gcc-12
x86_64      buildonly-randconfig-005-20250514    clang-20
x86_64      buildonly-randconfig-006-20250514    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250514    gcc-10.5.0
xtensa                randconfig-002-20250514    gcc-12.4.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
