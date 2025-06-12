Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56351885A5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722879; cv=none; b=JFnZaGVjY/wE+lxHd3WcEqSInFw1zjUwXY1tJgY3lxcelSZ2cvHAHuyC7yKNyErrwRnlQndgzU9zgkudGrzwLEEaKxDZUX3dqhQPfcabZDZ4YQGTtNTOqnzOBFlXt/CfevtckYltqGuCIXb4F+/t9n6CiQaSmRcS9YOoxvwGFW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722879; c=relaxed/simple;
	bh=U3fo5tP/fWHfIVtMDXqNtzzuDxeFogTCYAFKIcSqweA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n4w+zNTm1JsvyhfBld6tpgYH2D8igmgUNazdaKuNVbwUWQLH/q8lQlFl8NGjdxxfivLKiFHNlxGs8K0LIDLC5HX7393ZoobFYL1nG4T410bVk322YXkVi6dOSg1H0j6ni1yf9pforViONXlr2l5w2ny0MAG64qElS2EiXS6rcCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAKCP/+o; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAKCP/+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749722878; x=1781258878;
  h=date:from:to:cc:subject:message-id;
  bh=U3fo5tP/fWHfIVtMDXqNtzzuDxeFogTCYAFKIcSqweA=;
  b=TAKCP/+o+o53w1zwZ1t5gAZlUzXl2rEpY2rLCMDF/w4QYg4aI4hBxKVa
   NTqQBjaMJuTU8r68rzxZeRcMuTHH5Iho2Fb71RbxrcM7cxcdyjB9jjrh/
   c/tgX23cETb8JFMCzN8498MpcJBjV/Vbm23CX8oWkbp9gZ5DQHiei9A9m
   iWq9hRZ3UB8STvMXjXdzhSoDzhSUZyIsW3jmwClLPX/LcmoDb+LyRNmJy
   QaJPdrSm8UrpAYYv3GP9/TCdF+lg75aKq1CMC9iyFDzT9BuSShAPiiA6d
   yEfuuHPEbprkMnPCMZnO124MfHt2tB32K5BDf957pK7ubtZZs7/kTOtxB
   g==;
X-CSE-ConnectionGUID: J/n3OahwTCWwgNIfiblFbg==
X-CSE-MsgGUID: FkyvYH+CQvqzRonOCu+SMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55696194"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="55696194"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 03:07:57 -0700
X-CSE-ConnectionGUID: HEL1ZcpiSFObVzfIpNkkYQ==
X-CSE-MsgGUID: rprmDDBYS+e9mUfKoqGw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147966946"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2025 03:07:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPeqf-000BOI-1T;
	Thu, 12 Jun 2025 10:07:53 +0000
Date: Thu, 12 Jun 2025 18:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 7cd9a11dd0c3d1dd225795ed1b5b53132888e7b5
Message-ID: <202506121819.G3aAPNjK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 7cd9a11dd0c3d1dd225795ed1b5b53132888e7b5  Revert "mm/execmem: Unify early execmem_cache behaviour"

elapsed time: 1477m

configs tested: 116
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-8.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                            mmp2_defconfig    gcc-15.1.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250611    gcc-11.5.0
arm                   randconfig-002-20250611    clang-21
arm                   randconfig-003-20250611    gcc-13.3.0
arm                   randconfig-004-20250611    gcc-13.3.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250611    gcc-8.5.0
arm64                 randconfig-002-20250611    gcc-9.5.0
arm64                 randconfig-003-20250611    gcc-13.3.0
arm64                 randconfig-004-20250611    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-15.1.0
csky                  randconfig-002-20250611    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250611    clang-21
hexagon               randconfig-002-20250611    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250611    gcc-12
i386        buildonly-randconfig-002-20250611    gcc-12
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250611    gcc-12
i386        buildonly-randconfig-005-20250611    gcc-11
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-15.1.0
loongarch             randconfig-002-20250611    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip28_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250611    gcc-11.5.0
parisc                randconfig-002-20250611    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                  mpc885_ads_defconfig    clang-21
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-002-20250611    gcc-13.3.0
powerpc               randconfig-003-20250611    clang-21
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250611    clang-21
powerpc64             randconfig-002-20250611    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250611    clang-21
riscv                 randconfig-002-20250611    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250611    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-11.5.0
sparc                 randconfig-002-20250611    gcc-8.5.0
sparc64               randconfig-001-20250611    gcc-8.5.0
sparc64               randconfig-002-20250611    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250611    clang-21
um                    randconfig-002-20250611    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    gcc-12
x86_64      buildonly-randconfig-005-20250611    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250611    gcc-13.3.0
xtensa                randconfig-002-20250611    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
