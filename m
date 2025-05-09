Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE32609D9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746821937; cv=none; b=t7VTx7U4Gt9VqWtT2OrNtVWJUYvyC3fckMpaSGlpVk9IjN5ih9ldddalucIGzt1PRsryon5YdVOxuOHtCJIfLLqfejMVR7lNVodU4H0g6X3883AI+npjKGVRD1cRXAYrnZTG1GtdGu5IXiXkxgbYCaSPauYD9tGd0IFufTRKud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746821937; c=relaxed/simple;
	bh=keTnKQmfzM2LYqGGFrm259n15BZSFdgOsSoqw3Aw0uM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q4qjpuSIfXlD9e4fsJF+gUdWKIdlyBoxIar7cAUZXKrFK+dVBsICkVP7vEFnT/EZuXNOHlCag687cWdFgRJYQ+qpSUz2OlYpXiqt1nR18A3HMEOMWYVs/2/9jB74h9i35uc4/pfQRhXZ+losAfBQJ/8BKmXpMj2z6YY94q/0VeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/heBrTy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/heBrTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746821936; x=1778357936;
  h=date:from:to:cc:subject:message-id;
  bh=keTnKQmfzM2LYqGGFrm259n15BZSFdgOsSoqw3Aw0uM=;
  b=B/heBrTy/agoqlDYPJJ3YnQYt9pWdvyb59vJGYTTgb2S9H9t9e2v/GxU
   pyaHlhsD41+n4rZ4Zb2qIabVis0w0gfR0xt79wSSteNdX19LtCJZZF8zd
   664sLkHW712tJ2ZNZZp63c+AE3ePFpq35Khvd46Sd9ig+cs3gpJl30cFW
   K71xXzXAXk0hQ4f93juLZIqG+jOvzZLXZH1GI7oaENwBEVktVcNliBKO1
   nbJuaYdp+6OnjJn91jujjFb445S/zLLT/cmsEhGYWHWnkF66UQr16YQtb
   Rd36Vqm90SJXK0m4Df5xGvvySrBGy8pUYEnvi9Ab+QUDw+eyDbV/jCx0a
   w==;
X-CSE-ConnectionGUID: Bo56gNTCTua6oiQJvtoWtQ==
X-CSE-MsgGUID: 0GE03jQxTK+fDvWl0VNTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52471551"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="52471551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 13:18:54 -0700
X-CSE-ConnectionGUID: z+VmGiJqTkWZ5ec2Mxt1TA==
X-CSE-MsgGUID: QtdEw5WuR9uUrZZnuKIzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="167802113"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2025 13:18:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDUBG-000CQl-24;
	Fri, 09 May 2025 20:18:50 +0000
Date: Sat, 10 May 2025 04:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/futex] BUILD SUCCESS
 01475aedfdfa33a5ee3219079426f5743367c624
Message-ID: <202505100432.CFKGdul4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/futex
branch HEAD: 01475aedfdfa33a5ee3219079426f5743367c624  futex: Fix outdated comment in struct restart_block

elapsed time: 1459m

configs tested: 257
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-21
arc                   randconfig-001-20250509    clang-21
arc                   randconfig-001-20250509    gcc-13.3.0
arc                   randconfig-002-20250509    clang-21
arc                   randconfig-002-20250509    gcc-13.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    clang-21
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-21
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250509    clang-21
arm                   randconfig-001-20250509    gcc-7.5.0
arm                   randconfig-002-20250509    clang-21
arm                   randconfig-002-20250509    gcc-6.5.0
arm                   randconfig-003-20250509    clang-21
arm                   randconfig-003-20250509    gcc-10.5.0
arm                   randconfig-004-20250509    clang-21
arm                          sp7021_defconfig    clang-21
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250509    clang-21
arm64                 randconfig-001-20250509    gcc-7.5.0
arm64                 randconfig-002-20250509    clang-21
arm64                 randconfig-002-20250509    gcc-7.5.0
arm64                 randconfig-003-20250509    clang-21
arm64                 randconfig-004-20250509    clang-21
arm64                 randconfig-004-20250509    gcc-5.5.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250509    gcc-13.3.0
csky                  randconfig-001-20250509    gcc-14.2.0
csky                  randconfig-002-20250509    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250509    clang-20
hexagon               randconfig-001-20250509    gcc-13.3.0
hexagon               randconfig-002-20250509    clang-21
hexagon               randconfig-002-20250509    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250509    clang-20
i386        buildonly-randconfig-001-20250509    gcc-11
i386        buildonly-randconfig-002-20250509    clang-20
i386        buildonly-randconfig-002-20250509    gcc-12
i386        buildonly-randconfig-003-20250509    clang-20
i386        buildonly-randconfig-004-20250509    clang-20
i386        buildonly-randconfig-005-20250509    clang-20
i386        buildonly-randconfig-005-20250509    gcc-12
i386        buildonly-randconfig-006-20250509    clang-20
i386        buildonly-randconfig-006-20250509    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250509    clang-20
i386                  randconfig-002-20250509    clang-20
i386                  randconfig-003-20250509    clang-20
i386                  randconfig-004-20250509    clang-20
i386                  randconfig-005-20250509    clang-20
i386                  randconfig-006-20250509    clang-20
i386                  randconfig-007-20250509    clang-20
i386                  randconfig-011-20250509    gcc-12
i386                  randconfig-012-20250509    gcc-12
i386                  randconfig-013-20250509    gcc-12
i386                  randconfig-014-20250509    gcc-12
i386                  randconfig-015-20250509    gcc-12
i386                  randconfig-016-20250509    gcc-12
i386                  randconfig-017-20250509    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250509    gcc-13.3.0
loongarch             randconfig-002-20250509    gcc-13.3.0
loongarch             randconfig-002-20250509    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                           gcw0_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                            allmodconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250509    gcc-13.3.0
nios2                 randconfig-002-20250509    gcc-13.3.0
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250509    gcc-13.3.0
parisc                randconfig-001-20250509    gcc-6.5.0
parisc                randconfig-002-20250509    gcc-13.3.0
parisc                randconfig-002-20250509    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-21
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250509    clang-16
powerpc               randconfig-001-20250509    gcc-13.3.0
powerpc               randconfig-002-20250509    gcc-13.3.0
powerpc               randconfig-002-20250509    gcc-5.5.0
powerpc               randconfig-003-20250509    gcc-13.3.0
powerpc               randconfig-003-20250509    gcc-7.5.0
powerpc64             randconfig-001-20250509    gcc-13.3.0
powerpc64             randconfig-001-20250509    gcc-7.5.0
powerpc64             randconfig-002-20250509    clang-21
powerpc64             randconfig-002-20250509    gcc-13.3.0
powerpc64             randconfig-003-20250509    gcc-10.5.0
powerpc64             randconfig-003-20250509    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250509    clang-21
riscv                 randconfig-001-20250509    gcc-12.4.0
riscv                 randconfig-002-20250509    clang-21
riscv                 randconfig-002-20250509    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250509    clang-21
s390                  randconfig-001-20250509    gcc-12.4.0
s390                  randconfig-002-20250509    clang-17
s390                  randconfig-002-20250509    gcc-12.4.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250509    gcc-12.4.0
sh                    randconfig-001-20250509    gcc-9.3.0
sh                    randconfig-002-20250509    gcc-12.4.0
sh                    randconfig-002-20250509    gcc-5.5.0
sh                          rsk7203_defconfig    clang-21
sh                          rsk7203_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-21
sh                           se7750_defconfig    clang-21
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250509    gcc-12.4.0
sparc                 randconfig-001-20250509    gcc-6.5.0
sparc                 randconfig-002-20250509    gcc-12.4.0
sparc                 randconfig-002-20250509    gcc-6.5.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250509    gcc-10.5.0
sparc64               randconfig-001-20250509    gcc-12.4.0
sparc64               randconfig-002-20250509    gcc-12.4.0
sparc64               randconfig-002-20250509    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250509    clang-21
um                    randconfig-001-20250509    gcc-12.4.0
um                    randconfig-002-20250509    gcc-12
um                    randconfig-002-20250509    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250509    gcc-11
x86_64      buildonly-randconfig-002-20250509    gcc-11
x86_64      buildonly-randconfig-003-20250509    clang-20
x86_64      buildonly-randconfig-003-20250509    gcc-11
x86_64      buildonly-randconfig-004-20250509    clang-20
x86_64      buildonly-randconfig-004-20250509    gcc-11
x86_64      buildonly-randconfig-005-20250509    gcc-11
x86_64      buildonly-randconfig-005-20250509    gcc-12
x86_64      buildonly-randconfig-006-20250509    gcc-11
x86_64      buildonly-randconfig-006-20250509    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250509    clang-20
x86_64                randconfig-002-20250509    clang-20
x86_64                randconfig-003-20250509    clang-20
x86_64                randconfig-004-20250509    clang-20
x86_64                randconfig-005-20250509    clang-20
x86_64                randconfig-006-20250509    clang-20
x86_64                randconfig-007-20250509    clang-20
x86_64                randconfig-008-20250509    clang-20
x86_64                randconfig-071-20250509    clang-20
x86_64                randconfig-072-20250509    clang-20
x86_64                randconfig-073-20250509    clang-20
x86_64                randconfig-074-20250509    clang-20
x86_64                randconfig-075-20250509    clang-20
x86_64                randconfig-076-20250509    clang-20
x86_64                randconfig-077-20250509    clang-20
x86_64                randconfig-078-20250509    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                randconfig-001-20250509    gcc-12.4.0
xtensa                randconfig-002-20250509    gcc-12.4.0
xtensa                randconfig-002-20250509    gcc-14.2.0
xtensa                         virt_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
