Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FE136347
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738305930; cv=none; b=seNSKD/ZT9RCYGkoOfMvAQyGDmTqh6Py5CL8tFoA4KEVK9bDJ6c+eKtPP9Q8789JyyCOOIquxrYnlJDbnuv5/cY+OkBDeEuk26KgCGIuk9gpd5k4bkHNSvCRyiEL4mMMPh0qshDT3Ng4R/64OtoslHpk2l774uDb0QFwKpjgPoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738305930; c=relaxed/simple;
	bh=kHcmmuujRKJeqfOH7ZCCGLu9cJgjxLjrKF1Iw+Xsto8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hdklyILs9rT/zqwLEFASqMg1q+zFfn9LB299AviGnLMTrt5uxqrQZYTFN5sNLZ+npDhShyj3XuOkvTyjbkjILncIb06nh3s5O2zlnfTMa5oyA/bYeSgH6NhCdVtlEYqGZwhezNev8/Pw7LZAPhUjhcJlD5BshTlISEwDfrIUG3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mC7LrD6T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mC7LrD6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738305928; x=1769841928;
  h=date:from:to:cc:subject:message-id;
  bh=kHcmmuujRKJeqfOH7ZCCGLu9cJgjxLjrKF1Iw+Xsto8=;
  b=mC7LrD6T4eJUSiEqk5WTRkx1/ovFaMGXPr8iE+8BEg72ePKEHeXblMe/
   mV3cv7xe9bfxy0FSHSwuqn+QXl7DyrfETq8EtUv9y2gjx1/NWp/hCXJks
   a1IoMVf2ERgHUZy8ILtoe2gV4Jo6AGjyEBXa5mwo0kvgd+k7hpBW4PQ8d
   09wiB7hUzUTtW+s3eD2G0I1iYNSkaVwCsd29ih5HKiyqV6CjimkqERsLO
   IDXC8lGGIYws7modFoH1Q8nZRGny1AXpMxMGTwi/gS7ZDMW+EZqdrPTH0
   /Edq5j4PEu3z7VtW1826uPKt9BnKPw/emcxPimzYq/NuySHhvCvufFWEQ
   w==;
X-CSE-ConnectionGUID: 0tIGd19XRUOGL7UR6O7bbA==
X-CSE-MsgGUID: 7tt71xx2SsizYoTYNBCUhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50291645"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50291645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 22:45:28 -0800
X-CSE-ConnectionGUID: MLTcnJ+QRvmkMH/4C3OajA==
X-CSE-MsgGUID: QN8e5kv/TW6UhplgNvotPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146734509"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2025 22:45:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdkmK-000m6d-1K;
	Fri, 31 Jan 2025 06:45:24 +0000
Date: Fri, 31 Jan 2025 14:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 ee2ab467bddfb2d7f68d996dbab94d7b88f8eaf7
Message-ID: <202501311431.Vhyowou6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: ee2ab467bddfb2d7f68d996dbab94d7b88f8eaf7  x86/boot: Use '-std=gnu11' to fix build with GCC 15

elapsed time: 726m

configs tested: 115
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250131    clang-21
csky                  randconfig-002-20250131    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250131    clang-19
i386                  randconfig-002-20250131    clang-19
i386                  randconfig-003-20250131    clang-19
i386                  randconfig-004-20250131    clang-19
i386                  randconfig-005-20250131    clang-19
i386                  randconfig-006-20250131    clang-19
i386                  randconfig-007-20250131    clang-19
i386                  randconfig-011-20250131    gcc-12
i386                  randconfig-012-20250131    gcc-12
i386                  randconfig-013-20250131    gcc-12
i386                  randconfig-014-20250131    gcc-12
i386                  randconfig-015-20250131    gcc-12
i386                  randconfig-016-20250131    gcc-12
i386                  randconfig-017-20250131    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    clang-21
loongarch             randconfig-002-20250131    clang-21
m68k                              allnoconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    clang-21
nios2                 randconfig-002-20250131    clang-21
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250131    clang-21
parisc                randconfig-002-20250131    clang-21
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    clang-21
powerpc               randconfig-002-20250131    clang-21
powerpc               randconfig-003-20250131    clang-21
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250131    clang-21
powerpc64             randconfig-002-20250131    clang-21
powerpc64             randconfig-003-20250131    clang-21
riscv                            alldefconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                           se7619_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                                allnoconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250131    clang-19
x86_64                randconfig-002-20250131    clang-19
x86_64                randconfig-003-20250131    clang-19
x86_64                randconfig-004-20250131    clang-19
x86_64                randconfig-005-20250131    clang-19
x86_64                randconfig-006-20250131    clang-19
x86_64                randconfig-007-20250131    clang-19
x86_64                randconfig-008-20250131    clang-19
x86_64                randconfig-071-20250131    clang-19
x86_64                randconfig-072-20250131    clang-19
x86_64                randconfig-073-20250131    clang-19
x86_64                randconfig-074-20250131    clang-19
x86_64                randconfig-075-20250131    clang-19
x86_64                randconfig-076-20250131    clang-19
x86_64                randconfig-077-20250131    clang-19
x86_64                randconfig-078-20250131    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
