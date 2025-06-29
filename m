Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C958136D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 00:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751156126; cv=none; b=jGy/A/Lf9izEGLdtDp0Nh8+gVt8dfCTEthtuQsUA2Xi4rtmnw64JyezERheRnZ0CKDPrgviTTl3AGM2KyZUY7oITb3nOgJ1z/8chu/15vcFPVSYRtzjWMSe/fr/NZv+6qsjO868ZEmykUiVZnsJYa3OkjrXL+XRXiJBNUHCLm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751156126; c=relaxed/simple;
	bh=fDzY+EsMjKMuwF8DEsaT3ULUC3iyHWNTH+JaTUocFBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSbBDMs1tvLEpuosDYFzUDiRB2fkKIydwgvucSlIkuERHYTkg+KgwEQg5F9H2ahmpHwaOBOpqKSBW50oD7PjVzreV13aFX8WEuQP6pc+rIbcjgm3riA5vIJnGt31NRt8gyDFkt6dkgOgwS4r8ffV6Qjgrns+fKDp1LJacOSscgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gF33roe1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gF33roe1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751156125; x=1782692125;
  h=date:from:to:cc:subject:message-id;
  bh=fDzY+EsMjKMuwF8DEsaT3ULUC3iyHWNTH+JaTUocFBE=;
  b=gF33roe1L1i/zabm+jx4fgduo84ZqZOJMqYOW+gSRI5SZ2Chg4Cb/2as
   fJlin6T7w8ZvQzN07+CKKuikqHcdOq5oIgPk0055cNWiuHxJ9hBWnm+T8
   xXbMB8pDsunkJCWE3IRkiCiJLlILOwHuJh14Q3FKcg9Wqfg2yJehplc1H
   /iCanbcAlxI7/UWSeXfbROvaOXy5osbr3/Xa1uENxDGwP8nSArGC5NMEX
   QXBnGNrJ4jd1z9mfBJMcYOMLBuzWDv9R3jB5EIAvspPjUHpRnzlUR8khF
   n4n1Sc0tCQlmjgpwPyh/WMTAKsz+0Rv8Cwy47z2kuybaq8Ion1kvCbCJ+
   Q==;
X-CSE-ConnectionGUID: /x5iztI4RYGhgjQQjfbWAw==
X-CSE-MsgGUID: 87pV3p8TTMGYAWS4dWjlXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53523426"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53523426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 17:15:25 -0700
X-CSE-ConnectionGUID: tQM+kRBpQOSMmdi33BrmgQ==
X-CSE-MsgGUID: kQeLI3YeQDmHQKRZ4v8KHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="184036671"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jun 2025 17:15:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVfhZ-000XW8-0h;
	Sun, 29 Jun 2025 00:15:21 +0000
Date: Sun, 29 Jun 2025 08:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 a34535e3752e06dc7d9c43d3a1d2392160235f20
Message-ID: <202506290826.LIkBSHXb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: a34535e3752e06dc7d9c43d3a1d2392160235f20  Merge perf/urgent into tip/urgent

elapsed time: 721m

configs tested: 119
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250628    gcc-8.5.0
arc                   randconfig-002-20250628    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-21
arm                          collie_defconfig    gcc-15.1.0
arm                            mmp2_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250628    gcc-12.4.0
arm                   randconfig-002-20250628    clang-21
arm                   randconfig-003-20250628    clang-17
arm                   randconfig-004-20250628    clang-17
arm                        spear6xx_defconfig    clang-21
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250628    gcc-14.3.0
arm64                 randconfig-002-20250628    clang-21
arm64                 randconfig-003-20250628    clang-21
arm64                 randconfig-004-20250628    clang-17
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250628    gcc-14.3.0
csky                  randconfig-002-20250628    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250628    clang-21
hexagon               randconfig-002-20250628    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250628    clang-20
i386        buildonly-randconfig-002-20250628    clang-20
i386        buildonly-randconfig-003-20250628    gcc-12
i386        buildonly-randconfig-004-20250628    clang-20
i386        buildonly-randconfig-005-20250628    clang-20
i386        buildonly-randconfig-006-20250628    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250628    gcc-12.4.0
loongarch             randconfig-002-20250628    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250628    gcc-8.5.0
nios2                 randconfig-002-20250628    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250628    gcc-8.5.0
parisc                randconfig-002-20250628    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc512x_defconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc               randconfig-001-20250628    gcc-8.5.0
powerpc               randconfig-002-20250628    clang-19
powerpc               randconfig-003-20250628    clang-21
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250628    clang-20
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250628    clang-21
riscv                 randconfig-002-20250628    clang-16
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250628    clang-21
s390                  randconfig-002-20250628    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250628    gcc-15.1.0
sh                    randconfig-002-20250628    gcc-9.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250628    gcc-8.5.0
sparc                 randconfig-002-20250628    gcc-12.4.0
sparc64               randconfig-001-20250628    gcc-8.5.0
sparc64               randconfig-002-20250628    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250628    gcc-12
um                    randconfig-002-20250628    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250628    gcc-12
x86_64      buildonly-randconfig-002-20250628    clang-20
x86_64      buildonly-randconfig-003-20250628    gcc-12
x86_64      buildonly-randconfig-004-20250628    clang-20
x86_64      buildonly-randconfig-005-20250628    clang-20
x86_64      buildonly-randconfig-006-20250628    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250628    gcc-11.5.0
xtensa                randconfig-002-20250628    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
