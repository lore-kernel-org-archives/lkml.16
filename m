Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916F61F94A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 02:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746671769; cv=none; b=tlIckGJoWH5XmEaNZv6WoUFuSCQj/0O7DEwF58qiYXSzsLzlGC4g57e9/el58pQ+MapQa1/M32L1VA4XBdKJu6SGeefj1Z3VvqdecL3R6OcDkOgWAga3kP5ORUIOJv9UFXfT75mhR4moaNVyntSsb965/jwmGuRbJP1IvSxW4eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746671769; c=relaxed/simple;
	bh=AnPrlFrt1FLzJRQQ0wNOS7LpOlvSxbA1k2P65mxKSx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qVSkluO6fOrmtErRLK5BmevS3BmsYF0ZzpoQCFsWqW61HNHn1Eco6+5RGfgQnRh1hHtQJrxq5jLQcW8Ae7gsdzfmyu2DTQWsfg2vGXwfvnIWZYI8eR6GgF4tP9MNNEGVkv59LZtWFShjZWJHUIHqQLTe6NueyxAQgVOfgY1JmL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3Bj1SGE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3Bj1SGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746671767; x=1778207767;
  h=date:from:to:cc:subject:message-id;
  bh=AnPrlFrt1FLzJRQQ0wNOS7LpOlvSxbA1k2P65mxKSx8=;
  b=E3Bj1SGEjVHG0sPcHT47Y1YbZ5wv5x+zTJDjkkN4UFLMah7l9gLbg/pl
   MXhxrC2yMxeHXJwCIRwU4dEh550RCjAlz/TdqfCcHmVsKzeFQZZfiIgUd
   9RmZ7ULUQEblPIyHHvlzlF1p8UJLg18Q6akKNmYGaEVJiRRLQyL50oVGX
   jtMQuYLpH1uY9sezCTkylKZUEDuWmFVwYIgbzS/aojsFkEfxDH+mEmxjb
   pSifsiSYMGST+ettLI4WJ4zCZS8yKkBCbTDxK2dVQJeML0niZg/WxFIhw
   SLLLpWZ3Me7LBQ/B9DoD3DfOdCYITmTvkKh1A/IqmJPxBkcsHJUwm2nUX
   w==;
X-CSE-ConnectionGUID: GuViTIRHQbCnaa1iBkExJw==
X-CSE-MsgGUID: fPIcwb+6TuCvNCxgMTBP7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48580828"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48580828"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 19:36:07 -0700
X-CSE-ConnectionGUID: Q0v7+ItlRAixMMoYbfO7kA==
X-CSE-MsgGUID: dba/wuuiRMqWMsjMPoA4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="140188461"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 19:36:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCr7D-0009SX-3A;
	Thu, 08 May 2025 02:36:03 +0000
Date: Thu, 08 May 2025 10:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/mm] BUILD SUCCESS
 1b3f2bd04d90f61e1f291b5e365b9bc4ce0ea7c7
Message-ID: <202505081015.Yrfip7qx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: 1b3f2bd04d90f61e1f291b5e365b9bc4ce0ea7c7  x86/devmem: Remove duplicate range_is_allowed() definition

elapsed time: 9166m

configs tested: 123
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250502    gcc-14.2.0
arc                   randconfig-002-20250502    gcc-12.4.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250502    gcc-8.5.0
arm                   randconfig-002-20250502    gcc-7.5.0
arm                   randconfig-003-20250502    gcc-7.5.0
arm                   randconfig-004-20250502    clang-20
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250502    clang-21
arm64                 randconfig-002-20250502    gcc-8.5.0
arm64                 randconfig-003-20250502    gcc-8.5.0
arm64                 randconfig-004-20250502    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250502    gcc-12.4.0
csky                  randconfig-002-20250502    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250502    clang-21
hexagon               randconfig-002-20250502    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-005-20250502    gcc-12
i386        buildonly-randconfig-006-20250502    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250502    gcc-14.2.0
loongarch             randconfig-002-20250502    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250502    gcc-14.2.0
nios2                 randconfig-002-20250502    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250502    gcc-5.5.0
parisc                randconfig-002-20250502    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250502    clang-21
powerpc               randconfig-002-20250502    clang-19
powerpc               randconfig-003-20250502    clang-21
powerpc                     sequoia_defconfig    clang-17
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250502    clang-21
powerpc64             randconfig-002-20250502    clang-17
powerpc64             randconfig-003-20250502    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250502    clang-19
riscv                 randconfig-002-20250502    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250502    clang-21
s390                  randconfig-002-20250502    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250502    gcc-14.2.0
sh                    randconfig-002-20250502    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250502    gcc-10.3.0
sparc                 randconfig-002-20250502    gcc-11.5.0
sparc64               randconfig-001-20250502    gcc-5.5.0
sparc64               randconfig-002-20250502    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250502    clang-21
um                    randconfig-002-20250502    gcc-11
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250502    gcc-12
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-005-20250502    gcc-12
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-002-20250502    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
