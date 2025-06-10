Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FB1FF5F9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537940; cv=none; b=pBF/6UdSwBLptnf5eaivzsMz2lBjlzjHlyMWN4dpotxYQzV01Vz/MUs6wwxNIsbbgWx+etpNgqjqDSIobIRw4BIRRdUyWaVtw5ls6DVIX1qehgA48duoAEEC9mGyrwoS4Hb65hYIeHdDf05Ie5TodQ+BbNccKQ+yq+Vi7U7DMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537940; c=relaxed/simple;
	bh=pA8NlxjfOkPdeenuGi7tc4FGNfrnTjNLQ95+xVAXeDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bsy1ETxs7EnR3coqzBnKzxdDpHYrfgep8LJ0G4VT/Zo2Dx4a+xuhndOIvQJrjoMFs5kRhEgnAmTn4D2tjElN8e/WcXnJIs3L/OE9/cDg8XV1nUu5gNC3+WZX8wqSwe+SGHiJL9WyIcFrUb2zFfuBf53c7QtNd9L7r3G4C23m9f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP8g6Squ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP8g6Squ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749537939; x=1781073939;
  h=date:from:to:cc:subject:message-id;
  bh=pA8NlxjfOkPdeenuGi7tc4FGNfrnTjNLQ95+xVAXeDQ=;
  b=LP8g6Squb7QXTS7MqG/iHxQr6dnS2QyckGI+sVWrJXny7Mkys29FP4vb
   JZGNgii8gSnkmNuH08WipyHd6m0OP8Z+DSaSaOzN3A3ip8ti3qDH/VhhT
   /FxBrr1x9XUyvVqoXHBCV1PJ6nKiSPi1ozkzJ6/k9UwiTsyHQCq++i8yh
   4c9oZ9VPpOMWoYnGVAVwsxLsgykffSvXqvU4HkNeKYgEDxp1i8MYtfHal
   /I70ULHezkQVqSrvZr5zC9dnFsP6HQjLi2MDYSA+ijdMQcjsCBF6Q5Mo/
   FZzOcC+2Oin9Kv/g/18rcMSnNypZMyaC7ElC39vx1tKlV7cQXcb2iA3PP
   w==;
X-CSE-ConnectionGUID: kfGY2HYySa+6o7EExQuH5g==
X-CSE-MsgGUID: h/ST0APXTrCcAc3y2F0Q4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51509896"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51509896"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 23:45:38 -0700
X-CSE-ConnectionGUID: FAJcAx+4R1G9eLfhs5qkyQ==
X-CSE-MsgGUID: 31WFuA0xStWr7wwzWGuMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146718176"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2025 23:45:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOsjl-0007tU-1r;
	Tue, 10 Jun 2025 06:45:33 +0000
Date: Tue, 10 Jun 2025 14:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 f287822688eeb44ae1cf6ac45701d965efc33218
Message-ID: <202506101410.5W1U5CzK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: f287822688eeb44ae1cf6ac45701d965efc33218  selftests/x86: Add a test to detect infinite SIGTRAP handler loop

elapsed time: 873m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-002-20250610    gcc-14.3.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                   randconfig-001-20250610    clang-19
arm                   randconfig-002-20250610    gcc-8.5.0
arm                   randconfig-003-20250610    clang-21
arm                   randconfig-004-20250610    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250610    clang-21
arm64                 randconfig-002-20250610    gcc-11.5.0
arm64                 randconfig-003-20250610    clang-21
arm64                 randconfig-004-20250610    clang-18
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250610    gcc-12.4.0
csky                  randconfig-002-20250610    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250610    clang-21
hexagon               randconfig-002-20250610    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-004-20250610    clang-20
i386        buildonly-randconfig-004-20250610    gcc-12
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-006-20250610    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250610    gcc-15.1.0
loongarch             randconfig-002-20250610    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250610    gcc-8.5.0
nios2                 randconfig-002-20250610    gcc-13.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250610    gcc-10.5.0
parisc                randconfig-002-20250610    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250610    gcc-10.5.0
powerpc               randconfig-002-20250610    gcc-8.5.0
powerpc               randconfig-003-20250610    clang-21
powerpc64             randconfig-001-20250610    clang-21
powerpc64             randconfig-002-20250610    clang-21
powerpc64             randconfig-003-20250610    gcc-11.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250610    gcc-14.3.0
riscv                 randconfig-002-20250610    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250610    gcc-8.5.0
s390                  randconfig-002-20250610    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-002-20250610    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-15.1.0
sparc                 randconfig-002-20250610    gcc-12.4.0
sparc64               randconfig-001-20250610    gcc-8.5.0
sparc64               randconfig-002-20250610    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250610    gcc-11
um                    randconfig-002-20250610    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250610    clang-20
x86_64      buildonly-randconfig-002-20250610    gcc-12
x86_64      buildonly-randconfig-003-20250610    clang-20
x86_64      buildonly-randconfig-004-20250610    clang-20
x86_64      buildonly-randconfig-005-20250610    gcc-12
x86_64      buildonly-randconfig-006-20250610    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250610    gcc-11.5.0
xtensa                randconfig-002-20250610    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
