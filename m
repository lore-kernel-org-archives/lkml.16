Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29155214813
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484231; cv=none; b=MfO35cHbZkUM3k88FCPg2xMqeIJZP05NymKSuybqjAqBgWSBAmQM3KTnHHoJZDl3ouoDiT8AGQA3Jzy6O+bcZ69G0V86Rt/A34wbw0Wr+MMO+P9XSY+WbMq/daJMtyrzIDwTK/hQzHjS1bqDB8bcCZCQ0g3JmyKQvMPKw7/2xM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484231; c=relaxed/simple;
	bh=phVtzs7L8M16+72d4xKyFz0MnNds0C68edTWcJz7ZpY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u3nCHrvguo/0mZ5FcbipQGHPY16xMipFHchh5meHSLwNQdHGsYvj9gkOUbj5xgkjeCP4cDS7AQVhrQBB0xdOqD7ur9o1qsNR8611bnTeTj7xWFRcWrwwdxODGjM1DYCQywIVvHgXOO6o3+CCoJeWczwCZVzcE9HXzQXwTPDDa4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKUHKAO3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKUHKAO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745484230; x=1777020230;
  h=date:from:to:cc:subject:message-id;
  bh=phVtzs7L8M16+72d4xKyFz0MnNds0C68edTWcJz7ZpY=;
  b=SKUHKAO3SBryuD5aC2PiFDLifa2lHwx6JT4+8FdlyLW+mz2Exo8IJus2
   u/Sa/mqAa9532u8q0GwLt0c8p4l+A7n7XEJGe8D1HSt2BRAM5u57+YeEi
   TQi5x5u0ppiOVU0IXbnuctT8Z25HKazLpA/EaKxGQKs8wODYKBqvcM460
   YdKZ89SqtHGr0mtOOLD3pB/0aJdnBoytHpCmdRgJYdkORr7GPf2XXRlA9
   wkpiVn9harOY3+sVdx38izIF+PeLIp2zgQiXY/F7dLsuogjtdR0PvWJiA
   tYVNidR4JSsPavmY/UjQH7HJ9DVHoEqLVqhykLdWHJEgVb8nFrliMGoyh
   w==;
X-CSE-ConnectionGUID: kg7olFWKT02kt8DVKZ3Kvw==
X-CSE-MsgGUID: zmnK4fGSRxu4+QhZDozdUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57302254"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="57302254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 01:43:49 -0700
X-CSE-ConnectionGUID: 3dKHiDrhTWi2Wt1hcw97kA==
X-CSE-MsgGUID: sBnsSPTHR8SQKPEJG3mUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132439768"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2025 01:43:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7sBO-0003zi-0o;
	Thu, 24 Apr 2025 08:43:46 +0000
Date: Thu, 24 Apr 2025 16:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/boot] BUILD SUCCESS
 121c335b36e02d6aefb72501186e060474fdf33c
Message-ID: <202504241622.Gc4OH15k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: 121c335b36e02d6aefb72501186e060474fdf33c  x86/boot: Disable jump tables in PIC code

elapsed time: 1448m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250423    gcc-14.2.0
arc                   randconfig-002-20250423    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250423    gcc-10.5.0
arm                   randconfig-002-20250423    gcc-10.5.0
arm                   randconfig-003-20250423    gcc-7.5.0
arm                   randconfig-004-20250423    clang-21
arm                         socfpga_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250423    gcc-5.5.0
arm64                 randconfig-002-20250423    gcc-7.5.0
arm64                 randconfig-003-20250423    clang-17
arm64                 randconfig-004-20250423    gcc-7.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250423    gcc-13.3.0
csky                  randconfig-002-20250423    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250423    clang-21
hexagon               randconfig-002-20250423    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250423    gcc-12
i386        buildonly-randconfig-002-20250423    clang-20
i386        buildonly-randconfig-003-20250423    clang-20
i386        buildonly-randconfig-004-20250423    clang-20
i386        buildonly-randconfig-005-20250423    gcc-12
i386        buildonly-randconfig-006-20250423    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250423    gcc-14.2.0
loongarch             randconfig-002-20250423    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250423    gcc-11.5.0
nios2                 randconfig-002-20250423    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250423    gcc-12.4.0
parisc                randconfig-002-20250423    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                      pmac32_defconfig    clang-21
powerpc                      ppc44x_defconfig    clang-21
powerpc               randconfig-001-20250423    gcc-9.3.0
powerpc               randconfig-002-20250423    clang-21
powerpc               randconfig-003-20250423    gcc-9.3.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250423    gcc-5.5.0
powerpc64             randconfig-002-20250423    gcc-7.5.0
powerpc64             randconfig-003-20250423    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250423    gcc-9.3.0
riscv                 randconfig-002-20250423    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250423    clang-21
s390                  randconfig-002-20250423    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20250423    gcc-7.5.0
sh                    randconfig-002-20250423    gcc-13.3.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250423    gcc-6.5.0
sparc                 randconfig-002-20250423    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250423    gcc-12.4.0
sparc64               randconfig-002-20250423    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250423    clang-21
um                    randconfig-002-20250423    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250423    gcc-12
x86_64      buildonly-randconfig-002-20250423    gcc-12
x86_64      buildonly-randconfig-003-20250423    gcc-12
x86_64      buildonly-randconfig-004-20250423    clang-20
x86_64      buildonly-randconfig-005-20250423    gcc-12
x86_64      buildonly-randconfig-006-20250423    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250423    gcc-8.5.0
xtensa                randconfig-002-20250423    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
