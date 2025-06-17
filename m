Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E62EBBA5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189585; cv=none; b=WOp0oeaWvJ+0BtilYjepQklweMaYoHCWGQ6pyXlxMahjcJ/DFFpIo4pfe+KzBIAdcPcAWR3MTN0Px0/OBNnHOgLdBR614qhNnp2MSZTWwF9YJ+Da21+u/JmZh8SmhGdTViK+rWiqssr0+n941tXWNRXIb0FavJ7l7yn/uMPKfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189585; c=relaxed/simple;
	bh=cNDJdjuBfcrs8dUATiD/fMH5+0Ler1RXPAOnvq79Hps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OWSBTcUWo1F1GpNhOlnOl1TtmXmlXJw0/NpiYfeFS3XQqoKWNN9riPZF8Kkqwyhtx7a2GZdml/SJIkIXwYaSt4kMVcKmOn27eq5HKS8jj4YofD7YR30nopny0Nlty98Wnajx+OujxyWDuz+/yQBf3C+GaHO4hs6jaOKzJq6y5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApTcn6Jd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApTcn6Jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750189583; x=1781725583;
  h=date:from:to:cc:subject:message-id;
  bh=cNDJdjuBfcrs8dUATiD/fMH5+0Ler1RXPAOnvq79Hps=;
  b=ApTcn6Jdbx230z66LxEszpIOuGNB2Tez726U5fxABZsXxgGeUSxm1wMa
   v41AtPmUaQlKP3v/JIFKVObyPJJ9+W5SBiGDb3BU3BZzXVdVE8AgDTkoJ
   22xKa2YIM4dasI4Dhfbhtj8gzMSJT8pN7laAyKcd7vcFBifwMXnOFCV2C
   bjGkLal0MWevJSZnH/y2XG7x9kajREzOTeOQCWA5H1hWXzNFQeOSeHRTV
   Jj6LFi/kHolhd0KwGU0kdEbaF52dpXCHNqoYmd8aqmDJL/GA/jDQeaOj0
   AbIuHOFHULrTlD5lc8ad/PPgHf3mZzhOddD4r15G6DukCUHVxC43blP6a
   w==;
X-CSE-ConnectionGUID: /UXvKcKAQDyxzTWWc5oW1w==
X-CSE-MsgGUID: 2dHAAUsXRASGRjrNg7mOmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52363799"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52363799"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 12:46:22 -0700
X-CSE-ConnectionGUID: ysHFi8d8QS2OJQxWOulnbQ==
X-CSE-MsgGUID: aGXyHwzqQIaxVtGlmNpLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="153794509"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2025 12:46:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRcGB-000I2Q-04;
	Tue, 17 Jun 2025 19:46:19 +0000
Date: Wed, 18 Jun 2025 03:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 594902c986e269660302f09df9ec4bf1cf017b77
Message-ID: <202506180344.fzkekohx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 594902c986e269660302f09df9ec4bf1cf017b77  x86,fs/resctrl: Remove inappropriate references to cacheinfo in the resctrl subsystem

elapsed time: 1421m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250617    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                      footbridge_defconfig    clang-17
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20250617    gcc-8.5.0
arm                   randconfig-002-20250617    clang-21
arm                   randconfig-003-20250617    clang-21
arm                   randconfig-004-20250617    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250617    gcc-11.5.0
arm64                 randconfig-002-20250617    clang-21
arm64                 randconfig-003-20250617    gcc-8.5.0
arm64                 randconfig-004-20250617    gcc-12.3.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250617    gcc-13.3.0
csky                  randconfig-002-20250617    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250617    clang-21
hexagon               randconfig-002-20250617    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250617    gcc-12
i386        buildonly-randconfig-002-20250617    clang-20
i386        buildonly-randconfig-003-20250617    gcc-12
i386        buildonly-randconfig-004-20250617    gcc-12
i386        buildonly-randconfig-005-20250617    gcc-12
i386        buildonly-randconfig-006-20250617    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250617    gcc-15.1.0
loongarch             randconfig-002-20250617    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250617    gcc-10.5.0
nios2                 randconfig-002-20250617    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250617    gcc-8.5.0
parisc                randconfig-002-20250617    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                      mgcoge_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250617    gcc-8.5.0
powerpc               randconfig-002-20250617    clang-16
powerpc               randconfig-003-20250617    gcc-12.4.0
powerpc64             randconfig-001-20250617    gcc-14.3.0
powerpc64             randconfig-002-20250617    clang-21
powerpc64             randconfig-003-20250617    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250617    clang-21
riscv                 randconfig-002-20250617    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250617    clang-21
s390                  randconfig-002-20250617    clang-20
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250617    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-14.3.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250617    gcc-12.4.0
sparc                 randconfig-002-20250617    gcc-13.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250617    gcc-15.1.0
sparc64               randconfig-002-20250617    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250617    gcc-12
um                    randconfig-002-20250617    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250617    clang-20
x86_64      buildonly-randconfig-002-20250617    clang-20
x86_64      buildonly-randconfig-003-20250617    gcc-11
x86_64      buildonly-randconfig-004-20250617    gcc-12
x86_64      buildonly-randconfig-005-20250617    gcc-12
x86_64      buildonly-randconfig-006-20250617    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250617    gcc-10.5.0
xtensa                randconfig-002-20250617    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
