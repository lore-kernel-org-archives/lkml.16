Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505311D435F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751593853; cv=none; b=UNmAAeZgc+TRSfLrwftxxW+kQdRYDQKue0VeUVYUv4bdTbrrLvWdl6yIswGAt3CcSLBBV0kXWzSLFVNSHxwDFhLQSCjuGqRd/ZY32s/EDNmvSY4GYs5j8aMWsiGCM/2dVkKPWA7Gc6Jc0EIUprNPPMUkLKBBtuHXhLZ7wSKT9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751593853; c=relaxed/simple;
	bh=rWUxXwtVncDXRhcUguFlqLQYCT6w6Fg1J+xwbB3b1is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJ9jn8jh38qrIZF+arQZ5tj9gVBgFpZYewdxuUtnyI/yHOaPA1zfh1/FSXUBftzlb/CQxkd7Cl85R9oPCWVud18QbsGHrOp38P+AU4111uMS5Wz+5gNjNFOJ4CJstleBpDR8MKQfbWWjPFGIP+X6+/5ah6tX8Kc0g5qQCxjiRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGzLjXUW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGzLjXUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751593851; x=1783129851;
  h=date:from:to:cc:subject:message-id;
  bh=rWUxXwtVncDXRhcUguFlqLQYCT6w6Fg1J+xwbB3b1is=;
  b=jGzLjXUWdsfUKbugRpMYtSkNciu8lVAlWXAk9XHCB092WtSUqfFVujAS
   iOTv72eVdFQFgQFSrHFmbjgdd2JiECrDOEUMjBPLDmLq93CGMv25muoZj
   mxCmqWyCrp1VqnVdQioJ91LOWtrO8HC+Jm0nZcvJtKyTOJvhTPgBghX3V
   qvkn/vyw0BNaxw8jqN0mJYltefEMnvx7Nyk/u/t5IN5soX9XDDsiNy/58
   ATDgR6jAsmLqQ7wxdBWg7TkrC7lBiAFFP91KkFVOrOhSAam3WoyO+zpvL
   3iI9T+hVPST5qVP2Z53n575iKyDVYwDKtQ1c/jvQQiZuWFOgblTka7zQL
   A==;
X-CSE-ConnectionGUID: meUKQ4/VRmmSE/Very6eDw==
X-CSE-MsgGUID: lDbogoHVSymtf0/1AY53ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56551993"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="56551993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 18:50:50 -0700
X-CSE-ConnectionGUID: ILFga6aoT42PnC5y6PlNNA==
X-CSE-MsgGUID: 6CP21ZysTfy6YokICWGl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="160210748"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2025 18:50:50 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXVZf-0003CV-0f;
	Fri, 04 Jul 2025 01:50:47 +0000
Date: Fri, 04 Jul 2025 09:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 ba677dbe77af5ffe6204e0f3f547f3ba059c6302
Message-ID: <202507040913.bJOmjIcU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: ba677dbe77af5ffe6204e0f3f547f3ba059c6302  perf: Revert to requiring CAP_SYS_ADMIN for uprobes

elapsed time: 1029m

configs tested: 236
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-001-20250704    clang-21
arc                   randconfig-002-20250703    gcc-12.4.0
arc                   randconfig-002-20250704    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                                 defconfig    clang-19
arm                         lpc18xx_defconfig    clang-21
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-001-20250704    clang-21
arm                   randconfig-002-20250703    gcc-8.5.0
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-003-20250704    clang-21
arm                   randconfig-004-20250703    clang-21
arm                   randconfig-004-20250704    clang-21
arm                        realview_defconfig    clang-21
arm64                            alldefconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-001-20250704    clang-21
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-002-20250704    clang-21
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-003-20250704    clang-21
arm64                 randconfig-004-20250703    gcc-8.5.0
arm64                 randconfig-004-20250704    clang-21
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-001-20250704    gcc-10.5.0
csky                  randconfig-002-20250703    gcc-12.4.0
csky                  randconfig-002-20250704    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250703    clang-21
hexagon               randconfig-001-20250704    gcc-10.5.0
hexagon               randconfig-002-20250703    clang-21
hexagon               randconfig-002-20250704    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250703    clang-20
i386        buildonly-randconfig-001-20250704    clang-20
i386        buildonly-randconfig-002-20250703    gcc-12
i386        buildonly-randconfig-002-20250704    clang-20
i386        buildonly-randconfig-003-20250703    gcc-12
i386        buildonly-randconfig-003-20250704    clang-20
i386        buildonly-randconfig-004-20250703    clang-20
i386        buildonly-randconfig-004-20250704    clang-20
i386        buildonly-randconfig-005-20250703    gcc-12
i386        buildonly-randconfig-005-20250704    clang-20
i386        buildonly-randconfig-006-20250703    gcc-12
i386        buildonly-randconfig-006-20250704    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250704    clang-20
i386                  randconfig-002-20250704    clang-20
i386                  randconfig-003-20250704    clang-20
i386                  randconfig-004-20250704    clang-20
i386                  randconfig-005-20250704    clang-20
i386                  randconfig-006-20250704    clang-20
i386                  randconfig-007-20250704    clang-20
i386                  randconfig-011-20250704    clang-20
i386                  randconfig-012-20250704    clang-20
i386                  randconfig-013-20250704    clang-20
i386                  randconfig-014-20250704    clang-20
i386                  randconfig-015-20250704    clang-20
i386                  randconfig-016-20250704    clang-20
i386                  randconfig-017-20250704    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250703    clang-18
loongarch             randconfig-001-20250704    gcc-10.5.0
loongarch             randconfig-002-20250703    clang-18
loongarch             randconfig-002-20250704    gcc-10.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250703    gcc-8.5.0
nios2                 randconfig-001-20250704    gcc-10.5.0
nios2                 randconfig-002-20250703    gcc-8.5.0
nios2                 randconfig-002-20250704    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250703    gcc-8.5.0
parisc                randconfig-001-20250704    gcc-10.5.0
parisc                randconfig-002-20250703    gcc-8.5.0
parisc                randconfig-002-20250704    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-21
powerpc               randconfig-001-20250703    gcc-10.5.0
powerpc               randconfig-001-20250704    gcc-10.5.0
powerpc               randconfig-002-20250703    clang-21
powerpc               randconfig-002-20250704    gcc-10.5.0
powerpc               randconfig-003-20250703    gcc-8.5.0
powerpc               randconfig-003-20250704    gcc-10.5.0
powerpc64             randconfig-001-20250703    clang-18
powerpc64             randconfig-001-20250704    gcc-10.5.0
powerpc64             randconfig-002-20250703    clang-21
powerpc64             randconfig-002-20250704    gcc-10.5.0
powerpc64             randconfig-003-20250703    gcc-14.3.0
powerpc64             randconfig-003-20250704    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250703    gcc-13.4.0
riscv                 randconfig-001-20250704    clang-21
riscv                 randconfig-002-20250703    gcc-14.3.0
riscv                 randconfig-002-20250704    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250703    gcc-12.4.0
s390                  randconfig-001-20250704    clang-21
s390                  randconfig-002-20250703    clang-21
s390                  randconfig-002-20250704    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    clang-21
sh                    randconfig-001-20250703    gcc-9.3.0
sh                    randconfig-001-20250704    clang-21
sh                    randconfig-002-20250703    gcc-15.1.0
sh                    randconfig-002-20250704    clang-21
sh                           se7206_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250703    gcc-8.5.0
sparc                 randconfig-001-20250704    clang-21
sparc                 randconfig-002-20250703    gcc-13.4.0
sparc                 randconfig-002-20250704    clang-21
sparc                       sparc64_defconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250703    gcc-8.5.0
sparc64               randconfig-001-20250704    clang-21
sparc64               randconfig-002-20250703    clang-20
sparc64               randconfig-002-20250704    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250703    gcc-12
um                    randconfig-001-20250704    clang-21
um                    randconfig-002-20250703    gcc-12
um                    randconfig-002-20250704    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250703    gcc-11
x86_64      buildonly-randconfig-001-20250704    gcc-12
x86_64      buildonly-randconfig-002-20250703    gcc-12
x86_64      buildonly-randconfig-002-20250704    gcc-12
x86_64      buildonly-randconfig-003-20250703    clang-20
x86_64      buildonly-randconfig-003-20250704    gcc-12
x86_64      buildonly-randconfig-004-20250703    clang-20
x86_64      buildonly-randconfig-004-20250704    gcc-12
x86_64      buildonly-randconfig-005-20250703    gcc-12
x86_64      buildonly-randconfig-005-20250704    gcc-12
x86_64      buildonly-randconfig-006-20250703    gcc-12
x86_64      buildonly-randconfig-006-20250704    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250704    gcc-12
x86_64                randconfig-002-20250704    gcc-12
x86_64                randconfig-003-20250704    gcc-12
x86_64                randconfig-004-20250704    gcc-12
x86_64                randconfig-005-20250704    gcc-12
x86_64                randconfig-006-20250704    gcc-12
x86_64                randconfig-007-20250704    gcc-12
x86_64                randconfig-008-20250704    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250703    gcc-14.3.0
xtensa                randconfig-001-20250704    clang-21
xtensa                randconfig-002-20250703    gcc-8.5.0
xtensa                randconfig-002-20250704    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
