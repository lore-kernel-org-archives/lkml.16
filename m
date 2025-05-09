Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D0C27605F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778547; cv=none; b=L3kaUZdVCI+HMTfVF1QyIbDvMi/vPUM/VItr8XueD8AaTP0zPB0UHpKKgXkHnqXc3Mas7oTM/8BVvvcAZdZpdGqpt3NajtdF3iJ9x6ArIgtKC/qHgyDWnlXsn6BPLr1KBaFKLpP5QGAHBVh8BsqcNqoVFaTyHwbshEyJXrO+lCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778547; c=relaxed/simple;
	bh=8MsJuvOJXzCTebGy+/Mg8tfuFjqW8GI/yW5Fk/csuQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SCVKKVOt8rKT5/D4RQvLGsor9GpM7ThDqEkuK/3IRaaPNraWEH5dHem2RnwlWvV3ksB24fcRbsKohjWAMpauw4wWktzNyLYlRBosXjJf/09Ru2KzGfzi0f/IFHFYBMzZsKRSlSdyqekUqQ8Fg95totZD5hD6pytpbDoUWqpcsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bH9ARC8k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bH9ARC8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746778546; x=1778314546;
  h=date:from:to:cc:subject:message-id;
  bh=8MsJuvOJXzCTebGy+/Mg8tfuFjqW8GI/yW5Fk/csuQ4=;
  b=bH9ARC8kKqG7s2sZSc7Ocee7sj1BsShAT2ccDa4CL4i/kxfmTFNe/2/k
   TLsg+gZQGDu9BdcW5cpQY69+CFEpE8qN6H5BxaJTc73g6cHeSUVNVmu0h
   wCr2XxmrU8gT9yiJI8NsIsNGjj2pNo8aZfpjIcSi0/VxwOYu76ewrepxo
   Ou71BPkdE9CtyUvQ6pWoYtnrib5FoIft+ZpcqSUiUmQLfK67PK5j1U5cF
   osU6DYfTOGMRQDRV/OfLHGAnTVjriKdkt2HiUd0x7FXMLEro6e3M8Bffs
   GOnI2HqVnJLpPriNk+6ZSQ3HkL3r01daE1guWG+knHqNW6/zNiSSGy39W
   Q==;
X-CSE-ConnectionGUID: lInoY7NFSZSbr6jhXDbwkA==
X-CSE-MsgGUID: haRsh0PkStCaboUuXcGIJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59224511"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59224511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:15:45 -0700
X-CSE-ConnectionGUID: zwhKZtb3QRqaTN3MXrTw5w==
X-CSE-MsgGUID: 4i+9kiSsQ+uhknb3MgY3hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="159850115"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2025 01:15:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDItR-000BoR-2T;
	Fri, 09 May 2025 08:15:41 +0000
Date: Fri, 09 May 2025 16:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/msr] BUILD SUCCESS
 9cf78722003178b09c409df9aafe9d79e5b9a74e
Message-ID: <202505091644.4ZrZkOVE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/msr
branch HEAD: 9cf78722003178b09c409df9aafe9d79e5b9a74e  accel/habanalabs: Don't build the driver on UML

elapsed time: 1355m

configs tested: 135
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250508    gcc-8.5.0
arc                   randconfig-002-20250508    gcc-12.4.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    clang-21
arm                           h3600_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250508    clang-17
arm                   randconfig-002-20250508    clang-21
arm                   randconfig-003-20250508    clang-21
arm                   randconfig-004-20250508    gcc-7.5.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250508    clang-21
arm64                 randconfig-002-20250508    clang-21
arm64                 randconfig-003-20250508    gcc-8.5.0
arm64                 randconfig-004-20250508    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250508    gcc-14.2.0
csky                  randconfig-002-20250508    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250508    clang-20
hexagon               randconfig-002-20250508    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250509    gcc-11
i386        buildonly-randconfig-002-20250509    gcc-12
i386        buildonly-randconfig-003-20250509    clang-20
i386        buildonly-randconfig-004-20250509    clang-20
i386        buildonly-randconfig-005-20250509    gcc-12
i386        buildonly-randconfig-006-20250509    gcc-11
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250508    gcc-14.2.0
loongarch             randconfig-002-20250508    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250508    gcc-14.2.0
nios2                 randconfig-002-20250508    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250508    gcc-9.3.0
parisc                randconfig-002-20250508    gcc-11.5.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250508    gcc-6.5.0
powerpc               randconfig-002-20250508    clang-21
powerpc               randconfig-003-20250508    gcc-6.5.0
powerpc64             randconfig-001-20250508    clang-21
powerpc64             randconfig-002-20250508    gcc-6.5.0
powerpc64             randconfig-003-20250508    gcc-8.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250508    clang-16
riscv                 randconfig-002-20250508    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250508    gcc-6.5.0
s390                  randconfig-002-20250508    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250508    gcc-14.2.0
sh                    randconfig-002-20250508    gcc-10.5.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250508    gcc-13.3.0
sparc                 randconfig-002-20250508    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250508    gcc-13.3.0
sparc64               randconfig-002-20250508    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250508    clang-21
um                    randconfig-002-20250508    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250509    gcc-11
x86_64      buildonly-randconfig-002-20250509    gcc-11
x86_64      buildonly-randconfig-003-20250509    clang-20
x86_64      buildonly-randconfig-004-20250509    clang-20
x86_64      buildonly-randconfig-005-20250509    gcc-12
x86_64      buildonly-randconfig-006-20250509    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250508    gcc-7.5.0
xtensa                randconfig-002-20250508    gcc-13.3.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
