Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A901C9EB1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410422; cv=none; b=UjJH22zWsML2i0knVXgyYzCRD6Ecf5ScfOg6ZZrDkDAQS764WShP3o6JXPy5i+BnaUmCATyuxsVR+7HijGNcyAELLji/GES4q+A/2VvbYRUmcmb+dPluKUtFdJtP9ECMksSgjuBC0bQPwJsII+GSAfp3YUYU2PdDP+3++b9TMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410422; c=relaxed/simple;
	bh=nmhS93iQfv+SuiAHlPs6AQ3FSQE+GTy2dP4BfRI4aoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JPm8vIIUqCnWntPfv/wxEAfS8RFvLvZ9aAosgvXvD6UiIQR9LoFNnsMCp8EQy40IuPZ0eQ/Hg5wGIGDsF10U/QMm2H9jzzRw4uMDHKZPsd6lyPQKMRk7QdTYdAGxt+xG5RA1CQ10opT480aZGDyt3IfseyzZ8SBGlkjsTRUK8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKw6Fqsl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKw6Fqsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747410421; x=1778946421;
  h=date:from:to:cc:subject:message-id;
  bh=nmhS93iQfv+SuiAHlPs6AQ3FSQE+GTy2dP4BfRI4aoA=;
  b=fKw6FqslvrCRVRWQtyM+EsqCKw8MN3X1Se36Oq7o/OHiH8n0gxjP9r0C
   wuHMcc6vrUTtytM4L/Yh7bc9pPR6rUmTl/+lGNutNVKID1AfhyzEUr+U0
   mFmgb1eRMtwKsMOGOcs4f8t1dQs7rydb174j2dPwg3Lxq7lNUk0zMNP6I
   4KJ8ev2khoPtP+goBAq11SOdVWpO+gzB0CUjStAQIQ7XiQnpABPIZdmGv
   VQgzMuRCavmg82NopXF0rpL3CzyvVS2k/C2mYQCJsjofJpN26s722zXIL
   h0BgeOkfuwSBo3wJjCCnOCY1j5dMNObYQn3CZCzmK3RkdFBsoXKgatOs7
   A==;
X-CSE-ConnectionGUID: ty6fZ147Sp67xYVyUUxCEw==
X-CSE-MsgGUID: Vs4ESDOoQ9uc/Qn/qU2ujA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60023726"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="60023726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:46:59 -0700
X-CSE-ConnectionGUID: MMQpJq2KRza6dgcMiX1VxA==
X-CSE-MsgGUID: aZ0yy0qNQEOvJhuPgNu91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="138623396"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2025 08:46:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFxGy-000JTj-0A;
	Fri, 16 May 2025 15:46:56 +0000
Date: Fri, 16 May 2025 23:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/urgent] BUILD SUCCESS
 08fb624802d8786253994d8ebdbbcdaa186f04f5
Message-ID: <202505162345.J6a0hLv7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 08fb624802d8786253994d8ebdbbcdaa186f04f5  irqchip/riscv-imsic: Start local sync timer on correct CPU

elapsed time: 1453m

configs tested: 125
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250516    gcc-13.3.0
arc                   randconfig-002-20250516    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250516    gcc-7.5.0
arm                   randconfig-002-20250516    clang-21
arm                   randconfig-003-20250516    clang-21
arm                   randconfig-004-20250516    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250516    gcc-9.5.0
arm64                 randconfig-002-20250516    gcc-9.5.0
arm64                 randconfig-003-20250516    gcc-5.5.0
arm64                 randconfig-004-20250516    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250516    gcc-14.2.0
csky                  randconfig-002-20250516    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250516    clang-19
hexagon               randconfig-002-20250516    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250516    clang-20
i386        buildonly-randconfig-002-20250516    gcc-12
i386        buildonly-randconfig-003-20250516    clang-20
i386        buildonly-randconfig-004-20250516    clang-20
i386        buildonly-randconfig-005-20250516    clang-20
i386        buildonly-randconfig-006-20250516    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250516    gcc-14.2.0
loongarch             randconfig-002-20250516    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip28_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250516    gcc-13.3.0
nios2                 randconfig-002-20250516    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250516    gcc-10.5.0
parisc                randconfig-002-20250516    gcc-12.4.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      bamboo_defconfig    clang-21
powerpc                     mpc83xx_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250516    gcc-5.5.0
powerpc               randconfig-002-20250516    gcc-5.5.0
powerpc               randconfig-003-20250516    clang-17
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250516    clang-21
powerpc64             randconfig-002-20250516    clang-21
powerpc64             randconfig-003-20250516    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250516    gcc-7.5.0
riscv                 randconfig-002-20250516    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250516    gcc-7.5.0
s390                  randconfig-002-20250516    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250516    gcc-7.5.0
sh                    randconfig-002-20250516    gcc-9.3.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250516    gcc-8.5.0
sparc                 randconfig-002-20250516    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250516    gcc-12.4.0
sparc64               randconfig-002-20250516    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250516    clang-21
um                    randconfig-002-20250516    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250516    clang-20
x86_64      buildonly-randconfig-002-20250516    gcc-12
x86_64      buildonly-randconfig-003-20250516    clang-20
x86_64      buildonly-randconfig-004-20250516    clang-20
x86_64      buildonly-randconfig-005-20250516    gcc-12
x86_64      buildonly-randconfig-006-20250516    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250516    gcc-10.5.0
xtensa                randconfig-002-20250516    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
