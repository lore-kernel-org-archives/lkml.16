Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEBB221F37
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455983; cv=none; b=pDimTUGFV5VF1r1rJR0JjkcAjAkFEpIQSVTxgQkGBkylVXf1zKP5FFqpzwfRoWTyJqqDit60B0eTkNOr2VggELKXkJHtyIC+7bY7IgT5Sw2X7gFzYCj/3RAXr76CzH1dJiXHtMyPeKAS1dNNH8vlItOx1z1pnDvsHTO/HysPFOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455983; c=relaxed/simple;
	bh=rqR/bHPvJnN+kWF5c+Z3oM7RS06898Jd8iBY8bYVvcw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MoE2d23VWCNglDfFJlR6G2pnUlJoGOCQcTSqCCIOGbe6yy4AnoKQ1BX03XPMSb1ReAheS5aUHuCEsicQ1DdEFqvtHSdNx9D2sBVOTDmXe/Ain1LooCsEUKX3mzCWR7aqbT5G2tsmPdKYmY+021EbMZPdl1OY/QuuniJrXZFOt5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQqKSTGB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQqKSTGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751455982; x=1782991982;
  h=date:from:to:cc:subject:message-id;
  bh=rqR/bHPvJnN+kWF5c+Z3oM7RS06898Jd8iBY8bYVvcw=;
  b=kQqKSTGB8++mP0M852wFz7lTLINkfK4/haaHvhQsa4ZTmvB5xF0+8a0t
   M2zt8g/ZfdxPApZNoPR+Krkc1kw2MZU1s0flOjOnNPcd3FxpR+ehM62Bd
   +rVjQzdwKLNte44an3CiYW8rI7ojGJfpJ1SGNkyRlMJiiplUjCnNSXPWP
   ywUwWGXs5i1lFauZSxDI0KTUgYjxAMGYlahZMc37F/alRLDLfu/mHNOaI
   6uDWhrcsvWwmVZpQd9rUM0738mQSUJPm3GID+pnltH4PecNhMImV6Y/PP
   LrcqhRqkCegQGrHOPY2fq64RrAXXcT01AvLN/oUhiSGpETo0MdunLKH9r
   g==;
X-CSE-ConnectionGUID: zNiR7cAOSfOHBhunlFmA/g==
X-CSE-MsgGUID: RGw8Q3AURCGzFeikocIOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53838772"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53838772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:33:01 -0700
X-CSE-ConnectionGUID: 3CkILaNrRvyfgYHOgjfXeA==
X-CSE-MsgGUID: ZLvUscvQTXaYBJ3Kl3vQig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154596601"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 04:33:00 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWvhx-0000Z1-15;
	Wed, 02 Jul 2025 11:32:57 +0000
Date: Wed, 02 Jul 2025 19:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/urgent] BUILD SUCCESS
 009836b4fa52f92cba33618e773b1094affa8cd2
Message-ID: <202507021937.PrSe2Kw1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: 009836b4fa52f92cba33618e773b1094affa8cd2  sched/core: Fix migrate_swap() vs. hotplug

elapsed time: 1296m

configs tested: 253
configs skipped: 8

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
arc                   randconfig-001-20250701    gcc-13.3.0
arc                   randconfig-001-20250702    clang-19
arc                   randconfig-002-20250701    gcc-15.1.0
arc                   randconfig-002-20250702    clang-19
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                        mvebu_v7_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-18
arm                   randconfig-001-20250701    clang-17
arm                   randconfig-001-20250702    clang-19
arm                   randconfig-002-20250701    gcc-8.5.0
arm                   randconfig-002-20250702    clang-19
arm                   randconfig-003-20250701    clang-21
arm                   randconfig-003-20250702    clang-19
arm                   randconfig-004-20250701    clang-21
arm                   randconfig-004-20250702    clang-19
arm                           tegra_defconfig    clang-18
arm                           u8500_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    clang-18
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250701    clang-21
arm64                 randconfig-001-20250702    clang-19
arm64                 randconfig-002-20250701    gcc-15.1.0
arm64                 randconfig-002-20250702    clang-19
arm64                 randconfig-003-20250701    clang-18
arm64                 randconfig-003-20250702    clang-19
arm64                 randconfig-004-20250701    gcc-8.5.0
arm64                 randconfig-004-20250702    clang-19
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250701    gcc-11.5.0
csky                  randconfig-001-20250702    gcc-14.2.0
csky                  randconfig-002-20250701    gcc-10.5.0
csky                  randconfig-002-20250702    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250701    clang-21
hexagon               randconfig-001-20250702    gcc-14.2.0
hexagon               randconfig-002-20250701    clang-21
hexagon               randconfig-002-20250702    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250701    gcc-12
i386        buildonly-randconfig-001-20250702    clang-20
i386        buildonly-randconfig-002-20250701    gcc-12
i386        buildonly-randconfig-002-20250702    clang-20
i386        buildonly-randconfig-003-20250701    gcc-12
i386        buildonly-randconfig-003-20250702    clang-20
i386        buildonly-randconfig-004-20250701    gcc-12
i386        buildonly-randconfig-004-20250702    clang-20
i386        buildonly-randconfig-005-20250701    gcc-12
i386        buildonly-randconfig-005-20250702    clang-20
i386        buildonly-randconfig-006-20250701    clang-20
i386        buildonly-randconfig-006-20250702    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250702    clang-20
i386                  randconfig-002-20250702    clang-20
i386                  randconfig-003-20250702    clang-20
i386                  randconfig-004-20250702    clang-20
i386                  randconfig-005-20250702    clang-20
i386                  randconfig-006-20250702    clang-20
i386                  randconfig-007-20250702    clang-20
i386                  randconfig-011-20250702    gcc-12
i386                  randconfig-012-20250702    gcc-12
i386                  randconfig-013-20250702    gcc-12
i386                  randconfig-014-20250702    gcc-12
i386                  randconfig-015-20250702    gcc-12
i386                  randconfig-016-20250702    gcc-12
i386                  randconfig-017-20250702    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250701    gcc-13.3.0
loongarch             randconfig-001-20250702    gcc-14.2.0
loongarch             randconfig-002-20250701    gcc-15.1.0
loongarch             randconfig-002-20250702    gcc-14.2.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-18
mips                            gpr_defconfig    clang-18
mips                           ip32_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250701    gcc-14.2.0
nios2                 randconfig-001-20250702    gcc-14.2.0
nios2                 randconfig-002-20250701    gcc-13.3.0
nios2                 randconfig-002-20250702    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250701    gcc-14.3.0
parisc                randconfig-001-20250702    gcc-14.2.0
parisc                randconfig-002-20250701    gcc-10.5.0
parisc                randconfig-002-20250702    gcc-14.2.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    gcc-15.1.0
powerpc                       ebony_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250701    gcc-13.3.0
powerpc               randconfig-001-20250702    gcc-14.2.0
powerpc               randconfig-002-20250701    clang-21
powerpc               randconfig-002-20250702    gcc-14.2.0
powerpc               randconfig-003-20250701    clang-21
powerpc               randconfig-003-20250702    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-18
powerpc                     sequoia_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250701    clang-21
powerpc64             randconfig-001-20250702    gcc-14.2.0
powerpc64             randconfig-002-20250701    clang-21
powerpc64             randconfig-002-20250702    gcc-14.2.0
powerpc64             randconfig-003-20250701    gcc-10.5.0
powerpc64             randconfig-003-20250702    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250701    gcc-14.3.0
riscv                 randconfig-001-20250702    clang-21
riscv                 randconfig-002-20250701    gcc-10.5.0
riscv                 randconfig-002-20250702    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250701    gcc-9.3.0
s390                  randconfig-001-20250702    clang-21
s390                  randconfig-002-20250701    clang-17
s390                  randconfig-002-20250702    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-15.1.0
sh                             espt_defconfig    clang-18
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250701    gcc-15.1.0
sh                    randconfig-001-20250702    clang-21
sh                    randconfig-002-20250701    gcc-13.3.0
sh                    randconfig-002-20250702    clang-21
sh                           se7722_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250701    gcc-10.3.0
sparc                 randconfig-001-20250702    clang-21
sparc                 randconfig-002-20250701    gcc-15.1.0
sparc                 randconfig-002-20250702    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250701    gcc-8.5.0
sparc64               randconfig-001-20250702    clang-21
sparc64               randconfig-002-20250701    gcc-12.4.0
sparc64               randconfig-002-20250702    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250701    gcc-12
um                    randconfig-001-20250702    clang-21
um                    randconfig-002-20250701    gcc-12
um                    randconfig-002-20250702    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250701    gcc-12
x86_64      buildonly-randconfig-001-20250702    gcc-11
x86_64      buildonly-randconfig-002-20250701    gcc-12
x86_64      buildonly-randconfig-002-20250702    gcc-11
x86_64      buildonly-randconfig-003-20250701    gcc-12
x86_64      buildonly-randconfig-003-20250702    gcc-11
x86_64      buildonly-randconfig-004-20250701    gcc-12
x86_64      buildonly-randconfig-004-20250702    gcc-11
x86_64      buildonly-randconfig-005-20250701    clang-20
x86_64      buildonly-randconfig-005-20250702    gcc-11
x86_64      buildonly-randconfig-006-20250701    clang-20
x86_64      buildonly-randconfig-006-20250702    gcc-11
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-004-20250702    gcc-12
x86_64                randconfig-005-20250702    gcc-12
x86_64                randconfig-006-20250702    gcc-12
x86_64                randconfig-007-20250702    gcc-12
x86_64                randconfig-008-20250702    gcc-12
x86_64                randconfig-071-20250702    clang-20
x86_64                randconfig-072-20250702    clang-20
x86_64                randconfig-073-20250702    clang-20
x86_64                randconfig-074-20250702    clang-20
x86_64                randconfig-075-20250702    clang-20
x86_64                randconfig-076-20250702    clang-20
x86_64                randconfig-077-20250702    clang-20
x86_64                randconfig-078-20250702    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250701    gcc-15.1.0
xtensa                randconfig-001-20250702    clang-21
xtensa                randconfig-002-20250701    gcc-13.3.0
xtensa                randconfig-002-20250702    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
