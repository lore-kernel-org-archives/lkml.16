Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21BE29B8D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529477; cv=none; b=Rlu1lQXIG2So8uP5NlYl6sOQUoAJau7u9lpz9O7rUTpZU0OcO2HK3SSVYWkj5gOG7cXvUdTieDVE3juPK0YI6aIVxQGxLm/+4qAom+RP+Z/N+XrDMs/Mcd39OETNDNcuT964DEoKP5418twSZpYSpMrr7KavX3Z8BED/kK/Teyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529477; c=relaxed/simple;
	bh=RVDTGcNSLGEs/+ZQ2J3QxijRX4n46eY+WpvHkkY1kko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=attZsCQkpvzY9CARPag9K+R6gbfBrwdG5EFPweLdAvzDDylcS3YGWgPVjMfj7ajGy2A6opE2QmtjndlzA9V1gQBPmteJl9LEwt78Irg3hj6DCaklej+/R1r38omde4+cjFeZ0pIBvWL2kk+YfOIqgY9yInq8bzcxYvWfRGkqczg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtKLh8Q8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtKLh8Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751529476; x=1783065476;
  h=date:from:to:cc:subject:message-id;
  bh=RVDTGcNSLGEs/+ZQ2J3QxijRX4n46eY+WpvHkkY1kko=;
  b=gtKLh8Q81IQ9VZchn2Sm7uUwkIxHGIY3ri9Gy90J/FpQ0QNeT5Ufuq/N
   NOPWFU+BcSPmFrCFmiUPFRU4PrVJ7B7Yy6Uw3mnw/vWRQtWoKO5GwZtl2
   hPFXDEIpkFkTzh9yME8TG5sVyxvEsg6/s/9D2T3SxTUMFdYyPJhn3g7my
   NJ2hK/6BGkGEMKMIJMOpLaPLcppQefeicl6kjI9uOLiuYmw0Yy3no3Jyh
   I2GH/dSeqS0pgkqVv0sB/tQq1YGTiUjkbehB4ivKRsTSH9GcDWMFXATh7
   TwdN2tMWrmjicW2RMdia4j+UvojkT9fYRW8b+WjkEaWTt9t2DOHB5e8W+
   Q==;
X-CSE-ConnectionGUID: 5lFO+wFNSs6qNZ89L2aJLw==
X-CSE-MsgGUID: cGgR7GjzQRO5LPTkVIuUuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71279820"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="71279820"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 00:57:55 -0700
X-CSE-ConnectionGUID: uRpUupqGSn+Ka+sRSr3gvA==
X-CSE-MsgGUID: cWAzwTzDQL+8HJ6dg3clog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154441663"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jul 2025 00:57:53 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXEpL-0001b5-0R;
	Thu, 03 Jul 2025 07:57:51 +0000
Date: Thu, 03 Jul 2025 15:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core/bugs] BUILD SUCCESS
 fad009b77942a680f1b7408f88a1baa03d220220
Message-ID: <202507031553.s9WqChDf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/bugs
branch HEAD: fad009b77942a680f1b7408f88a1baa03d220220  bugs/s390: Remove private WARN_ON() implementation

elapsed time: 814m

configs tested: 201
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-001-20250703    gcc-8.5.0
arc                   randconfig-002-20250703    gcc-12.4.0
arc                   randconfig-002-20250703    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-001-20250703    gcc-8.5.0
arm                   randconfig-002-20250703    gcc-8.5.0
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-003-20250703    gcc-8.5.0
arm                   randconfig-004-20250703    clang-21
arm                   randconfig-004-20250703    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-001-20250703    gcc-8.5.0
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-002-20250703    gcc-8.5.0
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-003-20250703    gcc-8.5.0
arm64                 randconfig-004-20250703    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-001-20250703    gcc-8.5.0
csky                  randconfig-002-20250703    gcc-12.4.0
csky                  randconfig-002-20250703    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
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
i386                  randconfig-011-20250703    clang-20
i386                  randconfig-012-20250703    clang-20
i386                  randconfig-013-20250703    clang-20
i386                  randconfig-014-20250703    clang-20
i386                  randconfig-015-20250703    clang-20
i386                  randconfig-016-20250703    clang-20
i386                  randconfig-017-20250703    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-8.5.0
loongarch             randconfig-002-20250703    gcc-15.1.0
loongarch             randconfig-002-20250703    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    gcc-15.1.0
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
um                               allyesconfig    clang-19
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
