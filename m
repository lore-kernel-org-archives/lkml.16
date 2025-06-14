Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048232E11CC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749896187; cv=none; b=uXahbo5DuNofwgzt6oR08A6Wrfe+pZyeG3GN3oL5HkhS2GavMd1YuWEEIEsQMQ7QMNRhTLuv2XqDDoHjiF7KP/EWwU9BAH1jf+RpFZNuNE/N6YB2Wd/X6pOeIv2o8yvQt/1Q7XBhLfDgmGe39PpYDzIigQUqRsZ18CI67FRWY1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749896187; c=relaxed/simple;
	bh=IR++VZ/RZf2XDgL+Aw6eOV8NqJ3w5Kt1DyoI/mKwaTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F0fxCIAfBs+AFPVde7NXFFgTcdKWTcWR7oFwy3jwf4EWxz8VlwjkaO/012199pWaCEmpIKWX5wP+IsNN++gch2yo+sohp79RsyIlFWM4/N2Fx3V2Rm6o0fV5HJ3fpOJQ5xepuSW2bITatsWrbMKDWSqLlg/h513aWpuk9FnLMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qz0w8VRP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qz0w8VRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749896185; x=1781432185;
  h=date:from:to:cc:subject:message-id;
  bh=IR++VZ/RZf2XDgL+Aw6eOV8NqJ3w5Kt1DyoI/mKwaTQ=;
  b=Qz0w8VRPeMPVAO1EVI01M85FPI+4bxms+ANfloyUxk4D6eMvMB+SRz1Y
   a0tMT3eyEOfiHU/RGuB9uHFfOpo5o0KLDxGPSM2jZEzj65B6YQRzFYQ/o
   Qnf7Dhsbs0pp0AbgJ9EoQRMMNjyphkWOor5/anDUrL8Z3icr6a+6USoU+
   H2VQ0db9/nY4KCY6d09nzDHwoJlfm9IlGpQ2x79sWdz0tMw/CsbRe7YUG
   WFQmYAMNnshxaN5krl19EnYB+uonku9YupA7Y36Rn5hu55FrQAm0pC8fs
   qegUkVtuXSCMN4x+n1/yZlVlcICKtX8Yl4cDuOfaqivaUgi6fr0WEceY/
   w==;
X-CSE-ConnectionGUID: 9s9dyHKISkKm0KiL8Z9zYA==
X-CSE-MsgGUID: Y6/NrYANR1mnlJdiEwe0CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63140018"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63140018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 03:16:25 -0700
X-CSE-ConnectionGUID: R4bSmkQ7Se6QlqhWHfrSJA==
X-CSE-MsgGUID: oRsONlYgRyCnKYlulnPp3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148941165"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2025 03:16:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQNvx-000DRI-13;
	Sat, 14 Jun 2025 10:16:21 +0000
Date: Sat, 14 Jun 2025 18:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/core] BUILD SUCCESS
 66067c3c8a1ee097e9c30e8bbd643b12ba54a6b0
Message-ID: <202506141831.4ziE0TLW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
branch HEAD: 66067c3c8a1ee097e9c30e8bbd643b12ba54a6b0  genirq: Add kunit tests for depth counts

elapsed time: 1235m

configs tested: 230
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250613    gcc-12.4.0
arc                   randconfig-001-20250614    gcc-8.5.0
arc                   randconfig-002-20250613    gcc-12.4.0
arc                   randconfig-002-20250614    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250613    clang-21
arm                   randconfig-001-20250614    gcc-8.5.0
arm                   randconfig-002-20250613    clang-20
arm                   randconfig-002-20250614    gcc-8.5.0
arm                   randconfig-003-20250613    gcc-8.5.0
arm                   randconfig-003-20250614    gcc-8.5.0
arm                   randconfig-004-20250613    clang-21
arm                   randconfig-004-20250614    gcc-8.5.0
arm                           spitz_defconfig    gcc-15.1.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250613    gcc-15.1.0
arm64                 randconfig-001-20250614    gcc-8.5.0
arm64                 randconfig-002-20250613    clang-21
arm64                 randconfig-002-20250614    gcc-8.5.0
arm64                 randconfig-003-20250613    clang-21
arm64                 randconfig-003-20250614    gcc-8.5.0
arm64                 randconfig-004-20250613    gcc-15.1.0
arm64                 randconfig-004-20250614    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250614    gcc-13.3.0
csky                  randconfig-002-20250614    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250614    clang-21
hexagon               randconfig-002-20250614    clang-16
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250613    gcc-12
i386        buildonly-randconfig-001-20250614    clang-20
i386        buildonly-randconfig-002-20250613    gcc-11
i386        buildonly-randconfig-002-20250614    clang-20
i386        buildonly-randconfig-003-20250613    gcc-12
i386        buildonly-randconfig-003-20250614    clang-20
i386        buildonly-randconfig-004-20250613    clang-20
i386        buildonly-randconfig-004-20250614    clang-20
i386        buildonly-randconfig-005-20250613    clang-20
i386        buildonly-randconfig-005-20250614    clang-20
i386        buildonly-randconfig-006-20250613    gcc-12
i386        buildonly-randconfig-006-20250614    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250614    clang-20
i386                  randconfig-002-20250614    clang-20
i386                  randconfig-003-20250614    clang-20
i386                  randconfig-004-20250614    clang-20
i386                  randconfig-005-20250614    clang-20
i386                  randconfig-006-20250614    clang-20
i386                  randconfig-007-20250614    clang-20
i386                  randconfig-011-20250614    clang-20
i386                  randconfig-012-20250614    clang-20
i386                  randconfig-013-20250614    clang-20
i386                  randconfig-014-20250614    clang-20
i386                  randconfig-015-20250614    clang-20
i386                  randconfig-016-20250614    clang-20
i386                  randconfig-017-20250614    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250614    gcc-15.1.0
loongarch             randconfig-002-20250614    gcc-15.1.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250614    gcc-13.3.0
nios2                 randconfig-002-20250614    gcc-11.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250614    gcc-8.5.0
parisc                randconfig-002-20250614    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250614    gcc-13.3.0
powerpc               randconfig-002-20250614    clang-21
powerpc               randconfig-003-20250614    gcc-12.4.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250614    gcc-11.5.0
powerpc64             randconfig-002-20250614    clang-21
powerpc64             randconfig-003-20250614    gcc-12.4.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250613    gcc-8.5.0
riscv                 randconfig-001-20250614    gcc-14.3.0
riscv                 randconfig-002-20250613    clang-21
riscv                 randconfig-002-20250614    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250613    clang-21
s390                  randconfig-001-20250614    gcc-14.3.0
s390                  randconfig-002-20250613    clang-21
s390                  randconfig-002-20250614    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250613    gcc-15.1.0
sh                    randconfig-001-20250614    gcc-14.3.0
sh                    randconfig-002-20250613    gcc-15.1.0
sh                    randconfig-002-20250614    gcc-14.3.0
sh                          rsk7269_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250613    gcc-10.3.0
sparc                 randconfig-001-20250614    gcc-14.3.0
sparc                 randconfig-002-20250613    gcc-13.3.0
sparc                 randconfig-002-20250614    gcc-14.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250613    gcc-15.1.0
sparc64               randconfig-001-20250614    gcc-14.3.0
sparc64               randconfig-002-20250613    gcc-8.5.0
sparc64               randconfig-002-20250614    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250613    gcc-12
um                    randconfig-001-20250614    gcc-14.3.0
um                    randconfig-002-20250613    gcc-12
um                    randconfig-002-20250614    gcc-14.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250613    clang-20
x86_64      buildonly-randconfig-001-20250614    clang-20
x86_64      buildonly-randconfig-002-20250613    gcc-12
x86_64      buildonly-randconfig-002-20250614    clang-20
x86_64      buildonly-randconfig-003-20250613    gcc-12
x86_64      buildonly-randconfig-003-20250614    clang-20
x86_64      buildonly-randconfig-004-20250613    gcc-12
x86_64      buildonly-randconfig-004-20250614    clang-20
x86_64      buildonly-randconfig-005-20250613    clang-20
x86_64      buildonly-randconfig-005-20250614    clang-20
x86_64      buildonly-randconfig-006-20250613    gcc-12
x86_64      buildonly-randconfig-006-20250614    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250614    clang-20
x86_64                randconfig-002-20250614    clang-20
x86_64                randconfig-003-20250614    clang-20
x86_64                randconfig-004-20250614    clang-20
x86_64                randconfig-005-20250614    clang-20
x86_64                randconfig-006-20250614    clang-20
x86_64                randconfig-007-20250614    clang-20
x86_64                randconfig-008-20250614    clang-20
x86_64                randconfig-071-20250614    clang-20
x86_64                randconfig-072-20250614    clang-20
x86_64                randconfig-073-20250614    clang-20
x86_64                randconfig-074-20250614    clang-20
x86_64                randconfig-075-20250614    clang-20
x86_64                randconfig-076-20250614    clang-20
x86_64                randconfig-077-20250614    clang-20
x86_64                randconfig-078-20250614    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250613    gcc-8.5.0
xtensa                randconfig-001-20250614    gcc-14.3.0
xtensa                randconfig-002-20250613    gcc-15.1.0
xtensa                randconfig-002-20250614    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
