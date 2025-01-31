Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6A28EC
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738316268; cv=none; b=quHgcgckdYcQyEz06f6e7mhZclwxeB2C139AjGzMmJnBZDIEM5+QcaD3J6ZVbbdsfHpO53oZPC8ZGVWpOtaVLYoDcSWc+ed03iO4hz/YAhZb7yuI9G9tNoqW1D9yCywZDyWKc1rjgqEAD1/HnojmF+VeMROj5LZFhkb2hXXlHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738316268; c=relaxed/simple;
	bh=zQF/9gWcDewL4xodBFxpipFIAVU3Lib5r8Dh1jVSBas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Em1x9B5UjO/UXdv2CckR2w20rRxM9wI188iIG6jwA457irDBRkayqqWFLhT4GMV6NNBKyFL2QBb5T7un7JKxnZYBzgxII4ONGFh4GVXvS4YKTJEntgz2pec+Jc/g8XmQE/cKv5TYjGamqhClPRGhd1QbO4GA15Te6oJxoGZxAT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpGtZ3u1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpGtZ3u1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738316266; x=1769852266;
  h=date:from:to:cc:subject:message-id;
  bh=zQF/9gWcDewL4xodBFxpipFIAVU3Lib5r8Dh1jVSBas=;
  b=PpGtZ3u1+hGmHP/pdQp4r5Y344IX8H/NZ20/ZyOPMM07n07xpHPSY5Lu
   iP2DrZ/cqHcM+UzwoXWypB1bwtcbQ02JLK48JmXxo9BcdpXKUOwNz174K
   +17j/habbRmE99n1PY2QsxO/QGOEmmYW99r8Ct8FuVeJk3549c2qeUVSC
   8UdyrqhEWAlTDbbJycgNFhaGjUPP13Un7kZNslFnE+5EgxP/kpAczFoXW
   rfrIs+faYlTCg2sfVXG0kWkAga7UUTdJU2NlndngL5g6oJGPZy+hQegEa
   Z86G4dcLL4Trv5MD5jVsDdBgui23DsYTNoHc56CGI1Y7necgoglEPK73K
   g==;
X-CSE-ConnectionGUID: 1C/+CUdQTzmFILegBWS0dA==
X-CSE-MsgGUID: 4slLoBfxSjqOeRlJzH+1KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="26488342"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="26488342"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 01:37:45 -0800
X-CSE-ConnectionGUID: CwwBzWqdS8Wwublbbt58+w==
X-CSE-MsgGUID: agxZb9nVTwe2X3RWTMwUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="110169769"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jan 2025 01:37:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdnT4-000mEJ-1k;
	Fri, 31 Jan 2025 09:37:42 +0000
Date: Fri, 31 Jan 2025 17:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:lazypreempt.2025.01.30a] BUILD SUCCESS
 d28b5f192e9a31e434ea01fb780114ab8d30c000
Message-ID: <202501311746.KebxObn4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git lazypreempt.2025.01.30a
branch HEAD: d28b5f192e9a31e434ea01fb780114ab8d30c000  rcutorture: Make scenario TREE07 build CONFIG_PREEMPT_LAZY=y

elapsed time: 895m

configs tested: 200
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250131    gcc-13.2.0
arc                   randconfig-002-20250131    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250131    clang-15
arm64                 randconfig-002-20250131    gcc-14.2.0
arm64                 randconfig-003-20250131    clang-21
arm64                 randconfig-004-20250131    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250131    clang-21
csky                  randconfig-001-20250131    gcc-14.2.0
csky                  randconfig-002-20250131    clang-21
csky                  randconfig-002-20250131    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
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
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    clang-21
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-002-20250131    clang-21
loongarch             randconfig-002-20250131    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    clang-21
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-002-20250131    clang-21
nios2                 randconfig-002-20250131    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250131    clang-21
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-002-20250131    clang-21
parisc                randconfig-002-20250131    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    clang-21
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-002-20250131    clang-21
powerpc               randconfig-003-20250131    clang-21
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-001-20250131    clang-21
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-002-20250131    clang-21
powerpc64             randconfig-003-20250131    clang-15
powerpc64             randconfig-003-20250131    clang-21
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250131    gcc-14.2.0
riscv                 randconfig-002-20250131    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250131    gcc-14.2.0
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    gcc-14.2.0
um                    randconfig-002-20250131    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    clang-19
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
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                randconfig-002-20250131    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
