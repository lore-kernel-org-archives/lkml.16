Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C027FD68
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707804; cv=none; b=f2c/ieoTVKjJ3/ARQHr7YcJGjEkoBnLxOHjbycL2Qww2vigrkTnN/BsHmHKnI2DTga5VKyTMJcCQQ5UJAefZE9V18kIJotUqXx7AXeU8STh8x/sIycV9WgsxhJjeNI1BlVorwm9uNfcXhGqtICW+jWEf5SDYRFUu3UoaH48vnpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707804; c=relaxed/simple;
	bh=YIscRPW9sF4loXc/ssspvQlrdEiukJwIUPkxHLE5ZBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MfLMxvXlVBU+r26EwxHQ6AyN0ib5aGngXwMghyjzBn+s9zqS9d+qVIEwcu7pNX2DPNd/aT8SPKcqLamhd4VZho/bmN+ODldRZv+PKw9r1vCRAky057dFhkRk8hkuk2WHlFeT6bKCoqCwGS+fh7I8cp0bSLKX72DbGgW9MHOR99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4YhJ4Nq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4YhJ4Nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744707802; x=1776243802;
  h=date:from:to:cc:subject:message-id;
  bh=YIscRPW9sF4loXc/ssspvQlrdEiukJwIUPkxHLE5ZBY=;
  b=X4YhJ4Nqcdq+g0YmS+sNqForRFKfxHvgz+oU8BtkgrJUBicCPjqomy/E
   xw0O/9V5clRxGp00jXms1A0y7sanCJULMIAugQpyDfuUi7LKjucEzgkNp
   4imFrv3EGmH5Mto44mLDTYIkLMlYQurOJBPfgdWZhAI2VvLIegPg5iHIH
   faScQzkqn5c/jXQ/P/8zonoyTbQoB////ua2JBR+iU3vKg53PgZb0pbvG
   aqVWDiQpanOLiTz6XLpH3uzVnGsfZM6ozxb6yDTCxHDG/jTcH46NWbvRQ
   70yoQgGs9QzGzcK/0om3c71Bx0TXkpc8Fm5Wt5vxLZsgcdwuYSqwShfi2
   w==;
X-CSE-ConnectionGUID: pTTM/jO+QS23CRUPkrtIXA==
X-CSE-MsgGUID: cQcOO8XKQueOh7ZeP8YsGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="48904936"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="48904936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:03:21 -0700
X-CSE-ConnectionGUID: DxBINavYRI2giYwp2XxFGw==
X-CSE-MsgGUID: jKP/FrPxR/2YUw+j5RH3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="153260389"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2025 02:03:20 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4cCM-000FSy-0T;
	Tue, 15 Apr 2025 09:03:18 +0000
Date: Tue, 15 Apr 2025 17:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/merge] BUILD SUCCESS
 e6090e017e4b1e2a1e461750b7281a05f4e07a76
Message-ID: <202504151718.0ciJ08Gj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/merge
branch HEAD: e6090e017e4b1e2a1e461750b7281a05f4e07a76  Merge branch 'x86/cpu' into x86/merge, to resolve conflict

elapsed time: 1452m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250414    gcc-14.2.0
arc                   randconfig-002-20250414    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250414    clang-18
arm                   randconfig-002-20250414    gcc-7.5.0
arm                   randconfig-003-20250414    gcc-7.5.0
arm                   randconfig-004-20250414    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-002-20250414    clang-19
arm64                 randconfig-003-20250414    gcc-8.5.0
arm64                 randconfig-004-20250414    gcc-6.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250414    gcc-14.2.0
csky                  randconfig-002-20250414    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250414    clang-18
hexagon               randconfig-002-20250414    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250414    gcc-12
i386        buildonly-randconfig-002-20250414    clang-20
i386        buildonly-randconfig-003-20250414    clang-20
i386        buildonly-randconfig-004-20250414    gcc-12
i386        buildonly-randconfig-005-20250414    gcc-12
i386        buildonly-randconfig-006-20250414    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250414    gcc-12.4.0
loongarch             randconfig-002-20250414    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250414    gcc-12.4.0
nios2                 randconfig-002-20250414    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250414    gcc-5.5.0
parisc                randconfig-002-20250414    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250414    gcc-8.5.0
powerpc               randconfig-002-20250414    clang-21
powerpc               randconfig-003-20250414    gcc-6.5.0
powerpc64             randconfig-001-20250414    clang-17
powerpc64             randconfig-002-20250414    clang-21
powerpc64             randconfig-003-20250414    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250414    gcc-8.5.0
riscv                 randconfig-002-20250414    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250414    clang-20
s390                  randconfig-002-20250414    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250414    gcc-6.5.0
sh                    randconfig-002-20250414    gcc-10.5.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250414    gcc-11.5.0
sparc                 randconfig-002-20250414    gcc-13.3.0
sparc64               randconfig-001-20250414    gcc-5.5.0
sparc64               randconfig-002-20250414    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250414    clang-21
um                    randconfig-002-20250414    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250414    clang-20
x86_64      buildonly-randconfig-002-20250414    clang-20
x86_64      buildonly-randconfig-003-20250414    clang-20
x86_64      buildonly-randconfig-004-20250414    clang-20
x86_64      buildonly-randconfig-005-20250414    clang-20
x86_64      buildonly-randconfig-006-20250414    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250414    gcc-7.5.0
xtensa                randconfig-002-20250414    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
