Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2213D521
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149000; cv=none; b=UUQzsI5Y4hZNvmNHifJgYG2lGJ3xpzhj6olPlLh4sknMToHXovpCTLprowAqyJfLX0d2ZGaeADjnqIFe6mEIj75QzxBxuTsR4JN97rJujb32VB/YWh5VgHiFVht6FmXb12rrjlT7D/NudI0T+eTszB0l9qXTYfbuZISV23zhulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149000; c=relaxed/simple;
	bh=pwq0PLV/b4ZEoWdQ/eB1ig3rglS/tfq54ydr0mKuGes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jKrNP6g/xl5OB5HuoLkrWLoKrm0RwXS29vdCRTjYiWrfFoD/AbHRzqTYg+l58HcPILs8ieDUIswiivIwrYd8S2R/hENdmrs1CF4CD3A+Ni04i8/onzjwbqXJFdeAefDOlcjRO/ebrhM9keNRuZdYZkk7TnGdjv5zy8etKa6V9Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2x07z53; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2x07z53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749148998; x=1780684998;
  h=date:from:to:cc:subject:message-id;
  bh=pwq0PLV/b4ZEoWdQ/eB1ig3rglS/tfq54ydr0mKuGes=;
  b=Y2x07z53JMIUYEaLuP+kULNRg2QgUhapQriC/2FIBtT/OBvu6b6z99n2
   JNpG67wDh+zaeueObvoBn7Q7QmK40TKd9f42EuT9juk8qKmr0hwA62FGp
   m8+OhH3VsH5nLAFIUetjj7Q3lPBKKHCvRYGkkknCV9ZflibH+0tlgqdZT
   YzsBJWMjvhl6OhyNww5oUS3JBNxpOBEdclwPG0UGqlNjYNcGTIA9tpu0f
   4jqGCgg/ACqOxCy/Cz1PaZy49H1mn7vl205JIx11/uZLck2PE9XKatqOe
   BAHTagcJIWkrl6GZPX8kwyXpzeIcpfgbkgysfuVQ+a/Xz3kD3iNGQEmwj
   w==;
X-CSE-ConnectionGUID: v+lmv/h1T4G+YNyM9eQE/Q==
X-CSE-MsgGUID: Rrhd1IjhQ6Oovs2zAqbG0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916397"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="38916397"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:43:16 -0700
X-CSE-ConnectionGUID: o6MxDX6ITWO95RYwR0bLnw==
X-CSE-MsgGUID: TVJJsdigSwSV8o+b8ekJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="176546753"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2025 11:43:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNFYX-0004O5-23;
	Thu, 05 Jun 2025 18:43:13 +0000
Date: Fri, 06 Jun 2025 02:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 337964c8abfbef645cbbe25245e25c11d9d1fc4c
Message-ID: <202506060200.y0Y06XYf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 337964c8abfbef645cbbe25245e25c11d9d1fc4c  Merge branch into tip/master: 'x86/urgent'

elapsed time: 726m

configs tested: 276
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
arc                         haps_hs_defconfig    gcc-12
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250605    gcc-8.5.0
arc                   randconfig-001-20250606    gcc-15.1.0
arc                   randconfig-002-20250605    gcc-15.1.0
arc                   randconfig-002-20250606    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-21
arm                            mmp2_defconfig    gcc-15.1.0
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-001-20250606    gcc-15.1.0
arm                   randconfig-002-20250605    clang-17
arm                   randconfig-002-20250606    gcc-15.1.0
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-003-20250606    gcc-15.1.0
arm                   randconfig-004-20250605    clang-21
arm                   randconfig-004-20250606    gcc-15.1.0
arm                           sama5_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    clang-21
arm                           u8500_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-001-20250606    gcc-15.1.0
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-002-20250606    gcc-15.1.0
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-003-20250606    gcc-15.1.0
arm64                 randconfig-004-20250605    clang-21
arm64                 randconfig-004-20250606    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250605    gcc-10.5.0
csky                  randconfig-001-20250606    gcc-13.3.0
csky                  randconfig-002-20250605    gcc-15.1.0
csky                  randconfig-002-20250606    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-001-20250606    gcc-13.3.0
hexagon               randconfig-002-20250605    clang-20
hexagon               randconfig-002-20250606    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250605    gcc-12
i386        buildonly-randconfig-001-20250606    gcc-12
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-002-20250606    gcc-12
i386        buildonly-randconfig-003-20250605    gcc-12
i386        buildonly-randconfig-003-20250606    gcc-12
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-004-20250606    gcc-12
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-005-20250606    gcc-12
i386        buildonly-randconfig-006-20250605    gcc-11
i386        buildonly-randconfig-006-20250606    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250606    clang-20
i386                  randconfig-002-20250606    clang-20
i386                  randconfig-003-20250606    clang-20
i386                  randconfig-004-20250606    clang-20
i386                  randconfig-005-20250606    clang-20
i386                  randconfig-006-20250606    clang-20
i386                  randconfig-007-20250606    clang-20
i386                  randconfig-011-20250606    clang-20
i386                  randconfig-012-20250606    clang-20
i386                  randconfig-013-20250606    clang-20
i386                  randconfig-014-20250606    clang-20
i386                  randconfig-015-20250606    clang-20
i386                  randconfig-016-20250606    clang-20
i386                  randconfig-017-20250606    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250605    gcc-12.4.0
loongarch             randconfig-001-20250606    gcc-13.3.0
loongarch             randconfig-002-20250605    gcc-15.1.0
loongarch             randconfig-002-20250606    gcc-13.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                     decstation_defconfig    gcc-12
mips                      fuloong2e_defconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                     loongson1b_defconfig    clang-21
mips                           mtx1_defconfig    gcc-12
mips                         rt305x_defconfig    gcc-12
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250605    gcc-14.2.0
nios2                 randconfig-001-20250606    gcc-13.3.0
nios2                 randconfig-002-20250605    gcc-11.5.0
nios2                 randconfig-002-20250606    gcc-13.3.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250605    gcc-9.3.0
parisc                randconfig-001-20250606    gcc-13.3.0
parisc                randconfig-002-20250605    gcc-11.5.0
parisc                randconfig-002-20250606    gcc-13.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc                        icon_defconfig    gcc-12
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                      ppc44x_defconfig    clang-21
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-12
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-001-20250606    gcc-13.3.0
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-002-20250606    gcc-13.3.0
powerpc               randconfig-003-20250605    clang-21
powerpc               randconfig-003-20250606    gcc-13.3.0
powerpc64             randconfig-001-20250605    clang-18
powerpc64             randconfig-001-20250606    gcc-13.3.0
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-002-20250606    gcc-13.3.0
powerpc64             randconfig-003-20250605    clang-21
powerpc64             randconfig-003-20250606    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-001-20250606    gcc-12
riscv                 randconfig-002-20250605    clang-21
riscv                 randconfig-002-20250606    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-001-20250606    gcc-12
s390                  randconfig-002-20250605    clang-21
s390                  randconfig-002-20250606    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20250605    gcc-12.4.0
sh                    randconfig-001-20250606    gcc-12
sh                    randconfig-002-20250605    gcc-12.4.0
sh                    randconfig-002-20250606    gcc-12
sh                          rsk7201_defconfig    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250605    gcc-11.5.0
sparc                 randconfig-001-20250606    gcc-12
sparc                 randconfig-002-20250605    gcc-8.5.0
sparc                 randconfig-002-20250606    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250605    gcc-12.4.0
sparc64               randconfig-001-20250606    gcc-12
sparc64               randconfig-002-20250605    gcc-15.1.0
sparc64               randconfig-002-20250606    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250605    clang-21
um                    randconfig-001-20250606    gcc-12
um                    randconfig-002-20250605    clang-21
um                    randconfig-002-20250606    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-001-20250606    gcc-12
x86_64      buildonly-randconfig-002-20250605    gcc-12
x86_64      buildonly-randconfig-002-20250606    gcc-12
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-003-20250606    gcc-12
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-004-20250606    gcc-12
x86_64      buildonly-randconfig-005-20250605    gcc-12
x86_64      buildonly-randconfig-005-20250606    gcc-12
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64      buildonly-randconfig-006-20250606    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250606    gcc-11
x86_64                randconfig-002-20250606    gcc-11
x86_64                randconfig-003-20250606    gcc-11
x86_64                randconfig-004-20250606    gcc-11
x86_64                randconfig-005-20250606    gcc-11
x86_64                randconfig-006-20250606    gcc-11
x86_64                randconfig-007-20250606    gcc-11
x86_64                randconfig-008-20250606    gcc-11
x86_64                randconfig-071-20250606    gcc-12
x86_64                randconfig-072-20250606    gcc-12
x86_64                randconfig-073-20250606    gcc-12
x86_64                randconfig-074-20250606    gcc-12
x86_64                randconfig-075-20250606    gcc-12
x86_64                randconfig-076-20250606    gcc-12
x86_64                randconfig-077-20250606    gcc-12
x86_64                randconfig-078-20250606    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250605    gcc-8.5.0
xtensa                randconfig-001-20250606    gcc-12
xtensa                randconfig-002-20250605    gcc-12.4.0
xtensa                randconfig-002-20250606    gcc-12
xtensa                         virt_defconfig    gcc-15.1.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
