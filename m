Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FDD252914
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588043; cv=none; b=FUW0LBCsG5WSRsRkeojFunTm6pGFRRXi6yAA2KjzXDGV/KxMMdAybio+6EukXEdoupm0rTMVf1tDLMX43iQGdPdIuKMeSkP2dIH2XrDAbHNj+E8FCsLEVRGTNw+xMEL1Ck67aShth+FVioLW4uzSNN50kN0gW9yiZAVihjWTSeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588043; c=relaxed/simple;
	bh=TBWtWwhrMaJ9I4A/eVK+tqurIFxh6WiEiQufCnYN8l8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UMFoa0Q9nMc4vZZ5NwnlqvBJmJ9ElNACwKHNav4rC+khZXAEn4TppXcyjAMk7oqQDpUwdQR5vVyQOfQqXdqJpCBzgC+JHKJCyMfX1xkjdG4k/rVYf26KWZeEDL+aveRLX7RULTiAxavQ1o+n9bM3SpAhNcvoFxzm9+Euzh4ylzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6YOJCHx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6YOJCHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745588041; x=1777124041;
  h=date:from:to:cc:subject:message-id;
  bh=TBWtWwhrMaJ9I4A/eVK+tqurIFxh6WiEiQufCnYN8l8=;
  b=I6YOJCHxW/Xkp0HRoN9WQpGo9K/Teaaq0kROKi9Pun3dFGUVLCUtoelp
   l0ZxDrtrFaxlX7/6NSYOqBDwr33NtwdJu279J2HN14vfUeZ7saUmiu6Na
   /8E4agmPc5dNcO0+2OGrhQ5sWZ5e8zccmrXBI4mLewu2G+19OW/F32Ypn
   mtnmshMTTINXzQQ4Sg1sw874y/EAxmNClBkq1NUr0uQy8FlnEQbYr6R44
   v/VUriKOsYtHgcIYN7DE2hxnODODbmPX0Yx8uZacPnez9/RWeeXmYerx5
   ctL8GjpjpT21FnZAzp9z80lO0qxxrVc3GRDmFK+yWfwvtrYv/POwHcvoi
   A==;
X-CSE-ConnectionGUID: OCdl/nCITteB/6ry/GPvvA==
X-CSE-MsgGUID: cE152qg3SmSzxlA9pgcRLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58615132"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="58615132"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 06:34:01 -0700
X-CSE-ConnectionGUID: 2n1nUwY+TM2NA/Ofvp4wkA==
X-CSE-MsgGUID: wpz7X1KiTYCB4wtmPowMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="138069891"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Apr 2025 06:32:20 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8JA9-0005En-1X;
	Fri, 25 Apr 2025 13:32:17 +0000
Date: Fri, 25 Apr 2025 21:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/core] BUILD SUCCESS
 49916e22d9530d6cf027e635a5d824c7d698d67f
Message-ID: <202504252121.pVehIPyV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
branch HEAD: 49916e22d9530d6cf027e635a5d824c7d698d67f  timers: Remove unused __round_jiffies(_up)

elapsed time: 1461m

configs tested: 118
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250424    gcc-8.5.0
arc                   randconfig-002-20250424    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250424    gcc-7.5.0
arm                   randconfig-002-20250424    gcc-7.5.0
arm                   randconfig-003-20250424    clang-21
arm                   randconfig-004-20250424    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250424    clang-21
arm64                 randconfig-002-20250424    gcc-8.5.0
arm64                 randconfig-003-20250424    clang-21
arm64                 randconfig-004-20250424    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250424    gcc-12.4.0
csky                  randconfig-002-20250424    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250424    clang-21
hexagon               randconfig-002-20250424    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250424    gcc-12
i386        buildonly-randconfig-002-20250424    clang-20
i386        buildonly-randconfig-003-20250424    clang-20
i386        buildonly-randconfig-004-20250424    clang-20
i386        buildonly-randconfig-005-20250424    gcc-12
i386        buildonly-randconfig-006-20250424    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250424    gcc-14.2.0
loongarch             randconfig-002-20250424    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
mips                        maltaup_defconfig    clang-21
mips                        vocore2_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250424    gcc-10.5.0
nios2                 randconfig-002-20250424    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250424    gcc-9.3.0
parisc                randconfig-002-20250424    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                       ebony_defconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250424    clang-21
powerpc               randconfig-002-20250424    clang-17
powerpc               randconfig-003-20250424    clang-21
powerpc64             randconfig-001-20250424    clang-21
powerpc64             randconfig-002-20250424    clang-21
powerpc64             randconfig-003-20250424    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250424    clang-21
riscv                 randconfig-002-20250424    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250424    gcc-9.3.0
s390                  randconfig-002-20250424    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250424    gcc-12.4.0
sh                    randconfig-002-20250424    gcc-6.5.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250424    gcc-10.3.0
sparc                 randconfig-002-20250424    gcc-11.5.0
sparc64               randconfig-001-20250424    gcc-9.3.0
sparc64               randconfig-002-20250424    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250424    clang-21
um                    randconfig-002-20250424    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250424    gcc-12
x86_64      buildonly-randconfig-002-20250424    clang-20
x86_64      buildonly-randconfig-003-20250424    gcc-12
x86_64      buildonly-randconfig-004-20250424    clang-20
x86_64      buildonly-randconfig-005-20250424    clang-20
x86_64      buildonly-randconfig-006-20250424    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250424    gcc-14.2.0
xtensa                randconfig-002-20250424    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
