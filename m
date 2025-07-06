Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A46D2877F8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 23:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751843519; cv=none; b=peHUlmqGnrzJ9VdqbG0tkJ4p1FxtrQDA7M+1cHAaW5RQOgJZgVdOWqJyLfnLPvJBp59H6xagUzz/XWwLSwAxuVqZPXdLg+/8/cr1rbvs3S+1iB0ui45yPjpmRGcY9gdegNchQZ3bgovMxueVynzn7h07Tztell3ZbVyC3o+EtIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751843519; c=relaxed/simple;
	bh=3HG6ccIGAxy4g1aqRXRCeu9rMFTRbMTNV/PULdrRbA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KU0nMfdfGzPsAk4CZSPuwOmemIEplQGCngr0/fMrzOBLTUuUbcg2EhHAW4IBqB1hy1K6+V/+Qz6zKwQFzVgDHmxntxKz0CiwD2sEKG8o0E4/qKwZ75hT0aSXlYG712pJmqd0ZJb+m3zFYzaGIQ0qRyLMV12xnurkZOK2GC0PU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYVlhIzf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYVlhIzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751843518; x=1783379518;
  h=date:from:to:cc:subject:message-id;
  bh=3HG6ccIGAxy4g1aqRXRCeu9rMFTRbMTNV/PULdrRbA0=;
  b=kYVlhIzfMiqGMbvEFPQcxeiozLZiF4NNOT6qTT/ecmiQ1kSa/b797AP4
   5Gp96uSmxyOPVydkph11VacldDD2M2QukoQVwpxb40Drxbuy0HELULL6Q
   X+FEyq36ny9OcnnDNe1+VR+S+dYH2jyamQZaoIRa4hln0+8muViZ3613M
   tIMFKyz2K4CRF+TBYH09iaUyMzxN+Az1DXJG1C0q7fkLhab8o4F6exJ/c
   8Y/f47M1Tz5W/Wzps4GvcbAsj9nzaYdH8ju1ixVb+IicHR8RxC1aKH+if
   ATNFiFE1w0XE4wxQAsYAFNV7k2GLhj3nyQm9OIAGKO/4vTW0NQM98Oo+E
   g==;
X-CSE-ConnectionGUID: DUDL1xTsTTqm5Y6anjgdeA==
X-CSE-MsgGUID: pWfuFR0FT3+bk2ovGJ7OJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="71498655"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="71498655"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 16:11:57 -0700
X-CSE-ConnectionGUID: MPmDnrFhRG+oGI5MWptFKw==
X-CSE-MsgGUID: 7U16vFfGRR6aN3ukmWZrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="178729355"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2025 16:11:56 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYYWY-00004t-11;
	Sun, 06 Jul 2025 23:11:54 +0000
Date: Mon, 07 Jul 2025 07:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:smp/core] BUILD SUCCESS
 946a7281982530d333eaee62bd1726f25908b3a9
Message-ID: <202507070704.9gDb6LYM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git smp/core
branch HEAD: 946a7281982530d333eaee62bd1726f25908b3a9  smp: Wait only if work was enqueued

elapsed time: 730m

configs tested: 157
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250706    gcc-8.5.0
arc                   randconfig-002-20250706    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-21
arm                           omap1_defconfig    clang-21
arm                   randconfig-001-20250706    clang-21
arm                   randconfig-002-20250706    clang-21
arm                   randconfig-003-20250706    gcc-8.5.0
arm                   randconfig-004-20250706    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250706    clang-21
arm64                 randconfig-002-20250706    clang-21
arm64                 randconfig-003-20250706    clang-17
arm64                 randconfig-004-20250706    gcc-9.5.0
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250706    gcc-9.3.0
csky                  randconfig-002-20250706    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
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
i386                  randconfig-001-20250707    gcc-12
i386                  randconfig-002-20250707    gcc-12
i386                  randconfig-003-20250707    gcc-12
i386                  randconfig-004-20250707    gcc-12
i386                  randconfig-005-20250707    gcc-12
i386                  randconfig-006-20250707    gcc-12
i386                  randconfig-007-20250707    gcc-12
i386                  randconfig-011-20250707    gcc-12
i386                  randconfig-012-20250707    gcc-12
i386                  randconfig-013-20250707    gcc-12
i386                  randconfig-014-20250707    gcc-12
i386                  randconfig-015-20250707    gcc-12
i386                  randconfig-016-20250707    gcc-12
i386                  randconfig-017-20250707    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250706    clang-18
loongarch             randconfig-002-20250706    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    clang-21
m68k                           virt_defconfig    clang-21
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
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
powerpc                     mpc5200_defconfig    clang-21
powerpc                      ppc64e_defconfig    clang-21
powerpc               randconfig-001-20250706    gcc-8.5.0
powerpc               randconfig-002-20250706    clang-21
powerpc               randconfig-003-20250706    clang-21
powerpc                     tqm8560_defconfig    clang-21
powerpc64             randconfig-001-20250706    gcc-8.5.0
powerpc64             randconfig-002-20250706    clang-17
powerpc64             randconfig-003-20250706    gcc-13.4.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                    nommu_virt_defconfig    clang-21
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
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250706    gcc-14.3.0
sh                    randconfig-002-20250706    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    gcc-15.1.0
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
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    clang-21
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250706    gcc-8.5.0
xtensa                randconfig-002-20250706    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
