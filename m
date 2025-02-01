Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD31F9C1
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738397918; cv=none; b=Gpu24yDo9icmB4WFrR8j6KtmJX49KGlOw7PENwWVkfe51XUilM0am93hx5Opj0F6EQE+ZsqzIM3FZcktKBPtLk3uJjG5azqRHH4Vr/NKiVX8j47xoSaezOgFmE4OiN37IXlT8a7EDAcliK0pjAyq+8etbqvQj8Xv4zpYwuytNqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738397918; c=relaxed/simple;
	bh=OC7dAlglu8rp5jYz3gAXZG3WopArbbqsee6qFUBjIhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W3DZZbeMuq5O2462r1JL0jQD29JV8FN4NUPLqIDo0vC7nUVPtHRP+Y5FJCpksQSEZybIm/csRq+msAZwJ7piI4qWlVLYREr5+QaTuwZ8T5zunW2UqNQ+jNvlDNJpLmabsViGb4ZwEcMDyrUFM04RaPJN7lUP2i+kNOCOz+4NHfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrxzexXI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrxzexXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738397917; x=1769933917;
  h=date:from:to:cc:subject:message-id;
  bh=OC7dAlglu8rp5jYz3gAXZG3WopArbbqsee6qFUBjIhg=;
  b=XrxzexXIkMWIrJCQDWIGd6soA3vSwUCGt6M6aedUktM0AAAk73nq9Nv8
   TepUSBueYH/y9ndkZtmzcUGBa80HDGRHRBic4QE2YJNxyXXi+UpAgBWgF
   8koPwwxWxd9CpB+3DG1jc7676HsCtjTBKXJtwIsBQrwRpl57pRSTIZcdg
   WIzHjA160QkfvSsd21yVqcw0ajBrogWgCSA9GjaXDabhN1i5epr2f9YEx
   RtTuxXLdJdNldQYiK6LqWZtos1uI1+D1dPWVRks1Laz69jOjJ6ck8Dgb3
   00AS3dsxnhwzyBkdf1cVaNlN7zaOwDVtQ6GAhM0lE+AjP9+qt5vdUJj/7
   w==;
X-CSE-ConnectionGUID: O7yCc1T9QbGvqNxipCs8Dg==
X-CSE-MsgGUID: msFLiwh/S7CB/a0v1xTd2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38844729"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="38844729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 00:18:36 -0800
X-CSE-ConnectionGUID: dDv3xDf6Sb+TvlDbqER0Ig==
X-CSE-MsgGUID: Rrt13V6NQd6H3RVub0ArnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="109658821"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Feb 2025 00:18:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te8hz-000ntL-2o;
	Sat, 01 Feb 2025 08:18:31 +0000
Date: Sat, 01 Feb 2025 16:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 13f6b7b341e64c50613d89fa1e20bbe1b156258c
Message-ID: <202502011630.EAZUTgcN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 13f6b7b341e64c50613d89fa1e20bbe1b156258c  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1284m

configs tested: 238
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    clang-21
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250131    gcc-13.2.0
arc                   randconfig-002-20250131    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250131    clang-15
arm64                 randconfig-002-20250131    gcc-14.2.0
arm64                 randconfig-003-20250131    clang-21
arm64                 randconfig-004-20250131    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250131    gcc-14.2.0
csky                  randconfig-001-20250201    gcc-14.2.0
csky                  randconfig-002-20250131    gcc-14.2.0
csky                  randconfig-002-20250201    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-001-20250201    gcc-14.2.0
hexagon               randconfig-002-20250131    clang-21
hexagon               randconfig-002-20250201    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250201    clang-19
i386                  randconfig-002-20250201    clang-19
i386                  randconfig-003-20250201    clang-19
i386                  randconfig-004-20250201    clang-19
i386                  randconfig-005-20250201    clang-19
i386                  randconfig-006-20250201    clang-19
i386                  randconfig-007-20250201    clang-19
i386                  randconfig-011-20250201    clang-19
i386                  randconfig-012-20250201    clang-19
i386                  randconfig-013-20250201    clang-19
i386                  randconfig-014-20250201    clang-19
i386                  randconfig-015-20250201    clang-19
i386                  randconfig-016-20250201    clang-19
i386                  randconfig-017-20250201    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-001-20250201    gcc-14.2.0
loongarch             randconfig-002-20250131    gcc-14.2.0
loongarch             randconfig-002-20250201    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                        bcm47xx_defconfig    clang-21
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-001-20250201    gcc-14.2.0
nios2                 randconfig-002-20250131    gcc-14.2.0
nios2                 randconfig-002-20250201    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-001-20250201    gcc-14.2.0
parisc                randconfig-002-20250131    gcc-14.2.0
parisc                randconfig-002-20250201    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                   currituck_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-001-20250201    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-002-20250201    gcc-14.2.0
powerpc               randconfig-003-20250131    clang-21
powerpc               randconfig-003-20250201    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-001-20250201    gcc-14.2.0
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-002-20250201    gcc-14.2.0
powerpc64             randconfig-003-20250131    clang-15
powerpc64             randconfig-003-20250201    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                               defconfig    gcc-14.2.0
riscv                 randconfig-001-20250131    clang-19
riscv                 randconfig-001-20250201    gcc-14.2.0
riscv                 randconfig-002-20250131    clang-21
riscv                 randconfig-002-20250201    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250131    clang-16
s390                  randconfig-001-20250201    gcc-14.2.0
s390                  randconfig-002-20250131    gcc-14.2.0
s390                  randconfig-002-20250201    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-001-20250201    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                    randconfig-002-20250201    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-001-20250201    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc                 randconfig-002-20250201    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-001-20250201    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
sparc64               randconfig-002-20250201    gcc-14.2.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    clang-19
um                    randconfig-001-20250201    gcc-14.2.0
um                    randconfig-002-20250131    clang-21
um                    randconfig-002-20250201    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250201    clang-19
x86_64                randconfig-002-20250201    clang-19
x86_64                randconfig-003-20250201    clang-19
x86_64                randconfig-004-20250201    clang-19
x86_64                randconfig-005-20250201    clang-19
x86_64                randconfig-006-20250201    clang-19
x86_64                randconfig-007-20250201    clang-19
x86_64                randconfig-008-20250201    clang-19
x86_64                randconfig-071-20250201    clang-19
x86_64                randconfig-072-20250201    clang-19
x86_64                randconfig-073-20250201    clang-19
x86_64                randconfig-074-20250201    clang-19
x86_64                randconfig-075-20250201    clang-19
x86_64                randconfig-076-20250201    clang-19
x86_64                randconfig-077-20250201    clang-19
x86_64                randconfig-078-20250201    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                randconfig-001-20250201    gcc-14.2.0
xtensa                randconfig-002-20250201    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
