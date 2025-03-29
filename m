Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8EC1DE887
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743288541; cv=none; b=LgfMjNEypxPqhCF/xoGK+15TZv1y6SwvyfOFvQcoBD+eC7Vi6hX6v176IR/7I5VYnbXlyXSM6bWbJUxlyI5nbmi4FwDocKmcB3pSG+o+wncksb4ZXi5QQjc4CCef+L06bSRWMGxVJeUUJnqOMTBnaviRBI2a8JGkzjFvQ+rlCCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743288541; c=relaxed/simple;
	bh=ARgYQBSQ2dXcM9NwOB7rPt3AvX7olUMeTv1DhL1ARbA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A2+FSCZhaZ4Ug9U+dawTfi+cNQbd7/ySksZOnum94zX4wq6ellatuZP7hRatoHTV+ZNb944s/3ClmPy6esKqEcxFg641TuZh1bN4/ocheOLOi1X/Zhywqw4LCdkZw0yFpeDVOhZkamwKV6XQVzBT53daJBfRyvXlGjpJyS/w7zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVcvgLOB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVcvgLOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743288540; x=1774824540;
  h=date:from:to:cc:subject:message-id;
  bh=ARgYQBSQ2dXcM9NwOB7rPt3AvX7olUMeTv1DhL1ARbA=;
  b=fVcvgLOB5+gKPUPo7VdwjPM067KmgKgm9169Tf2ZjtgeUM9FlyxXlyvI
   mtwV9hp10ZD7h2EEr0pVZKnUs/JiaWXV5nqAjhY2VWGu3lAWl5IjAttDn
   n0Ik/PQx0eBlsrIzoBmHPS/aCt2tkJsVl0QM/a+VBShmNWyva3SI8NLgD
   4NKIbnkTTqVUWk3cOoIHzGp8VMRQwzFPbOpPO/IE8JgwUee/diCh2Rrco
   mBkRCAwN50FEJc02cFVs+n95XvyUMuGdg2el3h6LHABnsIVKhYNFUF1O3
   MiEF0FBp6i45TtQeGVXsUpQuQJE3GPwyel4T5EZkhYf2YhRnaLSSWRl7U
   w==;
X-CSE-ConnectionGUID: S4rKJPSmSN2U96Lvi5zfqQ==
X-CSE-MsgGUID: yveHB3HOR82N5HEs50l3Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44724155"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44724155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 15:49:00 -0700
X-CSE-ConnectionGUID: Fwr3niF3Q42JHXpcXrfnnA==
X-CSE-MsgGUID: CsX0bq+FSHyR1W8t7jdUsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="148932775"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2025 15:48:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyeyz-0008Pg-2U;
	Sat, 29 Mar 2025 22:48:54 +0000
Date: Sun, 30 Mar 2025 06:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 986d86349b138c2d0d267009e4ae38cb6b17ac86
Message-ID: <202503300641.KSep4NtV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 986d86349b138c2d0d267009e4ae38cb6b17ac86  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1442m

configs tested: 205
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250329    gcc-14.2.0
arc                   randconfig-002-20250329    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                         axm55xx_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                   randconfig-001-20250329    gcc-9.3.0
arm                   randconfig-002-20250329    clang-17
arm                   randconfig-003-20250329    clang-21
arm                   randconfig-004-20250329    clang-21
arm                             rpc_defconfig    clang-18
arm                         socfpga_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250329    gcc-7.5.0
arm64                 randconfig-002-20250329    gcc-9.5.0
arm64                 randconfig-003-20250329    gcc-5.5.0
arm64                 randconfig-004-20250329    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250329    gcc-11.5.0
csky                  randconfig-002-20250329    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250329    clang-21
hexagon               randconfig-002-20250329    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250329    gcc-12
i386        buildonly-randconfig-002-20250329    gcc-12
i386        buildonly-randconfig-003-20250329    clang-20
i386        buildonly-randconfig-004-20250329    gcc-11
i386        buildonly-randconfig-005-20250329    gcc-12
i386        buildonly-randconfig-006-20250329    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250330    clang-20
i386                  randconfig-002-20250330    clang-20
i386                  randconfig-003-20250330    clang-20
i386                  randconfig-004-20250330    clang-20
i386                  randconfig-005-20250330    clang-20
i386                  randconfig-006-20250330    clang-20
i386                  randconfig-007-20250330    clang-20
i386                  randconfig-011-20250330    clang-20
i386                  randconfig-012-20250330    clang-20
i386                  randconfig-013-20250330    clang-20
i386                  randconfig-014-20250330    clang-20
i386                  randconfig-015-20250330    clang-20
i386                  randconfig-016-20250330    clang-20
i386                  randconfig-017-20250330    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250329    gcc-14.2.0
loongarch             randconfig-002-20250329    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    clang-21
m68k                          multi_defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                       bmips_be_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250329    gcc-7.5.0
nios2                 randconfig-002-20250329    gcc-7.5.0
openrisc                         alldefconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250329    gcc-6.5.0
parisc                randconfig-002-20250329    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250329    gcc-5.5.0
powerpc               randconfig-002-20250329    gcc-5.5.0
powerpc               randconfig-003-20250329    gcc-9.3.0
powerpc64             randconfig-001-20250329    gcc-9.3.0
powerpc64             randconfig-002-20250329    gcc-9.3.0
powerpc64             randconfig-003-20250329    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250329    gcc-14.2.0
riscv                 randconfig-002-20250329    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250329    gcc-8.5.0
s390                  randconfig-002-20250329    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250329    gcc-5.5.0
sh                    randconfig-002-20250329    gcc-11.5.0
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-21
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250329    gcc-8.5.0
sparc                 randconfig-002-20250329    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250329    gcc-6.5.0
sparc64               randconfig-002-20250329    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250329    gcc-12
um                    randconfig-002-20250329    gcc-12
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250329    clang-20
x86_64      buildonly-randconfig-002-20250329    gcc-12
x86_64      buildonly-randconfig-003-20250329    gcc-12
x86_64      buildonly-randconfig-004-20250329    clang-20
x86_64      buildonly-randconfig-005-20250329    clang-20
x86_64      buildonly-randconfig-006-20250329    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250330    clang-20
x86_64                randconfig-002-20250330    clang-20
x86_64                randconfig-003-20250330    clang-20
x86_64                randconfig-004-20250330    clang-20
x86_64                randconfig-005-20250330    clang-20
x86_64                randconfig-006-20250330    clang-20
x86_64                randconfig-007-20250330    clang-20
x86_64                randconfig-008-20250330    clang-20
x86_64                randconfig-071-20250330    clang-20
x86_64                randconfig-072-20250330    clang-20
x86_64                randconfig-073-20250330    clang-20
x86_64                randconfig-074-20250330    clang-20
x86_64                randconfig-075-20250330    clang-20
x86_64                randconfig-076-20250330    clang-20
x86_64                randconfig-077-20250330    clang-20
x86_64                randconfig-078-20250330    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250329    gcc-10.5.0
xtensa                randconfig-002-20250329    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
