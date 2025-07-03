Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F0224AF3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528394; cv=none; b=IVuCGPMiPoA6Mk2p0v/HU4CInPkAPWjMfjL7URdQytwQeAE/420YzUI7SFOAZqSR4oYl+ogQBYjy0rcAG21JeCTMSqyjpiMuxeMJBUQ98TWZRAhK5Q+m3fs9SrrL74bQcDopUWn1O+btMk7rFTgU19S+PV/j6K/5/Go4HPdzPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528394; c=relaxed/simple;
	bh=m7UAHBh2pvst+zMlZwqVpL7krPdTe3Ai+yrwFTZuDiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UvLpw3BmW5qF83TLcJchq+p4fxS7eUg45Af7kMl79Fd4ro7LirC16PSedvC7hFEYXJdAwdD3/L7srMDmMabJkm8t32koO6cxexLiwnEi81XXdVSS0vNKzfWgARCS/lX2wLthRnJl7E4qfnJzZXgkBkionIQo9dDytkX0HItyfGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flKO+aSk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flKO+aSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751528392; x=1783064392;
  h=date:from:to:cc:subject:message-id;
  bh=m7UAHBh2pvst+zMlZwqVpL7krPdTe3Ai+yrwFTZuDiY=;
  b=flKO+aSkm1erp3+uC+wKp4uRnxb+B0gA8GZZh0FVeR1sBH+ClTJAw11G
   bHkbVSQ7AGP3x0p18uopgUgqYFEq8B6A/jim4asYPeQHV0t2lX7JM1rEr
   P+mvNI5x+gEsaUaV2CqGGw7UEd9S0xBOHfQOpUPwj7fc7sy4oIWgvHw8d
   YpN/xYvOzicz4UcaF6bTw29v5YyXOXwdULzkO8UPPSJLNcf8U4l97pr6P
   BlDdDmVCXDmDDvQ4Psw5fg2VNpbF5WA8+j1YWGxS4l03uawDA5JVRS9e9
   ZE4By2TrhV/igbXwLmxmYMnq4S1rwtpGyjPciwxJiQ5gmM1Ub/fqvJVNj
   Q==;
X-CSE-ConnectionGUID: PfGPTNKNSZO2FVnHaQYafw==
X-CSE-MsgGUID: SzRzlyqDQJqJLsdE1Ylt6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57518174"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="57518174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 00:39:51 -0700
X-CSE-ConnectionGUID: xBy/fdv7SxmwBQgjpYmHAQ==
X-CSE-MsgGUID: Nyoz7IkBQbu3LNEUps/djA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="155042952"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2025 00:39:51 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXEXt-0001Zj-0o;
	Thu, 03 Jul 2025 07:39:49 +0000
Date: Thu, 03 Jul 2025 15:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:smp/core] BUILD SUCCESS
 e0e9506523fea415e0d5abaa103fd67dc8a39696
Message-ID: <202507031544.GoqMUJR9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git smp/core
branch HEAD: e0e9506523fea415e0d5abaa103fd67dc8a39696  smp: Defer check for local execution in smp_call_function_many_cond()

elapsed time: 796m

configs tested: 183
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-001-20250703    gcc-8.5.0
arc                   randconfig-002-20250703    gcc-12.4.0
arc                   randconfig-002-20250703    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-001-20250703    gcc-8.5.0
arm                   randconfig-002-20250703    gcc-8.5.0
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-003-20250703    gcc-8.5.0
arm                   randconfig-004-20250703    clang-21
arm                   randconfig-004-20250703    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-001-20250703    gcc-8.5.0
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-002-20250703    gcc-8.5.0
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-003-20250703    gcc-8.5.0
arm64                 randconfig-004-20250703    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-001-20250703    gcc-8.5.0
csky                  randconfig-002-20250703    gcc-12.4.0
csky                  randconfig-002-20250703    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250703    clang-21
hexagon               randconfig-001-20250703    gcc-8.5.0
hexagon               randconfig-002-20250703    clang-21
hexagon               randconfig-002-20250703    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250703    clang-20
i386        buildonly-randconfig-001-20250703    gcc-12
i386        buildonly-randconfig-002-20250703    gcc-12
i386        buildonly-randconfig-003-20250703    gcc-12
i386        buildonly-randconfig-004-20250703    clang-20
i386        buildonly-randconfig-004-20250703    gcc-12
i386        buildonly-randconfig-005-20250703    gcc-12
i386        buildonly-randconfig-006-20250703    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250703    clang-20
i386                  randconfig-002-20250703    clang-20
i386                  randconfig-003-20250703    clang-20
i386                  randconfig-004-20250703    clang-20
i386                  randconfig-005-20250703    clang-20
i386                  randconfig-006-20250703    clang-20
i386                  randconfig-007-20250703    clang-20
i386                  randconfig-011-20250703    clang-20
i386                  randconfig-012-20250703    clang-20
i386                  randconfig-013-20250703    clang-20
i386                  randconfig-014-20250703    clang-20
i386                  randconfig-015-20250703    clang-20
i386                  randconfig-016-20250703    clang-20
i386                  randconfig-017-20250703    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-8.5.0
loongarch             randconfig-002-20250703    gcc-15.1.0
loongarch             randconfig-002-20250703    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250703    gcc-8.5.0
nios2                 randconfig-002-20250703    gcc-8.5.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250703    gcc-8.5.0
parisc                randconfig-002-20250703    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250703    gcc-10.5.0
powerpc               randconfig-001-20250703    gcc-8.5.0
powerpc               randconfig-002-20250703    clang-21
powerpc               randconfig-002-20250703    gcc-8.5.0
powerpc               randconfig-003-20250703    gcc-8.5.0
powerpc64             randconfig-001-20250703    clang-18
powerpc64             randconfig-001-20250703    gcc-8.5.0
powerpc64             randconfig-002-20250703    clang-21
powerpc64             randconfig-002-20250703    gcc-8.5.0
powerpc64             randconfig-003-20250703    gcc-14.3.0
powerpc64             randconfig-003-20250703    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250703    gcc-13.3.0
riscv                 randconfig-002-20250703    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250703    gcc-12.4.0
s390                  randconfig-002-20250703    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250703    gcc-9.3.0
sh                    randconfig-002-20250703    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250703    gcc-8.5.0
sparc                 randconfig-002-20250703    gcc-13.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250703    gcc-8.5.0
sparc64               randconfig-002-20250703    gcc-8.5.0
um                               allmodconfig    clang-19
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250703    gcc-12
um                    randconfig-002-20250703    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250703    gcc-11
x86_64      buildonly-randconfig-001-20250703    gcc-12
x86_64      buildonly-randconfig-002-20250703    gcc-12
x86_64      buildonly-randconfig-003-20250703    clang-20
x86_64      buildonly-randconfig-003-20250703    gcc-12
x86_64      buildonly-randconfig-004-20250703    clang-20
x86_64      buildonly-randconfig-004-20250703    gcc-12
x86_64      buildonly-randconfig-005-20250703    gcc-12
x86_64      buildonly-randconfig-006-20250703    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250703    clang-20
x86_64                randconfig-002-20250703    clang-20
x86_64                randconfig-003-20250703    clang-20
x86_64                randconfig-004-20250703    clang-20
x86_64                randconfig-005-20250703    clang-20
x86_64                randconfig-006-20250703    clang-20
x86_64                randconfig-007-20250703    clang-20
x86_64                randconfig-008-20250703    clang-20
x86_64                randconfig-071-20250703    gcc-12
x86_64                randconfig-072-20250703    gcc-12
x86_64                randconfig-073-20250703    gcc-12
x86_64                randconfig-074-20250703    gcc-12
x86_64                randconfig-075-20250703    gcc-12
x86_64                randconfig-076-20250703    gcc-12
x86_64                randconfig-077-20250703    gcc-12
x86_64                randconfig-078-20250703    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250703    gcc-14.3.0
xtensa                randconfig-002-20250703    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
