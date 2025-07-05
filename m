Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D48B7080E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751711808; cv=none; b=kwTjcAI05Xqjr+VWGmR+GvJHn/oNz7+3P0Qu0lWfCU7jp2twcibijUmqZYtfwaYcr6UX1z7oZnZWWlXfv68UU2gCCgqIlHZVlmvGgSuicRmuoGebl3y6oXfDAlyM5En7faEpu2brOhJXYW3yYPUdHpZ6aLRt8g+MRILCLg0CNtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751711808; c=relaxed/simple;
	bh=JtS9LMwW6B/XemYbNVUJe76hByCxwgPj8bdWwbwh8+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N1+r7AXU3BrEC6P+Suap/HWUc50ihkCdyOLAP/jAkX36eaFfJJkSflhaV9JDMQro5XeNtnB9DktHlo37/wruxiVj/bH/vrnYfDr7SZHkJ4gHxOP6+K4NEBdL7EtS6F7COHEFsyoqpzczFsX4SU8cpKH35k5jalqweG+La9AVhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SF6Sg3Pb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SF6Sg3Pb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751711807; x=1783247807;
  h=date:from:to:cc:subject:message-id;
  bh=JtS9LMwW6B/XemYbNVUJe76hByCxwgPj8bdWwbwh8+k=;
  b=SF6Sg3PbkIOuf2UDJEs5Y5Om25GYNHCYiDtnMK0opFtguUE20Lm4PALV
   tb9QD4PX6mHOgiPBh1O/Zn8UboMyT/FCTG9hsqVoWW1Vfj+gIKDKIX7yF
   yCJW3yJr9dtNTfFmSgmndF9b2UHpw9CtLZrbPRb+TOQyeOtvvbousUZny
   t2numaP8Rq8taX7Pr9EcgsPdDZ7pUixftX4dw9p2cNK/xrbpq+/VkPpnd
   6fi5wFc3hvHrjMa2ni38c9vaWEGRVgnMvpsgWfsa7Yg/A5e5IZpF3GsFU
   IvEbpejqEYNljf5DgogBorIgVyoUQKf8foHhQspU6RaxphsEI+d1tIgQe
   g==;
X-CSE-ConnectionGUID: n2NfwoX5TBGuXTC3J4yRdw==
X-CSE-MsgGUID: xjkX+TCIRq61Vce6I1TQbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53874786"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="53874786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 03:36:47 -0700
X-CSE-ConnectionGUID: HQL/G9V/TSu/D/a38opl8Q==
X-CSE-MsgGUID: p9Q6XAE6Qxek3Nab+QGT7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="154550094"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jul 2025 03:36:45 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY0GA-0004Rj-2W;
	Sat, 05 Jul 2025 10:36:42 +0000
Date: Sat, 05 Jul 2025 18:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 a26f93a17fcd2853291d9148572ac5fbd54b027b
Message-ID: <202507051802.DHoNtDOg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: a26f93a17fcd2853291d9148572ac5fbd54b027b  Merge sched/urgent into tip/urgent

elapsed time: 1128m

configs tested: 240
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250705    clang-21
arc                   randconfig-001-20250705    gcc-8.5.0
arc                   randconfig-002-20250705    clang-21
arc                   randconfig-002-20250705    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250705    clang-21
arm                   randconfig-001-20250705    gcc-12.4.0
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250705    clang-21
arm                   randconfig-003-20250705    gcc-8.5.0
arm                   randconfig-004-20250705    clang-21
arm                   randconfig-004-20250705    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250705    clang-21
arm64                 randconfig-001-20250705    gcc-10.5.0
arm64                 randconfig-002-20250705    clang-17
arm64                 randconfig-002-20250705    clang-21
arm64                 randconfig-003-20250705    clang-21
arm64                 randconfig-003-20250705    gcc-11.5.0
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250705    gcc-10.5.0
csky                  randconfig-001-20250705    gcc-9.3.0
csky                  randconfig-002-20250705    gcc-15.1.0
csky                  randconfig-002-20250705    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250705    clang-19
hexagon               randconfig-001-20250705    gcc-9.3.0
hexagon               randconfig-002-20250705    clang-21
hexagon               randconfig-002-20250705    gcc-9.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250705    gcc-11
i386        buildonly-randconfig-001-20250705    gcc-12
i386        buildonly-randconfig-002-20250705    clang-20
i386        buildonly-randconfig-002-20250705    gcc-12
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250705    clang-20
i386        buildonly-randconfig-006-20250705    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250705    gcc-12
i386                  randconfig-002-20250705    gcc-12
i386                  randconfig-003-20250705    gcc-12
i386                  randconfig-004-20250705    gcc-12
i386                  randconfig-005-20250705    gcc-12
i386                  randconfig-006-20250705    gcc-12
i386                  randconfig-007-20250705    gcc-12
i386                  randconfig-011-20250705    clang-20
i386                  randconfig-012-20250705    clang-20
i386                  randconfig-013-20250705    clang-20
i386                  randconfig-014-20250705    clang-20
i386                  randconfig-015-20250705    clang-20
i386                  randconfig-016-20250705    clang-20
i386                  randconfig-017-20250705    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250705    gcc-15.1.0
loongarch             randconfig-001-20250705    gcc-9.3.0
loongarch             randconfig-002-20250705    gcc-15.1.0
loongarch             randconfig-002-20250705    gcc-9.3.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    clang-21
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                     cu1000-neo_defconfig    clang-21
mips                      pic32mzda_defconfig    clang-21
nios2                            allmodconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    clang-21
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250705    gcc-8.5.0
nios2                 randconfig-001-20250705    gcc-9.3.0
nios2                 randconfig-002-20250705    gcc-9.3.0
openrisc                         allmodconfig    clang-21
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250705    gcc-9.3.0
parisc                randconfig-002-20250705    gcc-13.4.0
parisc                randconfig-002-20250705    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250705    gcc-11.5.0
powerpc               randconfig-001-20250705    gcc-9.3.0
powerpc               randconfig-002-20250705    gcc-9.3.0
powerpc               randconfig-003-20250705    gcc-12.4.0
powerpc               randconfig-003-20250705    gcc-9.3.0
powerpc64             randconfig-001-20250705    clang-21
powerpc64             randconfig-001-20250705    gcc-9.3.0
powerpc64             randconfig-002-20250705    clang-21
powerpc64             randconfig-002-20250705    gcc-9.3.0
powerpc64             randconfig-003-20250705    clang-21
powerpc64             randconfig-003-20250705    gcc-9.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250705    clang-21
riscv                 randconfig-001-20250705    gcc-12
riscv                 randconfig-002-20250705    gcc-12
riscv                 randconfig-002-20250705    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250705    clang-21
s390                  randconfig-001-20250705    gcc-12
s390                  randconfig-002-20250705    clang-21
s390                  randconfig-002-20250705    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250705    gcc-12
sh                    randconfig-001-20250705    gcc-15.1.0
sh                    randconfig-002-20250705    gcc-12
sh                    randconfig-002-20250705    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-21
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250705    gcc-12
sparc                 randconfig-001-20250705    gcc-13.4.0
sparc                 randconfig-002-20250705    gcc-12
sparc                 randconfig-002-20250705    gcc-8.5.0
sparc64                          allmodconfig    clang-21
sparc64                          allyesconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250705    gcc-12
sparc64               randconfig-001-20250705    gcc-8.5.0
sparc64               randconfig-002-20250705    clang-20
sparc64               randconfig-002-20250705    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250705    clang-20
x86_64      buildonly-randconfig-003-20250705    gcc-12
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250705    clang-20
x86_64      buildonly-randconfig-006-20250705    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250705    clang-20
x86_64                randconfig-002-20250705    clang-20
x86_64                randconfig-003-20250705    clang-20
x86_64                randconfig-004-20250705    clang-20
x86_64                randconfig-005-20250705    clang-20
x86_64                randconfig-006-20250705    clang-20
x86_64                randconfig-007-20250705    clang-20
x86_64                randconfig-008-20250705    clang-20
x86_64                randconfig-071-20250705    clang-20
x86_64                randconfig-072-20250705    clang-20
x86_64                randconfig-073-20250705    clang-20
x86_64                randconfig-074-20250705    clang-20
x86_64                randconfig-075-20250705    clang-20
x86_64                randconfig-076-20250705    clang-20
x86_64                randconfig-077-20250705    clang-20
x86_64                randconfig-078-20250705    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-21
xtensa                randconfig-001-20250705    gcc-12
xtensa                randconfig-001-20250705    gcc-12.4.0
xtensa                randconfig-002-20250705    gcc-12
xtensa                randconfig-002-20250705    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
