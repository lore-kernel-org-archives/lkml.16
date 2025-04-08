Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E797D263F5E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101602; cv=none; b=rpQUM3SxytZkZKVHA8Q6lIJ2Dkr0y7a0++pW1n6gCz1xQz+uPQBMQ8+oiWqSx2lTPdiikYDJnwhUNJf7M9k6JYEPHhzartLcv+GSVrcAKUZEvNjX4HHipoY6S/RIfvBqTK8ytznuXl1o7Kfl7O2tgLUapuXxvy43jSJ5TFU+eWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101602; c=relaxed/simple;
	bh=nA68vk5ddkNihHnxbrCu5v1Q3HThBfk28kaBpFGKWuQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u5Y8vojym8rXNFwX9rU4x+77qtBqpV5iuDnAL5i0hCdMnqv9zgSHvlyBo/R7de2vWMgCfG+g2yjKCMj1vz0jft/LyoQr2l4jaPgqqV23J29K7Al345OxOOfj0395D0+0ghdJGLS6c6peJbVkbLf6HmR8KLA6Fm82CW/r1vifMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7NIZvQ7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7NIZvQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744101601; x=1775637601;
  h=date:from:to:cc:subject:message-id;
  bh=nA68vk5ddkNihHnxbrCu5v1Q3HThBfk28kaBpFGKWuQ=;
  b=m7NIZvQ7neHmIF/jsdZWDr8JfpJowBbUgovOJz0B7twVLRIKMsmdf3oB
   ce+KmIJvTH4uwZWc2E0kgRWV/iX0dfM1oWRvG3lLGBzZDU6zIrwh/KuhO
   t7a+XRumvMEE21ziBWuqY8MUOsZgWMvUz1nX6XbGE/QMHyAGpdY0NHJqX
   yxocwT4lZSbgKeJV8snRmOTEX42Aj/ZgLNzSJTDWRXjFAqGZmk8iUrJoJ
   3CC2IoxIBQJGZXkYi3Qa8+kW5Se0pUEIFMZbS46Dzie7yK51jwSwSww3K
   e882OuYNfXaWJZR4dAnrEvbdErI6Tnw8xx8eXZyGfCe/VZBttIAB4g6ZC
   Q==;
X-CSE-ConnectionGUID: jGZ0Gc/4QkuEepSfRSRZRg==
X-CSE-MsgGUID: ziufJBl1SOasP/EPXLb0Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49178452"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="49178452"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:40:00 -0700
X-CSE-ConnectionGUID: sLc0e05cQnO0zRSefvlnjw==
X-CSE-MsgGUID: xzcu5p/LTxKrJrtVaP8pDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="132922765"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2025 01:39:59 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u24Uv-0004KZ-06;
	Tue, 08 Apr 2025 08:39:57 +0000
Date: Tue, 08 Apr 2025 16:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/core] BUILD SUCCESS
 0a02e1f4a54ace747304687ced3b76d159e58914
Message-ID: <202504081605.UVPNtMyw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
branch HEAD: 0a02e1f4a54ace747304687ced3b76d159e58914  irqdomain: Support three-cell scheme interrupts

elapsed time: 1464m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250407    gcc-12.4.0
arc                   randconfig-002-20250407    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                          pxa3xx_defconfig    clang-21
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20250407    gcc-8.5.0
arm                   randconfig-002-20250407    clang-21
arm                   randconfig-003-20250407    gcc-8.5.0
arm                   randconfig-004-20250407    gcc-8.5.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250407    clang-21
arm64                 randconfig-002-20250407    gcc-6.5.0
arm64                 randconfig-003-20250407    gcc-8.5.0
arm64                 randconfig-004-20250407    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250407    gcc-14.2.0
csky                  randconfig-002-20250407    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250407    clang-21
hexagon               randconfig-002-20250407    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250407    gcc-12
i386        buildonly-randconfig-002-20250407    gcc-12
i386        buildonly-randconfig-003-20250407    gcc-12
i386        buildonly-randconfig-004-20250407    clang-20
i386        buildonly-randconfig-005-20250407    gcc-12
i386        buildonly-randconfig-006-20250407    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250407    gcc-14.2.0
loongarch             randconfig-002-20250407    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250407    gcc-6.5.0
nios2                 randconfig-002-20250407    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250407    gcc-7.5.0
parisc                randconfig-002-20250407    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250407    clang-21
powerpc               randconfig-002-20250407    clang-21
powerpc               randconfig-003-20250407    gcc-6.5.0
powerpc64             randconfig-001-20250407    clang-21
powerpc64             randconfig-002-20250407    clang-17
powerpc64             randconfig-003-20250407    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250407    gcc-8.5.0
riscv                 randconfig-002-20250407    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250407    gcc-9.3.0
s390                  randconfig-002-20250407    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250407    gcc-12.4.0
sh                    randconfig-002-20250407    gcc-10.5.0
sh                          sdk7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250407    gcc-13.3.0
sparc                 randconfig-002-20250407    gcc-10.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250407    gcc-7.5.0
sparc64               randconfig-002-20250407    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250407    clang-18
um                    randconfig-002-20250407    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250407    gcc-11
x86_64      buildonly-randconfig-002-20250407    clang-20
x86_64      buildonly-randconfig-003-20250407    clang-20
x86_64      buildonly-randconfig-004-20250407    clang-20
x86_64      buildonly-randconfig-005-20250407    clang-20
x86_64      buildonly-randconfig-006-20250407    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250407    gcc-9.3.0
xtensa                randconfig-002-20250407    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
