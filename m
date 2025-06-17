Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1142F5312
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199189; cv=none; b=LeRCWLyHkq70sC7klqVnRARPpJdcpeCXSkApqp7EAe24/vYO+gfXd6hSK2UBl1Fw6rSqTSkuUByKsXoSRXY5xM6EOS1pivx2VXekOB5MnpxlLSPD1wvd0ENa6xcv4LCbHa9J7Omm2x9KpXuuaJ1kYodJ59/UyM4dxyjJrdH167w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199189; c=relaxed/simple;
	bh=kkb3Crfek9zllVXLdhAA5dACspoLQXEP0P/tZSU+qfo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H7z2ks9LFQFfCeKWFM/8s2Eaa8QKzXXvaowXKwFrHOpB5UCwiRC2fIdpnFnkqgU1OQyhbAE4yrTXriNbpIrW2FvIvgspOr5OzzLw1a8yTrr/7cdUqhXs7sCXeRgB88ciZdQbA/4npgEFX6/MAhZE9vHMcnDjh/ocmA3EtznMgCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=em7crSLJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="em7crSLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750199187; x=1781735187;
  h=date:from:to:cc:subject:message-id;
  bh=kkb3Crfek9zllVXLdhAA5dACspoLQXEP0P/tZSU+qfo=;
  b=em7crSLJCNkiZD5AklHoDVpLX4/Twhs51fAKVJLxxfIFW59G6PCf2OGw
   KOGHUwSX5WeiEs78qkMx8q3fmTrf3Ft84G8d2WoVrmAXOsVPdHTqevoFa
   Y6F4B0O9t7fnyKNwKkHycCQSbULim45ZTaqnYv7lONxp9p3Um2ia+7kqY
   d/g9X2Q6El8+Hrm1bXfoqsHlu6rQO3J5PAHDB596FdG5JGSCbHJWroB9L
   xxTl8A3xSLwkVq6ZR7Zwte6LuuDNIJNoYLI+3NAxbnnjLvLzGqLxYKqmn
   bnEqG9nZttArKnhu2p2rab9mWJ7fVJnsY/BXgiuDhCdzpAAHOfjEc2Wbi
   w==;
X-CSE-ConnectionGUID: uL5d3yL3SWaDqnfAGzakJA==
X-CSE-MsgGUID: aB5vcT7OTGOJ09cKl/jIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63756849"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="63756849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 15:26:27 -0700
X-CSE-ConnectionGUID: 5/3IQI6KR5mSNkhrH1+pzA==
X-CSE-MsgGUID: BWZA1JVbTB+7XkcuC6ZP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="148809607"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2025 15:26:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRel5-000JBe-0s;
	Tue, 17 Jun 2025 22:26:23 +0000
Date: Wed, 18 Jun 2025 06:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250616] BUILD SUCCESS
 a90c68ba6146ca3ab83e7dab3d1dd458d25f2e83
Message-ID: <202506180608.P93eau7n-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
branch HEAD: a90c68ba6146ca3ab83e7dab3d1dd458d25f2e83  NFSD: Avoid multiple -Wflex-array-member-not-at-end warnings

elapsed time: 1216m

configs tested: 237
configs skipped: 4

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
arc                        nsim_700_defconfig    clang-21
arc                   randconfig-001-20250617    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20250617    gcc-11.5.0
arm                   randconfig-001-20250617    gcc-8.5.0
arm                   randconfig-002-20250617    clang-21
arm                   randconfig-002-20250617    gcc-11.5.0
arm                   randconfig-003-20250617    clang-21
arm                   randconfig-003-20250617    gcc-11.5.0
arm                   randconfig-004-20250617    clang-21
arm                   randconfig-004-20250617    gcc-11.5.0
arm                        spear3xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250617    gcc-11.5.0
arm64                 randconfig-002-20250617    clang-21
arm64                 randconfig-002-20250617    gcc-11.5.0
arm64                 randconfig-003-20250617    gcc-11.5.0
arm64                 randconfig-003-20250617    gcc-8.5.0
arm64                 randconfig-004-20250617    gcc-11.5.0
arm64                 randconfig-004-20250617    gcc-12.3.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250617    clang-21
csky                  randconfig-001-20250617    gcc-13.3.0
csky                  randconfig-002-20250617    clang-21
csky                  randconfig-002-20250617    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250617    clang-21
hexagon               randconfig-002-20250617    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250617    gcc-12
i386        buildonly-randconfig-002-20250617    clang-20
i386        buildonly-randconfig-002-20250617    gcc-12
i386        buildonly-randconfig-003-20250617    gcc-12
i386        buildonly-randconfig-004-20250617    gcc-12
i386        buildonly-randconfig-005-20250617    gcc-12
i386        buildonly-randconfig-006-20250617    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250617    gcc-12
i386                  randconfig-002-20250617    gcc-12
i386                  randconfig-003-20250617    gcc-12
i386                  randconfig-004-20250617    gcc-12
i386                  randconfig-005-20250617    gcc-12
i386                  randconfig-006-20250617    gcc-12
i386                  randconfig-007-20250617    gcc-12
i386                  randconfig-011-20250617    clang-20
i386                  randconfig-012-20250617    clang-20
i386                  randconfig-013-20250617    clang-20
i386                  randconfig-014-20250617    clang-20
i386                  randconfig-015-20250617    clang-20
i386                  randconfig-016-20250617    clang-20
i386                  randconfig-017-20250617    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    clang-21
loongarch             randconfig-001-20250617    clang-21
loongarch             randconfig-001-20250617    gcc-15.1.0
loongarch             randconfig-002-20250617    clang-21
loongarch             randconfig-002-20250617    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250617    clang-21
nios2                 randconfig-001-20250617    gcc-10.5.0
nios2                 randconfig-002-20250617    clang-21
nios2                 randconfig-002-20250617    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-21
parisc                randconfig-001-20250617    clang-21
parisc                randconfig-001-20250617    gcc-8.5.0
parisc                randconfig-002-20250617    clang-21
parisc                randconfig-002-20250617    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    ge_imp3a_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                  iss476-smp_defconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc               randconfig-001-20250617    clang-21
powerpc               randconfig-001-20250617    gcc-8.5.0
powerpc               randconfig-002-20250617    clang-16
powerpc               randconfig-002-20250617    clang-21
powerpc               randconfig-003-20250617    clang-21
powerpc               randconfig-003-20250617    gcc-12.4.0
powerpc                 xes_mpc85xx_defconfig    clang-21
powerpc64             randconfig-001-20250617    clang-21
powerpc64             randconfig-001-20250617    gcc-14.3.0
powerpc64             randconfig-002-20250617    clang-21
powerpc64             randconfig-003-20250617    clang-21
powerpc64             randconfig-003-20250617    gcc-13.3.0
riscv                            alldefconfig    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250617    clang-21
riscv                 randconfig-001-20250617    gcc-12.4.0
riscv                 randconfig-002-20250617    gcc-10.5.0
riscv                 randconfig-002-20250617    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250617    clang-21
s390                  randconfig-001-20250617    gcc-12.4.0
s390                  randconfig-002-20250617    clang-20
s390                  randconfig-002-20250617    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                     magicpanelr2_defconfig    clang-21
sh                            migor_defconfig    clang-21
sh                    randconfig-001-20250617    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-14.3.0
sh                      rts7751r2d1_defconfig    clang-21
sh                        sh7763rdp_defconfig    clang-21
sh                            titan_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250617    gcc-12.4.0
sparc                 randconfig-002-20250617    gcc-12.4.0
sparc                 randconfig-002-20250617    gcc-13.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250617    gcc-12.4.0
sparc64               randconfig-001-20250617    gcc-15.1.0
sparc64               randconfig-002-20250617    gcc-12.4.0
sparc64               randconfig-002-20250617    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250617    gcc-12
um                    randconfig-001-20250617    gcc-12.4.0
um                    randconfig-002-20250617    clang-21
um                    randconfig-002-20250617    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250617    clang-20
x86_64      buildonly-randconfig-001-20250617    gcc-12
x86_64      buildonly-randconfig-002-20250617    clang-20
x86_64      buildonly-randconfig-002-20250617    gcc-12
x86_64      buildonly-randconfig-003-20250617    gcc-11
x86_64      buildonly-randconfig-003-20250617    gcc-12
x86_64      buildonly-randconfig-004-20250617    gcc-12
x86_64      buildonly-randconfig-005-20250617    gcc-12
x86_64      buildonly-randconfig-006-20250617    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250617    gcc-12
x86_64                randconfig-002-20250617    gcc-12
x86_64                randconfig-003-20250617    gcc-12
x86_64                randconfig-004-20250617    gcc-12
x86_64                randconfig-005-20250617    gcc-12
x86_64                randconfig-006-20250617    gcc-12
x86_64                randconfig-007-20250617    gcc-12
x86_64                randconfig-008-20250617    gcc-12
x86_64                randconfig-071-20250617    clang-20
x86_64                randconfig-072-20250617    clang-20
x86_64                randconfig-073-20250617    clang-20
x86_64                randconfig-074-20250617    clang-20
x86_64                randconfig-075-20250617    clang-20
x86_64                randconfig-076-20250617    clang-20
x86_64                randconfig-077-20250617    clang-20
x86_64                randconfig-078-20250617    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250617    gcc-10.5.0
xtensa                randconfig-001-20250617    gcc-12.4.0
xtensa                randconfig-002-20250617    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
