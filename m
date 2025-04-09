Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680B101C8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230353; cv=none; b=D3H110gppWlHTIiWY07s1SXa25SDlkvgcPhY6ltH9EirdyWqo5iUB/mL3LcrZ7BCG5YG7vEr3lbSXEloGGIZDfYsuvilmE64CPxVXxImfcBr6LI0PQ6ltei8iOgaFvEnqho6OEOmN22zqDbhkS1mkLA+oSB63uFX55siGZObe/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230353; c=relaxed/simple;
	bh=hf2iLRmwqqFbEfiGwrc8Byac9cUKeXH/vVrSW94v6sQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jLudpbShlXwfBRfuodzvfo+W4udC5vgJwJUhPWUEItVQJZPegg6XafgIffiQuo2hEmbf8eTjlaXTMfXbrw1nWA20CQw7T5SB0BEbVlIoRZAR6c1q1J04Rc1dttamKWXdPJmKaZ8Dw9FA5K/Baw7wTujr8oR32FdNmntwzPvKqck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3aNSRl2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3aNSRl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744230352; x=1775766352;
  h=date:from:to:cc:subject:message-id;
  bh=hf2iLRmwqqFbEfiGwrc8Byac9cUKeXH/vVrSW94v6sQ=;
  b=D3aNSRl26bZRD02S4wS/67C4HYPn1GY6C26xCba+SEDRaF73J+66i5T3
   +CvD29DwUxUIy3lElDPWp4DQltcKbBh2l9lcvPeE2BQDHyYUxQGmAoBuy
   iIjwHgisWW84kwHoOzQ9xfG6Bsc7R8aOQOSYRGtSfl/Sryk7gmry9Zkte
   ampnM2YGCGf/baXiU5QJaSn9e2SI1TqrHMzNjv60hPfXdNStwuNIDvtK7
   MqRU2U2eFooPyrd2XYtaHzkGwzufH/6WtKenqmxCDXQYxVaZo2QdaXjMW
   XlSMnV706i1t6LTGU5MUA2xZ4x8PaAAsZZZoJqRqF1tY5oNeuVe3g7f3S
   g==;
X-CSE-ConnectionGUID: EXDTSFtXR3CIarS9PdhQrg==
X-CSE-MsgGUID: YJGqqxDbSKeBKugl5ojzkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45621117"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45621117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 13:25:52 -0700
X-CSE-ConnectionGUID: eLWQ169pQbOuT1NBrdLJug==
X-CSE-MsgGUID: AoSXH2VgSva8DVwhGMoRSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128656099"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2025 13:25:50 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2bzY-0009HP-09;
	Wed, 09 Apr 2025 20:25:48 +0000
Date: Thu, 10 Apr 2025 04:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 56799bc035658738f362acec3e7647bb84e68933
Message-ID: <202504100420.Nl4XnslM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 56799bc035658738f362acec3e7647bb84e68933  perf: Fix hang while freeing sigtrap event

elapsed time: 1462m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250409    gcc-12.4.0
arc                   randconfig-002-20250409    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250409    gcc-7.5.0
arm                   randconfig-002-20250409    gcc-7.5.0
arm                   randconfig-003-20250409    gcc-7.5.0
arm                   randconfig-004-20250409    clang-14
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250409    clang-21
arm64                 randconfig-002-20250409    clang-21
arm64                 randconfig-003-20250409    clang-15
arm64                 randconfig-004-20250409    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250409    gcc-14.2.0
csky                  randconfig-002-20250409    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250409    clang-21
hexagon               randconfig-002-20250409    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250409    gcc-12
i386        buildonly-randconfig-002-20250409    clang-20
i386        buildonly-randconfig-003-20250409    gcc-11
i386        buildonly-randconfig-004-20250409    clang-20
i386        buildonly-randconfig-005-20250409    gcc-12
i386        buildonly-randconfig-006-20250409    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250409    gcc-14.2.0
loongarch             randconfig-002-20250409    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250409    gcc-10.5.0
nios2                 randconfig-002-20250409    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250409    gcc-13.3.0
parisc                randconfig-002-20250409    gcc-13.3.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250409    gcc-6.5.0
powerpc               randconfig-002-20250409    clang-21
powerpc               randconfig-003-20250409    clang-21
powerpc64             randconfig-001-20250409    clang-21
powerpc64             randconfig-002-20250409    gcc-8.5.0
powerpc64             randconfig-003-20250409    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250409    clang-21
riscv                 randconfig-002-20250409    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250409    gcc-9.3.0
s390                  randconfig-002-20250409    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250409    gcc-12.4.0
sh                    randconfig-002-20250409    gcc-12.4.0
sh                           se7721_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250409    gcc-13.3.0
sparc                 randconfig-002-20250409    gcc-7.5.0
sparc64               randconfig-001-20250409    gcc-11.5.0
sparc64               randconfig-002-20250409    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250409    gcc-12
um                    randconfig-002-20250409    clang-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250409    clang-20
x86_64      buildonly-randconfig-002-20250409    gcc-12
x86_64      buildonly-randconfig-003-20250409    clang-20
x86_64      buildonly-randconfig-004-20250409    clang-20
x86_64      buildonly-randconfig-005-20250409    gcc-12
x86_64      buildonly-randconfig-006-20250409    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250409    gcc-11.5.0
xtensa                randconfig-002-20250409    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
