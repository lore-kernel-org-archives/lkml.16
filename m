Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343512747B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829749; cv=none; b=QMVihgJLl1KPOwwBbqPlayhGESQ/ifxklZPxPfiiAhqaZOgyl+RVqbsAowalXG1hc8MxE2LKSV99pSi7fYRqBJuVLlP2ZH7WbnMYbn9L0f6biAUVBQXR8E2CarFqu+UWbXf5qxPrutlVGfp4bdToA3EF+WCThy5aKIWn5lfbJPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829749; c=relaxed/simple;
	bh=S0pwW0TPvzZ28VXAzMe/lm02EVM/6B3EALdEnyj5Mfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AEAnmJYiYz/qCSFO+cdYmLc8CHVS3PA7fxAghe41KLcJOcVI8tDjvLdqzF3PKBoXsxJuYKVbOXuGTKC4UgtI7Zfh7RcWhSHBYLUeNlLqWUCGkJQEWMDDEwuDe1yAYd43/+opYoqG8CgXxqCsmJAELbT7OsDa/ZTpUZ5lCvbasso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEaU8X7m; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEaU8X7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746829747; x=1778365747;
  h=date:from:to:cc:subject:message-id;
  bh=S0pwW0TPvzZ28VXAzMe/lm02EVM/6B3EALdEnyj5Mfw=;
  b=iEaU8X7mQp6acn17jmHYYYw6SzGFTuhW3cxUHfOQWUPYRTU2YymeNpE7
   tUzjimAahts1rV2JBsLdcqLBMYUncmS24El3lCIPxvMevgCE4JLc9hXfT
   ub+hQRb2mzG5gjx4W7orvK4VR6R/6KiNldtFIPShzPHn2+k1iCed/JmEt
   5e15lBlrXJxJXo8mV4Ap/G2kTYTGibT4qPeg61kcIvygx++lC+VwxaneK
   zmXx1DJM6mVfgv1oms06oS2n+Adw46TrpoZOCZgh2ISxr/kZVm3YQSp1j
   sgc37Q25VUNIU/0e6C8HwkpgrAepR4ZEno8t3gOjbUuRVocKgTx7WiFbR
   w==;
X-CSE-ConnectionGUID: YpwTkUuYQTSQBwlYqyBh2Q==
X-CSE-MsgGUID: fEGXsCcqQnW0uwaEzpz+mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48794516"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48794516"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 15:29:06 -0700
X-CSE-ConnectionGUID: hBXkn2adST2ijvtCivS1RQ==
X-CSE-MsgGUID: Tyae6EjGTQOoqz0i45OOqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141704514"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2025 15:29:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDWDG-000CXj-2j;
	Fri, 09 May 2025 22:29:02 +0000
Date: Sat, 10 May 2025 06:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu/next] BUILD SUCCESS
 e55dc2e5b2e3f517d45805f51c6eafff774f2bd1
Message-ID: <202505100658.TzLxuXSb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: e55dc2e5b2e3f517d45805f51c6eafff774f2bd1  Merge branches 'lkmm.2025.04.22a' and 'ratelimit.2025.05.08a' into HEAD

elapsed time: 1368m

configs tested: 246
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250509    gcc-13.3.0
arc                   randconfig-001-20250510    gcc-8.5.0
arc                   randconfig-002-20250509    gcc-13.3.0
arc                   randconfig-002-20250510    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                        multi_v5_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250509    gcc-7.5.0
arm                   randconfig-001-20250510    gcc-8.5.0
arm                   randconfig-002-20250509    gcc-6.5.0
arm                   randconfig-002-20250510    gcc-8.5.0
arm                   randconfig-003-20250509    gcc-10.5.0
arm                   randconfig-003-20250510    gcc-8.5.0
arm                   randconfig-004-20250509    clang-21
arm                   randconfig-004-20250510    gcc-8.5.0
arm                          sp7021_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250509    gcc-7.5.0
arm64                 randconfig-001-20250510    gcc-8.5.0
arm64                 randconfig-002-20250509    gcc-7.5.0
arm64                 randconfig-002-20250510    gcc-8.5.0
arm64                 randconfig-003-20250509    clang-21
arm64                 randconfig-003-20250510    gcc-8.5.0
arm64                 randconfig-004-20250509    gcc-5.5.0
arm64                 randconfig-004-20250510    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250509    gcc-14.2.0
csky                  randconfig-001-20250510    clang-18
csky                  randconfig-002-20250509    gcc-13.3.0
csky                  randconfig-002-20250510    clang-18
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250509    clang-20
hexagon               randconfig-001-20250510    clang-18
hexagon               randconfig-002-20250509    clang-21
hexagon               randconfig-002-20250510    clang-18
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250509    gcc-11
i386        buildonly-randconfig-002-20250509    gcc-12
i386        buildonly-randconfig-003-20250509    clang-20
i386        buildonly-randconfig-004-20250509    clang-20
i386        buildonly-randconfig-005-20250509    gcc-12
i386        buildonly-randconfig-006-20250509    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250510    gcc-12
i386                  randconfig-002-20250510    gcc-12
i386                  randconfig-003-20250510    gcc-12
i386                  randconfig-004-20250510    gcc-12
i386                  randconfig-005-20250510    gcc-12
i386                  randconfig-006-20250510    gcc-12
i386                  randconfig-007-20250510    gcc-12
i386                  randconfig-011-20250510    clang-20
i386                  randconfig-012-20250510    clang-20
i386                  randconfig-013-20250510    clang-20
i386                  randconfig-014-20250510    clang-20
i386                  randconfig-015-20250510    clang-20
i386                  randconfig-016-20250510    clang-20
i386                  randconfig-017-20250510    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250509    gcc-13.3.0
loongarch             randconfig-001-20250510    clang-18
loongarch             randconfig-002-20250509    gcc-14.2.0
loongarch             randconfig-002-20250510    clang-18
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    clang-21
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-17
mips                        maltaup_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250509    gcc-13.3.0
nios2                 randconfig-001-20250510    clang-18
nios2                 randconfig-002-20250509    gcc-13.3.0
nios2                 randconfig-002-20250510    clang-18
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    clang-21
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250509    gcc-6.5.0
parisc                randconfig-001-20250510    clang-18
parisc                randconfig-002-20250509    gcc-14.2.0
parisc                randconfig-002-20250510    clang-18
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc                      pcm030_defconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250509    clang-16
powerpc               randconfig-001-20250510    clang-18
powerpc               randconfig-002-20250509    gcc-5.5.0
powerpc               randconfig-002-20250510    clang-18
powerpc               randconfig-003-20250509    gcc-7.5.0
powerpc               randconfig-003-20250510    clang-18
powerpc64             randconfig-001-20250509    gcc-7.5.0
powerpc64             randconfig-001-20250510    clang-18
powerpc64             randconfig-002-20250509    clang-21
powerpc64             randconfig-002-20250510    clang-18
powerpc64             randconfig-003-20250509    gcc-10.5.0
powerpc64             randconfig-003-20250510    clang-18
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250509    clang-21
riscv                 randconfig-001-20250510    clang-21
riscv                 randconfig-002-20250509    clang-21
riscv                 randconfig-002-20250510    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250509    clang-21
s390                  randconfig-001-20250510    clang-21
s390                  randconfig-002-20250509    clang-17
s390                  randconfig-002-20250510    clang-21
sh                               alldefconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    clang-21
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250509    gcc-9.3.0
sh                    randconfig-001-20250510    clang-21
sh                    randconfig-002-20250509    gcc-5.5.0
sh                    randconfig-002-20250510    clang-21
sh                          rsk7201_defconfig    clang-21
sh                          rsk7203_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250509    gcc-6.5.0
sparc                 randconfig-001-20250510    clang-21
sparc                 randconfig-002-20250509    gcc-6.5.0
sparc                 randconfig-002-20250510    clang-21
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250509    gcc-10.5.0
sparc64               randconfig-001-20250510    clang-21
sparc64               randconfig-002-20250509    gcc-6.5.0
sparc64               randconfig-002-20250510    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250509    clang-21
um                    randconfig-001-20250510    clang-21
um                    randconfig-002-20250509    gcc-12
um                    randconfig-002-20250510    clang-21
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250509    gcc-11
x86_64      buildonly-randconfig-001-20250510    clang-20
x86_64      buildonly-randconfig-002-20250509    gcc-11
x86_64      buildonly-randconfig-002-20250510    clang-20
x86_64      buildonly-randconfig-003-20250509    clang-20
x86_64      buildonly-randconfig-003-20250510    clang-20
x86_64      buildonly-randconfig-004-20250509    clang-20
x86_64      buildonly-randconfig-004-20250510    clang-20
x86_64      buildonly-randconfig-005-20250509    gcc-12
x86_64      buildonly-randconfig-005-20250510    clang-20
x86_64      buildonly-randconfig-006-20250509    gcc-12
x86_64      buildonly-randconfig-006-20250510    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250510    clang-20
x86_64                randconfig-002-20250510    clang-20
x86_64                randconfig-003-20250510    clang-20
x86_64                randconfig-004-20250510    clang-20
x86_64                randconfig-005-20250510    clang-20
x86_64                randconfig-006-20250510    clang-20
x86_64                randconfig-007-20250510    clang-20
x86_64                randconfig-008-20250510    clang-20
x86_64                randconfig-071-20250510    gcc-11
x86_64                randconfig-072-20250510    gcc-11
x86_64                randconfig-073-20250510    gcc-11
x86_64                randconfig-074-20250510    gcc-11
x86_64                randconfig-075-20250510    gcc-11
x86_64                randconfig-076-20250510    gcc-11
x86_64                randconfig-077-20250510    gcc-11
x86_64                randconfig-078-20250510    gcc-11
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250509    gcc-12.4.0
xtensa                randconfig-001-20250510    clang-21
xtensa                randconfig-002-20250509    gcc-14.2.0
xtensa                randconfig-002-20250510    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
