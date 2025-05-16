Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437A28003D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432173; cv=none; b=jzvibdBPeF2FZuP8BculUVxrgtZNuBHbGOfh62WNFz+IFKtcNQuDBRqoN+4dZrUvyknqpfWfy1epUsACMYQXM8lpdIaRvxZa9Fhg9RoYFdXdRKQ0lBWJI0+r9XBo8S1SNDkuxuoYWbduozvh7pp4cZPqQylmZ1clP42VjuYh6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432173; c=relaxed/simple;
	bh=GvpkEhpRTLIjQS49G3VxWw17YTQzaPvFFVdofxESMD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e16HP2+WZtQaVch5SU69bYr9t3nOgQTo/NzAQbepDVpx7l72ddoyEKBFu1tPDvK5cIZe+rFJHPm+U383floWqCt40RBOQZ6uC5lB/Hn2eAusyQomXCMrA6FUs8t6DHwrNqBd/07g4lXpp/BInLjQWwP6klGbNZE6wj9GP1WqfrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtYP4xO8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtYP4xO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747432172; x=1778968172;
  h=date:from:to:cc:subject:message-id;
  bh=GvpkEhpRTLIjQS49G3VxWw17YTQzaPvFFVdofxESMD8=;
  b=KtYP4xO8AWXbx+AaehPyvoyw0d/rg3jWp0Ql7GUZ7OotJx4n7qTJ/vjF
   QNfd1TYB9Hz9HswO4TP2ugxoAWrV63kjU0ntc86ARINAfkfF+W2tfkCoz
   X/RYZjiZH2iLyQN2iNKKeGyGHonQukGcA9wGF9qGkdHloTbsgjr2Wv32o
   R2iZJZxIBTdIjnznvS3NrL05xRYXzL32AERhLeiJxeMqk/ISlVitvVZ2L
   CCSfsdxpLsAfFcZMRzvKJQBvg5NgoZkc5NwW+RiBaZV3UZsGUNK2Wa5lE
   sGXiLXtGyG8s0bKwcqPRayYn+PTKI/JWEYj91K694O7pOxVebDaDMNTUA
   A==;
X-CSE-ConnectionGUID: T4WtRhjnTLGh+0Tz/05v6A==
X-CSE-MsgGUID: LFHo7BelSN6wiRIP3mqqKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49114767"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49114767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 14:49:31 -0700
X-CSE-ConnectionGUID: GlTDw8nfQ/yrzo05aUv1dQ==
X-CSE-MsgGUID: 5MKJ/SWkRXmoK/OfFQuIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="139208417"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 May 2025 14:49:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG2vn-000Jjv-2o;
	Fri, 16 May 2025 21:49:27 +0000
Date: Sat, 17 May 2025 05:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/futex] BUILD SUCCESS
 bd59f6170968314c82e2b65f8bbaec55896b7a5f
Message-ID: <202505170523.gUDn7fgI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/futex
branch HEAD: bd59f6170968314c82e2b65f8bbaec55896b7a5f  futex: Fix kernel-doc comments

elapsed time: 848m

configs tested: 257
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-21
arc                 nsimosci_hs_smp_defconfig    clang-21
arc                   randconfig-001-20250516    gcc-13.3.0
arc                   randconfig-001-20250517    gcc-8.5.0
arc                   randconfig-002-20250516    gcc-13.3.0
arc                   randconfig-002-20250517    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                         assabet_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                          pxa910_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250516    gcc-7.5.0
arm                   randconfig-001-20250517    gcc-8.5.0
arm                   randconfig-002-20250516    clang-21
arm                   randconfig-002-20250517    gcc-8.5.0
arm                   randconfig-003-20250516    clang-21
arm                   randconfig-003-20250517    gcc-8.5.0
arm                   randconfig-004-20250516    clang-21
arm                   randconfig-004-20250517    gcc-8.5.0
arm                        realview_defconfig    clang-21
arm                         wpcm450_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250516    gcc-9.5.0
arm64                 randconfig-001-20250517    gcc-8.5.0
arm64                 randconfig-002-20250516    gcc-9.5.0
arm64                 randconfig-002-20250517    gcc-8.5.0
arm64                 randconfig-003-20250516    gcc-5.5.0
arm64                 randconfig-003-20250517    gcc-8.5.0
arm64                 randconfig-004-20250516    gcc-9.5.0
arm64                 randconfig-004-20250517    gcc-8.5.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250516    gcc-14.2.0
csky                  randconfig-001-20250517    clang-21
csky                  randconfig-002-20250516    gcc-14.2.0
csky                  randconfig-002-20250517    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250516    clang-19
hexagon               randconfig-001-20250517    clang-21
hexagon               randconfig-002-20250516    clang-21
hexagon               randconfig-002-20250517    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250516    clang-20
i386        buildonly-randconfig-001-20250517    clang-20
i386        buildonly-randconfig-002-20250516    gcc-12
i386        buildonly-randconfig-002-20250517    clang-20
i386        buildonly-randconfig-003-20250516    clang-20
i386        buildonly-randconfig-003-20250517    clang-20
i386        buildonly-randconfig-004-20250516    clang-20
i386        buildonly-randconfig-004-20250517    clang-20
i386        buildonly-randconfig-005-20250516    clang-20
i386        buildonly-randconfig-005-20250517    clang-20
i386        buildonly-randconfig-006-20250516    gcc-12
i386        buildonly-randconfig-006-20250517    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250517    clang-20
i386                  randconfig-002-20250517    clang-20
i386                  randconfig-003-20250517    clang-20
i386                  randconfig-004-20250517    clang-20
i386                  randconfig-005-20250517    clang-20
i386                  randconfig-006-20250517    clang-20
i386                  randconfig-007-20250517    clang-20
i386                  randconfig-011-20250517    gcc-12
i386                  randconfig-012-20250517    gcc-12
i386                  randconfig-013-20250517    gcc-12
i386                  randconfig-014-20250517    gcc-12
i386                  randconfig-015-20250517    gcc-12
i386                  randconfig-016-20250517    gcc-12
i386                  randconfig-017-20250517    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250516    gcc-14.2.0
loongarch             randconfig-001-20250517    clang-21
loongarch             randconfig-002-20250516    gcc-14.2.0
loongarch             randconfig-002-20250517    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                          atari_defconfig    clang-21
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-21
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-21
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250516    gcc-13.3.0
nios2                 randconfig-001-20250517    clang-21
nios2                 randconfig-002-20250516    gcc-13.3.0
nios2                 randconfig-002-20250517    clang-21
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250516    gcc-10.5.0
parisc                randconfig-001-20250517    clang-21
parisc                randconfig-002-20250516    gcc-12.4.0
parisc                randconfig-002-20250517    clang-21
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250516    gcc-5.5.0
powerpc               randconfig-001-20250517    clang-21
powerpc               randconfig-002-20250516    gcc-5.5.0
powerpc               randconfig-002-20250517    clang-21
powerpc               randconfig-003-20250516    clang-17
powerpc               randconfig-003-20250517    clang-21
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-21
powerpc64             randconfig-001-20250516    clang-21
powerpc64             randconfig-001-20250517    clang-21
powerpc64             randconfig-002-20250516    clang-21
powerpc64             randconfig-002-20250517    clang-21
powerpc64             randconfig-003-20250516    clang-21
powerpc64             randconfig-003-20250517    clang-21
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250516    gcc-7.5.0
riscv                 randconfig-001-20250517    gcc-9.3.0
riscv                 randconfig-002-20250516    gcc-14.2.0
riscv                 randconfig-002-20250517    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250516    gcc-7.5.0
s390                  randconfig-001-20250517    gcc-9.3.0
s390                  randconfig-002-20250516    gcc-7.5.0
s390                  randconfig-002-20250517    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-21
sh                    randconfig-001-20250516    gcc-7.5.0
sh                    randconfig-001-20250517    gcc-9.3.0
sh                    randconfig-002-20250516    gcc-9.3.0
sh                    randconfig-002-20250517    gcc-9.3.0
sh                   sh7770_generic_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250516    gcc-8.5.0
sparc                 randconfig-001-20250517    gcc-9.3.0
sparc                 randconfig-002-20250516    gcc-8.5.0
sparc                 randconfig-002-20250517    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250516    gcc-12.4.0
sparc64               randconfig-001-20250517    gcc-9.3.0
sparc64               randconfig-002-20250516    gcc-14.2.0
sparc64               randconfig-002-20250517    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250516    clang-21
um                    randconfig-001-20250517    gcc-9.3.0
um                    randconfig-002-20250516    gcc-12
um                    randconfig-002-20250517    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250516    clang-20
x86_64      buildonly-randconfig-001-20250517    clang-20
x86_64      buildonly-randconfig-002-20250516    gcc-12
x86_64      buildonly-randconfig-002-20250517    clang-20
x86_64      buildonly-randconfig-003-20250516    clang-20
x86_64      buildonly-randconfig-003-20250517    clang-20
x86_64      buildonly-randconfig-004-20250516    clang-20
x86_64      buildonly-randconfig-004-20250517    clang-20
x86_64      buildonly-randconfig-005-20250516    gcc-12
x86_64      buildonly-randconfig-005-20250517    clang-20
x86_64      buildonly-randconfig-006-20250516    gcc-12
x86_64      buildonly-randconfig-006-20250517    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250517    gcc-11
x86_64                randconfig-002-20250517    gcc-11
x86_64                randconfig-003-20250517    gcc-11
x86_64                randconfig-004-20250517    gcc-11
x86_64                randconfig-005-20250517    gcc-11
x86_64                randconfig-006-20250517    gcc-11
x86_64                randconfig-007-20250517    gcc-11
x86_64                randconfig-008-20250517    gcc-11
x86_64                randconfig-071-20250517    gcc-12
x86_64                randconfig-072-20250517    gcc-12
x86_64                randconfig-073-20250517    gcc-12
x86_64                randconfig-074-20250517    gcc-12
x86_64                randconfig-075-20250517    gcc-12
x86_64                randconfig-076-20250517    gcc-12
x86_64                randconfig-077-20250517    gcc-12
x86_64                randconfig-078-20250517    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250516    gcc-10.5.0
xtensa                randconfig-001-20250517    gcc-9.3.0
xtensa                randconfig-002-20250516    gcc-10.5.0
xtensa                randconfig-002-20250517    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
