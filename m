Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E82114
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749118173; cv=none; b=JHPClQ10CqxyDcWM3o3Px5tfNjIq0idBCaDbGNjsUutt44gzUJUshX6m+VZlfkW38Cyj6BGQtVy+fs5kTVW3wf77ToseMS9B6fRNTXtZpqjGZSsECIIFGUn3OQas2JF4HZ1NCTzsNIXXFIi04pKcLDFPXXJkSr+1GYGxT1RjGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749118173; c=relaxed/simple;
	bh=SMjgtGi5oHsLYxmFByQZJTfFRooQNXvhpAiKaIwF4NM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=acd/QGfRVyGMFPyTVup1sIyyMYvwMjxq6kgqLspnhDzyF31QMyscPYO2rqm4uE3sCvqrH4tLIcWAoGSDFGXvmqfQoSie3Djo39IgLKstM4oS3x8ucFSRdzuTS4Wmeg3NgSgmOQTQXqTi/taMFbjoEdXyyqJxa67WY6eUKCRpRHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTQ56ONs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTQ56ONs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749118172; x=1780654172;
  h=date:from:to:cc:subject:message-id;
  bh=SMjgtGi5oHsLYxmFByQZJTfFRooQNXvhpAiKaIwF4NM=;
  b=cTQ56ONshsqOyhR/sPQ2TeEMFPvEGfnLscL5NZYmF9wprRNgvgUN5xBw
   4jrH966PzYUBquYDsSQ/NXm1sD74ONgHHZCQazeYF37bcBZoAfQzBZJ45
   Z3Vkof0ipyKNmSy9Fof1xBHPU7ovWE7qyG3wha3waMoMiHTJ2uXB2L+mI
   B1yiIieYgSY4Ke9j6os3F411z4D2lhvOrfBQGCuEWyuoK1kLPyTPzcTNN
   8b32o1oWk8aE0xZXr1YSnzVVm75CG1R8TY0mDYgi81/Wac4X/ULZ5oxXR
   nP0pjFxb4hJeKxSCqpqPVGGAAHUSFS/1AVv9xgXXKBXfkqMc+bGKfuWAY
   Q==;
X-CSE-ConnectionGUID: EkuiNwNNTQuHdEL5j4WRjw==
X-CSE-MsgGUID: TrTna5qaR7yjvX3iEZliXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51375611"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51375611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 03:09:31 -0700
X-CSE-ConnectionGUID: fs0eRbXRSQi5EzEpTHTveg==
X-CSE-MsgGUID: SyzPz2K+Tw+fsAONqLVSHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="176415100"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2025 03:09:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN7XL-0003yr-1B;
	Thu, 05 Jun 2025 10:09:27 +0000
Date: Thu, 05 Jun 2025 18:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/urgent] BUILD SUCCESS
 434d7f9b0e24e1f0166d05f10881a8ab386845b7
Message-ID: <202506051843.LLD0fcgp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
branch HEAD: 434d7f9b0e24e1f0166d05f10881a8ab386845b7  timens: Add struct seq_file forward declaration

elapsed time: 1420m

configs tested: 300
configs skipped: 11

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
arc                        nsimosci_defconfig    clang-19
arc                   randconfig-001-20250604    gcc-12.4.0
arc                   randconfig-001-20250605    clang-21
arc                   randconfig-002-20250604    gcc-12.4.0
arc                   randconfig-002-20250605    clang-21
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-21
arm                     davinci_all_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-19
arm                          exynos_defconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                          gemini_defconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-21
arm                         lpc32xx_defconfig    clang-17
arm                            mmp2_defconfig    gcc-15.1.0
arm                          pxa910_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250604    gcc-14.3.0
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-002-20250604    clang-18
arm                   randconfig-002-20250605    clang-21
arm                   randconfig-003-20250604    gcc-10.5.0
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-004-20250604    clang-21
arm                   randconfig-004-20250605    clang-21
arm                             rpc_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    clang-21
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250604    gcc-8.5.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-002-20250604    clang-21
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-003-20250604    gcc-8.5.0
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-004-20250604    gcc-12.3.0
arm64                 randconfig-004-20250605    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250604    gcc-12.4.0
csky                  randconfig-001-20250605    clang-21
csky                  randconfig-002-20250604    gcc-15.1.0
csky                  randconfig-002-20250605    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250604    clang-21
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-002-20250604    clang-21
hexagon               randconfig-002-20250605    clang-21
i386                             alldefconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250604    clang-20
i386        buildonly-randconfig-001-20250605    clang-20
i386        buildonly-randconfig-002-20250604    gcc-12
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-003-20250604    gcc-12
i386        buildonly-randconfig-003-20250605    clang-20
i386        buildonly-randconfig-004-20250604    gcc-12
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-005-20250604    clang-20
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-006-20250604    gcc-12
i386        buildonly-randconfig-006-20250605    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250605    clang-20
i386                  randconfig-002-20250605    clang-20
i386                  randconfig-003-20250605    clang-20
i386                  randconfig-004-20250605    clang-20
i386                  randconfig-005-20250605    clang-20
i386                  randconfig-006-20250605    clang-20
i386                  randconfig-007-20250605    clang-20
i386                  randconfig-011-20250605    clang-20
i386                  randconfig-012-20250605    clang-20
i386                  randconfig-013-20250605    clang-20
i386                  randconfig-014-20250605    clang-20
i386                  randconfig-015-20250605    clang-20
i386                  randconfig-016-20250605    clang-20
i386                  randconfig-017-20250605    clang-20
loongarch                        alldefconfig    clang-19
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    clang-19
loongarch             randconfig-001-20250604    gcc-15.1.0
loongarch             randconfig-001-20250605    clang-21
loongarch             randconfig-002-20250604    gcc-15.1.0
loongarch             randconfig-002-20250605    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250604    gcc-13.3.0
nios2                 randconfig-001-20250605    clang-21
nios2                 randconfig-002-20250604    gcc-8.5.0
nios2                 randconfig-002-20250605    clang-21
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250604    gcc-8.5.0
parisc                randconfig-001-20250605    clang-21
parisc                randconfig-002-20250604    gcc-14.3.0
parisc                randconfig-002-20250605    clang-21
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc                        icon_defconfig    clang-21
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-21
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    clang-21
powerpc               randconfig-001-20250604    clang-21
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-002-20250604    clang-18
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-003-20250604    gcc-8.5.0
powerpc               randconfig-003-20250605    clang-21
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250604    gcc-12.4.0
powerpc64             randconfig-001-20250605    clang-21
powerpc64             randconfig-002-20250604    gcc-11.5.0
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-003-20250604    clang-21
powerpc64             randconfig-003-20250605    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250604    clang-19
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-002-20250604    gcc-8.5.0
riscv                 randconfig-002-20250605    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250604    clang-18
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-002-20250604    gcc-9.3.0
s390                  randconfig-002-20250605    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                          landisk_defconfig    clang-21
sh                    randconfig-001-20250604    gcc-11.5.0
sh                    randconfig-001-20250605    clang-21
sh                    randconfig-002-20250604    gcc-15.1.0
sh                    randconfig-002-20250605    clang-21
sh                          rsk7201_defconfig    clang-21
sh                          rsk7264_defconfig    gcc-15.1.0
sh                          rsk7269_defconfig    clang-21
sh                           se7619_defconfig    clang-21
sh                   sh7770_generic_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250604    gcc-10.3.0
sparc                 randconfig-001-20250605    clang-21
sparc                 randconfig-002-20250604    gcc-11.5.0
sparc                 randconfig-002-20250605    clang-21
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250604    gcc-14.3.0
sparc64               randconfig-001-20250605    clang-21
sparc64               randconfig-002-20250604    gcc-15.1.0
sparc64               randconfig-002-20250605    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250604    clang-17
um                    randconfig-001-20250605    clang-21
um                    randconfig-002-20250604    clang-21
um                    randconfig-002-20250605    clang-21
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250604    gcc-12
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-002-20250604    gcc-12
x86_64      buildonly-randconfig-002-20250605    clang-20
x86_64      buildonly-randconfig-003-20250604    gcc-12
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-004-20250604    gcc-12
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-005-20250604    gcc-12
x86_64      buildonly-randconfig-005-20250605    clang-20
x86_64      buildonly-randconfig-006-20250604    clang-20
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250605    gcc-12
x86_64                randconfig-002-20250605    gcc-12
x86_64                randconfig-003-20250605    gcc-12
x86_64                randconfig-004-20250605    gcc-12
x86_64                randconfig-005-20250605    gcc-12
x86_64                randconfig-006-20250605    gcc-12
x86_64                randconfig-007-20250605    gcc-12
x86_64                randconfig-008-20250605    gcc-12
x86_64                randconfig-071-20250605    clang-20
x86_64                randconfig-072-20250605    clang-20
x86_64                randconfig-073-20250605    clang-20
x86_64                randconfig-074-20250605    clang-20
x86_64                randconfig-075-20250605    clang-20
x86_64                randconfig-076-20250605    clang-20
x86_64                randconfig-077-20250605    clang-20
x86_64                randconfig-078-20250605    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250604    gcc-13.3.0
xtensa                randconfig-001-20250605    clang-21
xtensa                randconfig-002-20250604    gcc-11.5.0
xtensa                randconfig-002-20250605    clang-21
xtensa                         virt_defconfig    gcc-15.1.0
xtensa                    xip_kc705_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
