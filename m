Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E41DE4FF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749710365; cv=none; b=P2mKKafhTZAAGhQjfMT1kPXDB4b+AXrBC8qhYQDzZdKDa+FZZ9hrNUvorTB7PVWiBQyzpG3SDs2xMeHf4UunD8GCll5xothyPB/uuuezmd5scA6YRg7llIrp9omqwyDBbewWbcVQ2QRw2I7iTFRBGNQdROLkOCU20pYj+FNNMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749710365; c=relaxed/simple;
	bh=O/aSM65I8EqgJiBFH2soeGn6bu1Bk7fZ02i6I3Dvxyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pX7UVVNKTfoqX0bA4fTxyPH/PNcGMYEnLoCND+2QXIkVAf5fboWa7RA9qraCmeHwMZaWsaBiHjQe6TOvcvLTGEaM0XfjmhCQUMVm1mvIAxaKvbCY2sE/33nvxRbZ1gHDyiwRNrsyA2zFoSYBonarsARdYkH6pVVXXFFT9DbikDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jM+ULzAe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM+ULzAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749710364; x=1781246364;
  h=date:from:to:cc:subject:message-id;
  bh=O/aSM65I8EqgJiBFH2soeGn6bu1Bk7fZ02i6I3Dvxyc=;
  b=jM+ULzAe9VC2m/eTx9+0xM6Kut489WLIAf7PGKlk0q0QlSUzY7uATxhA
   k5EHcsxeOCms7vLJk0th9+t0cu1p/O1tDOajf9RD68Fjdc8g5+Q/wgyZU
   kl2+mBQNHjTQgsMkjO9nX1Ij8GzERoigPb6VQmKbqT/TTqlsWTtJCvHt/
   D2oNZ+y43V0RK4gvv4vxjFNVDDUUgGdyHyj7peAvLUNcGPs+UklMZFCsq
   jOI2cIxZfKB7wKyu7+39mO3M1zvWZQlibQb7luRFo6OZJeb9FVZzYyQep
   frcY7jUIoW/UYlC7lSQknzj8hEXoLfE+ROpEOJf+yX32TZADX8aMOeV5Z
   Q==;
X-CSE-ConnectionGUID: NwzKkEWcQbWNbi08c67cFg==
X-CSE-MsgGUID: 89WTE9hWQf6GdB2q/+Dx1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51865237"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51865237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:39:24 -0700
X-CSE-ConnectionGUID: i53Jt4jSQ6Ch2hNIP+BtVw==
X-CSE-MsgGUID: 6PqS3IX4RFi/GzoEMwHO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="152417757"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2025 23:39:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPbap-000BDA-1I;
	Thu, 12 Jun 2025 06:39:19 +0000
Date: Thu, 12 Jun 2025 14:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/core] BUILD SUCCESS
 b01f2d9597250e9c4011cb78d8d46287deaa6a69
Message-ID: <202506121430.9OOac40h-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
branch HEAD: b01f2d9597250e9c4011cb78d8d46287deaa6a69  sched/eevdf: Correct the comment in place_entity

elapsed time: 1268m

configs tested: 252
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-001-20250612    gcc-8.5.0
arc                   randconfig-002-20250611    gcc-8.5.0
arc                   randconfig-002-20250612    gcc-8.5.0
arc                        vdk_hs38_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-21
arm                         bcm2835_defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm                      footbridge_defconfig    clang-21
arm                         lpc18xx_defconfig    clang-21
arm                            mmp2_defconfig    clang-21
arm                        multi_v7_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250611    gcc-11.5.0
arm                   randconfig-001-20250612    gcc-8.5.0
arm                   randconfig-002-20250611    clang-21
arm                   randconfig-002-20250612    gcc-8.5.0
arm                   randconfig-003-20250611    gcc-13.3.0
arm                   randconfig-003-20250612    gcc-8.5.0
arm                   randconfig-004-20250611    gcc-13.3.0
arm                   randconfig-004-20250612    gcc-8.5.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250611    gcc-8.5.0
arm64                 randconfig-001-20250612    gcc-8.5.0
arm64                 randconfig-002-20250611    gcc-9.5.0
arm64                 randconfig-002-20250612    gcc-8.5.0
arm64                 randconfig-003-20250611    gcc-13.3.0
arm64                 randconfig-003-20250612    gcc-8.5.0
arm64                 randconfig-004-20250611    gcc-8.5.0
arm64                 randconfig-004-20250612    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-15.1.0
csky                  randconfig-001-20250612    gcc-10.5.0
csky                  randconfig-002-20250611    gcc-15.1.0
csky                  randconfig-002-20250612    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250611    clang-21
hexagon               randconfig-001-20250612    gcc-10.5.0
hexagon               randconfig-002-20250611    clang-21
hexagon               randconfig-002-20250612    gcc-10.5.0
i386                             alldefconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250611    gcc-12
i386        buildonly-randconfig-001-20250612    clang-20
i386        buildonly-randconfig-002-20250611    gcc-12
i386        buildonly-randconfig-002-20250612    clang-20
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-003-20250612    clang-20
i386        buildonly-randconfig-004-20250611    gcc-12
i386        buildonly-randconfig-004-20250612    clang-20
i386        buildonly-randconfig-005-20250611    gcc-11
i386        buildonly-randconfig-005-20250612    clang-20
i386        buildonly-randconfig-006-20250611    clang-20
i386        buildonly-randconfig-006-20250612    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250612    gcc-12
i386                  randconfig-002-20250612    gcc-12
i386                  randconfig-003-20250612    gcc-12
i386                  randconfig-004-20250612    gcc-12
i386                  randconfig-005-20250612    gcc-12
i386                  randconfig-006-20250612    gcc-12
i386                  randconfig-007-20250612    gcc-12
i386                  randconfig-011-20250612    gcc-12
i386                  randconfig-012-20250612    gcc-12
i386                  randconfig-013-20250612    gcc-12
i386                  randconfig-014-20250612    gcc-12
i386                  randconfig-015-20250612    gcc-12
i386                  randconfig-016-20250612    gcc-12
i386                  randconfig-017-20250612    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-15.1.0
loongarch             randconfig-001-20250612    gcc-10.5.0
loongarch             randconfig-002-20250611    gcc-15.1.0
loongarch             randconfig-002-20250612    gcc-10.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip28_defconfig    clang-21
mips                           jazz_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-001-20250612    gcc-10.5.0
nios2                 randconfig-002-20250611    gcc-9.3.0
nios2                 randconfig-002-20250612    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250611    gcc-11.5.0
parisc                randconfig-001-20250612    gcc-10.5.0
parisc                randconfig-002-20250611    gcc-8.5.0
parisc                randconfig-002-20250612    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        cell_defconfig    clang-21
powerpc                      ep88xc_defconfig    clang-21
powerpc                     mpc512x_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-001-20250612    gcc-10.5.0
powerpc               randconfig-002-20250611    gcc-13.3.0
powerpc               randconfig-002-20250612    gcc-10.5.0
powerpc               randconfig-003-20250611    clang-21
powerpc               randconfig-003-20250612    gcc-10.5.0
powerpc                  storcenter_defconfig    clang-21
powerpc                     taishan_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250611    clang-21
powerpc64             randconfig-001-20250612    gcc-10.5.0
powerpc64             randconfig-002-20250611    clang-21
powerpc64             randconfig-002-20250612    gcc-10.5.0
powerpc64             randconfig-003-20250612    gcc-10.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250611    clang-21
riscv                 randconfig-001-20250612    gcc-12.4.0
riscv                 randconfig-002-20250611    clang-19
riscv                 randconfig-002-20250612    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-001-20250612    gcc-12.4.0
s390                  randconfig-002-20250611    gcc-11.5.0
s390                  randconfig-002-20250612    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-001-20250612    gcc-12.4.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                    randconfig-002-20250612    gcc-12.4.0
sh                           se7751_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    clang-21
sh                  sh7785lcr_32bit_defconfig    clang-21
sh                            titan_defconfig    clang-21
sh                          urquell_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-11.5.0
sparc                 randconfig-001-20250612    gcc-12.4.0
sparc                 randconfig-002-20250611    gcc-8.5.0
sparc                 randconfig-002-20250612    gcc-12.4.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250611    gcc-8.5.0
sparc64               randconfig-001-20250612    gcc-12.4.0
sparc64               randconfig-002-20250611    gcc-13.3.0
sparc64               randconfig-002-20250612    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250611    clang-21
um                    randconfig-001-20250612    gcc-12.4.0
um                    randconfig-002-20250611    clang-19
um                    randconfig-002-20250612    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    gcc-12
x86_64      buildonly-randconfig-001-20250612    clang-20
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-002-20250612    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-003-20250612    clang-20
x86_64      buildonly-randconfig-004-20250611    gcc-12
x86_64      buildonly-randconfig-004-20250612    clang-20
x86_64      buildonly-randconfig-005-20250611    gcc-12
x86_64      buildonly-randconfig-005-20250612    clang-20
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64      buildonly-randconfig-006-20250612    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250612    clang-20
x86_64                randconfig-002-20250612    clang-20
x86_64                randconfig-003-20250612    clang-20
x86_64                randconfig-004-20250612    clang-20
x86_64                randconfig-005-20250612    clang-20
x86_64                randconfig-006-20250612    clang-20
x86_64                randconfig-007-20250612    clang-20
x86_64                randconfig-008-20250612    clang-20
x86_64                randconfig-071-20250612    gcc-12
x86_64                randconfig-072-20250612    gcc-12
x86_64                randconfig-073-20250612    gcc-12
x86_64                randconfig-074-20250612    gcc-12
x86_64                randconfig-075-20250612    gcc-12
x86_64                randconfig-076-20250612    gcc-12
x86_64                randconfig-077-20250612    gcc-12
x86_64                randconfig-078-20250612    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250611    gcc-13.3.0
xtensa                randconfig-001-20250612    gcc-12.4.0
xtensa                randconfig-002-20250611    gcc-10.5.0
xtensa                randconfig-002-20250612    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
