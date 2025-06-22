Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8930E85D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562274; cv=none; b=HzD2WH5MdmXDZKw8Hr/IgH3KCAoFG/7KIs1jyVben5EjP6WwpE7y34jDSHQIkAn8nMOyDE5+zIzI7FUpUizE4WuG8Oc91hRLDLuuou4lb9pLWKYtL5Q5RGL2luvIYdAh09NvGEkt2UC6VvWB7efYduAIywlQAMP7J494YdjXP1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562274; c=relaxed/simple;
	bh=JtsyAtq8TVhLqZNvis7dweWcWT/0BXuVigMNKwz6VQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ciJqRnJD3pzZQIapqcGWMOpJDxABgDzX2Eb+xwPdjIRyoCjExm2nU8+4fFcwz264Atz1EXxo5R/jjauERggY/0FGB+zBoSjwrw9AN2vt2+N7x/4HNIe0S4w0eHviFv8TvDLK/G1Lo3zl9OooIq72s5g2VvMH3bXyrJmRvlOfhT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsyEC74M; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsyEC74M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750562273; x=1782098273;
  h=date:from:to:cc:subject:message-id;
  bh=JtsyAtq8TVhLqZNvis7dweWcWT/0BXuVigMNKwz6VQQ=;
  b=HsyEC74MqKCZ1/00J0fxF8ew6LqJFzh4H9eOhCXT0/cHRooiz0j5DyES
   gE1EcFu1jRtjT3fVNTPJF8qvu5HHaGDOthWYHRvAdR/pWtTO13qmOtSLb
   rwKuvrCMB3P0ZLOHjZFHrcgnQCG4Cd0/Wkf3K42eOG7jmn7W6LPkHdnkq
   dJIeiPsPvkzBl5+hkmyyCFpNWXwe19A4bQ+49t8ekYJMbPl9XXSOPAk14
   ud/AZKvsSJIaJH7T4/3lsD1NzLtVvqOr6wGi7h6NB/H1u8XPRVkRkvM0l
   2TZbcxA3fuiaVSBz7jnCXXj3cTWeoZsU9IeRmEwHqM2N2B4yN3SckVX2X
   g==;
X-CSE-ConnectionGUID: fTsJbJ3/SQiAId4kjMRd2g==
X-CSE-MsgGUID: zWLA0ydXS66d1ngztGSnKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="75321809"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="75321809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 20:17:52 -0700
X-CSE-ConnectionGUID: X1LoXnm3RayoKxSbVQwQNw==
X-CSE-MsgGUID: hm2m0kdoThOxpPm06bRGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="182291629"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jun 2025 20:17:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTBDJ-000N0r-0O;
	Sun, 22 Jun 2025 03:17:49 +0000
Date: Sun, 22 Jun 2025 11:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/boot] BUILD SUCCESS
 61b57d35396a4b4bcca9944644b24fc6015976b5
Message-ID: <202506221126.AH3y2xvP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: 61b57d35396a4b4bcca9944644b24fc6015976b5  x86/efi: Implement support for embedding SBAT data for x86

elapsed time: 854m

configs tested: 130
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250621    gcc-8.5.0
arc                   randconfig-002-20250621    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250621    clang-21
arm                   randconfig-002-20250621    gcc-15.1.0
arm                   randconfig-003-20250621    clang-20
arm                   randconfig-004-20250621    gcc-8.5.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250621    clang-21
arm64                 randconfig-002-20250621    gcc-15.1.0
arm64                 randconfig-003-20250621    clang-17
arm64                 randconfig-004-20250621    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250621    gcc-15.1.0
csky                  randconfig-002-20250621    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250621    clang-21
hexagon               randconfig-002-20250621    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250621    clang-20
i386        buildonly-randconfig-002-20250621    gcc-12
i386        buildonly-randconfig-003-20250621    clang-20
i386        buildonly-randconfig-004-20250621    clang-20
i386        buildonly-randconfig-005-20250621    clang-20
i386        buildonly-randconfig-006-20250621    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250621    gcc-12.4.0
loongarch             randconfig-002-20250621    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250621    gcc-9.3.0
nios2                 randconfig-002-20250621    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250621    gcc-10.5.0
parisc                randconfig-002-20250621    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250621    clang-17
powerpc               randconfig-002-20250621    clang-19
powerpc               randconfig-003-20250621    gcc-8.5.0
powerpc                     redwood_defconfig    clang-21
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc                     tqm8548_defconfig    clang-21
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250621    gcc-11.5.0
powerpc64             randconfig-002-20250621    gcc-13.3.0
powerpc64             randconfig-003-20250621    gcc-11.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250621    clang-21
riscv                 randconfig-002-20250621    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250621    clang-21
s390                  randconfig-002-20250621    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250621    gcc-15.1.0
sh                    randconfig-002-20250621    gcc-15.1.0
sh                          sdk7780_defconfig    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250621    gcc-15.1.0
sparc                 randconfig-002-20250621    gcc-15.1.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250621    gcc-8.5.0
sparc64               randconfig-002-20250621    gcc-13.3.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250621    clang-21
um                    randconfig-002-20250621    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250621    gcc-12
x86_64      buildonly-randconfig-002-20250621    clang-20
x86_64      buildonly-randconfig-003-20250621    gcc-12
x86_64      buildonly-randconfig-004-20250621    gcc-12
x86_64      buildonly-randconfig-005-20250621    gcc-12
x86_64      buildonly-randconfig-006-20250621    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250621    gcc-12.4.0
xtensa                randconfig-002-20250621    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
