Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ECA8BEC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743866495; cv=none; b=KeCun3SgY3peoM0l62bQMjyakWVyYR0wF9xiOqUsrMkaFBI+N+o4cS1zSq7W4sMuOYW/CcvDeRmRZ4tYEdIZ3/HKT0eM3fzeJisBKXRwaqZx93My4MROnJyajHW9vd2gT0qrE9lSM+i3l5nTqm2+arRY0DG4w/E6I12kg2FVeTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743866495; c=relaxed/simple;
	bh=NSfL7cYMIvWF854H9Yh2Fd2LhyjzCG2CG70hSBBWy0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jDXSvVG/588RLkBFPIuJtbeAU4FFFQfmeIoPsf6cGZ4KYp0t2ie7ISRA9o5/6T/zzxszZ+JHmxDYhD9MISBMXhSPQactYB8DyJsI8DCBNao1Q0Q7E4fZiabiZkuVM8kddGO7Pwj5Gh0dHMvo6ebqd6dROkzjUb8cvhvT7Vgew7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpUwaHLW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpUwaHLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743866493; x=1775402493;
  h=date:from:to:cc:subject:message-id;
  bh=NSfL7cYMIvWF854H9Yh2Fd2LhyjzCG2CG70hSBBWy0A=;
  b=LpUwaHLWmvFjXHydRwZi2qmzfPInCeUsSJ963HDP3IDKiFDX6rj3FSsg
   Nbe4fQObIf0hLHGyh5I7K4ajfIMZXzxLgkyhh1yFloN/xQtqGvQjn5Psm
   dbSJQLJ5BCq8rpLsdAIoSfBWjwPmGYjJwnpZDWvlg622VCYXTtMdxnjNg
   A+9W7iRfLS/wlKm4at3MgvrnuRbnV/+rMm2sTwsmaf/phiacfYAGjRUAo
   saXPK6HXLwXcmCF28bZGs5vCkM4DJ7A9YFBQD4YeQl3SdG3ZMcs4ghXeR
   8iPNFc3YK1ow/3l9VbTPzxKfywx16lNzCzXRAzza+x8hoQxhbFX2cR6C4
   g==;
X-CSE-ConnectionGUID: 6P2aB6yNRhmjSeD4POD1Ng==
X-CSE-MsgGUID: VwZhspJnQ+id5PSF1/HIbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="48947969"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="48947969"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 08:21:32 -0700
X-CSE-ConnectionGUID: slqnApqpRAOnV9zIPE2bFQ==
X-CSE-MsgGUID: zKIh2Dc1TRmdR74zzarwoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="164754356"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Apr 2025 08:21:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u15Kr-00027C-1K;
	Sat, 05 Apr 2025 15:21:29 +0000
Date: Sat, 05 Apr 2025 23:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/urgent] BUILD SUCCESS
 9b305678c55dd45044aa565fee04f8d88382bc4d
Message-ID: <202504052300.FPRpnpYh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 9b305678c55dd45044aa565fee04f8d88382bc4d  genirq/migration: Use irqd_get_parent_data() in irq_force_complete_move()

elapsed time: 1444m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250405    gcc-14.2.0
arc                   randconfig-002-20250405    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250405    clang-18
arm                   randconfig-002-20250405    gcc-7.5.0
arm                   randconfig-003-20250405    gcc-8.5.0
arm                   randconfig-004-20250405    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250405    clang-19
arm64                 randconfig-002-20250405    gcc-8.5.0
arm64                 randconfig-003-20250405    gcc-8.5.0
arm64                 randconfig-004-20250405    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250405    gcc-14.2.0
csky                  randconfig-002-20250405    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250405    clang-21
hexagon               randconfig-002-20250405    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250404    gcc-12
i386        buildonly-randconfig-002-20250404    gcc-12
i386        buildonly-randconfig-003-20250404    gcc-12
i386        buildonly-randconfig-004-20250404    gcc-12
i386        buildonly-randconfig-005-20250404    gcc-12
i386        buildonly-randconfig-006-20250404    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250405    gcc-14.2.0
loongarch             randconfig-002-20250405    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250405    gcc-12.4.0
nios2                 randconfig-002-20250405    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250405    gcc-11.5.0
parisc                randconfig-002-20250405    gcc-9.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 linkstation_defconfig    clang-20
powerpc                      mgcoge_defconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc                     mpc83xx_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250405    gcc-8.5.0
powerpc               randconfig-002-20250405    gcc-8.5.0
powerpc               randconfig-003-20250405    gcc-8.5.0
powerpc64             randconfig-001-20250405    clang-21
powerpc64             randconfig-002-20250405    clang-21
powerpc64             randconfig-003-20250405    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250405    clang-21
riscv                 randconfig-002-20250405    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250405    clang-15
s390                  randconfig-002-20250405    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250405    gcc-14.2.0
sh                    randconfig-002-20250405    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250405    gcc-11.5.0
sparc                 randconfig-002-20250405    gcc-10.3.0
sparc64               randconfig-001-20250405    gcc-9.3.0
sparc64               randconfig-002-20250405    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250405    clang-17
um                    randconfig-002-20250405    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250405    gcc-12
x86_64      buildonly-randconfig-002-20250405    clang-20
x86_64      buildonly-randconfig-003-20250405    clang-20
x86_64      buildonly-randconfig-004-20250405    clang-20
x86_64      buildonly-randconfig-005-20250405    gcc-12
x86_64      buildonly-randconfig-006-20250405    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250405    gcc-11.5.0
xtensa                randconfig-002-20250405    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
