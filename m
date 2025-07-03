Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1758D2C15BC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530262; cv=none; b=ZM5myQfHd0xUqcnJLqeiKwX/LCfDGPIQ0doxFKWljMTGcBQHHrMabxPnzX3DflVy31LOEGR1CFaD5rstwSh4MKM0C65XjtiAG+19HUIJtXCY4s85aT6wYoSAPhxt8UrbM/6lzxxDKuIbQTeCvmUFwrBHUqy37HvmXKYbMOHJp0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530262; c=relaxed/simple;
	bh=uJnBDSqypXoXgeVLTGaSgcYhkxCq3hZM4Yyw9U+m6R8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iyNM35nXvQgaJIcZQ3T1GSsZULelO455C9FRAxKEAOVSAiipq9STQDR6zJDm3/ILc6dD1jdkRrYglP7SfO34w0oheCYSFsyqzdHJtOVQp0AHv0kBbztzYGZohEZ5CqZhnK96urTYnpm2Z5WaeaA7Q5rqNXQG2Mpke4JVQa42mMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeB3XNyg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeB3XNyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751530260; x=1783066260;
  h=date:from:to:cc:subject:message-id;
  bh=uJnBDSqypXoXgeVLTGaSgcYhkxCq3hZM4Yyw9U+m6R8=;
  b=SeB3XNyg3T0IzDXts83Ckvcr0hPuSNSRqP9uIwRaniA8IjgHtag/VWLW
   ygQ2a0XfZZ67zEHL0Sz7nxzRs+pTjWuCbzRPUX//EqeGUWYWvDFcaoZz7
   /63lIr4xdNZPnDYu4l4jT8rA0lnB9SXJ4uSOiAHaXXkZrxMk/wBuWgExW
   I86/e09Fzr5TFW7wRR+AH7j0Z7hTecBu13c5JuyGFuCgFwLXLqG2cfS5J
   oWZfzr8T+CFbw/SY85/yfQVO9K55E4dft3WFGVtmVjD6pQUQHmbwJszDc
   H3DA3orx+4kPDGntHjBsMU6GCC2k1bQgVHN5NpkDYSyggSTiabNOkhrVG
   w==;
X-CSE-ConnectionGUID: V9yxnDFhS/Gv6erV/4PnyQ==
X-CSE-MsgGUID: On4lmTFFRamfzpr4vRZgGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53958519"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="53958519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 01:10:56 -0700
X-CSE-ConnectionGUID: IGOd+b8WQJGwQ4bSLPEX0g==
X-CSE-MsgGUID: 1wYomQUsQi22BghhCfy+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="185324410"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2025 01:10:55 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXF1w-0001ba-0m;
	Thu, 03 Jul 2025 08:10:52 +0000
Date: Thu, 03 Jul 2025 16:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 a4585558a904c253ba8b71a016718e971e8b0d1c
Message-ID: <202507031639.p9iKtGHJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: a4585558a904c253ba8b71a016718e971e8b0d1c  Merge core/bugs into tip/master

elapsed time: 756m

configs tested: 213
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-001-20250703    gcc-8.5.0
arc                   randconfig-002-20250703    gcc-12.4.0
arc                   randconfig-002-20250703    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-001-20250703    gcc-8.5.0
arm                   randconfig-002-20250703    gcc-8.5.0
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-003-20250703    gcc-8.5.0
arm                   randconfig-004-20250703    clang-21
arm                   randconfig-004-20250703    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-001-20250703    gcc-8.5.0
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-002-20250703    gcc-8.5.0
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-003-20250703    gcc-8.5.0
arm64                 randconfig-004-20250703    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-001-20250703    gcc-8.5.0
csky                  randconfig-002-20250703    gcc-12.4.0
csky                  randconfig-002-20250703    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250703    clang-21
hexagon               randconfig-001-20250703    gcc-8.5.0
hexagon               randconfig-002-20250703    clang-21
hexagon               randconfig-002-20250703    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250703    clang-20
i386        buildonly-randconfig-001-20250703    gcc-12
i386        buildonly-randconfig-002-20250703    gcc-12
i386        buildonly-randconfig-003-20250703    gcc-12
i386        buildonly-randconfig-004-20250703    clang-20
i386        buildonly-randconfig-004-20250703    gcc-12
i386        buildonly-randconfig-005-20250703    gcc-12
i386        buildonly-randconfig-006-20250703    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250703    clang-20
i386                  randconfig-002-20250703    clang-20
i386                  randconfig-003-20250703    clang-20
i386                  randconfig-004-20250703    clang-20
i386                  randconfig-005-20250703    clang-20
i386                  randconfig-006-20250703    clang-20
i386                  randconfig-007-20250703    clang-20
i386                  randconfig-011-20250703    clang-20
i386                  randconfig-012-20250703    clang-20
i386                  randconfig-013-20250703    clang-20
i386                  randconfig-014-20250703    clang-20
i386                  randconfig-015-20250703    clang-20
i386                  randconfig-016-20250703    clang-20
i386                  randconfig-017-20250703    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-8.5.0
loongarch             randconfig-002-20250703    gcc-15.1.0
loongarch             randconfig-002-20250703    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250703    gcc-8.5.0
nios2                 randconfig-002-20250703    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250703    gcc-8.5.0
parisc                randconfig-002-20250703    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250703    gcc-10.5.0
powerpc               randconfig-001-20250703    gcc-8.5.0
powerpc               randconfig-002-20250703    clang-21
powerpc               randconfig-002-20250703    gcc-8.5.0
powerpc               randconfig-003-20250703    gcc-8.5.0
powerpc64             randconfig-001-20250703    clang-18
powerpc64             randconfig-001-20250703    gcc-8.5.0
powerpc64             randconfig-002-20250703    clang-21
powerpc64             randconfig-002-20250703    gcc-8.5.0
powerpc64             randconfig-003-20250703    gcc-14.3.0
powerpc64             randconfig-003-20250703    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250703    gcc-12
riscv                 randconfig-001-20250703    gcc-13.3.0
riscv                 randconfig-002-20250703    gcc-12
riscv                 randconfig-002-20250703    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250703    gcc-12
s390                  randconfig-001-20250703    gcc-12.4.0
s390                  randconfig-002-20250703    clang-21
s390                  randconfig-002-20250703    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250703    gcc-12
sh                    randconfig-001-20250703    gcc-9.3.0
sh                    randconfig-002-20250703    gcc-12
sh                    randconfig-002-20250703    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                 randconfig-001-20250703    gcc-12
sparc                 randconfig-001-20250703    gcc-8.5.0
sparc                 randconfig-002-20250703    gcc-12
sparc                 randconfig-002-20250703    gcc-13.3.0
sparc64                          allmodconfig    gcc-15.1.0
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250703    gcc-12
sparc64               randconfig-001-20250703    gcc-8.5.0
sparc64               randconfig-002-20250703    gcc-12
sparc64               randconfig-002-20250703    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250703    gcc-12
um                    randconfig-002-20250703    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250703    gcc-11
x86_64      buildonly-randconfig-001-20250703    gcc-12
x86_64      buildonly-randconfig-002-20250703    gcc-12
x86_64      buildonly-randconfig-003-20250703    clang-20
x86_64      buildonly-randconfig-003-20250703    gcc-12
x86_64      buildonly-randconfig-004-20250703    clang-20
x86_64      buildonly-randconfig-004-20250703    gcc-12
x86_64      buildonly-randconfig-005-20250703    gcc-12
x86_64      buildonly-randconfig-006-20250703    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250703    clang-20
x86_64                randconfig-002-20250703    clang-20
x86_64                randconfig-003-20250703    clang-20
x86_64                randconfig-004-20250703    clang-20
x86_64                randconfig-005-20250703    clang-20
x86_64                randconfig-006-20250703    clang-20
x86_64                randconfig-007-20250703    clang-20
x86_64                randconfig-008-20250703    clang-20
x86_64                randconfig-071-20250703    gcc-12
x86_64                randconfig-072-20250703    gcc-12
x86_64                randconfig-073-20250703    gcc-12
x86_64                randconfig-074-20250703    gcc-12
x86_64                randconfig-075-20250703    gcc-12
x86_64                randconfig-076-20250703    gcc-12
x86_64                randconfig-077-20250703    gcc-12
x86_64                randconfig-078-20250703    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20250703    gcc-12
xtensa                randconfig-001-20250703    gcc-14.3.0
xtensa                randconfig-002-20250703    gcc-12
xtensa                randconfig-002-20250703    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
