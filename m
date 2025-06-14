Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312632F32
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 03:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749870412; cv=none; b=Tm2on9VKRzAI3VYLlgB1MEBzazViJMCU+3duAuJeMk/7aehKX9hm8JgcGbMLB5Ts0NrHoujo8ciGUjBomNBKhnsUmEfVLEBTUYqnHVATctK2wnjbHExVU9IAbEKtx7ehGxWPro9gmL2P8SVBJKdMwEdVmjoSXu7u2QfiM9DrHp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749870412; c=relaxed/simple;
	bh=o5CUVcnIDSVfp35T0nhAsMRuBvEdesfHBp1fC/eo+r0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VXNnm0Sbz+3G+pMiQi0fLw1uZjj0dVJEwKQGkDgXrztyiezlDbRNQ5+RFZpCGavHTVw5DhIGcAl5evm3KIOi/A8164+O099xgRLXCKdD12bdN5yqUPuLgcwEwY3gjqVYhXmnvNaDrHiTnGuthuaLJwFsz/4vtyEBWUKEhTlazHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOtRS5xB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOtRS5xB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749870410; x=1781406410;
  h=date:from:to:cc:subject:message-id;
  bh=o5CUVcnIDSVfp35T0nhAsMRuBvEdesfHBp1fC/eo+r0=;
  b=cOtRS5xBg1qntIkSqNRZBAvPH1RJ+unotr0fA/ext2sXaA2hOTPfkz2I
   55DM+IwEKwEXktiA4Z/hU4r9aswxiwj/rST56erbTraDv3eXQ89WEorir
   Jgie8tNyCKP+RZxMF7cwQn19X58P2YaRcZD++Y698SCuHnBLkGw4XNKlZ
   B9paPZ5Ddkz2Lz79da/F/fonIiixZPzNd1uY6IH9jGGJ4ZNTFqccassi1
   Dh3hLiXq8HCrZTN0izIrzvptn/fmReTgnvfV/uB/QVMeEYgwFaQ2KV1D0
   aYiLJCoABd0vu4mUy7rttNuF7wK9sO3m783iDaLGEGXa+vhUICiQpZrVU
   A==;
X-CSE-ConnectionGUID: idnBj6jNTjK1BbocQH+85g==
X-CSE-MsgGUID: wOmPRUaFSzuldb1dmpTIzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69532693"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="69532693"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 20:06:49 -0700
X-CSE-ConnectionGUID: 3xSqXOdcSri4TqGmUV57Tw==
X-CSE-MsgGUID: w+/Y8CL0Rsi1gWzOpPvYqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="178872030"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2025 20:06:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQHEE-000DDA-0Y;
	Sat, 14 Jun 2025 03:06:46 +0000
Date: Sat, 14 Jun 2025 11:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core/bugs] BUILD SUCCESS
 d298bb98d65f964288bb87feef014da1baafedda
Message-ID: <202506141128.wV5iymdg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/bugs
branch HEAD: d298bb98d65f964288bb87feef014da1baafedda  bugs/core: Reorganize fields in the first line of WARNING output, add ->comm[] output

elapsed time: 1098m

configs tested: 246
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250613    gcc-12.4.0
arc                   randconfig-001-20250614    gcc-8.5.0
arc                   randconfig-002-20250613    gcc-12.4.0
arc                   randconfig-002-20250614    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-21
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250613    clang-21
arm                   randconfig-001-20250614    gcc-8.5.0
arm                   randconfig-002-20250613    clang-20
arm                   randconfig-002-20250614    gcc-8.5.0
arm                   randconfig-003-20250613    gcc-8.5.0
arm                   randconfig-003-20250614    gcc-8.5.0
arm                   randconfig-004-20250613    clang-21
arm                   randconfig-004-20250614    gcc-8.5.0
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250613    gcc-15.1.0
arm64                 randconfig-001-20250614    gcc-8.5.0
arm64                 randconfig-002-20250613    clang-21
arm64                 randconfig-002-20250614    gcc-8.5.0
arm64                 randconfig-003-20250613    clang-21
arm64                 randconfig-003-20250614    gcc-8.5.0
arm64                 randconfig-004-20250613    gcc-15.1.0
arm64                 randconfig-004-20250614    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250613    gcc-15.1.0
csky                  randconfig-001-20250614    clang-21
csky                  randconfig-002-20250613    gcc-15.1.0
csky                  randconfig-002-20250614    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250613    clang-21
hexagon               randconfig-001-20250614    clang-21
hexagon               randconfig-002-20250613    clang-21
hexagon               randconfig-002-20250614    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250613    gcc-12
i386        buildonly-randconfig-001-20250614    clang-20
i386        buildonly-randconfig-002-20250613    gcc-11
i386        buildonly-randconfig-002-20250614    clang-20
i386        buildonly-randconfig-003-20250613    gcc-12
i386        buildonly-randconfig-003-20250614    clang-20
i386        buildonly-randconfig-004-20250613    clang-20
i386        buildonly-randconfig-004-20250614    clang-20
i386        buildonly-randconfig-005-20250613    clang-20
i386        buildonly-randconfig-005-20250614    clang-20
i386        buildonly-randconfig-006-20250613    gcc-12
i386        buildonly-randconfig-006-20250614    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250614    clang-20
i386                  randconfig-002-20250614    clang-20
i386                  randconfig-003-20250614    clang-20
i386                  randconfig-004-20250614    clang-20
i386                  randconfig-005-20250614    clang-20
i386                  randconfig-006-20250614    clang-20
i386                  randconfig-007-20250614    clang-20
i386                  randconfig-011-20250614    clang-20
i386                  randconfig-012-20250614    clang-20
i386                  randconfig-013-20250614    clang-20
i386                  randconfig-014-20250614    clang-20
i386                  randconfig-015-20250614    clang-20
i386                  randconfig-016-20250614    clang-20
i386                  randconfig-017-20250614    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250613    gcc-15.1.0
loongarch             randconfig-001-20250614    clang-21
loongarch             randconfig-002-20250613    gcc-15.1.0
loongarch             randconfig-002-20250614    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250613    gcc-11.5.0
nios2                 randconfig-001-20250614    clang-21
nios2                 randconfig-002-20250613    gcc-11.5.0
nios2                 randconfig-002-20250614    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250613    gcc-8.5.0
parisc                randconfig-001-20250614    clang-21
parisc                randconfig-002-20250613    gcc-13.3.0
parisc                randconfig-002-20250614    clang-21
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    clang-21
powerpc               randconfig-001-20250613    clang-21
powerpc               randconfig-001-20250614    clang-21
powerpc               randconfig-002-20250613    gcc-8.5.0
powerpc               randconfig-002-20250614    clang-21
powerpc               randconfig-003-20250613    gcc-9.3.0
powerpc               randconfig-003-20250614    clang-21
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250613    gcc-8.5.0
powerpc64             randconfig-001-20250614    clang-21
powerpc64             randconfig-002-20250613    gcc-8.5.0
powerpc64             randconfig-002-20250614    clang-21
powerpc64             randconfig-003-20250613    gcc-10.5.0
powerpc64             randconfig-003-20250614    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250613    gcc-8.5.0
riscv                 randconfig-001-20250614    gcc-14.3.0
riscv                 randconfig-002-20250613    clang-21
riscv                 randconfig-002-20250614    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250613    clang-21
s390                  randconfig-001-20250614    gcc-14.3.0
s390                  randconfig-002-20250613    clang-21
s390                  randconfig-002-20250614    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250613    gcc-15.1.0
sh                    randconfig-001-20250614    gcc-14.3.0
sh                    randconfig-002-20250613    gcc-15.1.0
sh                    randconfig-002-20250614    gcc-14.3.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                           se7724_defconfig    clang-21
sh                             shx3_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250613    gcc-10.3.0
sparc                 randconfig-001-20250614    gcc-14.3.0
sparc                 randconfig-002-20250613    gcc-13.3.0
sparc                 randconfig-002-20250614    gcc-14.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250613    gcc-15.1.0
sparc64               randconfig-001-20250614    gcc-14.3.0
sparc64               randconfig-002-20250613    gcc-8.5.0
sparc64               randconfig-002-20250614    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250613    gcc-12
um                    randconfig-001-20250614    gcc-14.3.0
um                    randconfig-002-20250613    gcc-12
um                    randconfig-002-20250614    gcc-14.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250613    clang-20
x86_64      buildonly-randconfig-001-20250614    clang-20
x86_64      buildonly-randconfig-002-20250613    gcc-12
x86_64      buildonly-randconfig-002-20250614    clang-20
x86_64      buildonly-randconfig-003-20250613    gcc-12
x86_64      buildonly-randconfig-003-20250614    clang-20
x86_64      buildonly-randconfig-004-20250613    gcc-12
x86_64      buildonly-randconfig-004-20250614    clang-20
x86_64      buildonly-randconfig-005-20250613    clang-20
x86_64      buildonly-randconfig-005-20250614    clang-20
x86_64      buildonly-randconfig-006-20250613    gcc-12
x86_64      buildonly-randconfig-006-20250614    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250614    clang-20
x86_64                randconfig-002-20250614    clang-20
x86_64                randconfig-003-20250614    clang-20
x86_64                randconfig-004-20250614    clang-20
x86_64                randconfig-005-20250614    clang-20
x86_64                randconfig-006-20250614    clang-20
x86_64                randconfig-007-20250614    clang-20
x86_64                randconfig-008-20250614    clang-20
x86_64                randconfig-071-20250614    clang-20
x86_64                randconfig-072-20250614    clang-20
x86_64                randconfig-073-20250614    clang-20
x86_64                randconfig-074-20250614    clang-20
x86_64                randconfig-075-20250614    clang-20
x86_64                randconfig-076-20250614    clang-20
x86_64                randconfig-077-20250614    clang-20
x86_64                randconfig-078-20250614    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                          iss_defconfig    clang-21
xtensa                randconfig-001-20250613    gcc-8.5.0
xtensa                randconfig-001-20250614    gcc-14.3.0
xtensa                randconfig-002-20250613    gcc-15.1.0
xtensa                randconfig-002-20250614    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
