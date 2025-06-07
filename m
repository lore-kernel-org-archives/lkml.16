Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25720258CF4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749281123; cv=none; b=kBhqPFO08tf2ioBOIacE5VuafBkQiRVH4OHI7XSp7jwoClNLcJmP2LnfuEf9WkCQVc3vrfNumtMAV7V7a4vSBLD1pJVxKhnnR4xOpH7K+xAF+s718CnT5eThybJTp1szY4F94X24EMlm5MYbClJp15nnAhz05Co0+BXiLjuPBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749281123; c=relaxed/simple;
	bh=p2vamR60PmAsbL3CFybFaecsczNHgSzzUISGtjzB744=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJGLLq0lwWWJgGim8ySsd0Asha9ETX/NUC9I8qC0oyt+abdyl8aPeD6D8mlasB47+lxzCRq4tz98LtTa3V+pQLfVuH5xae9740L9PZM9L8XaBLCRjbv56oP8edmMjRkI2YNRNU5WozgIbxawzXw5LTkOWktNRMNXp4KEG5Zpink=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jN8WPwsQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jN8WPwsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749281122; x=1780817122;
  h=date:from:to:cc:subject:message-id;
  bh=p2vamR60PmAsbL3CFybFaecsczNHgSzzUISGtjzB744=;
  b=jN8WPwsQ8WeVPjaMh2R56gXeZKGT6TVHOf/VlGif0vtIZdDVosIoDdBj
   UyvWiNFL7y6W9e4Wl6wPe41Ev3CZs4ISBu1z2+y+PfiiW9hURKSuaFzms
   4PWojZNKTbLXSP11dAqWnWThu92OrAqnIu0m3iMb5y6UG5De3vB5a4x2F
   /9qUxfFnkxKON9wauCIR3UsYXGj9nL1K/Ew0uRzYnZPR+SUzQe/ELvbtf
   oiaDpEBSyACClg9aAK8BcFe5abR+5hQbfjSH8Oc1BFlcQD+ua4BZeyii1
   mRK6U1xS6Zuoe0H4+96oJ9JG4Uja7Rl2v2vN3SXvfboBBCrB9nKuWfg9E
   w==;
X-CSE-ConnectionGUID: KssNNOSVQi6bm2zyIWINFA==
X-CSE-MsgGUID: lOwq4gikRAWk6lXYqzGe2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68880386"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="68880386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 00:25:21 -0700
X-CSE-ConnectionGUID: 1ciSIpabR46RJdzNX/smfw==
X-CSE-MsgGUID: 9NDZtgV0SiWcZI/9uMiqcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="146027201"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2025 00:25:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNnvZ-0005X3-2r;
	Sat, 07 Jun 2025 07:25:17 +0000
Date: Sat, 07 Jun 2025 15:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.06.04b] BUILD REGRESSION
 12a2f572c0040895409bbf5773f80fa08586c01a
Message-ID: <202506071504.mYq5Gc8c-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.06.04b
branch HEAD: 12a2f572c0040895409bbf5773f80fa08586c01a  rcutorture: Make BUSTED scenario check and log readers

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506070040.aFxmm3vX-lkp@intel.com

    lib/tests/test_ratelimit.c:98:18: error: call to undeclared function 'ratelimit_state_reset_miss'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    lib/tests/test_ratelimit.c:98:25: error: implicit declaration of function 'ratelimit_state_reset_miss'; did you mean 'ratelimit_state_exit'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-001-20250606
|   `-- lib-tests-test_ratelimit.c:error:call-to-undeclared-function-ratelimit_state_reset_miss-ISO-C99-and-later-do-not-support-implicit-function-declarations
`-- arm-randconfig-004-20250606
    `-- lib-tests-test_ratelimit.c:error:implicit-declaration-of-function-ratelimit_state_reset_miss

elapsed time: 964m

configs tested: 216
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250606    gcc-8.5.0
arc                   randconfig-001-20250607    gcc-15.1.0
arc                   randconfig-002-20250606    gcc-10.5.0
arc                   randconfig-002-20250607    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250606    clang-21
arm                   randconfig-001-20250607    clang-21
arm                   randconfig-002-20250606    gcc-11.5.0
arm                   randconfig-002-20250607    gcc-13.3.0
arm                   randconfig-003-20250606    clang-21
arm                   randconfig-003-20250607    gcc-15.1.0
arm                   randconfig-004-20250606    gcc-11.5.0
arm                   randconfig-004-20250607    gcc-14.3.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250606    clang-21
arm64                 randconfig-001-20250607    clang-21
arm64                 randconfig-002-20250606    gcc-15.1.0
arm64                 randconfig-002-20250607    clang-21
arm64                 randconfig-003-20250606    clang-21
arm64                 randconfig-003-20250607    clang-21
arm64                 randconfig-004-20250606    clang-21
arm64                 randconfig-004-20250607    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250606    gcc-14.3.0
csky                  randconfig-002-20250606    gcc-15.1.0
csky                  randconfig-002-20250607    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250606    clang-21
hexagon               randconfig-002-20250606    clang-18
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250606    clang-20
i386        buildonly-randconfig-001-20250607    clang-20
i386        buildonly-randconfig-002-20250606    gcc-12
i386        buildonly-randconfig-002-20250607    gcc-12
i386        buildonly-randconfig-003-20250606    gcc-12
i386        buildonly-randconfig-003-20250607    gcc-12
i386        buildonly-randconfig-004-20250606    gcc-12
i386        buildonly-randconfig-004-20250607    gcc-12
i386        buildonly-randconfig-005-20250606    gcc-12
i386        buildonly-randconfig-005-20250607    clang-20
i386        buildonly-randconfig-006-20250606    gcc-11
i386        buildonly-randconfig-006-20250607    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250607    gcc-12
i386                  randconfig-012-20250607    gcc-12
i386                  randconfig-013-20250607    gcc-12
i386                  randconfig-014-20250607    gcc-12
i386                  randconfig-015-20250607    gcc-12
i386                  randconfig-016-20250607    gcc-12
i386                  randconfig-017-20250607    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250606    gcc-15.1.0
loongarch             randconfig-002-20250606    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
mips                      maltasmvp_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    gcc-15.1.0
mips                           rs90_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250606    gcc-14.2.0
nios2                 randconfig-002-20250606    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250606    gcc-11.5.0
parisc                randconfig-002-20250606    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    clang-21
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250606    clang-21
powerpc               randconfig-002-20250606    clang-21
powerpc               randconfig-003-20250606    gcc-13.3.0
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250606    clang-21
powerpc64             randconfig-002-20250606    clang-17
powerpc64             randconfig-003-20250606    gcc-12.4.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250607    clang-21
riscv                 randconfig-001-20250607    gcc-12
riscv                 randconfig-002-20250607    clang-16
riscv                 randconfig-002-20250607    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250607    clang-16
s390                  randconfig-001-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250607    gcc-12
sh                    randconfig-001-20250607    gcc-14.3.0
sh                    randconfig-002-20250607    gcc-12
sh                    randconfig-002-20250607    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250607    gcc-10.3.0
sparc                 randconfig-001-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12.4.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250607    gcc-12
sparc64               randconfig-001-20250607    gcc-9.3.0
sparc64               randconfig-002-20250607    gcc-12
sparc64               randconfig-002-20250607    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250607    clang-21
um                    randconfig-001-20250607    gcc-12
um                    randconfig-002-20250607    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250606    clang-20
x86_64      buildonly-randconfig-001-20250607    clang-20
x86_64      buildonly-randconfig-002-20250606    gcc-12
x86_64      buildonly-randconfig-002-20250607    clang-20
x86_64      buildonly-randconfig-003-20250606    gcc-12
x86_64      buildonly-randconfig-003-20250607    clang-20
x86_64      buildonly-randconfig-004-20250606    gcc-12
x86_64      buildonly-randconfig-004-20250607    gcc-12
x86_64      buildonly-randconfig-005-20250606    gcc-12
x86_64      buildonly-randconfig-005-20250607    gcc-12
x86_64      buildonly-randconfig-006-20250606    gcc-12
x86_64      buildonly-randconfig-006-20250607    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250607    clang-20
x86_64                randconfig-002-20250607    clang-20
x86_64                randconfig-003-20250607    clang-20
x86_64                randconfig-004-20250607    clang-20
x86_64                randconfig-005-20250607    clang-20
x86_64                randconfig-006-20250607    clang-20
x86_64                randconfig-007-20250607    clang-20
x86_64                randconfig-008-20250607    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250607    gcc-10.5.0
xtensa                randconfig-001-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
