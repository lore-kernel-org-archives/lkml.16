Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100FE555
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745005630; cv=none; b=Qpfvxy1Lh5Vl43qez0TILLTA3z55G2ojhZoOaDNZpLpb7NYZJEYCo6gizFTcuqPYKJNgyO/cfMyTCLKzoPQrc3R+enNjjsYiDDv2Ind+UjjDlarAZ8FLKEFxFx+f1G1jUTaMvQurvsnV/d05vFtqTW6UfcJAb9lEIGnUjIiTo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745005630; c=relaxed/simple;
	bh=4O6Dh9DBRHcqhoHKPHHO/u6C97VHPF8DBEKLyCfYTsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=givWclxFZ3WZFx6Gplep5Ef8+neXfQKy9lo7Qs6zG64MsH31Z8RyuFDob+y9Ko11JxCRHsqCYFK12dybBqzMTNR6JM8AZFc9ZzvGgXDsBP96NhNP6p0HCEvudPJs8gllGVvv/pKGq64kd8SYuPmunlH6KY86CII5zXltGHQ0jtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFTWxP6e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFTWxP6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745005629; x=1776541629;
  h=date:from:to:cc:subject:message-id;
  bh=4O6Dh9DBRHcqhoHKPHHO/u6C97VHPF8DBEKLyCfYTsM=;
  b=JFTWxP6eC+awhU5j+tt3+G+X/A9to+3xh1lz1kUXnC0ySvCsVd19FF0R
   8s4AlHb0Ck5ccJcBYUKKsBTJ8wAKQxOlNhjUKmMJ2APb7yUTnEoc6xVAG
   dmrvY85ncAq76ZH25fcsfUgXexAapEa9ks4Yoma9qf+LrZnTrCtXqG7va
   jSnM7Q8V8uJqBYLDe2La0zxR95DyWAM2rixiQocDq4SkAbTJXJ7ggNjVv
   gQ25/J5L/lshmbCEBzw1D6a+RP00S7GrObDGfxl+st4q7CJBN1m6/mEL1
   Ld0I0DLha4/jiSoHsJoRUs1Qm7KJx7beiRhu4cMTkqXBtLYQNsavFSU8E
   g==;
X-CSE-ConnectionGUID: WLD/sHbyTSmFQxEwEYx9sA==
X-CSE-MsgGUID: 0+g6G88sSy6ecaf6A6wALg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50301986"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50301986"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 12:47:08 -0700
X-CSE-ConnectionGUID: h/Hs5G9qSsuSk4PEAWQoHg==
X-CSE-MsgGUID: BX5MqO4hROWv9cibJxWmaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="131203934"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Apr 2025 12:47:07 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5rg0-0003GB-2L;
	Fri, 18 Apr 2025 19:47:04 +0000
Date: Sat, 19 Apr 2025 03:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.04.16a] BUILD SUCCESS
 d037d1bb13a9b963de24af8372bf3f940568e8e6
Message-ID: <202504190318.FF98uOJW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.04.16a
branch HEAD: d037d1bb13a9b963de24af8372bf3f940568e8e6  EXP rcutorture: Fix duplicate ->up_read() and misplaced WARN_ON_ONCE()

elapsed time: 1458m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250418    gcc-14.2.0
arc                   randconfig-001-20250419    gcc-14.2.0
arc                   randconfig-002-20250418    gcc-12.4.0
arc                   randconfig-002-20250419    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250418    gcc-8.5.0
arm                   randconfig-001-20250419    gcc-6.5.0
arm                   randconfig-002-20250418    gcc-7.5.0
arm                   randconfig-002-20250419    gcc-7.5.0
arm                   randconfig-003-20250418    gcc-8.5.0
arm                   randconfig-003-20250419    clang-18
arm                   randconfig-004-20250418    clang-21
arm                   randconfig-004-20250419    gcc-7.5.0
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250418    clang-21
arm64                 randconfig-002-20250418    clang-21
arm64                 randconfig-003-20250418    clang-21
arm64                 randconfig-003-20250419    gcc-5.5.0
arm64                 randconfig-004-20250418    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250418    gcc-14.2.0
csky                  randconfig-001-20250419    gcc-11.5.0
csky                  randconfig-002-20250418    gcc-10.5.0
csky                  randconfig-002-20250419    gcc-11.5.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250418    clang-21
hexagon               randconfig-001-20250419    clang-21
hexagon               randconfig-002-20250418    clang-21
hexagon               randconfig-002-20250419    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250418    clang-20
i386        buildonly-randconfig-001-20250419    gcc-11
i386        buildonly-randconfig-002-20250418    gcc-12
i386        buildonly-randconfig-002-20250419    gcc-12
i386        buildonly-randconfig-003-20250418    clang-20
i386        buildonly-randconfig-003-20250419    clang-20
i386        buildonly-randconfig-004-20250418    gcc-12
i386        buildonly-randconfig-004-20250419    clang-20
i386        buildonly-randconfig-005-20250418    gcc-11
i386        buildonly-randconfig-006-20250418    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250418    gcc-14.2.0
loongarch             randconfig-002-20250418    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
mips                        omega2p_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250418    gcc-10.5.0
nios2                 randconfig-001-20250419    gcc-7.5.0
nios2                 randconfig-002-20250418    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250418    gcc-11.5.0
parisc                randconfig-002-20250418    gcc-13.3.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250418    gcc-8.5.0
powerpc               randconfig-002-20250418    gcc-6.5.0
powerpc               randconfig-003-20250418    clang-21
powerpc64             randconfig-001-20250418    clang-21
powerpc64             randconfig-002-20250418    clang-21
powerpc64             randconfig-003-20250418    clang-17
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250418    clang-21
riscv                 randconfig-001-20250419    gcc-14.2.0
riscv                 randconfig-002-20250418    clang-21
riscv                 randconfig-002-20250419    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250418    gcc-7.5.0
s390                  randconfig-001-20250419    clang-21
s390                  randconfig-002-20250418    gcc-6.5.0
s390                  randconfig-002-20250419    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                    randconfig-001-20250418    gcc-12.4.0
sh                    randconfig-001-20250419    gcc-5.5.0
sh                    randconfig-002-20250418    gcc-14.2.0
sh                    randconfig-002-20250419    gcc-11.5.0
sh                           se7721_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250418    gcc-10.3.0
sparc                 randconfig-001-20250419    gcc-12.4.0
sparc                 randconfig-002-20250418    gcc-7.5.0
sparc                 randconfig-002-20250419    gcc-8.5.0
sparc64               randconfig-001-20250418    gcc-9.3.0
sparc64               randconfig-001-20250419    gcc-8.5.0
sparc64               randconfig-002-20250418    gcc-11.5.0
sparc64               randconfig-002-20250419    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250418    clang-21
um                    randconfig-001-20250419    clang-19
um                    randconfig-002-20250418    clang-21
um                    randconfig-002-20250419    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250418    clang-20
x86_64      buildonly-randconfig-001-20250419    gcc-12
x86_64      buildonly-randconfig-002-20250418    clang-20
x86_64      buildonly-randconfig-002-20250419    gcc-11
x86_64      buildonly-randconfig-003-20250418    clang-20
x86_64      buildonly-randconfig-003-20250419    gcc-12
x86_64      buildonly-randconfig-004-20250418    clang-20
x86_64      buildonly-randconfig-004-20250419    gcc-11
x86_64      buildonly-randconfig-005-20250418    clang-20
x86_64      buildonly-randconfig-006-20250418    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250418    gcc-7.5.0
xtensa                randconfig-002-20250418    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
