Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E5213E7B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141576; cv=none; b=U8Lh55/huBN8A6DHPrEDBIOV4xvKD0AtA1VjhzVzHjS8/zDLgdyvkdR4KjGxMVdVtnJDEOadlU/0qdwg8klphzcX8wscZqj0bvdFN+hDdj+ie1HVVQTvlwb1KdI5I+DqrWYz1Tt15xQriiQOc1WwinzwRLJ9iZTlgZ70HkfCaJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141576; c=relaxed/simple;
	bh=nlNv4cukRiEA7mYjp8K+ut2J3mbaew4EsmrIFGrjkUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iUVfudgmrQ0kXiXRm0ZyOe3DYREE0tyF4nCu8E5g+JxcgnicrahhNsDZaN7HQrwdcAzpabnnB1Jv9P8uhIdJsl6eWN6KBpxMQv64agWvjXt4Qk0r4XHO91+q/MfXk/TbTnt+9f7G2Y+g4l5Yb7Ea5qiWlxEKsKx+hFfdWSnxZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fq9HIJpp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fq9HIJpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747141574; x=1778677574;
  h=date:from:to:cc:subject:message-id;
  bh=nlNv4cukRiEA7mYjp8K+ut2J3mbaew4EsmrIFGrjkUM=;
  b=Fq9HIJppzDy1o9h+QlJlhZwXdZOG1ecGQ6qMhmxbXefJ+fo6BOqd03Ef
   lUQP9Uc6h0py28EDhWae2Hl3YSRaU2RXG1GS6KImKCHBpAu8Ku4XYdaVr
   onUzluPAniSXiPmCunb/Utnbd6kWRIK7UEY7AlxN2d2SsUDJTAc1SbZ34
   0by7RnnGxOu7GM80huc+kAnD4Em0O2z8wvKk1Ier68oznT1sG/jO1Oynb
   K4fft8uGbU+GFT0lDxEwgUQSkU0/LBHiAvFVcVWyLel3hVhoHV+VDTAKz
   X6xds8YHJMNLeVm+fTazpllBomp2Z7eq62SvubOhXQ4W7Beyd5Vw1u7e2
   Q==;
X-CSE-ConnectionGUID: hhFnQuE3SSuj0gAD//xnCg==
X-CSE-MsgGUID: 4uXwF/R8TY2QbEMkAXX7AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48678961"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48678961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:06:13 -0700
X-CSE-ConnectionGUID: +XaTO6XXR8+6v6d1pb8i1A==
X-CSE-MsgGUID: d5jRGD8hR5KcW9mpVvaIVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="142891082"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 May 2025 06:06:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEpKk-000G3z-0J;
	Tue, 13 May 2025 13:06:10 +0000
Date: Tue, 13 May 2025 21:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/mtrr] BUILD SUCCESS
 824c6384e8d9275d4ec7204f3f79a4ac6bc10379
Message-ID: <202505132147.YrbDOUic-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mtrr
branch HEAD: 824c6384e8d9275d4ec7204f3f79a4ac6bc10379  x86/mtrr: Check if fixed-range MTRRs exist in mtrr_save_fixed_ranges()

elapsed time: 1326m

configs tested: 147
configs skipped: 129

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                          exynos_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250513    clang-21
csky                  randconfig-002-20250513    clang-21
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20250513    clang-21
hexagon               randconfig-002-20250513    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250513    clang-20
i386        buildonly-randconfig-002-20250513    clang-20
i386        buildonly-randconfig-003-20250513    clang-20
i386        buildonly-randconfig-004-20250513    clang-20
i386        buildonly-randconfig-005-20250513    clang-20
i386        buildonly-randconfig-005-20250513    gcc-12
i386        buildonly-randconfig-006-20250513    clang-20
i386        buildonly-randconfig-006-20250513    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250513    gcc-12
i386                  randconfig-002-20250513    gcc-12
i386                  randconfig-003-20250513    gcc-12
i386                  randconfig-004-20250513    gcc-12
i386                  randconfig-005-20250513    gcc-12
i386                  randconfig-006-20250513    gcc-12
i386                  randconfig-007-20250513    gcc-12
i386                  randconfig-011-20250513    gcc-12
i386                  randconfig-012-20250513    gcc-12
i386                  randconfig-013-20250513    gcc-12
i386                  randconfig-014-20250513    gcc-12
i386                  randconfig-015-20250513    gcc-12
i386                  randconfig-016-20250513    gcc-12
i386                  randconfig-017-20250513    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250513    clang-21
loongarch             randconfig-002-20250513    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250513    clang-21
nios2                 randconfig-002-20250513    clang-21
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250513    clang-21
parisc                randconfig-002-20250513    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-002-20250513    clang-21
powerpc               randconfig-003-20250513    clang-21
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-003-20250513    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250512    gcc-12
x86_64      buildonly-randconfig-001-20250513    gcc-12
x86_64      buildonly-randconfig-002-20250512    gcc-12
x86_64      buildonly-randconfig-002-20250513    gcc-12
x86_64      buildonly-randconfig-003-20250512    clang-20
x86_64      buildonly-randconfig-003-20250513    gcc-12
x86_64      buildonly-randconfig-004-20250512    clang-20
x86_64      buildonly-randconfig-004-20250513    gcc-12
x86_64      buildonly-randconfig-005-20250512    clang-20
x86_64      buildonly-randconfig-005-20250513    gcc-12
x86_64      buildonly-randconfig-006-20250512    clang-20
x86_64      buildonly-randconfig-006-20250513    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250513    clang-20
x86_64                randconfig-002-20250513    clang-20
x86_64                randconfig-003-20250513    clang-20
x86_64                randconfig-004-20250513    clang-20
x86_64                randconfig-005-20250513    clang-20
x86_64                randconfig-006-20250513    clang-20
x86_64                randconfig-007-20250513    clang-20
x86_64                randconfig-008-20250513    clang-20
x86_64                randconfig-071-20250513    clang-20
x86_64                randconfig-072-20250513    clang-20
x86_64                randconfig-073-20250513    clang-20
x86_64                randconfig-074-20250513    clang-20
x86_64                randconfig-075-20250513    clang-20
x86_64                randconfig-076-20250513    clang-20
x86_64                randconfig-077-20250513    clang-20
x86_64                randconfig-078-20250513    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
