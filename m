Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931FA19995D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947330; cv=none; b=PY+XuKvEX1lQeicmIe3dO5eIOgJ+O8hDC6U/hbChskIuawxj1UFR6uCD5tkFSZYwQklCJclsotmqc/Al6bSp8L7ttcRinf76S80p+6uZ1mIva+PIhEeIaYH8LprC037kQx+l8sES6oboLMrSQBmsCEGZL8q3YZz5N2f8v3l8oGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947330; c=relaxed/simple;
	bh=7aZPA04h9pHLfzAmeAVyTqu5WviBwr8pgQv6S2KwNyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NyVkxkN1THLQ8QCKLu7eJJXA9zbliWGadpnjo1vnBvD1RoOuNwGirIdtUczVsUPQw1N90KvdhlnOLi7DFCc+buBGgMZY1mo4vEEexZHgF8k9WWM64TT25gbyzHo8zxkfaVgQr8kmL/Gv5SG0Xc3RGcfUe9qjXQfDRgBLrh4muA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RI3cuWt4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RI3cuWt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947328; x=1779483328;
  h=date:from:to:cc:subject:message-id;
  bh=7aZPA04h9pHLfzAmeAVyTqu5WviBwr8pgQv6S2KwNyQ=;
  b=RI3cuWt41RuPNxD8eB7wlnNeh3h+PIyhYsdJmrbxiQHx9JFp+bRaumh4
   pGrWLqJnDaB43O43kAYzO4VJllnLEJnWv0EaHkzWGHB11KGZn28SHFYJz
   yPoWJlEZaL4DFOTD/CUcEqEy3ahjtGikoE8zs3I2LJyKWjK/Jw9fZjKWs
   cMFO3boQM7HabCSWiyUqiw5btk2nu0xb03clP+b/sYCCp4bFlNYQ0dZLh
   GlZoH1cEr+/mNfcvc4SPDoW8frn6W9KcuSClwfKnb21A+AaGWa4wNdBSr
   fV08xvfXDD1uco0j3HREFQFRzLncS/7XsX8TiEXK/bAZgXFXH59pIfvVt
   A==;
X-CSE-ConnectionGUID: mw5XJ0fNRXqq96v0VP7b0g==
X-CSE-MsgGUID: 1KopnLHvSwOvLYIO7Mf05A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49246949"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49246949"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:55:28 -0700
X-CSE-ConnectionGUID: FlK95WXuTDCg4mxXQBsCaw==
X-CSE-MsgGUID: DVNjOWvbSQCGVR4etufcLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="171753079"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 May 2025 13:55:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uICwm-000PhR-2V;
	Thu, 22 May 2025 20:55:24 +0000
Date: Fri, 23 May 2025 04:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/msi] BUILD SUCCESS
 4e7bca76e3fed58437dcd7f747d1c8d98507379e
Message-ID: <202505230457.GyXa76NL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/msi
branch HEAD: 4e7bca76e3fed58437dcd7f747d1c8d98507379e  PCI/MSI: Use bool for MSI enable state tracking

elapsed time: 1456m

configs tested: 110
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                   randconfig-001-20250522    gcc-15.1.0
arc                   randconfig-002-20250522    gcc-15.1.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250522    clang-21
arm                   randconfig-002-20250522    clang-21
arm                   randconfig-003-20250522    clang-18
arm                   randconfig-004-20250522    gcc-7.5.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250522    clang-21
arm64                 randconfig-002-20250522    gcc-7.5.0
arm64                 randconfig-003-20250522    clang-21
arm64                 randconfig-004-20250522    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250522    gcc-15.1.0
csky                  randconfig-002-20250522    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250522    clang-17
hexagon               randconfig-002-20250522    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250522    clang-20
i386        buildonly-randconfig-002-20250522    gcc-12
i386        buildonly-randconfig-003-20250522    gcc-12
i386        buildonly-randconfig-004-20250522    gcc-12
i386        buildonly-randconfig-005-20250522    gcc-12
i386        buildonly-randconfig-006-20250522    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250522    gcc-15.1.0
loongarch             randconfig-002-20250522    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250522    gcc-6.5.0
parisc                randconfig-002-20250522    gcc-12.4.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250522    clang-21
powerpc               randconfig-003-20250522    gcc-7.5.0
powerpc64             randconfig-001-20250522    clang-21
powerpc64             randconfig-002-20250522    gcc-10.5.0
powerpc64             randconfig-003-20250522    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-002-20250522    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-002-20250522    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-002-20250522    gcc-13.3.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-002-20250522    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250522    gcc-12
um                    randconfig-002-20250522    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250522    clang-20
x86_64      buildonly-randconfig-002-20250522    gcc-12
x86_64      buildonly-randconfig-003-20250522    gcc-12
x86_64      buildonly-randconfig-004-20250522    gcc-12
x86_64      buildonly-randconfig-005-20250522    gcc-12
x86_64      buildonly-randconfig-006-20250522    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-002-20250522    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
