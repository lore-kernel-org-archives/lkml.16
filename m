Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CF3647
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745069014; cv=none; b=gP6kl+du1Vp49Wbp32FUFH+0IkPajfNpuwr3DJ0SUTvJOn+1unYLwPqa3VB55IT8WUzMR4jM9khhPFazzunD6YRWyh1+nQuXqqBFYIJJ6B4hQP7MFoHRoH0aB91h++EQ7Itt6ujiMqZBdnrJlaD2V+gwOBKgnUaugPaz7UZoGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745069014; c=relaxed/simple;
	bh=7NNjKNTQRbiC02oid68Prowxt0E065UTtoBoU33XKFU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=el32qHNc31oO2Ta7nbwXFOUAuwLt8uL0gbAAwliqaePdV/jE+NAh+oxl5l0NBr0aM9M3GGsSvRe8/9Wku1eEb2Z/2HahE4jHkYX498TsoovMPmUibqTWcvuKWLXA4fSxorZ+QmWeISBkR41ftkh+zz9UVbLxXjgHki0Cx11+PLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3aXn3Kn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3aXn3Kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745069013; x=1776605013;
  h=date:from:to:cc:subject:message-id;
  bh=7NNjKNTQRbiC02oid68Prowxt0E065UTtoBoU33XKFU=;
  b=A3aXn3KnNeSVU4BAj8tRDUEurqkOjKY7yj6QPx50wTwu49c+xsuizbD+
   LHGj0NsQvtguivA8tgLpAF0I1X/yEgkF6xZUAm6kXki/nrA4N4x8mBM+1
   9MZhn3Avntm0sTO/xPguHrqk1XMl0btxA5HeQ543tZAe3Xj21Pdw5rjSO
   mC94YKcEZuqXx7IZlQb4CjmGI6CyMZA9mZmPGvLoqtTlXSIOyOKgwEiZB
   W6Gierh9lg6hZyGVGZq5zW2EjwyfTccAixxLRO5CSX9P5x/qWlUdiA2RL
   YTQ2PK7D/6oH+e5NCzGaWTikhKQde/MDXWxKtzldQ7g3DySwtJNaL19rx
   w==;
X-CSE-ConnectionGUID: lhc+0DFqRw2SlLLX9eHp4Q==
X-CSE-MsgGUID: M75d3FaJSK25dfS7Uikx8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46844539"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46844539"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 06:23:32 -0700
X-CSE-ConnectionGUID: Kai8aqLASF+mm9cYJWydOQ==
X-CSE-MsgGUID: IZEavLd/TVu4y/EGNwRmLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="132219581"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Apr 2025 06:23:31 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u68AL-0003t7-08;
	Sat, 19 Apr 2025 13:23:29 +0000
Date: Sat, 19 Apr 2025 21:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/alternatives] BUILD SUCCESS
 aef1d0209ddf127a8069aca5fa3a062be4136b76
Message-ID: <202504192122.KkmXmeHQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/alternatives
branch HEAD: aef1d0209ddf127a8069aca5fa3a062be4136b76  x86/mm: Fix {,un}use_temporary_mm() IRQ state

elapsed time: 1450m

configs tested: 206
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250419    gcc-7.5.0
arc                   randconfig-002-20250419    gcc-7.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                     davinci_all_defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-21
arm                        mvebu_v7_defconfig    gcc-14.2.0
arm                   randconfig-001-20250419    gcc-7.5.0
arm                   randconfig-002-20250419    gcc-7.5.0
arm                   randconfig-003-20250419    gcc-7.5.0
arm                   randconfig-004-20250419    gcc-7.5.0
arm                        shmobile_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250419    gcc-7.5.0
arm64                 randconfig-002-20250419    gcc-7.5.0
arm64                 randconfig-003-20250419    gcc-7.5.0
arm64                 randconfig-004-20250419    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250419    gcc-14.2.0
csky                  randconfig-002-20250419    gcc-14.2.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20250419    gcc-14.2.0
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
loongarch             randconfig-001-20250419    gcc-14.2.0
loongarch             randconfig-002-20250419    gcc-14.2.0
m68k                             alldefconfig    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-21
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
mips                           ip32_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
nios2                         3c120_defconfig    clang-21
nios2                            allmodconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250419    gcc-14.2.0
nios2                 randconfig-002-20250419    gcc-14.2.0
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250419    gcc-14.2.0
parisc                randconfig-002-20250419    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250419    gcc-14.2.0
powerpc               randconfig-002-20250419    gcc-14.2.0
powerpc               randconfig-003-20250419    gcc-14.2.0
powerpc                     tqm5200_defconfig    clang-21
powerpc                     tqm8548_defconfig    clang-21
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250419    gcc-14.2.0
powerpc64             randconfig-002-20250419    gcc-14.2.0
powerpc64             randconfig-003-20250419    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250419    gcc-5.5.0
riscv                 randconfig-002-20250419    gcc-5.5.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250419    gcc-5.5.0
s390                  randconfig-002-20250419    gcc-5.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    clang-21
sh                         apsh4a3a_defconfig    clang-21
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    clang-21
sh                    randconfig-001-20250419    gcc-5.5.0
sh                    randconfig-002-20250419    gcc-5.5.0
sh                           se7721_defconfig    clang-21
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    clang-21
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250419    gcc-5.5.0
sparc                 randconfig-002-20250419    gcc-5.5.0
sparc                       sparc64_defconfig    clang-21
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250419    gcc-5.5.0
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
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                randconfig-001-20250419    gcc-5.5.0
xtensa                randconfig-002-20250419    gcc-5.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
