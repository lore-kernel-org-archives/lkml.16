Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56F1CDFA6
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738496442; cv=none; b=ZaAMVIaUIiLn7gZQ4kxbW5MCiU5kFlBPqXIGog8mziROeeyg2gHjgLRy5bN02DRq3Cfi3uoTOnPIEZgaNfEVanYQwsAPH4QNo9PNUxbwH5MIcw+pGnRm4a9uEqApMWTpOi2CArzAAac5Zxq9wzLIBLYmXm/sXmCE0LfJfXK1Evg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738496442; c=relaxed/simple;
	bh=NdJXBFbgFtJeKilD2j9PDiWMM6+5Vt0573aplqgamOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zx5cPKN+OPx2auAqS8uiuD+NfZ3JaGvquF0bVOVF9lkIA9xlZ120gICXAXPEpmcO3hACp6JoAu5ZiXDw9qf08FIC/ezUS+9CzpG4bVay3hbRm95XPUL1+PrlYr/tgvrLKKVgOEE8kou5K0PHLkfbSbI3ZXNmYi3wpHSrZYw1i4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6lZJiha; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6lZJiha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738496440; x=1770032440;
  h=date:from:to:cc:subject:message-id;
  bh=NdJXBFbgFtJeKilD2j9PDiWMM6+5Vt0573aplqgamOs=;
  b=O6lZJihaBcJ/9KzBE9joHSXiympdPNm4KLiGkjP8RczLcdRWyezXaI33
   kFZVK/BRvy/l3prgARhbWlastxtCqKobGrvrHHwDibt+F7SKrH+xAkoFY
   fKXCQk6ykQPlDnNYc2cphJjEgq5ANffXl1HMYqI68/fJp5xHu14dp+kyi
   IGdhk2mNAgwGVdDfXHYqUFDjCY87/IHO7vXRzZt+Cyw7VitO4J8r6r/A3
   QPB3izvbMd/eqY4jqkggQ7qvfGabbtS0X+6NcXtnkiYizfQ0TCMrFyGY5
   wuwZW5DLvTbPofYAsIsasAny1xjBy15LDiwWXQqUODdTZJYlgT9MD3tWK
   A==;
X-CSE-ConnectionGUID: 7623bn/lR7K0iaH8QoFcjA==
X-CSE-MsgGUID: JLVVtZKOQlai3+eqTPTIwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="26608636"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="26608636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 03:40:39 -0800
X-CSE-ConnectionGUID: 0i7PCTTpRkWrEtyr0rE0NA==
X-CSE-MsgGUID: +IrzTkRPRr6YSTDI1U0LHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115017042"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Feb 2025 03:40:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teYL5-000pdD-2R;
	Sun, 02 Feb 2025 11:40:35 +0000
Date: Sun, 02 Feb 2025 19:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 401d39f54085606e759cd7c38a82af146493d063
Message-ID: <202502021914.11V3QM57-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 401d39f54085606e759cd7c38a82af146493d063  Merge branch into tip/master: 'x86/urgent'

elapsed time: 965m

configs tested: 184
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250202    gcc-13.2.0
arc                   randconfig-002-20250202    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-21
arm                         lpc32xx_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-21
arm                        mvebu_v5_defconfig    clang-21
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250202    gcc-14.2.0
arm                   randconfig-002-20250202    clang-15
arm                   randconfig-003-20250202    clang-21
arm                   randconfig-004-20250202    clang-15
arm                           sama5_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250202    gcc-14.2.0
arm64                 randconfig-002-20250202    clang-17
arm64                 randconfig-003-20250202    gcc-14.2.0
arm64                 randconfig-004-20250202    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250202    gcc-14.2.0
csky                  randconfig-002-20250202    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250202    clang-16
hexagon               randconfig-002-20250202    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250202    gcc-12
i386        buildonly-randconfig-002-20250202    gcc-12
i386        buildonly-randconfig-003-20250202    gcc-12
i386        buildonly-randconfig-004-20250202    gcc-12
i386        buildonly-randconfig-005-20250202    gcc-12
i386        buildonly-randconfig-006-20250202    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250202    clang-19
i386                  randconfig-002-20250202    clang-19
i386                  randconfig-003-20250202    clang-19
i386                  randconfig-004-20250202    clang-19
i386                  randconfig-005-20250202    clang-19
i386                  randconfig-006-20250202    clang-19
i386                  randconfig-007-20250202    clang-19
i386                  randconfig-011-20250202    gcc-12
i386                  randconfig-012-20250202    gcc-12
i386                  randconfig-013-20250202    gcc-12
i386                  randconfig-014-20250202    gcc-12
i386                  randconfig-015-20250202    gcc-12
i386                  randconfig-016-20250202    gcc-12
i386                  randconfig-017-20250202    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250202    gcc-14.2.0
loongarch             randconfig-002-20250202    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-19
mips                            gpr_defconfig    clang-21
mips                           ip22_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250202    gcc-14.2.0
nios2                 randconfig-002-20250202    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250202    gcc-14.2.0
parisc                randconfig-002-20250202    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc               randconfig-001-20250202    clang-17
powerpc               randconfig-002-20250202    gcc-14.2.0
powerpc               randconfig-003-20250202    gcc-14.2.0
powerpc64             randconfig-001-20250202    gcc-14.2.0
powerpc64             randconfig-002-20250202    clang-21
powerpc64             randconfig-003-20250202    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250202    clang-21
riscv                 randconfig-002-20250202    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250202    gcc-14.2.0
s390                  randconfig-002-20250202    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250202    gcc-14.2.0
sh                    randconfig-002-20250202    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250202    gcc-14.2.0
sparc                 randconfig-002-20250202    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250202    gcc-14.2.0
sparc64               randconfig-002-20250202    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250202    gcc-12
um                    randconfig-002-20250202    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250202    clang-19
x86_64      buildonly-randconfig-002-20250202    clang-19
x86_64      buildonly-randconfig-003-20250202    gcc-12
x86_64      buildonly-randconfig-004-20250202    gcc-12
x86_64      buildonly-randconfig-005-20250202    clang-19
x86_64      buildonly-randconfig-006-20250202    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250202    clang-19
x86_64                randconfig-002-20250202    clang-19
x86_64                randconfig-003-20250202    clang-19
x86_64                randconfig-004-20250202    clang-19
x86_64                randconfig-005-20250202    clang-19
x86_64                randconfig-006-20250202    clang-19
x86_64                randconfig-007-20250202    clang-19
x86_64                randconfig-008-20250202    clang-19
x86_64                randconfig-071-20250202    gcc-12
x86_64                randconfig-072-20250202    gcc-12
x86_64                randconfig-073-20250202    gcc-12
x86_64                randconfig-074-20250202    gcc-12
x86_64                randconfig-075-20250202    gcc-12
x86_64                randconfig-076-20250202    gcc-12
x86_64                randconfig-077-20250202    gcc-12
x86_64                randconfig-078-20250202    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250202    gcc-14.2.0
xtensa                randconfig-002-20250202    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
