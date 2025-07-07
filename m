Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7C1EE032
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 05:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751864947; cv=none; b=J1IjyaZnMC6gfe7z3D5U5uzWKHx32bh0IPJ/ebKxcXBAvAt72MXnLIFDwXULLt2OJp0qs5c3DAXM8JtffDm2sJ+plKxTxi/YoL9twf58PZOHVSvMyLE3+jdVTazgAVpDMeHboHPA6UR1GR3ezeyh1f7aNgFD0wN9byzaIO11v6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751864947; c=relaxed/simple;
	bh=+Vzn60u1EW+1CmX1z2s0h3zi4N1/tz2W9Y4hv9dm+PE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FSLePTgIHSQdTBtOcT7Ee9Eh8qEVDG1yeWoNtrkkuEULbWxfESEm+2mzB0xo0KxfQArmGOluwSmXvIrBouNGSe8zbRLF2C0e/0JU5YGiL6pyeZ9JiJvuvuPPpn4MAyOD3O8EHbGoUgNJoXfE2TzBdjqXgwJ7BMjfcHZpTNOOpto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZCSxJSr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZCSxJSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751864946; x=1783400946;
  h=date:from:to:cc:subject:message-id;
  bh=+Vzn60u1EW+1CmX1z2s0h3zi4N1/tz2W9Y4hv9dm+PE=;
  b=LZCSxJSrbM0z6HeGX3e0G7i4AzUMRpOLKqrlPiomy6DEA2Hk1eNCmJWk
   qSNz7PQsn1Xr05kVYb5E6gtwv+Ur7cdaON2nt2J1TVC/uqnyxM5xdYzVj
   h8NAFNw87Rk4N8mjeCmeC6c6fKvUyMj+NY1pgGsqtdFqcl1OAv8OQrLyq
   F5VHd3ArSsdxccx40S3Rq7l1xuVWQntDwXyHHbuE6hI/q02rbWVm0uqNl
   X2ZSRxB1or6oa1h8ezal9RjwRpFJJmQ0OAOTqJeDt2zShwl66AFla+GqN
   Nn1wuE3WOu8n+9ReRe4eF4QW+vPL9qTEESkQJKy60jxlmrPbfIPnPooMw
   g==;
X-CSE-ConnectionGUID: ifTaxh1QQUes/FVWLLjQCA==
X-CSE-MsgGUID: 8DT4BRmmQPmEctse2tiv5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53939105"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="53939105"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 22:09:05 -0700
X-CSE-ConnectionGUID: nRyW6Z1DSZ6zBGcFj9y8ig==
X-CSE-MsgGUID: UZ5ZWAOzRlK7wMRS/Zsi3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="160655271"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2025 22:09:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYe6A-00006G-0j;
	Mon, 07 Jul 2025 05:09:02 +0000
Date: Mon, 07 Jul 2025 08:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/urgent] BUILD SUCCESS
 d0a48dc4df5c986bf8c3caf4d8fc15c480273052
Message-ID: <202507070835.daTQLUds-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/urgent
branch HEAD: d0a48dc4df5c986bf8c3caf4d8fc15c480273052  selftests/futex: Convert 32-bit timespec to 64-bit version for 32-bit compatibility mode

elapsed time: 896m

configs tested: 134
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250706    gcc-8.5.0
arc                   randconfig-002-20250706    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                       imx_v6_v7_defconfig    clang-16
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250706    clang-21
arm                   randconfig-002-20250706    clang-21
arm                   randconfig-003-20250706    gcc-8.5.0
arm                   randconfig-004-20250706    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250706    clang-21
arm64                 randconfig-002-20250706    clang-21
arm64                 randconfig-003-20250706    clang-17
arm64                 randconfig-004-20250706    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250706    gcc-9.3.0
csky                  randconfig-002-20250706    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250706    clang-21
hexagon               randconfig-002-20250706    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250706    gcc-12
i386        buildonly-randconfig-002-20250706    gcc-12
i386        buildonly-randconfig-003-20250706    clang-20
i386        buildonly-randconfig-004-20250706    clang-20
i386        buildonly-randconfig-005-20250706    gcc-12
i386        buildonly-randconfig-006-20250706    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250706    clang-18
loongarch             randconfig-002-20250706    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250706    gcc-9.3.0
nios2                 randconfig-002-20250706    gcc-13.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250706    gcc-15.1.0
parisc                randconfig-002-20250706    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250706    gcc-8.5.0
powerpc               randconfig-002-20250706    clang-21
powerpc               randconfig-003-20250706    clang-21
powerpc64             randconfig-001-20250706    gcc-8.5.0
powerpc64             randconfig-002-20250706    clang-17
powerpc64             randconfig-003-20250706    gcc-13.4.0
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250706    gcc-11.5.0
riscv                 randconfig-002-20250706    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250706    gcc-8.5.0
s390                  randconfig-002-20250706    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250706    gcc-14.3.0
sh                    randconfig-002-20250706    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250706    gcc-8.5.0
sparc                 randconfig-002-20250706    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250706    gcc-10.5.0
sparc64               randconfig-002-20250706    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250706    gcc-12
um                    randconfig-002-20250706    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250706    gcc-12
x86_64      buildonly-randconfig-002-20250706    gcc-12
x86_64      buildonly-randconfig-003-20250706    clang-20
x86_64      buildonly-randconfig-004-20250706    clang-20
x86_64      buildonly-randconfig-005-20250706    clang-20
x86_64      buildonly-randconfig-006-20250706    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250706    gcc-8.5.0
xtensa                randconfig-002-20250706    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
