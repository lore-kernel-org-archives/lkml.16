Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0164F205AA8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312542; cv=none; b=ihMDl20UUMnB+VR4jV/CyteJtkROE47vZvQr3e7NFr8kG8jSOBa3gDSENP4cQtnmuNzmi/8jWY4gexeOsFE3RaIULBSmDPb3gy0vLcNJ+L+vVBrnIUepHG7sUIwteirK6psKn6RPEdTiJD3pj5PSikUIaWz//7CvOzoNPVCLRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312542; c=relaxed/simple;
	bh=GWcGuuFDNA5MgqqnhfuCg3fr+KdbJbT8D1u9ax7J0Kw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gYimdcu9EFreExE+j4j0ex6FpsWH8swNWHwVUMe8kQI+d5KnpMOn53G4OfrlrehCkej0S7AuO3TLzett1Bw2x+4gOFt52ar4RpO3RyxbkDrLAUHgmUbWDuD31JUTjjpHUVDlxsV8JxBgw3mG6Aht31CVx31dJgTKd6UB58a3x0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrQfgSNz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrQfgSNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747312541; x=1778848541;
  h=date:from:to:cc:subject:message-id;
  bh=GWcGuuFDNA5MgqqnhfuCg3fr+KdbJbT8D1u9ax7J0Kw=;
  b=nrQfgSNzoeNETnRm38lkaYJ2HPXYPPGZ6LjReQ6ZsejyBJDxhaBCpcyd
   9Xuvr3pGqjPem9K3yIg623gyTP1+RpALP41+cJ6IOstyDWhDXAET8tMt9
   fktjKX2hj/vJZzKGNu/umGjrxR6kfy/wx8WEOuHrPNRx5MzSUIBBkiIUS
   OBsYRtHcWFgieuXvmtbbmvyaI/r5LaH8UvyiQefWtASBZZJCPTBw75e6o
   PRDPdkbjjsBRsdTPpbwOoQLrqAmdzQLmPRVLVBF9Mwd3VQwPfsZ+X6oc4
   OJaTN0HN/T1HseITCihIGsjWmi4ll1rXhXXt3bONszjfjLTMTvnmQDFqY
   Q==;
X-CSE-ConnectionGUID: mr6hVxjUSYSSbNpvzwRXJw==
X-CSE-MsgGUID: iMps9WN7T+yQvUZYdozo+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49405357"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49405357"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 05:33:39 -0700
X-CSE-ConnectionGUID: BTGdWW7pRW+bwZBoBB07ZQ==
X-CSE-MsgGUID: RxC7QKyeQgewy+BxaWjlFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143557235"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2025 05:33:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFXmJ-000INE-0g;
	Thu, 15 May 2025 12:33:35 +0000
Date: Thu, 15 May 2025 20:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:objtool/core] BUILD SUCCESS
 4ed9d82bf5b21d65e2f18249eec89a6a84df8f23
Message-ID: <202505152008.6WUAGwDU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
branch HEAD: 4ed9d82bf5b21d65e2f18249eec89a6a84df8f23  objtool: Speed up SHT_GROUP reindexing

elapsed time: 1453m

configs tested: 226
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
riscv                 randconfig-002-20250515    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250515    clang-21
s390                  randconfig-002-20250515    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250515    gcc-14.2.0
sh                    randconfig-002-20250515    gcc-10.5.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250515    gcc-6.5.0
sparc                 randconfig-002-20250515    gcc-10.3.0
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
um                    randconfig-002-20250515    clang-21
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
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-14.2.0
xtensa                randconfig-002-20250515    gcc-13.3.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
