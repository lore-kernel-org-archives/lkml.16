Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F6275AE8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465063; cv=none; b=g9JeiJkuldaE3MTBj9FHwihzFYqXTGPByD6Ktrm4weXGg9DjqFK8AO092H5ZxBl6wPPrFQJ9f1ilrHoHYhfx964IFr011UbSO2SG52tIq42T/ch4cjbg5JNai9N0hjo+TodRXRKyGL9ugmFxjSUIuVA3vCJVxIStoNWvX1jXG1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465063; c=relaxed/simple;
	bh=dGjxNlhxEbC6iORzBV8XZ7p+ClVx6uxTgcW37j0RdmA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TjxolTmJJNIXwYC7EE3mchlhAgKBGzfgcTvFXDUqAe0rfeiHjyz5z4ObOtAeNcCOlZHcQy7N+aMexYatsIpApsQXyvaRPq7t19B5bSBdIntEOCEPaVBDQKxiuYC70mB7C0ZOP2Uwft7LwyS14kt40c7ZZqqBvLmh3x4CWmdetS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/RI0Weo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/RI0Weo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751465062; x=1783001062;
  h=date:from:to:cc:subject:message-id;
  bh=dGjxNlhxEbC6iORzBV8XZ7p+ClVx6uxTgcW37j0RdmA=;
  b=a/RI0WeouoyN+XDGcwZcqWoJ5Mo7xPIdFOhxDpRt5Yuylf5tRi3PUv3Y
   MwyRITqG0LfqM7hGRts6HJ/S2szQWRdBtMVVBsxTQF2bihaBw0K/ksuHN
   Bt1iHbxQmgVRSbUA0rCVJwdIOdbEnXcTuAp7ICWskGAM8zc9WGD9B7o7K
   OI+7JJ6vhpRXF7wVwcV3ZX84UuBdrWvROFRFJCyDc49BfM7L03ocihg9y
   VkYCoLbDEG/zfbAOy1Nnq53W4iINUtYarDI2sdh9oMLx0rzQd8AL+mE7s
   Hvwdr91Da+Nr3UT1Y88FiMViIUBM+5opeiwTT8zhnkY2POGmcq6bdFkMC
   A==;
X-CSE-ConnectionGUID: pmh/l2SaQ+aZzteqF8fN3Q==
X-CSE-MsgGUID: kdywgv0uRI6RYrp6xDhtjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53691186"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53691186"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 07:04:21 -0700
X-CSE-ConnectionGUID: ud9rScSjRcSM7XUiJEXW5w==
X-CSE-MsgGUID: VyIoNFgJQkW/Pt1KSyvlug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154641441"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 07:04:20 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWy4Q-0000iJ-14;
	Wed, 02 Jul 2025 14:04:18 +0000
Date: Wed, 02 Jul 2025 22:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/urgent] BUILD SUCCESS
 9a57c3773152a3ff2c35cc8325e088d011c9f83b
Message-ID: <202507022222.Jqxilsu1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/urgent
branch HEAD: 9a57c3773152a3ff2c35cc8325e088d011c9f83b  futex: Temporary disable FUTEX_PRIVATE_HASH

elapsed time: 1447m

configs tested: 116
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250701    gcc-13.3.0
arc                   randconfig-002-20250701    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250701    clang-17
arm                   randconfig-002-20250701    gcc-8.5.0
arm                   randconfig-003-20250701    clang-21
arm                   randconfig-004-20250701    clang-21
arm                          sp7021_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250701    clang-21
arm64                 randconfig-002-20250701    gcc-15.1.0
arm64                 randconfig-003-20250701    clang-18
arm64                 randconfig-004-20250701    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250701    gcc-11.5.0
csky                  randconfig-002-20250701    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250701    clang-21
hexagon               randconfig-002-20250701    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250702    clang-20
i386        buildonly-randconfig-002-20250702    gcc-12
i386        buildonly-randconfig-003-20250702    clang-20
i386        buildonly-randconfig-004-20250702    clang-20
i386        buildonly-randconfig-005-20250702    gcc-12
i386        buildonly-randconfig-006-20250702    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250701    gcc-13.3.0
loongarch             randconfig-002-20250701    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq6_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250701    gcc-14.2.0
nios2                 randconfig-002-20250701    gcc-13.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250701    gcc-14.3.0
parisc                randconfig-002-20250701    gcc-10.5.0
parisc64                         alldefconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250701    gcc-13.3.0
powerpc               randconfig-002-20250701    clang-21
powerpc               randconfig-003-20250701    clang-21
powerpc64             randconfig-001-20250701    clang-21
powerpc64             randconfig-002-20250701    clang-21
powerpc64             randconfig-003-20250701    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250701    gcc-14.3.0
riscv                 randconfig-002-20250701    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250701    gcc-9.3.0
s390                  randconfig-002-20250701    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250701    gcc-15.1.0
sh                    randconfig-002-20250701    gcc-13.3.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250701    gcc-10.3.0
sparc                 randconfig-002-20250701    gcc-15.1.0
sparc64               randconfig-001-20250701    gcc-8.5.0
sparc64               randconfig-002-20250701    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250701    gcc-12
um                    randconfig-002-20250701    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250701    gcc-12
x86_64      buildonly-randconfig-002-20250701    gcc-12
x86_64      buildonly-randconfig-003-20250701    gcc-12
x86_64      buildonly-randconfig-004-20250701    gcc-12
x86_64      buildonly-randconfig-005-20250701    clang-20
x86_64      buildonly-randconfig-006-20250701    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250701    gcc-15.1.0
xtensa                randconfig-002-20250701    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
