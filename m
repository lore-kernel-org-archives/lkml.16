Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6421E4BE
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749975994; cv=none; b=Jvt0PC3oTgHPju4/VW+qTEsIAPigDvmSJ9AEuCYeq7scQRtrGZEBoBO4F0L69eewxL+4/Xd7f46K00yXHlUJqB4JR11nIGIVDBYe1s7GU+H3M82MIqWVes1gh6gmfXL4EMzMHSTUTfDT5cp27zm7h+TmhtzGysf1R+9lklNWons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749975994; c=relaxed/simple;
	bh=sxgCmGZvuXVdXTw8/rpedx6cK5QpNlKr24Udxj590jA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OnO35sttQf9+EZoOUsC6z6COboxBNfdQRoX5n5q2/zKUVnZjDiC82v9h3wYbCrH6A5IU9b6k4Vzk2+FDZrr8hkzqc67h8+TqpBMSJR4VkWrpyojJgGI89WTsbxw9H8skX4lIoNimfb0j/N7fXQy5JTCqgbMSCvXtL/A4Qg26WQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMvYn5KJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMvYn5KJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749975993; x=1781511993;
  h=date:from:to:cc:subject:message-id;
  bh=sxgCmGZvuXVdXTw8/rpedx6cK5QpNlKr24Udxj590jA=;
  b=cMvYn5KJwP3AU5FqCJGACSO39L8IzwSxy+zmRmvk2uEoZ+DB48207tbo
   6Hxvs+vPZbV9INdDJKd6TbebNgtdqbn9vMz3MOQmHfm0mkBgKEVUF92pq
   qmldyf0DplNUZit3WIWMSK0OkfBauRj028/N46LqI3A1Ceps/EHI6q4Qg
   Y0G/JwTKqSoSRrNdq3CuFprqwvfDHaPs4+HKfJW93bw1CMjgpIHxyvukP
   +IFu4yCik9FNGTteq7aIwlRmBru5aF5ZJt92Am8LDFIx4xx9RAGouPM/N
   hzVnbFxMUXZpy/ZLAdmFiNETimpbs0kvMqWZhHxdfJUEjnLLz4U6eiS+l
   Q==;
X-CSE-ConnectionGUID: 3nlpkMjmTWOj3qZlUPornQ==
X-CSE-MsgGUID: wzeAJYn/QnG5iWpVlwWmpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55940605"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="55940605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 01:26:32 -0700
X-CSE-ConnectionGUID: 2FRrRYW8QX22eBn7bNH6ig==
X-CSE-MsgGUID: QsMUhbFkRFenupZO2XDZUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148746953"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jun 2025 01:26:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQihA-000ECk-2h;
	Sun, 15 Jun 2025 08:26:28 +0000
Date: Sun, 15 Jun 2025 16:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/core] BUILD SUCCESS
 bfa788dc2ddaea7d7930f63a5c7c8f3668a3f2c5
Message-ID: <202506151644.mgWuabYq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
branch HEAD: bfa788dc2ddaea7d7930f63a5c7c8f3668a3f2c5  clocksource: Use cpumask_next_wrap() in clocksource_watchdog()

elapsed time: 818m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250615    gcc-12.4.0
arc                   randconfig-002-20250615    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                            mmp2_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250615    clang-16
arm                   randconfig-002-20250615    clang-21
arm                   randconfig-003-20250615    gcc-8.5.0
arm                   randconfig-004-20250615    clang-21
arm                         socfpga_defconfig    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250615    clang-16
arm64                 randconfig-002-20250615    gcc-9.5.0
arm64                 randconfig-003-20250615    gcc-12.3.0
arm64                 randconfig-004-20250615    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250615    gcc-14.3.0
csky                  randconfig-002-20250615    gcc-10.5.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250615    clang-21
hexagon               randconfig-002-20250615    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250615    gcc-12
i386        buildonly-randconfig-002-20250615    gcc-12
i386        buildonly-randconfig-003-20250615    gcc-12
i386        buildonly-randconfig-004-20250615    clang-20
i386        buildonly-randconfig-005-20250615    gcc-12
i386        buildonly-randconfig-006-20250615    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250615    gcc-15.1.0
loongarch             randconfig-002-20250615    gcc-15.1.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250615    gcc-8.5.0
nios2                 randconfig-002-20250615    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250615    gcc-14.3.0
parisc                randconfig-002-20250615    gcc-8.5.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250615    gcc-8.5.0
powerpc               randconfig-002-20250615    clang-21
powerpc               randconfig-003-20250615    gcc-10.5.0
powerpc64             randconfig-002-20250615    gcc-15.1.0
powerpc64             randconfig-003-20250615    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250615    clang-21
riscv                 randconfig-002-20250615    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250615    gcc-12.4.0
s390                  randconfig-002-20250615    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250615    gcc-15.1.0
sh                    randconfig-002-20250615    gcc-9.3.0
sh                           se7206_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250615    gcc-8.5.0
sparc                 randconfig-002-20250615    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250615    gcc-15.1.0
sparc64               randconfig-002-20250615    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250615    clang-21
um                    randconfig-002-20250615    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250615    clang-20
x86_64      buildonly-randconfig-002-20250615    clang-20
x86_64      buildonly-randconfig-003-20250615    gcc-12
x86_64      buildonly-randconfig-004-20250615    clang-20
x86_64      buildonly-randconfig-005-20250615    clang-20
x86_64      buildonly-randconfig-006-20250615    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250615    gcc-9.3.0
xtensa                randconfig-002-20250615    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
