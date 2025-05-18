Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96A33FD
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 05:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747545660; cv=none; b=MVjegCbRqfU4SbP3LO2LK4/9j0JUomhK/acXUf6hhujMhyPy/NGxRqa/RR+85G/WOAbYa4bVaUlAMxUaBuMwa2I8b8jz8GOArKaKhGBP4DdvFz9XajrFdu7rseiPleaqJHkWrm/Lzh1xxgcMAnnTfppqeVSVdk/Mb+o1HqINX1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747545660; c=relaxed/simple;
	bh=GcIWKulvOllfV1khkYRDi69jwakAqasPpzSOE36b7K0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pZSslmKvBfoHpDffiYvUdI3pH6s4Vb17ri9ckdYYjPeO9d/otP48lZh2vFc+rQAiz++w1x8Y1PnWxMONTDHQ5CJl3x9n1EG23lGABOouhObVnhK6PVa6d5dqq7B1MU1I9VbQcp46oBY7oFv1pqgzaosnFM0h5zcla3Npw0CU7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giow3BFn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giow3BFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747545659; x=1779081659;
  h=date:from:to:cc:subject:message-id;
  bh=GcIWKulvOllfV1khkYRDi69jwakAqasPpzSOE36b7K0=;
  b=giow3BFna1BaZNl1vEN7ukUSOyW82pOo+YIHMgoSSkQB9blPTw30NMbi
   xHwJ5BUWn0ZsM5V/mv0Qb5UkJ5wD9XVOHvZcEjgrSjzuvSy05mGGV/IWx
   HFQtDtHy0beOnFPWySdmGIf2QiXwgvz9v8gqeg+QBN5tDWzwyv9Sop1/E
   hgD24+uFi+Q4U2Pxl3EfeJ9jK4lq2RpIdHRMxgMKgQqu2r/PQZ/J70jaW
   YupbKX6INapdGab206e1McJUbngYfmvrbiA5KKH3kDNABoJu6R9iQ9+/d
   1mt5yyb0pJ/TDLiide7PmWTNbqBlYSWY8M64A+RKU24DU/d994uvHoDV5
   Q==;
X-CSE-ConnectionGUID: 2olwCLGRSGa9+VJ9UYbfKw==
X-CSE-MsgGUID: tI/KR6dnTiezA12swfZh1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60498534"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="60498534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 22:20:58 -0700
X-CSE-ConnectionGUID: KO9lwf/4TmGRWdFujtPTWw==
X-CSE-MsgGUID: 3t3cDRimTqaqem8gbNVTcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139585514"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2025 22:20:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGWSF-000Ke3-0C;
	Sun, 18 May 2025 05:20:55 +0000
Date: Sun, 18 May 2025 13:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/core] BUILD SUCCESS
 09230b7554824c9db1712324efcf3595c67fd326
Message-ID: <202505181306.OJjP5eIK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
branch HEAD: 09230b7554824c9db1712324efcf3595c67fd326  x86/paravirt: Restrict PARAVIRT_XXL to 64-bit only

elapsed time: 919m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250517    gcc-10.5.0
arc                   randconfig-002-20250517    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250517    clang-21
arm                   randconfig-002-20250517    gcc-8.5.0
arm                   randconfig-003-20250517    gcc-8.5.0
arm                   randconfig-004-20250517    clang-21
arm                           stm32_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250517    clang-17
arm64                 randconfig-002-20250517    clang-16
arm64                 randconfig-003-20250517    gcc-6.5.0
arm64                 randconfig-004-20250517    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250517    gcc-10.5.0
csky                  randconfig-002-20250517    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250517    clang-21
hexagon               randconfig-002-20250517    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250517    clang-20
i386        buildonly-randconfig-002-20250517    clang-20
i386        buildonly-randconfig-003-20250517    clang-20
i386        buildonly-randconfig-004-20250517    gcc-12
i386        buildonly-randconfig-005-20250517    clang-20
i386        buildonly-randconfig-006-20250517    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250517    gcc-14.2.0
loongarch             randconfig-002-20250517    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250517    gcc-14.2.0
nios2                 randconfig-002-20250517    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250517    gcc-5.5.0
parisc                randconfig-002-20250517    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250517    gcc-6.5.0
powerpc               randconfig-002-20250517    gcc-6.5.0
powerpc               randconfig-003-20250517    clang-16
powerpc64             randconfig-001-20250517    clang-21
powerpc64             randconfig-002-20250517    gcc-6.5.0
powerpc64             randconfig-003-20250517    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250517    clang-21
riscv                 randconfig-002-20250517    clang-21
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250517    gcc-7.5.0
s390                  randconfig-002-20250517    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250517    gcc-12.4.0
sh                    randconfig-002-20250517    gcc-10.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250517    gcc-11.5.0
sparc                 randconfig-002-20250517    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250517    gcc-7.5.0
sparc64               randconfig-002-20250517    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250517    gcc-12
um                    randconfig-002-20250517    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250517    gcc-12
x86_64      buildonly-randconfig-002-20250517    gcc-12
x86_64      buildonly-randconfig-003-20250517    clang-20
x86_64      buildonly-randconfig-004-20250517    clang-20
x86_64      buildonly-randconfig-005-20250517    clang-20
x86_64      buildonly-randconfig-006-20250517    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250517    gcc-9.3.0
xtensa                randconfig-002-20250517    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
