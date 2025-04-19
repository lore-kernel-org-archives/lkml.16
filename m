Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5368185B72
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745058442; cv=none; b=G7du/ahrJNLySggHyXsh7hxHptY85ZyZ1uLs6xbVtzYgbRzkdF4/lN5GN1KUBL0gTByUHRRMrUHWPLvzuN+nDuSFeH7gtV0Z73Jzg/JDdZBuwNSlkxvaXCstuHjvgAMwLJrGga1MO9EBI/7+wVOS9OIpdtdgecKqkZ9vxgs7Nd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745058442; c=relaxed/simple;
	bh=jtAK3z9dxdeubxtxamnLJeITB44A/4NLuRevMtLwstc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WS80diS16g+SNL0tHYEhCaD/LTBj5qf+j/SeQz8X0wj9KzHpO3aygGgtcspBE/Iv1/J2UfSRsozngS8lDi0rFtdUviSiLmru1rVDhWs9UJ2AoCpyRzQse4UoiOlShtqgSlDjLpABKCPFwQsV+9r9NrM6y5+TGt2p/D4UUromgQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggsDlgo0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggsDlgo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745058440; x=1776594440;
  h=date:from:to:cc:subject:message-id;
  bh=jtAK3z9dxdeubxtxamnLJeITB44A/4NLuRevMtLwstc=;
  b=ggsDlgo06fANAK4y/FqFPYrIjjjZEzrJfKuCR66tOsHQfadxZUCBSP5l
   VQgyGx44va/0AjZiC21ZY7Sgc2Svg2IrlHO/D464uXPg9cOzpKEzbKlvf
   WwXADJ5Ur6tdDP8tSdl+/5dO6tKoTxKk8Su5owlmeM6Nc1fjfbENiqD1G
   AwE+FNu4nuwYOJUnMh073ZqhCg8pD/kfJ9IoImA8ufaS9kXQ4MzRls3sC
   isiKRRMBBegaDNPQrVoAk7oY34pmTWYBZm3ADo6n744UFolQQfBc/QAbk
   qcYA+KfxNTdsv7r36souTyRnsGM5PT/NGVtnEat5wK+TnVJE3fmJ6+h4K
   Q==;
X-CSE-ConnectionGUID: N7Jipx/ySeqU2bmxgOgvng==
X-CSE-MsgGUID: KLifZKGbTxCDCz2gulXzHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57658294"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="57658294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 03:27:19 -0700
X-CSE-ConnectionGUID: fxf2LJ1ZRrmlpY3r0usrtg==
X-CSE-MsgGUID: KK6Mg2TTTdu20QrY98tSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131061972"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2025 03:27:19 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u65Pn-0003nF-36;
	Sat, 19 Apr 2025 10:27:15 +0000
Date: Sat, 19 Apr 2025 18:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/merge] BUILD SUCCESS
 b6b34347d36a3e54cb859625c0318e7005a79152
Message-ID: <202504191837.f2brhkSI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/merge
branch HEAD: b6b34347d36a3e54cb859625c0318e7005a79152  Merge branch 'perf/core' into perf/merge, to resolve conflicts

elapsed time: 1451m

configs tested: 253
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250418    gcc-14.2.0
arc                   randconfig-001-20250419    gcc-7.5.0
arc                   randconfig-002-20250418    gcc-12.4.0
arc                   randconfig-002-20250419    gcc-7.5.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-21
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250418    gcc-8.5.0
arm                   randconfig-001-20250419    gcc-7.5.0
arm                   randconfig-002-20250418    gcc-7.5.0
arm                   randconfig-002-20250419    gcc-7.5.0
arm                   randconfig-003-20250418    gcc-8.5.0
arm                   randconfig-003-20250419    gcc-7.5.0
arm                   randconfig-004-20250418    clang-21
arm                   randconfig-004-20250419    gcc-7.5.0
arm                        shmobile_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250418    clang-21
arm64                 randconfig-001-20250419    gcc-7.5.0
arm64                 randconfig-002-20250418    clang-21
arm64                 randconfig-002-20250419    gcc-7.5.0
arm64                 randconfig-003-20250418    clang-21
arm64                 randconfig-003-20250419    gcc-7.5.0
arm64                 randconfig-004-20250418    gcc-6.5.0
arm64                 randconfig-004-20250419    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250418    gcc-14.2.0
csky                  randconfig-001-20250419    gcc-14.2.0
csky                  randconfig-002-20250418    gcc-10.5.0
csky                  randconfig-002-20250419    gcc-14.2.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250418    clang-21
hexagon               randconfig-001-20250419    gcc-14.2.0
hexagon               randconfig-002-20250418    clang-21
hexagon               randconfig-002-20250419    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250418    clang-20
i386        buildonly-randconfig-001-20250419    clang-20
i386        buildonly-randconfig-002-20250418    gcc-12
i386        buildonly-randconfig-002-20250419    clang-20
i386        buildonly-randconfig-003-20250418    clang-20
i386        buildonly-randconfig-003-20250419    clang-20
i386        buildonly-randconfig-004-20250418    gcc-12
i386        buildonly-randconfig-004-20250419    clang-20
i386        buildonly-randconfig-005-20250418    gcc-11
i386        buildonly-randconfig-005-20250419    clang-20
i386        buildonly-randconfig-006-20250418    clang-20
i386        buildonly-randconfig-006-20250419    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250419    clang-20
i386                  randconfig-002-20250419    clang-20
i386                  randconfig-003-20250419    clang-20
i386                  randconfig-004-20250419    clang-20
i386                  randconfig-005-20250419    clang-20
i386                  randconfig-006-20250419    clang-20
i386                  randconfig-007-20250419    clang-20
i386                  randconfig-011-20250419    gcc-12
i386                  randconfig-012-20250419    gcc-12
i386                  randconfig-013-20250419    gcc-12
i386                  randconfig-014-20250419    gcc-12
i386                  randconfig-015-20250419    gcc-12
i386                  randconfig-016-20250419    gcc-12
i386                  randconfig-017-20250419    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250418    gcc-14.2.0
loongarch             randconfig-001-20250419    gcc-14.2.0
loongarch             randconfig-002-20250418    gcc-12.4.0
loongarch             randconfig-002-20250419    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-21
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-21
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
nios2                         3c120_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250418    gcc-10.5.0
nios2                 randconfig-001-20250419    gcc-14.2.0
nios2                 randconfig-002-20250418    gcc-14.2.0
nios2                 randconfig-002-20250419    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250418    gcc-11.5.0
parisc                randconfig-001-20250419    gcc-14.2.0
parisc                randconfig-002-20250418    gcc-13.3.0
parisc                randconfig-002-20250419    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250418    gcc-8.5.0
powerpc               randconfig-001-20250419    gcc-14.2.0
powerpc               randconfig-002-20250418    gcc-6.5.0
powerpc               randconfig-002-20250419    gcc-14.2.0
powerpc               randconfig-003-20250418    clang-21
powerpc               randconfig-003-20250419    gcc-14.2.0
powerpc                     tqm5200_defconfig    clang-21
powerpc                     tqm8548_defconfig    clang-21
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250418    clang-21
powerpc64             randconfig-001-20250419    gcc-14.2.0
powerpc64             randconfig-002-20250418    clang-21
powerpc64             randconfig-002-20250419    gcc-14.2.0
powerpc64             randconfig-003-20250418    clang-17
powerpc64             randconfig-003-20250419    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250418    clang-21
riscv                 randconfig-001-20250419    gcc-5.5.0
riscv                 randconfig-002-20250418    clang-21
riscv                 randconfig-002-20250419    gcc-5.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250418    gcc-7.5.0
s390                  randconfig-001-20250419    gcc-5.5.0
s390                  randconfig-002-20250418    gcc-6.5.0
s390                  randconfig-002-20250419    gcc-5.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    clang-21
sh                         apsh4a3a_defconfig    clang-21
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    clang-21
sh                    randconfig-001-20250418    gcc-12.4.0
sh                    randconfig-001-20250419    gcc-5.5.0
sh                    randconfig-002-20250418    gcc-14.2.0
sh                    randconfig-002-20250419    gcc-5.5.0
sh                           se7721_defconfig    clang-21
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    clang-21
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250418    gcc-10.3.0
sparc                 randconfig-001-20250419    gcc-5.5.0
sparc                 randconfig-002-20250418    gcc-7.5.0
sparc                 randconfig-002-20250419    gcc-5.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250418    gcc-9.3.0
sparc64               randconfig-001-20250419    gcc-5.5.0
sparc64               randconfig-002-20250418    gcc-11.5.0
sparc64               randconfig-002-20250419    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250418    clang-21
um                    randconfig-001-20250419    gcc-5.5.0
um                    randconfig-002-20250418    clang-21
um                    randconfig-002-20250419    gcc-5.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250418    clang-20
x86_64      buildonly-randconfig-001-20250419    clang-20
x86_64      buildonly-randconfig-002-20250418    clang-20
x86_64      buildonly-randconfig-002-20250419    clang-20
x86_64      buildonly-randconfig-003-20250418    clang-20
x86_64      buildonly-randconfig-003-20250419    clang-20
x86_64      buildonly-randconfig-004-20250418    clang-20
x86_64      buildonly-randconfig-004-20250419    clang-20
x86_64      buildonly-randconfig-005-20250418    clang-20
x86_64      buildonly-randconfig-005-20250419    clang-20
x86_64      buildonly-randconfig-006-20250418    gcc-12
x86_64      buildonly-randconfig-006-20250419    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250419    clang-20
x86_64                randconfig-002-20250419    clang-20
x86_64                randconfig-003-20250419    clang-20
x86_64                randconfig-004-20250419    clang-20
x86_64                randconfig-005-20250419    clang-20
x86_64                randconfig-006-20250419    clang-20
x86_64                randconfig-007-20250419    clang-20
x86_64                randconfig-008-20250419    clang-20
x86_64                randconfig-071-20250419    clang-20
x86_64                randconfig-072-20250419    clang-20
x86_64                randconfig-073-20250419    clang-20
x86_64                randconfig-074-20250419    clang-20
x86_64                randconfig-075-20250419    clang-20
x86_64                randconfig-076-20250419    clang-20
x86_64                randconfig-077-20250419    clang-20
x86_64                randconfig-078-20250419    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250418    gcc-7.5.0
xtensa                randconfig-001-20250419    gcc-5.5.0
xtensa                randconfig-002-20250418    gcc-14.2.0
xtensa                randconfig-002-20250419    gcc-5.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
