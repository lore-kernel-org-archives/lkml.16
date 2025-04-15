Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5F274FE5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704264; cv=none; b=ZyPRmkHmXAMHI3OnJdo72VcPGU2ISFNdGglN26asCC170RLszKWRsv+pTTG4J1mzvs7YyO0x66pIWtAF+BJhzxY9UUMW3kw3nlrA9Hl7ICFw6bPZHr/IHqO3O7s5BQdhsRgoS8ehzHFfvNSHa5Kpx8PPv9tWXy1rr3keHiM/4fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704264; c=relaxed/simple;
	bh=MCFdjtzdQYNqOd9ssFJozSuc8EYeldb8BXM2CQqD/6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=To0B8mb8sF7Cq6B5Ur9Uw/3bP935e5M7gIY3VPHAfcHhXDZLN322p1bzB5uq2KJHuShFUc4xwj3KLgLCm04aAwdNFrO1v5aaje1AxeP0ZLmiARMDbUPpBWGzf+7TXeNbO1NMsuCVbcOzlyIUMP4AqLYjw8oHaLaZs2MUZW+k4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ek0wKrbH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ek0wKrbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744704263; x=1776240263;
  h=date:from:to:cc:subject:message-id;
  bh=MCFdjtzdQYNqOd9ssFJozSuc8EYeldb8BXM2CQqD/6I=;
  b=ek0wKrbHg3xN6G4O8m2zmavVTazlDWn7S/vtzOQ29TPJ5wFSi83AbkXG
   P9GRkmTMSkgBqNGR1+UTFme9mYn6sXeA+/mESAqnLHlRVSxm6JuEfbxZu
   73o98dvE9nSIWYjdLZsMu2Nds9Ws0E10Z54Xpdx0olZJUMIERpOnPgghK
   KPRXbeLFufidmB9um2o342xg+09/m2qHHrZw58tMeh6qICj4966lnMADp
   SMByUrLj+iQxzNVqHJVPEzqTJer4SlNYsgCt37Klw3j+FUdov/TWv7qjl
   6IW+QQ0kxcvebToh7Vl/RRde8v52aQBoz8QtAkAlrJA2+qnw/18xPrB02
   g==;
X-CSE-ConnectionGUID: kGXgipHvQNmqgUizI5bkDA==
X-CSE-MsgGUID: TH/5U5OkSsyEEMKRO2P7ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50000216"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="50000216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:03:15 -0700
X-CSE-ConnectionGUID: lbM0sHkqTGGK4YJ3Xd5LHQ==
X-CSE-MsgGUID: dZb7SklNSOG4bgBaB8ZCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134146676"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2025 01:03:13 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4bGB-000FOE-1R;
	Tue, 15 Apr 2025 08:03:11 +0000
Date: Tue, 15 Apr 2025 16:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core/urgent] BUILD SUCCESS
 1013f5636fd808569c1f4c40a58a4efc70713a28
Message-ID: <202504151636.eDsdz86W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/urgent
branch HEAD: 1013f5636fd808569c1f4c40a58a4efc70713a28  genksyms: Handle typeof_unqual keyword and __seg_{fs,gs} qualifiers

elapsed time: 1468m

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
arc                   randconfig-001-20250414    gcc-14.2.0
arc                   randconfig-002-20250414    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250414    clang-18
arm                   randconfig-002-20250414    gcc-7.5.0
arm                   randconfig-003-20250414    gcc-7.5.0
arm                   randconfig-004-20250414    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250414    clang-21
arm64                 randconfig-002-20250414    clang-19
arm64                 randconfig-003-20250414    gcc-8.5.0
arm64                 randconfig-004-20250414    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250414    gcc-14.2.0
csky                  randconfig-002-20250414    gcc-10.5.0
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
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-21
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
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
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
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250414    gcc-11.5.0
sparc                 randconfig-002-20250414    gcc-13.3.0
sparc64                          alldefconfig    gcc-14.2.0
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
