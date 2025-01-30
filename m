Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2A84D34
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253212; cv=none; b=qApTpqPhcE+0cejp/+OB0Nmn3UmlcLgd2Q7c6NjizqPRlSoOdAusLJJ3AucdicumVSSiOcxGQrNbc0tWBvQQ8awF2BWV+u63pEcvNslki+PPEnw6pPFQ8KocCSk0XPJijnDKSLnycCK+wQ4V02j/Yt1570A7Gi5PoqwCH9wLxf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253212; c=relaxed/simple;
	bh=UNj3RyKjzUHLACHEZcc5e5gb4EUHv7ka1krnwMcx88E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R9JVqv0/Ztc8R1DzCB+YY3vRRmHFC+kBfBXzmZwhqgM21gRvKw74GFgz4hyAB/UgbnXmr22AgzzzlztFZCk2k0Ej2C0fejI56W9v+YOBZ1BmuTyOhVli5vnTpTx+WczRfXUnkSk2WHASfThgTV0ZNS1lMfGhF6JMR+iYU4pAAIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0ppX0AI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0ppX0AI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738253211; x=1769789211;
  h=date:from:to:cc:subject:message-id;
  bh=UNj3RyKjzUHLACHEZcc5e5gb4EUHv7ka1krnwMcx88E=;
  b=c0ppX0AINo8PssKZ/2cWDJW7ZOVP8QYZ62inoqNdcpUjrFNE8bbUy9gy
   InMNcSMHiXM+LTAxnuE9jPzvZ4tex3rkIzydHAnRR7x9bL80Gt8PcLBp0
   Xd52hGofuIJqMMLqlOFAKWGbfhkEyzkpBWVw1zRUkekQ1iEQ7j+BiFWJx
   xojmeubib6qGreoIc8gDMVF30F8T0V6wcC2gzbuNE/1gNJ8/J7hm870px
   3xn4Mhw0nhipsatkhzGt8mMItLNjzk/nhPGrQXNvdyoDaAiZOGZQzxVDe
   fSUS6NLSOobceW53fdP1qcAZWHc1prYwdnX+bqxjPvSb1OWmKYOZeQw6z
   w==;
X-CSE-ConnectionGUID: x0XBVkRXTCm6bVHijOB7NA==
X-CSE-MsgGUID: EcpvV4hcSBWwxPRYMCGegg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="50192007"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="50192007"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 08:06:21 -0800
X-CSE-ConnectionGUID: sJNZRb8eTZetVgAbOnVvYA==
X-CSE-MsgGUID: XOfIGhG+Qpq6lRVCVBQGGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114514258"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2025 08:06:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdX3Y-000kep-39;
	Thu, 30 Jan 2025 16:06:16 +0000
Date: Fri, 31 Jan 2025 00:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/urgent] BUILD SUCCESS
 1f566840a82982141f94086061927a90e79440e5
Message-ID: <202501310015.H5MA73Jd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
branch HEAD: 1f566840a82982141f94086061927a90e79440e5  clocksource: Use pr_info() for "Checking clocksource synchronization" message

elapsed time: 1193m

configs tested: 185
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    clang-20
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-20
arm                           stm32_defconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-20
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-20
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250130    clang-21
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    clang-21
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250130    clang-20
hexagon               randconfig-001-20250130    clang-21
hexagon               randconfig-002-20250130    clang-20
hexagon               randconfig-002-20250130    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250130    clang-19
i386        buildonly-randconfig-002-20250130    clang-19
i386        buildonly-randconfig-003-20250130    gcc-11
i386        buildonly-randconfig-004-20250130    gcc-12
i386        buildonly-randconfig-005-20250130    gcc-12
i386        buildonly-randconfig-006-20250130    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250130    gcc-12
i386                  randconfig-002-20250130    gcc-12
i386                  randconfig-003-20250130    gcc-12
i386                  randconfig-004-20250130    gcc-12
i386                  randconfig-005-20250130    gcc-12
i386                  randconfig-006-20250130    gcc-12
i386                  randconfig-007-20250130    gcc-12
i386                  randconfig-011-20250130    clang-19
i386                  randconfig-012-20250130    clang-19
i386                  randconfig-013-20250130    clang-19
i386                  randconfig-014-20250130    clang-19
i386                  randconfig-015-20250130    clang-19
i386                  randconfig-016-20250130    clang-19
i386                  randconfig-017-20250130    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    clang-21
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    clang-21
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250130    clang-21
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    clang-21
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250130    clang-21
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    clang-21
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 linkstation_defconfig    clang-20
powerpc               randconfig-001-20250130    clang-21
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-002-20250130    clang-21
powerpc               randconfig-003-20250130    clang-21
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc64             randconfig-001-20250130    clang-21
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-20
powerpc64             randconfig-002-20250130    clang-21
powerpc64             randconfig-003-20250130    clang-20
powerpc64             randconfig-003-20250130    clang-21
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250130    clang-20
riscv                 randconfig-001-20250130    gcc-14.2.0
riscv                 randconfig-002-20250130    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250130    gcc-14.2.0
s390                  randconfig-002-20250130    clang-20
s390                  randconfig-002-20250130    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250130    gcc-14.2.0
sh                    randconfig-002-20250130    gcc-14.2.0
sh                           se7722_defconfig    clang-20
sh                           se7722_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250130    gcc-14.2.0
sparc                 randconfig-002-20250130    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250130    gcc-14.2.0
sparc64               randconfig-002-20250130    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250130    gcc-12
um                    randconfig-001-20250130    gcc-14.2.0
um                    randconfig-002-20250130    gcc-12
um                    randconfig-002-20250130    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250130    clang-19
x86_64                randconfig-072-20250130    clang-19
x86_64                randconfig-073-20250130    clang-19
x86_64                randconfig-074-20250130    clang-19
x86_64                randconfig-075-20250130    clang-19
x86_64                randconfig-076-20250130    clang-19
x86_64                randconfig-077-20250130    clang-19
x86_64                randconfig-078-20250130    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250130    gcc-14.2.0
xtensa                randconfig-002-20250130    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
