Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465B4296169
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747288025; cv=none; b=tLLlwi1PIhC3J7LYdPLvbv4ISMEi3JJ6rQE+hkjKHN4j75ZFbMO6IRn+DCahC3Bz1w5BtnmY40NZNaHj2PbqlGt9h+kWD7taQEZGfSFJzTlA2HCSIFmBaYeyFdGJwI8d2+yFsAYmhnDLd8hltjX0LW/NFFds+flZiro5psBhwB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747288025; c=relaxed/simple;
	bh=8afQTwmSiOUgPl8LoKvHouIF+vTEyegW+hleiSg5GUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ue/cgcakEZxhj51+ceoAUjOPzikpK1F/E9V0nqg9I5ZYj0pHzRGTlUfA3IzwPzEK3fTwQZb83SD62qiXHDjJum71yxCm5rXSVitWJHtSSlltn3JhmVenS9MDtINuJAulDhaOARn8PO0+uLhgmoKkcdwuhl7dOstkUckARuFNaik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOnNbi4z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOnNbi4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747288024; x=1778824024;
  h=date:from:to:cc:subject:message-id;
  bh=8afQTwmSiOUgPl8LoKvHouIF+vTEyegW+hleiSg5GUE=;
  b=IOnNbi4z6EkQZc8MEOezJjHky2GZb8wK+DaEMLezrS6DXQDr0ipMtZQx
   PhKd9LovTBTTdgxq2U1v4S5T+wg06DiCjQjciS+ZifTrliwWnXwi2GF5m
   x7kURRqw+0nUQuec1UtswkzkRVzU9fw4Yyzz+lryeUogPxnZz+nmIplYh
   Jumqr64OzBgE4M0O0Rz5C0A25wuOIGb5hOcIteKBzVOxuzyoxj3HsUZ3P
   kaG9ja4autFbSwh6g6IuQr5KmjVr2u9AGFtRhG6jp94xF6xdnT1RS/n+d
   pK1Piy3fESl+iT/rMZHNtfiZoUNBuHxkx2HbNW+B9MAtPn7QVmPqaR3c+
   Q==;
X-CSE-ConnectionGUID: 0i5kksZeTiGL2Hm7gMm0/Q==
X-CSE-MsgGUID: P+0NqxYAQOe5r/5EOBMbGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71718986"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="71718986"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:47:03 -0700
X-CSE-ConnectionGUID: sc+GiMafT220r6T1avxP/Q==
X-CSE-MsgGUID: S4YH+vazTSqCOefipDYT/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="169195023"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2025 22:47:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFRQo-000HyF-37;
	Thu, 15 May 2025 05:46:58 +0000
Date: Thu, 15 May 2025 13:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/core] BUILD SUCCESS
 676e8cf70cb0533e1118e29898c9a9c33ae3a10f
Message-ID: <202505151349.4pFtV86F-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
branch HEAD: 676e8cf70cb0533e1118e29898c9a9c33ae3a10f  sched,livepatch: Untangle cond_resched() and live-patching

elapsed time: 1046m

configs tested: 235
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250514    gcc-13.3.0
arc                   randconfig-001-20250515    gcc-6.5.0
arc                   randconfig-002-20250514    gcc-14.2.0
arc                   randconfig-002-20250515    gcc-6.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250514    clang-21
arm                   randconfig-001-20250515    gcc-6.5.0
arm                   randconfig-002-20250514    clang-21
arm                   randconfig-002-20250515    gcc-6.5.0
arm                   randconfig-003-20250514    gcc-7.5.0
arm                   randconfig-003-20250515    gcc-6.5.0
arm                   randconfig-004-20250514    gcc-7.5.0
arm                   randconfig-004-20250515    gcc-6.5.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250514    clang-17
arm64                 randconfig-001-20250515    gcc-6.5.0
arm64                 randconfig-002-20250514    gcc-5.5.0
arm64                 randconfig-002-20250515    gcc-6.5.0
arm64                 randconfig-003-20250514    gcc-5.5.0
arm64                 randconfig-003-20250515    gcc-6.5.0
arm64                 randconfig-004-20250514    clang-21
arm64                 randconfig-004-20250515    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250514    gcc-13.3.0
csky                  randconfig-001-20250515    clang-21
csky                  randconfig-002-20250514    gcc-14.2.0
csky                  randconfig-002-20250515    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250514    clang-21
hexagon               randconfig-001-20250515    clang-21
hexagon               randconfig-002-20250514    clang-21
hexagon               randconfig-002-20250515    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250514    clang-20
i386        buildonly-randconfig-001-20250515    gcc-11
i386        buildonly-randconfig-002-20250514    gcc-12
i386        buildonly-randconfig-002-20250515    gcc-11
i386        buildonly-randconfig-003-20250514    clang-20
i386        buildonly-randconfig-003-20250515    gcc-11
i386        buildonly-randconfig-004-20250514    clang-20
i386        buildonly-randconfig-004-20250515    gcc-11
i386        buildonly-randconfig-005-20250514    gcc-12
i386        buildonly-randconfig-005-20250515    gcc-11
i386        buildonly-randconfig-006-20250514    gcc-12
i386        buildonly-randconfig-006-20250515    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250515    clang-20
i386                  randconfig-002-20250515    clang-20
i386                  randconfig-003-20250515    clang-20
i386                  randconfig-004-20250515    clang-20
i386                  randconfig-005-20250515    clang-20
i386                  randconfig-006-20250515    clang-20
i386                  randconfig-007-20250515    clang-20
i386                  randconfig-011-20250515    gcc-12
i386                  randconfig-012-20250515    gcc-12
i386                  randconfig-013-20250515    gcc-12
i386                  randconfig-014-20250515    gcc-12
i386                  randconfig-015-20250515    gcc-12
i386                  randconfig-016-20250515    gcc-12
i386                  randconfig-017-20250515    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250514    gcc-14.2.0
loongarch             randconfig-001-20250515    clang-21
loongarch             randconfig-002-20250514    gcc-14.2.0
loongarch             randconfig-002-20250515    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250514    gcc-7.5.0
nios2                 randconfig-001-20250515    clang-21
nios2                 randconfig-002-20250514    gcc-11.5.0
nios2                 randconfig-002-20250515    clang-21
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250514    gcc-12.4.0
parisc                randconfig-001-20250515    clang-21
parisc                randconfig-002-20250514    gcc-10.5.0
parisc                randconfig-002-20250515    clang-21
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250514    clang-17
powerpc               randconfig-001-20250515    clang-21
powerpc               randconfig-002-20250514    gcc-5.5.0
powerpc               randconfig-002-20250515    clang-21
powerpc               randconfig-003-20250514    gcc-7.5.0
powerpc               randconfig-003-20250515    clang-21
powerpc64             randconfig-001-20250514    gcc-10.5.0
powerpc64             randconfig-001-20250515    clang-21
powerpc64             randconfig-002-20250514    clang-19
powerpc64             randconfig-002-20250515    clang-21
powerpc64             randconfig-003-20250514    gcc-5.5.0
powerpc64             randconfig-003-20250515    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250515    gcc-8.5.0
riscv                 randconfig-001-20250515    gcc-9.3.0
riscv                 randconfig-002-20250515    gcc-14.2.0
riscv                 randconfig-002-20250515    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250515    clang-21
s390                  randconfig-001-20250515    gcc-9.3.0
s390                  randconfig-002-20250515    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250515    gcc-14.2.0
sh                    randconfig-001-20250515    gcc-9.3.0
sh                    randconfig-002-20250515    gcc-10.5.0
sh                    randconfig-002-20250515    gcc-9.3.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250515    gcc-6.5.0
sparc                 randconfig-001-20250515    gcc-9.3.0
sparc                 randconfig-002-20250515    gcc-10.3.0
sparc                 randconfig-002-20250515    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250515    gcc-9.3.0
sparc64               randconfig-002-20250515    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250515    gcc-12
um                    randconfig-001-20250515    gcc-9.3.0
um                    randconfig-002-20250515    clang-21
um                    randconfig-002-20250515    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250514    clang-20
x86_64      buildonly-randconfig-001-20250515    gcc-12
x86_64      buildonly-randconfig-002-20250514    gcc-12
x86_64      buildonly-randconfig-002-20250515    gcc-12
x86_64      buildonly-randconfig-003-20250514    gcc-12
x86_64      buildonly-randconfig-003-20250515    gcc-12
x86_64      buildonly-randconfig-004-20250514    gcc-12
x86_64      buildonly-randconfig-004-20250515    gcc-12
x86_64      buildonly-randconfig-005-20250514    clang-20
x86_64      buildonly-randconfig-005-20250515    gcc-12
x86_64      buildonly-randconfig-006-20250514    gcc-12
x86_64      buildonly-randconfig-006-20250515    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250515    gcc-12
x86_64                randconfig-002-20250515    gcc-12
x86_64                randconfig-003-20250515    gcc-12
x86_64                randconfig-004-20250515    gcc-12
x86_64                randconfig-005-20250515    gcc-12
x86_64                randconfig-006-20250515    gcc-12
x86_64                randconfig-007-20250515    gcc-12
x86_64                randconfig-008-20250515    gcc-12
x86_64                randconfig-071-20250515    clang-20
x86_64                randconfig-072-20250515    clang-20
x86_64                randconfig-073-20250515    clang-20
x86_64                randconfig-074-20250515    clang-20
x86_64                randconfig-075-20250515    clang-20
x86_64                randconfig-076-20250515    clang-20
x86_64                randconfig-077-20250515    clang-20
x86_64                randconfig-078-20250515    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-9.3.0
xtensa                randconfig-002-20250515    gcc-13.3.0
xtensa                randconfig-002-20250515    gcc-9.3.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
