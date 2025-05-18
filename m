Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1850A55
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747596303; cv=none; b=kl5RjKX8/o1eSf+bi7fkypKfTn7AOqc4dusGqV3659jGxX83HGS5uiSY6/vSDvl/2519HJtexuwoXPVj3uuqnE6/3f9ODz3NoH3rAs17oEnhMH3vdhSidXSHXL6NY4UxERmHwIFqpdmk1dStZV12GuQiQIfk2Pyen30jtPc8RR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747596303; c=relaxed/simple;
	bh=OYO2hjN1T7dQ0o1Xjad6NL/y5JvI97IxfqvSjrBEe3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AwyMhHS30mjQG/JGN3ljXJSKYc8YKYNedvfOtyD28wLAOl2MvywdFDvIN+4WmN46lvVQOMugMTXe8zTB3n3Q9ng51rfCHx/MmJi7fUD+0cy0lodHRjkoO8jRgIqbf4cY0+e1ZRf0zrnPZSF8dU9PQVvsov3tOY8JWTpQC2q1S78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8rIzxhe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8rIzxhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747596302; x=1779132302;
  h=date:from:to:cc:subject:message-id;
  bh=OYO2hjN1T7dQ0o1Xjad6NL/y5JvI97IxfqvSjrBEe3M=;
  b=U8rIzxhe6FTICqaah6d3OmfY+HqrmgeckeDjno+kaW12JzYqoYpzxAAr
   3vQ1LY0rgncQNVP4M/lM49lgw1mf193d/2T435PwVyX/QRkivgvwqcj51
   m1xxi4YdaZBv7GdWUr563lEepiR5PBKMB1unFIRvsd4ux7mRMMwXjUjSN
   wD2/w5lNNPKHd91JaAdnd/uxLovtGPf6rfrkNhDA93QjFdG6S//OT31QJ
   WQGPBPcoULifL0dN/zCvy47Ovt0Ijlh0CwvTuDaiiWTb+q9vLH8LSgmvn
   Iw6DQBxv93zYQG2SxqFTnG1eKzHj1RaPRVF5vjnVSucNMchIic9MsikSW
   Q==;
X-CSE-ConnectionGUID: 3zYPCd6kS7CBr3vx30EtdA==
X-CSE-MsgGUID: WvOvKWKgSQmufvtTSzNnBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49476718"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="49476718"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 12:25:02 -0700
X-CSE-ConnectionGUID: JO9BTebYRR6x+SStUEjdSQ==
X-CSE-MsgGUID: Y01vGzWKSyOZh1GpQiUFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139022481"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2025 12:25:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGjd4-000L07-0c;
	Sun, 18 May 2025 19:24:58 +0000
Date: Mon, 19 May 2025 03:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/core] BUILD SUCCESS
 54c2c688cd9305bdbab4883b9da6ff63f4deca5d
Message-ID: <202505190342.UYkvE44f-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
branch HEAD: 54c2c688cd9305bdbab4883b9da6ff63f4deca5d  x86/xen/msr: Fix uninitialized variable 'err'

elapsed time: 721m

configs tested: 135
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250518    gcc-14.2.0
arc                   randconfig-002-20250518    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    clang-21
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250518    gcc-10.5.0
arm                   randconfig-002-20250518    clang-21
arm                   randconfig-003-20250518    gcc-7.5.0
arm                   randconfig-004-20250518    clang-16
arm                         s5pv210_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250518    gcc-7.5.0
arm64                 randconfig-002-20250518    clang-21
arm64                 randconfig-003-20250518    clang-21
arm64                 randconfig-004-20250518    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250518    gcc-14.2.0
csky                  randconfig-002-20250518    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250518    clang-21
hexagon               randconfig-002-20250518    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250518    gcc-12
i386        buildonly-randconfig-002-20250518    clang-20
i386        buildonly-randconfig-003-20250518    gcc-12
i386        buildonly-randconfig-004-20250518    gcc-12
i386        buildonly-randconfig-005-20250518    gcc-12
i386        buildonly-randconfig-006-20250518    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250518    gcc-13.3.0
loongarch             randconfig-002-20250518    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-21
mips                        omega2p_defconfig    clang-21
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250518    gcc-5.5.0
nios2                 randconfig-002-20250518    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250518    gcc-8.5.0
parisc                randconfig-002-20250518    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250518    gcc-7.5.0
powerpc               randconfig-002-20250518    gcc-5.5.0
powerpc               randconfig-003-20250518    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250518    gcc-10.5.0
powerpc64             randconfig-002-20250518    gcc-7.5.0
powerpc64             randconfig-003-20250518    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250518    clang-21
riscv                 randconfig-002-20250518    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250518    gcc-7.5.0
s390                  randconfig-002-20250518    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250518    gcc-13.3.0
sh                    randconfig-002-20250518    gcc-7.5.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250518    gcc-12.4.0
sparc                 randconfig-002-20250518    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250518    gcc-6.5.0
sparc64               randconfig-002-20250518    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250518    clang-19
um                    randconfig-002-20250518    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250518    gcc-12
x86_64      buildonly-randconfig-002-20250518    clang-20
x86_64      buildonly-randconfig-003-20250518    gcc-12
x86_64      buildonly-randconfig-004-20250518    gcc-12
x86_64      buildonly-randconfig-005-20250518    gcc-12
x86_64      buildonly-randconfig-006-20250518    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250518    gcc-12.4.0
xtensa                randconfig-002-20250518    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
