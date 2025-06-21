Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF27494
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 02:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750472451; cv=none; b=L/3mSAV/+ZnqLIegxoFQbxXX5kOctBkz6edI/3Fv+NSrBo2GS7zG9C2LvV5dUS/nLIdpFoEqeGGvke7dWStbb+1X++ufUPRvGaQ90HRf1ZdWASdvukKXvI4eHMItXlHdohqurq7r4l+Kx4nC9fBSTHelFUnpPuWNnJQU/77ToGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750472451; c=relaxed/simple;
	bh=CkSkGTuYSu+mjYOZ2Ak4OTCfk5VLC2RLd6wVc5vJ+Ww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RL9KoFI51DAxNYD0aDyoCnrW5lQocraSj89gFIAWOtLDtWOcUhQRoImlmg9WKoe1Z+Ery7ERjSwvS/ql8f9hjwEqBd42jFtP+BiLKUc8C7dT0shGETSizO+2gOFxf//iVHs+HUeBVSxCX2MnawuT9il5su3xlBiHmi9fonXoheo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MenR8Yyg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MenR8Yyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750472450; x=1782008450;
  h=date:from:to:cc:subject:message-id;
  bh=CkSkGTuYSu+mjYOZ2Ak4OTCfk5VLC2RLd6wVc5vJ+Ww=;
  b=MenR8Yygc4puNzIj7Z3oUUkHBlZzhtBbqvs0yhMRT7mKCzUcC0uz22C9
   0NFDzCS2CPRWcwv044vyUrUYnhFRf6fnk5Cive7Jx9jHFXJnz26z7p/GS
   xFJOhIq5e7C9eJrb8xWM3px0w1tZQlWRJInuCKtqe2acraCnAoEqVKfcf
   m04R1TLYwsfWWsYds0jW1nwGZlwfJiVYVKrOzdjyAF6pR5zs17GROa65c
   5ibW1bkfY5G+8hMOL4MUIYsvrKACe0EG8bjbU/fCdtnZmxMLd/qxdKoFe
   KDRw7SD8Hbe8wBxpHm5z2GcH9C94FNu15oopmMlG3Xjesg/2Thzs/iVur
   Q==;
X-CSE-ConnectionGUID: /fkS+cFGTTu74ecM/tClNQ==
X-CSE-MsgGUID: oVKvk+IvRXOP2lhP+xyTrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52706300"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="52706300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 19:20:49 -0700
X-CSE-ConnectionGUID: Xc1JgjbmTf+HUwIDxcJUJw==
X-CSE-MsgGUID: +PJsd4PKQJmZ5x0glfTYOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="151355669"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2025 19:20:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSnqX-000MJ5-19;
	Sat, 21 Jun 2025 02:20:45 +0000
Date: Sat, 21 Jun 2025 10:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 99a9396fdc2e17961257dea72c17a89a752d4cdf
Message-ID: <202506211009.eva28bh7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 99a9396fdc2e17961257dea72c17a89a752d4cdf  Merge branch into tip/master: 'x86/sev'

elapsed time: 1097m

configs tested: 238
configs skipped: 4

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
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250620    clang-21
arc                   randconfig-001-20250620    gcc-8.5.0
arc                   randconfig-002-20250620    clang-21
arc                   randconfig-002-20250620    gcc-11.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                       imx_v6_v7_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250620    clang-21
arm                   randconfig-002-20250620    clang-21
arm                   randconfig-003-20250620    clang-21
arm                   randconfig-004-20250620    clang-21
arm                           sama7_defconfig    gcc-15.1.0
arm                        shmobile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250620    clang-21
arm64                 randconfig-001-20250620    gcc-9.5.0
arm64                 randconfig-002-20250620    clang-21
arm64                 randconfig-002-20250620    gcc-8.5.0
arm64                 randconfig-003-20250620    clang-21
arm64                 randconfig-003-20250620    gcc-11.5.0
arm64                 randconfig-004-20250620    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250620    clang-21
csky                  randconfig-001-20250620    gcc-13.3.0
csky                  randconfig-002-20250620    clang-21
csky                  randconfig-002-20250620    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250620    clang-21
hexagon               randconfig-002-20250620    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250620    clang-20
i386        buildonly-randconfig-002-20250620    clang-20
i386        buildonly-randconfig-003-20250620    clang-20
i386        buildonly-randconfig-004-20250620    clang-20
i386        buildonly-randconfig-005-20250620    clang-20
i386        buildonly-randconfig-006-20250620    clang-20
i386        buildonly-randconfig-006-20250620    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250620    gcc-12
i386                  randconfig-002-20250620    gcc-12
i386                  randconfig-003-20250620    gcc-12
i386                  randconfig-004-20250620    gcc-12
i386                  randconfig-005-20250620    gcc-12
i386                  randconfig-006-20250620    gcc-12
i386                  randconfig-007-20250620    gcc-12
i386                  randconfig-011-20250620    gcc-12
i386                  randconfig-012-20250620    gcc-12
i386                  randconfig-013-20250620    gcc-12
i386                  randconfig-014-20250620    gcc-12
i386                  randconfig-015-20250620    gcc-12
i386                  randconfig-016-20250620    gcc-12
i386                  randconfig-017-20250620    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250620    clang-21
loongarch             randconfig-001-20250620    gcc-14.3.0
loongarch             randconfig-002-20250620    clang-21
loongarch             randconfig-002-20250620    gcc-15.1.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250620    clang-21
nios2                 randconfig-001-20250620    gcc-8.5.0
nios2                 randconfig-002-20250620    clang-21
nios2                 randconfig-002-20250620    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250620    clang-21
parisc                randconfig-001-20250620    gcc-10.5.0
parisc                randconfig-002-20250620    clang-21
parisc                randconfig-002-20250620    gcc-12.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       eiger_defconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250620    clang-21
powerpc               randconfig-002-20250620    clang-21
powerpc               randconfig-002-20250620    gcc-11.5.0
powerpc               randconfig-003-20250620    clang-21
powerpc64             randconfig-001-20250620    clang-21
powerpc64             randconfig-001-20250620    gcc-14.3.0
powerpc64             randconfig-002-20250620    clang-21
powerpc64             randconfig-003-20250620    clang-19
powerpc64             randconfig-003-20250620    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250620    gcc-13.3.0
riscv                 randconfig-001-20250620    gcc-14.3.0
riscv                 randconfig-002-20250620    clang-21
riscv                 randconfig-002-20250620    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250620    gcc-13.3.0
s390                  randconfig-001-20250620    gcc-9.3.0
s390                  randconfig-002-20250620    clang-21
s390                  randconfig-002-20250620    gcc-13.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250620    gcc-13.3.0
sh                    randconfig-001-20250620    gcc-15.1.0
sh                    randconfig-002-20250620    gcc-13.3.0
sh                    randconfig-002-20250620    gcc-15.1.0
sh                           se7705_defconfig    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250620    gcc-13.3.0
sparc                 randconfig-001-20250620    gcc-8.5.0
sparc                 randconfig-002-20250620    gcc-10.3.0
sparc                 randconfig-002-20250620    gcc-13.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250620    gcc-13.3.0
sparc64               randconfig-002-20250620    gcc-13.3.0
sparc64               randconfig-002-20250620    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250620    clang-21
um                    randconfig-001-20250620    gcc-13.3.0
um                    randconfig-002-20250620    clang-21
um                    randconfig-002-20250620    gcc-13.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250620    gcc-12
x86_64      buildonly-randconfig-001-20250621    gcc-12
x86_64      buildonly-randconfig-002-20250620    gcc-12
x86_64      buildonly-randconfig-002-20250621    gcc-12
x86_64      buildonly-randconfig-003-20250620    clang-20
x86_64      buildonly-randconfig-003-20250621    gcc-12
x86_64      buildonly-randconfig-004-20250620    gcc-12
x86_64      buildonly-randconfig-004-20250621    gcc-12
x86_64      buildonly-randconfig-005-20250620    gcc-12
x86_64      buildonly-randconfig-005-20250621    gcc-12
x86_64      buildonly-randconfig-006-20250620    clang-20
x86_64      buildonly-randconfig-006-20250621    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250620    clang-20
x86_64                randconfig-002-20250620    clang-20
x86_64                randconfig-003-20250620    clang-20
x86_64                randconfig-004-20250620    clang-20
x86_64                randconfig-005-20250620    clang-20
x86_64                randconfig-006-20250620    clang-20
x86_64                randconfig-007-20250620    clang-20
x86_64                randconfig-008-20250620    clang-20
x86_64                randconfig-071-20250620    clang-20
x86_64                randconfig-071-20250621    gcc-12
x86_64                randconfig-072-20250620    clang-20
x86_64                randconfig-072-20250621    gcc-12
x86_64                randconfig-073-20250620    clang-20
x86_64                randconfig-073-20250621    gcc-12
x86_64                randconfig-074-20250620    clang-20
x86_64                randconfig-074-20250621    gcc-12
x86_64                randconfig-075-20250620    clang-20
x86_64                randconfig-075-20250621    gcc-12
x86_64                randconfig-076-20250620    clang-20
x86_64                randconfig-076-20250621    gcc-12
x86_64                randconfig-077-20250620    clang-20
x86_64                randconfig-077-20250621    gcc-12
x86_64                randconfig-078-20250620    clang-20
x86_64                randconfig-078-20250621    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250620    gcc-13.3.0
xtensa                randconfig-001-20250620    gcc-8.5.0
xtensa                randconfig-002-20250620    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
