Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8524339E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739079543; cv=none; b=MOi7mecvryXhcDa/hhFwQ8bwi7gZA5QIpqBB8gKfQGvbt/lL46u3uaCgfY2cutdbnpAmWHaXP+HmvGP9K1vLKpd8F7/UbgRCB/yWNgZg2DTdenSloiV5XXCsx84qx9Qlt13W+Ob7at6PUuAOpNMKHVODUcrpQmASZQjhM6Yarg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739079543; c=relaxed/simple;
	bh=zdKi1os2TONznxYwO9iZU1seZ0q3ACU+A23xeg4fzsk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JSsYhkLOPnZ4lIbN11e/DsOdCd6Ekb9EQBoasG/IBmdZejMl9pG1XuwetKa8Fgp7pOnit//Njlz3awYTjzWhaxdm5ALTk67njvv/GdZklBis/gCt8ZkLJ+AQu2mb/nruo2c6f89f4FHBDYkZldbn3tkDv6Wrs6Q2bmRNohc1Bs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ft4mUZNJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ft4mUZNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739079542; x=1770615542;
  h=date:from:to:cc:subject:message-id;
  bh=zdKi1os2TONznxYwO9iZU1seZ0q3ACU+A23xeg4fzsk=;
  b=ft4mUZNJwu9zfOIdFOCue5I4/ubuJmkNw5LUrc7U5QjURnFCSquzOfmp
   0NV4dVdGl++hQmNgsJ4RZb0Bo5jErDimUcNX/6q5ll+VPCetR0usdigtr
   xjEh3umJtQc/9rBYV4tpUujbvB6hWnFwxVY9aSckLK6DjvO2/hCrW3YXO
   h1fJVUjSvdUuI3q9k+emCDb0DMG2rrGDopeUSItMxgBpNE3STuerJijLl
   rZSKVDDHUD9MyKuRG6/h2Q+SIWSNvwuVy+5Bbzkh6FzxQG1hwD9pGhkTg
   GxXDvXSjSShwPtMAlLulMszV3T6yU8MTNh+2j+thYFlI0ECbxINUwOnnY
   A==;
X-CSE-ConnectionGUID: vqlUWy4BRJKax7Q8VlZzTQ==
X-CSE-MsgGUID: BqpD0HsFQhq0dW8AFYgHgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="65036562"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="65036562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 21:39:01 -0800
X-CSE-ConnectionGUID: B4NLZBCKTv+eKGoFouHXcQ==
X-CSE-MsgGUID: 0e85Bb7xRtCdXEHobGFMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="112393820"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Feb 2025 21:39:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th01y-00117f-0c;
	Sun, 09 Feb 2025 05:38:58 +0000
Date: Sun, 09 Feb 2025 13:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 d4d18d1e103fd870fc98135f2928117154cdbf16
Message-ID: <202502091333.8GrnzPKO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: d4d18d1e103fd870fc98135f2928117154cdbf16  Merge branch into tip/master: 'x86/mm'

elapsed time: 1185m

configs tested: 223
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250208    gcc-13.2.0
arc                   randconfig-001-20250209    gcc-13.2.0
arc                   randconfig-002-20250208    gcc-13.2.0
arc                   randconfig-002-20250209    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-13.2.0
arm                   randconfig-001-20250208    gcc-14.2.0
arm                   randconfig-001-20250209    gcc-13.2.0
arm                   randconfig-002-20250208    clang-17
arm                   randconfig-002-20250209    gcc-13.2.0
arm                   randconfig-003-20250208    clang-21
arm                   randconfig-003-20250209    gcc-13.2.0
arm                   randconfig-004-20250208    gcc-14.2.0
arm                   randconfig-004-20250209    gcc-13.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250208    clang-21
arm64                 randconfig-001-20250209    gcc-13.2.0
arm64                 randconfig-002-20250208    clang-21
arm64                 randconfig-002-20250209    gcc-13.2.0
arm64                 randconfig-003-20250208    clang-21
arm64                 randconfig-003-20250209    gcc-13.2.0
arm64                 randconfig-004-20250208    clang-15
arm64                 randconfig-004-20250209    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250208    gcc-14.2.0
csky                  randconfig-001-20250209    gcc-14.2.0
csky                  randconfig-002-20250208    gcc-14.2.0
csky                  randconfig-002-20250209    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250208    clang-21
hexagon               randconfig-001-20250209    gcc-14.2.0
hexagon               randconfig-002-20250208    clang-21
hexagon               randconfig-002-20250209    gcc-14.2.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250208    gcc-11
i386        buildonly-randconfig-002-20250208    clang-19
i386        buildonly-randconfig-003-20250208    gcc-12
i386        buildonly-randconfig-004-20250208    clang-19
i386        buildonly-randconfig-005-20250208    clang-19
i386        buildonly-randconfig-006-20250208    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250209    clang-19
i386                  randconfig-002-20250209    clang-19
i386                  randconfig-003-20250209    clang-19
i386                  randconfig-004-20250209    clang-19
i386                  randconfig-005-20250209    clang-19
i386                  randconfig-006-20250209    clang-19
i386                  randconfig-007-20250209    clang-19
i386                  randconfig-011-20250209    clang-19
i386                  randconfig-012-20250209    clang-19
i386                  randconfig-013-20250209    clang-19
i386                  randconfig-014-20250209    clang-19
i386                  randconfig-015-20250209    clang-19
i386                  randconfig-016-20250209    clang-19
i386                  randconfig-017-20250209    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250208    gcc-14.2.0
loongarch             randconfig-001-20250209    gcc-14.2.0
loongarch             randconfig-002-20250208    gcc-14.2.0
loongarch             randconfig-002-20250209    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250208    gcc-14.2.0
nios2                 randconfig-001-20250209    gcc-14.2.0
nios2                 randconfig-002-20250208    gcc-14.2.0
nios2                 randconfig-002-20250209    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250208    gcc-14.2.0
parisc                randconfig-001-20250209    gcc-14.2.0
parisc                randconfig-002-20250208    gcc-14.2.0
parisc                randconfig-002-20250209    gcc-14.2.0
parisc64                         alldefconfig    gcc-13.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    gcc-13.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250208    clang-19
powerpc               randconfig-001-20250209    gcc-14.2.0
powerpc               randconfig-002-20250208    clang-17
powerpc               randconfig-002-20250209    gcc-14.2.0
powerpc               randconfig-003-20250208    gcc-14.2.0
powerpc               randconfig-003-20250209    gcc-14.2.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250208    clang-21
powerpc64             randconfig-001-20250209    gcc-14.2.0
powerpc64             randconfig-002-20250208    gcc-14.2.0
powerpc64             randconfig-002-20250209    gcc-14.2.0
powerpc64             randconfig-003-20250208    clang-21
powerpc64             randconfig-003-20250209    gcc-14.2.0
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250209    clang-18
riscv                 randconfig-001-20250209    gcc-14.2.0
riscv                 randconfig-002-20250209    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250209    clang-21
s390                  randconfig-001-20250209    gcc-14.2.0
s390                  randconfig-002-20250209    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250209    gcc-14.2.0
sh                    randconfig-002-20250209    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-13.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250209    gcc-14.2.0
sparc                 randconfig-002-20250209    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250209    gcc-14.2.0
sparc64               randconfig-002-20250209    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250209    gcc-11
um                    randconfig-001-20250209    gcc-14.2.0
um                    randconfig-002-20250209    gcc-12
um                    randconfig-002-20250209    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250208    clang-19
x86_64      buildonly-randconfig-002-20250208    gcc-12
x86_64      buildonly-randconfig-003-20250208    gcc-12
x86_64      buildonly-randconfig-004-20250208    clang-19
x86_64      buildonly-randconfig-005-20250208    clang-19
x86_64      buildonly-randconfig-006-20250208    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250209    gcc-12
x86_64                randconfig-002-20250209    gcc-12
x86_64                randconfig-003-20250209    gcc-12
x86_64                randconfig-004-20250209    gcc-12
x86_64                randconfig-005-20250209    gcc-12
x86_64                randconfig-006-20250209    gcc-12
x86_64                randconfig-007-20250209    gcc-12
x86_64                randconfig-008-20250209    gcc-12
x86_64                randconfig-071-20250209    gcc-12
x86_64                randconfig-072-20250209    gcc-12
x86_64                randconfig-073-20250209    gcc-12
x86_64                randconfig-074-20250209    gcc-12
x86_64                randconfig-075-20250209    gcc-12
x86_64                randconfig-076-20250209    gcc-12
x86_64                randconfig-077-20250209    gcc-12
x86_64                randconfig-078-20250209    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250209    gcc-14.2.0
xtensa                randconfig-002-20250209    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
