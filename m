Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C31A0BF3
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004872; cv=none; b=LVfp6OBtVQ3PfBPH6DALrT0pO61zv/G7R7yhc6/ENi5VwZeEfA8nlJnFK0VZRqtQDFTr+3MvUokyJyasSr7JbUZdS8pKAibmnrJ4IzKD6tm9qxEDDy+7GMbzr6JHmPf5zfTRTRVb+ZXhL4HABzCBTGcq68Jc/8sJuj1QrQdOtLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004872; c=relaxed/simple;
	bh=9tuAp2/3Rki0mCAv2zZjExRYvaMTB5zPnQFUQmfKirc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PNL3n4/pm7MCGLzUw4KvgcMkojxJ06brxjpfBadCf0qnhX5HEiFR+fZg0vgh1jxvkrsR5yg0UHg8OZPemFRMauodowMZxdqXGIzqQUcZy99v4JP6DpLlCGGyY1qH6IKlRAAQ/CgrJ8qCs4GLKaWt1i9Cyz+lEUSd5qjxS5Xi+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbYprysw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbYprysw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739004870; x=1770540870;
  h=date:from:to:cc:subject:message-id;
  bh=9tuAp2/3Rki0mCAv2zZjExRYvaMTB5zPnQFUQmfKirc=;
  b=WbYprysw7y6uSGLN4poTiI3ERX9RnVTKUxM6BVF6RglGxsPCWRxCg8Zd
   u0ov7aI70aGT09QxGX8VcVXTMFtGOK6DLYIKCIH6MropWrq4TKTrRbg+3
   GPwtDC3MCGkoCnxRer5e9xhBwTk0mZI/CPPOKnITPQoLtbUh6jqwcyVQI
   EFKPXLfu3jopZOQBJmdgAskwivgjYBqTaxtOBMVenokF6i/9ukTeG+TGy
   a6LfSIU8dxRVLCJuQyWHfnCBeYOtg1BVDGlZ07zSectf5EMxmvMPV9FE9
   GfPpjsC7wlZn1aLvF9ucfPNRKeW0N8OCWeQDaQIMyqz5co6TsJYuB4SOT
   Q==;
X-CSE-ConnectionGUID: Cw+pkLy+R4iuNFQdCIVTVw==
X-CSE-MsgGUID: SuxT+UtKQtihFB/XFnWdLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39516470"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39516470"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 00:54:30 -0800
X-CSE-ConnectionGUID: v+5K8fNkT8e4qEQicBSKyA==
X-CSE-MsgGUID: ZsMipoYvQS2D7chXZEdccQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148943238"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Feb 2025 00:54:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tggba-000zlr-04;
	Sat, 08 Feb 2025 08:54:26 +0000
Date: Sat, 08 Feb 2025 16:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/urgent] BUILD SUCCESS
 29a61a1f40637ae010b828745fb41f60301c3a3d
Message-ID: <202502081657.KSsOWd00-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 29a61a1f40637ae010b828745fb41f60301c3a3d  genirq: Remove leading space from irq_chip::irq_print_chip() callbacks

elapsed time: 1467m

configs tested: 248
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-14.2.0
arc                   randconfig-001-20250207    gcc-13.2.0
arc                   randconfig-001-20250208    gcc-13.2.0
arc                   randconfig-002-20250207    gcc-13.2.0
arc                   randconfig-002-20250208    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-21
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                   randconfig-001-20250207    gcc-14.2.0
arm                   randconfig-001-20250208    gcc-13.2.0
arm                   randconfig-002-20250207    gcc-14.2.0
arm                   randconfig-002-20250208    gcc-13.2.0
arm                   randconfig-003-20250207    gcc-14.2.0
arm                   randconfig-003-20250208    gcc-13.2.0
arm                   randconfig-004-20250207    clang-21
arm                   randconfig-004-20250208    gcc-13.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250207    gcc-14.2.0
arm64                 randconfig-001-20250208    gcc-13.2.0
arm64                 randconfig-002-20250207    gcc-14.2.0
arm64                 randconfig-002-20250208    gcc-13.2.0
arm64                 randconfig-003-20250207    clang-16
arm64                 randconfig-003-20250208    gcc-13.2.0
arm64                 randconfig-004-20250207    clang-21
arm64                 randconfig-004-20250208    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    clang-21
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250207    gcc-14.2.0
csky                  randconfig-001-20250208    gcc-14.2.0
csky                  randconfig-002-20250207    gcc-14.2.0
csky                  randconfig-002-20250208    gcc-14.2.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250207    clang-21
hexagon               randconfig-001-20250208    gcc-14.2.0
hexagon               randconfig-002-20250207    clang-17
hexagon               randconfig-002-20250208    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250207    gcc-12
i386        buildonly-randconfig-001-20250208    gcc-11
i386        buildonly-randconfig-002-20250207    gcc-12
i386        buildonly-randconfig-002-20250208    gcc-11
i386        buildonly-randconfig-003-20250207    gcc-12
i386        buildonly-randconfig-003-20250208    gcc-11
i386        buildonly-randconfig-004-20250207    gcc-12
i386        buildonly-randconfig-004-20250208    gcc-11
i386        buildonly-randconfig-005-20250207    clang-19
i386        buildonly-randconfig-005-20250208    gcc-11
i386        buildonly-randconfig-006-20250207    clang-19
i386        buildonly-randconfig-006-20250208    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20250208    clang-19
i386                  randconfig-002-20250208    clang-19
i386                  randconfig-003-20250208    clang-19
i386                  randconfig-004-20250208    clang-19
i386                  randconfig-005-20250208    clang-19
i386                  randconfig-006-20250208    clang-19
i386                  randconfig-007-20250208    clang-19
i386                  randconfig-011-20250208    gcc-12
i386                  randconfig-012-20250208    gcc-12
i386                  randconfig-013-20250208    gcc-12
i386                  randconfig-014-20250208    gcc-12
i386                  randconfig-015-20250208    gcc-12
i386                  randconfig-016-20250208    gcc-12
i386                  randconfig-017-20250208    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250207    gcc-14.2.0
loongarch             randconfig-001-20250208    gcc-14.2.0
loongarch             randconfig-002-20250207    gcc-14.2.0
loongarch             randconfig-002-20250208    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250207    gcc-14.2.0
nios2                 randconfig-001-20250208    gcc-14.2.0
nios2                 randconfig-002-20250207    gcc-14.2.0
nios2                 randconfig-002-20250208    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250207    gcc-14.2.0
parisc                randconfig-001-20250208    gcc-14.2.0
parisc                randconfig-002-20250207    gcc-14.2.0
parisc                randconfig-002-20250208    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250207    clang-21
powerpc               randconfig-001-20250208    gcc-14.2.0
powerpc               randconfig-002-20250207    clang-21
powerpc               randconfig-002-20250208    gcc-14.2.0
powerpc               randconfig-003-20250207    gcc-14.2.0
powerpc               randconfig-003-20250208    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250207    gcc-14.2.0
powerpc64             randconfig-001-20250208    gcc-14.2.0
powerpc64             randconfig-002-20250207    clang-21
powerpc64             randconfig-002-20250208    gcc-14.2.0
powerpc64             randconfig-003-20250207    gcc-14.2.0
powerpc64             randconfig-003-20250208    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250207    gcc-14.2.0
riscv                 randconfig-001-20250208    gcc-14.2.0
riscv                 randconfig-002-20250207    gcc-14.2.0
riscv                 randconfig-002-20250208    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250207    gcc-14.2.0
s390                  randconfig-001-20250208    gcc-14.2.0
s390                  randconfig-002-20250207    clang-21
s390                  randconfig-002-20250208    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    clang-21
sh                    randconfig-001-20250207    gcc-14.2.0
sh                    randconfig-001-20250208    gcc-14.2.0
sh                    randconfig-002-20250207    gcc-14.2.0
sh                    randconfig-002-20250208    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-21
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250207    gcc-14.2.0
sparc                 randconfig-001-20250208    gcc-14.2.0
sparc                 randconfig-002-20250207    gcc-14.2.0
sparc                 randconfig-002-20250208    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250207    gcc-14.2.0
sparc64               randconfig-001-20250208    gcc-14.2.0
sparc64               randconfig-002-20250207    gcc-14.2.0
sparc64               randconfig-002-20250208    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250207    clang-21
um                    randconfig-001-20250208    gcc-14.2.0
um                    randconfig-002-20250207    gcc-12
um                    randconfig-002-20250208    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250207    gcc-12
x86_64      buildonly-randconfig-001-20250208    clang-19
x86_64      buildonly-randconfig-002-20250207    clang-19
x86_64      buildonly-randconfig-002-20250208    clang-19
x86_64      buildonly-randconfig-003-20250207    clang-19
x86_64      buildonly-randconfig-003-20250208    clang-19
x86_64      buildonly-randconfig-004-20250207    clang-19
x86_64      buildonly-randconfig-004-20250208    clang-19
x86_64      buildonly-randconfig-005-20250207    clang-19
x86_64      buildonly-randconfig-005-20250208    clang-19
x86_64      buildonly-randconfig-006-20250207    clang-19
x86_64      buildonly-randconfig-006-20250208    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250208    clang-19
x86_64                randconfig-002-20250208    clang-19
x86_64                randconfig-003-20250208    clang-19
x86_64                randconfig-004-20250208    clang-19
x86_64                randconfig-005-20250208    clang-19
x86_64                randconfig-006-20250208    clang-19
x86_64                randconfig-007-20250208    clang-19
x86_64                randconfig-008-20250208    clang-19
x86_64                randconfig-071-20250208    gcc-12
x86_64                randconfig-072-20250208    gcc-12
x86_64                randconfig-073-20250208    gcc-12
x86_64                randconfig-074-20250208    gcc-12
x86_64                randconfig-075-20250208    gcc-12
x86_64                randconfig-076-20250208    gcc-12
x86_64                randconfig-077-20250208    gcc-12
x86_64                randconfig-078-20250208    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250207    gcc-14.2.0
xtensa                randconfig-001-20250208    gcc-14.2.0
xtensa                randconfig-002-20250207    gcc-14.2.0
xtensa                randconfig-002-20250208    gcc-14.2.0
xtensa                    xip_kc705_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
