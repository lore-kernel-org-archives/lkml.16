Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83823212FA3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150691; cv=none; b=CdlL6SomhdY7wBOEyflH9i3Zc+xjMJK10AEq+sFRpFe02Kj551QX71tbzZvqAOtTXxHirYa3MJG63fVN3VhCF0uNzf7qOlGNFD5rzwTMa4YuF5Or0hivdm0Ut57avijTfFDvn/hLX1PzV05PhL1IzeThSfKHDer/Ihv+7GFanSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150691; c=relaxed/simple;
	bh=FPPCVXjrL4yDJJT3LCK88zcRxGvj0wKMspyXe7R7IGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=enk0Ii08edfXjE20fla/+DrFA3L90og5mKxNjApJ0S4Lck+XXMI3ePm485spAEHVMmLfvhCa84v4EcChajGE8R3uhyLxNMccwLbLo+03U84xtfSvqSulqI6Xo2aN9lwdBeCYcnY+3eFK0AWpnurp74GfwsFoNPEdfbc63Rzn/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLxWGzrh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLxWGzrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743150689; x=1774686689;
  h=date:from:to:cc:subject:message-id;
  bh=FPPCVXjrL4yDJJT3LCK88zcRxGvj0wKMspyXe7R7IGw=;
  b=VLxWGzrhy34VdcwsSr88rV9U4bsG4/FiBkOsTpdKPtjhMQIRCYiqJh9j
   Ce7+v7CBhlvj7i4thxFAmZ48002YjpSGE/b9KVtduD9uy5vBN0NTOAhjo
   TJjq4SQWBA1vUi663uyrcsXXwm9H8pim8/XgF47URxMDDP4CrXHyrMzFL
   359iQ0OxO2Y2YjyzliKwOMMxekjmTZzxBRaeyu4wTOZBKa+YrsPhUwvuP
   k4Y5AUDTbqS6re9PKCmW2SqEz0mgyGET/mwFef2hwmWMA7BxdPEBRkw+F
   1oao4jtRSXlthl76LKHtuglv58gv9+4auKUzdNLHSEZ+vKrRGdnaTaFQo
   A==;
X-CSE-ConnectionGUID: hn39pHH3SImilZayuXOiaA==
X-CSE-MsgGUID: yLKIIGvuQy+YPxqe8ESn5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="32109161"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="32109161"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 01:30:57 -0700
X-CSE-ConnectionGUID: CPiXQoPISuClEAsd/Xxdgg==
X-CSE-MsgGUID: IUfzAknfTmeL3aStepSnFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="130444434"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Mar 2025 01:30:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty570-0007FP-2X;
	Fri, 28 Mar 2025 08:30:49 +0000
Date: Fri, 28 Mar 2025 16:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/urgent] BUILD SUCCESS
 495f53d5cca0f939eaed9dca90b67e7e6fb0e30c
Message-ID: <202503281631.8aZ8IAiD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/urgent
branch HEAD: 495f53d5cca0f939eaed9dca90b67e7e6fb0e30c  locking/lockdep: Decrease nr_unused_locks if lock unused in zap_class()

elapsed time: 1458m

configs tested: 210
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250327    gcc-14.2.0
arc                   randconfig-002-20250327    gcc-14.2.0
arc                           tb10x_defconfig    clang-21
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                         mv78xx0_defconfig    clang-19
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250327    clang-21
arm                   randconfig-002-20250327    gcc-5.5.0
arm                   randconfig-003-20250327    clang-21
arm                   randconfig-004-20250327    clang-16
arm                       spear13xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250327    gcc-5.5.0
arm64                 randconfig-002-20250327    clang-21
arm64                 randconfig-003-20250327    clang-21
arm64                 randconfig-004-20250327    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250327    gcc-9.3.0
csky                  randconfig-002-20250327    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250327    clang-21
hexagon               randconfig-002-20250327    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250327    clang-20
i386        buildonly-randconfig-002-20250327    gcc-12
i386        buildonly-randconfig-003-20250327    clang-20
i386        buildonly-randconfig-004-20250327    clang-20
i386        buildonly-randconfig-005-20250327    clang-20
i386        buildonly-randconfig-006-20250327    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250328    gcc-12
i386                  randconfig-002-20250328    gcc-12
i386                  randconfig-003-20250328    gcc-12
i386                  randconfig-004-20250328    gcc-12
i386                  randconfig-005-20250328    gcc-12
i386                  randconfig-006-20250328    gcc-12
i386                  randconfig-007-20250328    gcc-12
i386                  randconfig-011-20250328    clang-20
i386                  randconfig-012-20250328    clang-20
i386                  randconfig-013-20250328    clang-20
i386                  randconfig-014-20250328    clang-20
i386                  randconfig-015-20250328    clang-20
i386                  randconfig-016-20250328    clang-20
i386                  randconfig-017-20250328    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250327    gcc-14.2.0
loongarch             randconfig-002-20250327    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250327    gcc-11.5.0
nios2                 randconfig-002-20250327    gcc-13.3.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250327    gcc-14.2.0
parisc                randconfig-002-20250327    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250327    gcc-7.5.0
powerpc               randconfig-002-20250327    gcc-9.3.0
powerpc               randconfig-003-20250327    gcc-5.5.0
powerpc                     taishan_defconfig    clang-17
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    clang-21
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250327    gcc-9.3.0
powerpc64             randconfig-002-20250327    clang-21
powerpc64             randconfig-003-20250327    clang-16
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250327    clang-21
riscv                 randconfig-002-20250327    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250327    gcc-6.5.0
s390                  randconfig-002-20250327    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250327    gcc-5.5.0
sh                    randconfig-002-20250327    gcc-9.3.0
sh                          rsk7203_defconfig    clang-21
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250327    gcc-12.4.0
sparc                 randconfig-002-20250327    gcc-10.3.0
sparc                       sparc64_defconfig    clang-21
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250327    gcc-6.5.0
sparc64               randconfig-002-20250327    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250327    clang-19
um                    randconfig-002-20250327    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250327    gcc-12
x86_64      buildonly-randconfig-002-20250327    gcc-12
x86_64      buildonly-randconfig-003-20250327    clang-20
x86_64      buildonly-randconfig-004-20250327    clang-20
x86_64      buildonly-randconfig-005-20250327    gcc-12
x86_64      buildonly-randconfig-006-20250327    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250328    gcc-12
x86_64                randconfig-002-20250328    gcc-12
x86_64                randconfig-003-20250328    gcc-12
x86_64                randconfig-004-20250328    gcc-12
x86_64                randconfig-005-20250328    gcc-12
x86_64                randconfig-006-20250328    gcc-12
x86_64                randconfig-007-20250328    gcc-12
x86_64                randconfig-008-20250328    gcc-12
x86_64                randconfig-071-20250328    clang-20
x86_64                randconfig-072-20250328    clang-20
x86_64                randconfig-073-20250328    clang-20
x86_64                randconfig-074-20250328    clang-20
x86_64                randconfig-075-20250328    clang-20
x86_64                randconfig-076-20250328    clang-20
x86_64                randconfig-077-20250328    clang-20
x86_64                randconfig-078-20250328    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250327    gcc-14.2.0
xtensa                randconfig-002-20250327    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
