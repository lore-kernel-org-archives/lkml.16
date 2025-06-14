Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E11581F0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894745; cv=none; b=DXXHtA7j4UYJQ8uqjpPoC9MRz1wEt0C7CWx4aIRczT458LigYmTZtc+1oOPPQoNAmsH5GbRQUt7zclGV5jj4fza7OXCvpJfFQLh/btS1vgfSzGmrNc2zqIeWkMDA6v1oPsW08YEr+qFR2KDKIeQOn2/az53VzhTRAgTOA2LsLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894745; c=relaxed/simple;
	bh=s6NBoGtNqMPAR6AOUr8huK08zBITswD2estiTm/LZqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WbxOoA8Ac1WghdS6Xvt5UsmXPf/W9stPr9MR+ALS/qE5rrZkcR7siQ24bpIoRY8mwtuA0zPxi7sYhxUxeyyFfQGlDOIsvPBjYuR3xX9VDU49zc3tPjrrbCUFXLXS+80+YFrKnNpaHO0cX5Z3IrczeJGOe9Iy/baE8ioqaEWd5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDKADOZk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDKADOZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749894743; x=1781430743;
  h=date:from:to:cc:subject:message-id;
  bh=s6NBoGtNqMPAR6AOUr8huK08zBITswD2estiTm/LZqI=;
  b=nDKADOZkC36D2d6/0QkC4qOm2CzTTP5VC1y8TfaMErBIayZDpgdR6jGs
   9BDIko2O4nliGf3RXOZcq/taQvvJ8LQvf798jCK5iz6nfWdve3qD0zRpW
   upUuiJ0tRUJUSNNzzifeqAIONBIDskT98wZ6x4v1yYji1xB1rHzXOPJZj
   59DAyqxo/aDoXEO2hWnDtFH6+hLDpXrAlYfhpDhtYkAzoLmcv++OgojmV
   KOkeI6W36+19yk6xR8rBXjeL+wDHMHUOZcYGbV2Ft2G1viEetBSexZvqC
   lvsGl/C34f8DeNH87NLCkSqpBD4OmLXF6rkIDxn/jDm+hdt/Skl9WJCvA
   A==;
X-CSE-ConnectionGUID: pnZfsALNTiWz2tZU5o4vNQ==
X-CSE-MsgGUID: bNM3PsEiSNuAlpHnSHLsOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63514824"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63514824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 02:52:23 -0700
X-CSE-ConnectionGUID: Vg6VLA3CSxajw73RNPCy8w==
X-CSE-MsgGUID: P7DjEvxVR+eeqSnODkhFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148502328"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jun 2025 02:52:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQNYh-000DPP-0M;
	Sat, 14 Jun 2025 09:52:19 +0000
Date: Sat, 14 Jun 2025 17:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core/entry] BUILD SUCCESS
 b6a5a16b8b59476156dc6d6f73bffaf3a1707adb
Message-ID: <202506141715.92MuBJ7H-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
branch HEAD: b6a5a16b8b59476156dc6d6f73bffaf3a1707adb  selftests: Add tests for PR_SYS_DISPATCH_INCLUSIVE_ON

elapsed time: 986m

configs tested: 220
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250614    gcc-8.5.0
arc                   randconfig-002-20250614    gcc-12.4.0
arc                   randconfig-002-20250614    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250614    gcc-8.5.0
arm                   randconfig-002-20250614    clang-21
arm                   randconfig-002-20250614    gcc-8.5.0
arm                   randconfig-003-20250614    clang-16
arm                   randconfig-003-20250614    gcc-8.5.0
arm                   randconfig-004-20250614    clang-17
arm                   randconfig-004-20250614    gcc-8.5.0
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250614    clang-21
arm64                 randconfig-001-20250614    gcc-8.5.0
arm64                 randconfig-002-20250614    gcc-15.1.0
arm64                 randconfig-002-20250614    gcc-8.5.0
arm64                 randconfig-003-20250614    clang-21
arm64                 randconfig-003-20250614    gcc-8.5.0
arm64                 randconfig-004-20250614    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250614    clang-21
csky                  randconfig-001-20250614    gcc-13.3.0
csky                  randconfig-002-20250614    clang-21
csky                  randconfig-002-20250614    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250614    clang-21
hexagon               randconfig-002-20250614    clang-16
hexagon               randconfig-002-20250614    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250614    clang-20
i386        buildonly-randconfig-002-20250614    clang-20
i386        buildonly-randconfig-003-20250614    clang-20
i386        buildonly-randconfig-004-20250614    clang-20
i386        buildonly-randconfig-004-20250614    gcc-12
i386        buildonly-randconfig-005-20250614    clang-20
i386        buildonly-randconfig-006-20250614    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250614    clang-20
i386                  randconfig-002-20250614    clang-20
i386                  randconfig-003-20250614    clang-20
i386                  randconfig-004-20250614    clang-20
i386                  randconfig-005-20250614    clang-20
i386                  randconfig-006-20250614    clang-20
i386                  randconfig-007-20250614    clang-20
i386                  randconfig-011-20250614    clang-20
i386                  randconfig-012-20250614    clang-20
i386                  randconfig-013-20250614    clang-20
i386                  randconfig-014-20250614    clang-20
i386                  randconfig-015-20250614    clang-20
i386                  randconfig-016-20250614    clang-20
i386                  randconfig-017-20250614    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250614    clang-21
loongarch             randconfig-001-20250614    gcc-15.1.0
loongarch             randconfig-002-20250614    clang-21
loongarch             randconfig-002-20250614    gcc-15.1.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250614    clang-21
nios2                 randconfig-001-20250614    gcc-13.3.0
nios2                 randconfig-002-20250614    clang-21
nios2                 randconfig-002-20250614    gcc-11.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250614    clang-21
parisc                randconfig-001-20250614    gcc-8.5.0
parisc                randconfig-002-20250614    clang-21
parisc                randconfig-002-20250614    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250614    clang-21
powerpc               randconfig-001-20250614    gcc-13.3.0
powerpc               randconfig-002-20250614    clang-21
powerpc               randconfig-003-20250614    clang-21
powerpc               randconfig-003-20250614    gcc-12.4.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250614    clang-21
powerpc64             randconfig-001-20250614    gcc-11.5.0
powerpc64             randconfig-002-20250614    clang-21
powerpc64             randconfig-003-20250614    clang-21
powerpc64             randconfig-003-20250614    gcc-12.4.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250614    clang-21
riscv                 randconfig-001-20250614    gcc-14.3.0
riscv                 randconfig-002-20250614    gcc-14.3.0
riscv                 randconfig-002-20250614    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250614    clang-21
s390                  randconfig-001-20250614    gcc-14.3.0
s390                  randconfig-002-20250614    gcc-10.5.0
s390                  randconfig-002-20250614    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250614    gcc-14.3.0
sh                    randconfig-002-20250614    gcc-12.4.0
sh                    randconfig-002-20250614    gcc-14.3.0
sh                          rsk7269_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250614    gcc-14.3.0
sparc                 randconfig-001-20250614    gcc-15.1.0
sparc                 randconfig-002-20250614    gcc-10.3.0
sparc                 randconfig-002-20250614    gcc-14.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250614    gcc-14.3.0
sparc64               randconfig-001-20250614    gcc-8.5.0
sparc64               randconfig-002-20250614    gcc-14.3.0
sparc64               randconfig-002-20250614    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250614    clang-21
um                    randconfig-001-20250614    gcc-14.3.0
um                    randconfig-002-20250614    gcc-12
um                    randconfig-002-20250614    gcc-14.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250614    clang-20
x86_64      buildonly-randconfig-002-20250614    clang-20
x86_64      buildonly-randconfig-003-20250614    clang-20
x86_64      buildonly-randconfig-003-20250614    gcc-12
x86_64      buildonly-randconfig-004-20250614    clang-20
x86_64      buildonly-randconfig-005-20250614    clang-20
x86_64      buildonly-randconfig-006-20250614    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250614    clang-20
x86_64                randconfig-002-20250614    clang-20
x86_64                randconfig-003-20250614    clang-20
x86_64                randconfig-004-20250614    clang-20
x86_64                randconfig-005-20250614    clang-20
x86_64                randconfig-006-20250614    clang-20
x86_64                randconfig-007-20250614    clang-20
x86_64                randconfig-008-20250614    clang-20
x86_64                randconfig-071-20250614    clang-20
x86_64                randconfig-072-20250614    clang-20
x86_64                randconfig-073-20250614    clang-20
x86_64                randconfig-074-20250614    clang-20
x86_64                randconfig-075-20250614    clang-20
x86_64                randconfig-076-20250614    clang-20
x86_64                randconfig-077-20250614    clang-20
x86_64                randconfig-078-20250614    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250614    gcc-14.3.0
xtensa                randconfig-001-20250614    gcc-9.3.0
xtensa                randconfig-002-20250614    gcc-13.3.0
xtensa                randconfig-002-20250614    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
