Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701F17A2E0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933753; cv=none; b=nXE59hdm8VKAAScqCv3qpOQy2lV4bKDCCIGFK/fxtU6EizB79P4V8Hgt9f1KKQTYfHG/0kRLRt46Z2XNy77fYncwSGXz4HXIeVxXFvxUsGRr83CqzI0xa9nxkUrJQIOpZq5zbR9iHHxeAkwO4UUYZGSThG8/r1/5jKIVvkIasgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933753; c=relaxed/simple;
	bh=mo3eNtJLePhL/EwAhRj18myWR1qO/JVxKZGo4w4nA/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rfc1vc6XjD1KipI0eh2bma/v4xPVQ+AuAR91n3mP1ZAoTqMpSmhRj+Q98k+epYDRkmZ5pHhF08zSSoiFzuie+gKc8KapyHqHtZknePDQFZD17s7gkYnTlUF6eYUZbOfRNL0IkdwknhcLJj3KgKrtwo352cHR4+fYwj+udsdczCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EctTZtlQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EctTZtlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747933752; x=1779469752;
  h=date:from:to:cc:subject:message-id;
  bh=mo3eNtJLePhL/EwAhRj18myWR1qO/JVxKZGo4w4nA/M=;
  b=EctTZtlQ8M73TKJNlAaib6S+4BBQ9emx0V7DR4h9UBAr7zPX8BZH7SI9
   /1PKsoOu9l0IxD4gCrn2uBz/n3S+ybeFQ2jyReEvFHudv6/qJhnurIRO4
   /L0SJdyRHfLi2CR3K7waPMbri58z5WT9d085v+fXWw1gi+WPPk8+BJLK4
   eR8Ptr9zfGRYjNo+oS96GXwafdhEajqw8ze8TCoSdcbeKqlrbVXujyJJw
   SrKwgeRSXIqIwMwX8p63nSCvn6AfAstRJxFMU5Iq9zXRHj1RdnjTn+pb+
   pTdKjKQVDDPhyl4vDhOsnLiUem85GCcqaDWDU5LV5lotMIzxszcfthQjq
   A==;
X-CSE-ConnectionGUID: 4vlRyvW/TAul67UTO83HFw==
X-CSE-MsgGUID: cwKeKEZLRlOSvdNf3h6TTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53638109"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="53638109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 10:09:10 -0700
X-CSE-ConnectionGUID: mgUr0tB/SnyuAESFAEe5uw==
X-CSE-MsgGUID: 8q39j6flQnSgpTKZlQOGcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140558036"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 May 2025 10:09:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI9Pm-000PXs-0M;
	Thu, 22 May 2025 17:09:06 +0000
Date: Fri, 23 May 2025 01:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/clocksource] BUILD SUCCESS
 29857e6f4e30b475e0713fc7a65a962745c429ab
Message-ID: <202505230118.IaxJplmr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/clocksource
branch HEAD: 29857e6f4e30b475e0713fc7a65a962745c429ab  Merge tag 'timers-v6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux into timers/drivers

elapsed time: 1447m

configs tested: 230
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250522    clang-21
arc                   randconfig-001-20250522    gcc-15.1.0
arc                   randconfig-002-20250522    clang-21
arc                   randconfig-002-20250522    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                         bcm2835_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          moxart_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                            mps2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250522    clang-21
arm                   randconfig-002-20250522    clang-21
arm                   randconfig-003-20250522    clang-18
arm                   randconfig-003-20250522    clang-21
arm                   randconfig-004-20250522    clang-21
arm                   randconfig-004-20250522    gcc-7.5.0
arm                         socfpga_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250522    clang-21
arm64                 randconfig-002-20250522    clang-21
arm64                 randconfig-002-20250522    gcc-7.5.0
arm64                 randconfig-003-20250522    clang-21
arm64                 randconfig-004-20250522    clang-21
arm64                 randconfig-004-20250522    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250522    gcc-15.1.0
csky                  randconfig-001-20250522    gcc-9.3.0
csky                  randconfig-002-20250522    gcc-15.1.0
csky                  randconfig-002-20250522    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250522    clang-17
hexagon               randconfig-001-20250522    gcc-9.3.0
hexagon               randconfig-002-20250522    clang-21
hexagon               randconfig-002-20250522    gcc-9.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250522    clang-20
i386        buildonly-randconfig-001-20250522    gcc-12
i386        buildonly-randconfig-002-20250522    gcc-12
i386        buildonly-randconfig-003-20250522    gcc-12
i386        buildonly-randconfig-004-20250522    gcc-12
i386        buildonly-randconfig-005-20250522    gcc-12
i386        buildonly-randconfig-006-20250522    clang-20
i386        buildonly-randconfig-006-20250522    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250522    clang-20
i386                  randconfig-002-20250522    clang-20
i386                  randconfig-003-20250522    clang-20
i386                  randconfig-004-20250522    clang-20
i386                  randconfig-005-20250522    clang-20
i386                  randconfig-006-20250522    clang-20
i386                  randconfig-007-20250522    clang-20
i386                  randconfig-011-20250522    gcc-12
i386                  randconfig-012-20250522    gcc-12
i386                  randconfig-013-20250522    gcc-12
i386                  randconfig-014-20250522    gcc-12
i386                  randconfig-015-20250522    gcc-12
i386                  randconfig-016-20250522    gcc-12
i386                  randconfig-017-20250522    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250522    gcc-15.1.0
loongarch             randconfig-001-20250522    gcc-9.3.0
loongarch             randconfig-002-20250522    gcc-15.1.0
loongarch             randconfig-002-20250522    gcc-9.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       rbtx49xx_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250522    gcc-6.5.0
parisc                randconfig-001-20250522    gcc-9.3.0
parisc                randconfig-002-20250522    gcc-12.4.0
parisc                randconfig-002-20250522    gcc-9.3.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-21
powerpc                        fsp2_defconfig    clang-21
powerpc                      ppc64e_defconfig    clang-21
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250522    clang-21
powerpc               randconfig-002-20250522    gcc-9.3.0
powerpc               randconfig-003-20250522    gcc-7.5.0
powerpc               randconfig-003-20250522    gcc-9.3.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250522    clang-21
powerpc64             randconfig-001-20250522    gcc-9.3.0
powerpc64             randconfig-002-20250522    gcc-10.5.0
powerpc64             randconfig-002-20250522    gcc-9.3.0
powerpc64             randconfig-003-20250522    gcc-7.5.0
powerpc64             randconfig-003-20250522    gcc-9.3.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250522    gcc-10.5.0
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-002-20250522    clang-18
riscv                 randconfig-002-20250522    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-001-20250522    gcc-10.5.0
s390                  randconfig-002-20250522    clang-18
s390                  randconfig-002-20250522    gcc-10.5.0
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250522    gcc-10.5.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-002-20250522    gcc-10.5.0
sh                    randconfig-002-20250522    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-10.5.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-002-20250522    gcc-10.5.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250522    gcc-10.5.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-002-20250522    gcc-10.5.0
sparc64               randconfig-002-20250522    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250522    gcc-10.5.0
um                    randconfig-001-20250522    gcc-12
um                    randconfig-002-20250522    gcc-10.5.0
um                    randconfig-002-20250522    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250522    clang-20
x86_64      buildonly-randconfig-002-20250522    clang-20
x86_64      buildonly-randconfig-002-20250522    gcc-12
x86_64      buildonly-randconfig-003-20250522    clang-20
x86_64      buildonly-randconfig-003-20250522    gcc-12
x86_64      buildonly-randconfig-004-20250522    clang-20
x86_64      buildonly-randconfig-004-20250522    gcc-12
x86_64      buildonly-randconfig-005-20250522    clang-20
x86_64      buildonly-randconfig-005-20250522    gcc-12
x86_64      buildonly-randconfig-006-20250522    clang-20
x86_64      buildonly-randconfig-006-20250522    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250522    clang-20
x86_64                randconfig-002-20250522    clang-20
x86_64                randconfig-003-20250522    clang-20
x86_64                randconfig-004-20250522    clang-20
x86_64                randconfig-005-20250522    clang-20
x86_64                randconfig-006-20250522    clang-20
x86_64                randconfig-007-20250522    clang-20
x86_64                randconfig-008-20250522    clang-20
x86_64                randconfig-071-20250522    gcc-12
x86_64                randconfig-072-20250522    gcc-12
x86_64                randconfig-073-20250522    gcc-12
x86_64                randconfig-074-20250522    gcc-12
x86_64                randconfig-075-20250522    gcc-12
x86_64                randconfig-076-20250522    gcc-12
x86_64                randconfig-077-20250522    gcc-12
x86_64                randconfig-078-20250522    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-10.5.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-002-20250522    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
