Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D038D21A92F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830530; cv=none; b=ioXhayw8iL9Lm2IIauiGD1aoYFQa6t99IMjlubIS89cbCrfkwiNarhM+4X7DelxnJT9HPNLjteBzyeuLHigEZD55ITGpzdmtkglZdmlphLUr00eDEMnPQqAl/epNJ21tvMaxSuGKKw1hhMmHYatAh6nPbJsBI3RzjKz8aqtQqIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830530; c=relaxed/simple;
	bh=sosNfj7/7LX9bMSYzpQ5zGMCgD2aAiz50aiJZbbwT+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rQwwHqvL6l6RV03LkOlxGhnHFEjlQpHS1WU7Xndbwmqcm46DmLfvEv5pEwJxAqQ6c+ymX3Jk7jQrDD9VIeIRiDmEasy4CCdp0spwkS7P6Dgt2WfRhNHYbwaslnEmZ6H6apRJort70Au1IBOY0wk/yfeA+C6BcEPPH4gQEpG3RgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTu2Tbnd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTu2Tbnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746830528; x=1778366528;
  h=date:from:to:cc:subject:message-id;
  bh=sosNfj7/7LX9bMSYzpQ5zGMCgD2aAiz50aiJZbbwT+M=;
  b=kTu2TbndWEdtm7UGrg86WG7f2hacB/wNCSV9AJh0jAMB1vtaCUOxkXDZ
   xdln7sVVvuMKKMclHlPWth/MU/qtfYhSpPhHdnDbWcLPZnjfZqhofzw18
   +L/sNjSugoV8i41i2hf1NLS6KEU92UYxNLe6SVTiQeMSlOgP2PX5o3ne7
   4GdMmA4Rm7H6iouhEm708ikQDLwXunUBTT6p5vRiM7D36AoC+mkuBrDVQ
   wV0k5BZKJLp1Q/ecwPm2n22AUxmOyD33/bXOLEcILSySYDopCcBckVuT+
   TIXiQEJOTVQ86xYQWjEQM54M34Wnfjij6BdWdglcE5G1O0mi5BKaA1+S1
   Q==;
X-CSE-ConnectionGUID: 18QUVkcLRO2T5dXp81twLQ==
X-CSE-MsgGUID: G7x1MexmQqqitDpx6DzZ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47925335"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="47925335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 15:42:07 -0700
X-CSE-ConnectionGUID: ixEtQzgBTYO0Kuocn3514Q==
X-CSE-MsgGUID: JJ1EeIh1RYOIXQQEISxGNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136619710"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2025 15:42:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDWPr-000CYB-2X;
	Fri, 09 May 2025 22:42:03 +0000
Date: Sat, 10 May 2025 06:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 031e77577f69e78ed4f8874340a0b06eaa56e4c2
Message-ID: <202505100607.UWoOaafn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 031e77577f69e78ed4f8874340a0b06eaa56e4c2  EXP arm64: enable PREEMPT_LAZY

elapsed time: 1381m

configs tested: 207
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250509    gcc-13.3.0
arc                   randconfig-001-20250510    gcc-8.5.0
arc                   randconfig-002-20250509    gcc-13.3.0
arc                   randconfig-002-20250510    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                         bcm2835_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250509    gcc-7.5.0
arm                   randconfig-001-20250510    gcc-8.5.0
arm                   randconfig-002-20250509    gcc-6.5.0
arm                   randconfig-002-20250510    gcc-8.5.0
arm                   randconfig-003-20250509    gcc-10.5.0
arm                   randconfig-003-20250510    gcc-8.5.0
arm                   randconfig-004-20250509    clang-21
arm                   randconfig-004-20250510    gcc-8.5.0
arm                          sp7021_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250509    gcc-7.5.0
arm64                 randconfig-001-20250510    gcc-8.5.0
arm64                 randconfig-002-20250509    gcc-7.5.0
arm64                 randconfig-002-20250510    gcc-8.5.0
arm64                 randconfig-003-20250509    clang-21
arm64                 randconfig-003-20250510    gcc-8.5.0
arm64                 randconfig-004-20250509    gcc-5.5.0
arm64                 randconfig-004-20250510    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250509    gcc-14.2.0
csky                  randconfig-001-20250510    clang-18
csky                  randconfig-002-20250509    gcc-13.3.0
csky                  randconfig-002-20250510    clang-18
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20250509    clang-20
hexagon               randconfig-001-20250510    clang-18
hexagon               randconfig-002-20250509    clang-21
hexagon               randconfig-002-20250510    clang-18
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250509    gcc-11
i386        buildonly-randconfig-002-20250509    gcc-12
i386        buildonly-randconfig-003-20250509    clang-20
i386        buildonly-randconfig-004-20250509    clang-20
i386        buildonly-randconfig-005-20250509    gcc-12
i386        buildonly-randconfig-006-20250509    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250510    gcc-12
i386                  randconfig-002-20250510    gcc-12
i386                  randconfig-003-20250510    gcc-12
i386                  randconfig-004-20250510    gcc-12
i386                  randconfig-005-20250510    gcc-12
i386                  randconfig-006-20250510    gcc-12
i386                  randconfig-007-20250510    gcc-12
i386                  randconfig-011-20250510    clang-20
i386                  randconfig-012-20250510    clang-20
i386                  randconfig-013-20250510    clang-20
i386                  randconfig-014-20250510    clang-20
i386                  randconfig-015-20250510    clang-20
i386                  randconfig-016-20250510    clang-20
i386                  randconfig-017-20250510    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250509    gcc-13.3.0
loongarch             randconfig-001-20250510    clang-18
loongarch             randconfig-002-20250509    gcc-14.2.0
loongarch             randconfig-002-20250510    clang-18
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250509    gcc-13.3.0
nios2                 randconfig-001-20250510    clang-18
nios2                 randconfig-002-20250509    gcc-13.3.0
nios2                 randconfig-002-20250510    clang-18
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-21
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250509    gcc-6.5.0
parisc                randconfig-001-20250510    clang-18
parisc                randconfig-002-20250509    gcc-14.2.0
parisc                randconfig-002-20250510    clang-18
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250509    clang-16
powerpc               randconfig-001-20250510    clang-18
powerpc               randconfig-002-20250509    gcc-5.5.0
powerpc               randconfig-002-20250510    clang-18
powerpc               randconfig-003-20250509    gcc-7.5.0
powerpc               randconfig-003-20250510    clang-18
powerpc64             randconfig-001-20250509    gcc-7.5.0
powerpc64             randconfig-001-20250510    clang-18
powerpc64             randconfig-002-20250509    clang-21
powerpc64             randconfig-002-20250510    clang-18
powerpc64             randconfig-003-20250509    gcc-10.5.0
powerpc64             randconfig-003-20250510    clang-18
riscv                            allmodconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250509    clang-21
riscv                 randconfig-001-20250510    clang-21
riscv                 randconfig-002-20250509    clang-21
riscv                 randconfig-002-20250510    clang-21
s390                             allmodconfig    gcc-14.2.0
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250509    clang-21
s390                  randconfig-001-20250510    clang-21
s390                  randconfig-002-20250509    clang-17
s390                  randconfig-002-20250510    clang-21
sh                               alldefconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    clang-21
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20250509    gcc-9.3.0
sh                    randconfig-001-20250510    clang-21
sh                    randconfig-002-20250509    gcc-5.5.0
sh                    randconfig-002-20250510    clang-21
sh                          rsk7201_defconfig    clang-21
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250509    gcc-6.5.0
sparc                 randconfig-001-20250510    clang-21
sparc                 randconfig-002-20250509    gcc-6.5.0
sparc                 randconfig-002-20250510    clang-21
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250509    gcc-10.5.0
sparc64               randconfig-001-20250510    clang-21
sparc64               randconfig-002-20250509    gcc-6.5.0
sparc64               randconfig-002-20250510    clang-21
um                               allmodconfig    clang-19
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250509    clang-21
um                    randconfig-001-20250510    clang-21
um                    randconfig-002-20250509    gcc-12
um                    randconfig-002-20250510    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250509    gcc-11
x86_64      buildonly-randconfig-001-20250510    clang-20
x86_64      buildonly-randconfig-002-20250509    gcc-11
x86_64      buildonly-randconfig-002-20250510    clang-20
x86_64      buildonly-randconfig-003-20250509    clang-20
x86_64      buildonly-randconfig-003-20250510    clang-20
x86_64      buildonly-randconfig-004-20250509    clang-20
x86_64      buildonly-randconfig-004-20250510    clang-20
x86_64      buildonly-randconfig-005-20250509    gcc-12
x86_64      buildonly-randconfig-005-20250510    clang-20
x86_64      buildonly-randconfig-006-20250509    gcc-12
x86_64      buildonly-randconfig-006-20250510    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250510    clang-20
x86_64                randconfig-002-20250510    clang-20
x86_64                randconfig-003-20250510    clang-20
x86_64                randconfig-004-20250510    clang-20
x86_64                randconfig-005-20250510    clang-20
x86_64                randconfig-006-20250510    clang-20
x86_64                randconfig-007-20250510    clang-20
x86_64                randconfig-008-20250510    clang-20
x86_64                randconfig-071-20250510    gcc-11
x86_64                randconfig-072-20250510    gcc-11
x86_64                randconfig-073-20250510    gcc-11
x86_64                randconfig-074-20250510    gcc-11
x86_64                randconfig-075-20250510    gcc-11
x86_64                randconfig-076-20250510    gcc-11
x86_64                randconfig-077-20250510    gcc-11
x86_64                randconfig-078-20250510    gcc-11
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250509    gcc-12.4.0
xtensa                randconfig-001-20250510    clang-21
xtensa                randconfig-002-20250509    gcc-14.2.0
xtensa                randconfig-002-20250510    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
