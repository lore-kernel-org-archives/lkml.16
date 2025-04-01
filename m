Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D311EFFA6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508420; cv=none; b=DVQbsZHFdw5qcwGQnwACifw2bhmEfjiEPjnoZzF1PVCEY6k/xkTodXAzzDkSl2k+Mow73Ab1BjP4zcOGf04CsfQalk+7wi2PKCq8aVAgl5kxJdqnjLV7RFiMNy9l5d808arYMVkSPxAL44ATpxcFc7EapB+aGCvYUGWoO5P2ZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508420; c=relaxed/simple;
	bh=joXzdDZoj3KoYYnfLuJZGslwC0I7FJ/i3QnexF3H0yY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jwjNnU0a+PL/izYZUa/RCVeeHxDfeV13AYSD3Qf7AM+rncLN4tWvZo0Cw5ZB4PaCkciL5M3E40EZRknuC942bjYOib7taXoearcTD8iC3Y/hXrFm2Jxp1OhvoK2gVysqt/EHWbEPsAOctuzBpdeP0o9QrCo1Qwg3l3/L2Ybj81A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnYF3jU2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnYF3jU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743508420; x=1775044420;
  h=date:from:to:cc:subject:message-id;
  bh=joXzdDZoj3KoYYnfLuJZGslwC0I7FJ/i3QnexF3H0yY=;
  b=FnYF3jU2uqg6vi32sECNR2j21eGW2Y8GcTtrYvZJGQuSvChbAD/N7MQn
   qX+/9snv0JzX6QNqTMHX7ra1+v6gBU0TJNt9F6bw6srpvUW/f5V15UlGT
   GqnapILOGpS34VxUMGk21ho7HKscJsftTdkrBzcNt3HkTD4sveBYBRWBk
   T7xHsjKu8ZxUcugH185opMhWI5O9xqwVj8npy6FzvhBjei+zz6kjEu8RM
   xIdWonnYehaJWSs99wHK3dB8Fxt9Zch1yISi3Tm9SmqI9K71aHzpkuulP
   ZhHJfJViMYjY842Wpz91FI0GVEbFawnC3BQ+K+BPCXY0EKoDWyAXlCFor
   Q==;
X-CSE-ConnectionGUID: 1MzPxmCsTAaYE2H7AFrnqA==
X-CSE-MsgGUID: QZGmlfHeQCaWWyotqhC10w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67298458"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="67298458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:53:39 -0700
X-CSE-ConnectionGUID: +/tWtq2MQqevi5Z7fWs0yw==
X-CSE-MsgGUID: eoLQcgM5St6Zy6wAnSzbtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126256000"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 04:53:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzaBT-0009q2-1Z;
	Tue, 01 Apr 2025 11:53:35 +0000
Date: Tue, 01 Apr 2025 19:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 a3c3c66670cee11eb13aa43905904bf29cb92d32
Message-ID: <202504011952.kYjGgvRA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: a3c3c66670cee11eb13aa43905904bf29cb92d32  perf/core: Fix child_total_time_enabled accounting bug at task exit

elapsed time: 1443m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250331    gcc-8.5.0
arc                   randconfig-002-20250331    gcc-8.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-17
arm                   milbeaut_m10v_defconfig    clang-19
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250331    clang-21
arm                   randconfig-002-20250331    clang-21
arm                   randconfig-003-20250331    clang-21
arm                   randconfig-004-20250331    gcc-7.5.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250331    gcc-8.5.0
arm64                 randconfig-002-20250331    clang-21
arm64                 randconfig-003-20250331    clang-14
arm64                 randconfig-004-20250331    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250331    gcc-10.5.0
csky                  randconfig-002-20250331    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250331    clang-20
hexagon               randconfig-002-20250331    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250331    clang-20
i386        buildonly-randconfig-002-20250331    gcc-12
i386        buildonly-randconfig-003-20250331    clang-20
i386        buildonly-randconfig-004-20250331    clang-20
i386        buildonly-randconfig-005-20250331    clang-20
i386        buildonly-randconfig-006-20250331    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250331    gcc-14.2.0
loongarch             randconfig-002-20250331    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250331    gcc-6.5.0
nios2                 randconfig-002-20250331    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250331    gcc-9.3.0
parisc                randconfig-002-20250331    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250331    clang-21
powerpc               randconfig-002-20250331    clang-16
powerpc               randconfig-003-20250331    clang-18
powerpc64             randconfig-001-20250331    gcc-6.5.0
powerpc64             randconfig-002-20250331    gcc-8.5.0
powerpc64             randconfig-003-20250331    clang-19
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250331    clang-14
riscv                 randconfig-002-20250331    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250331    clang-15
s390                  randconfig-002-20250331    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250331    gcc-10.5.0
sh                    randconfig-002-20250331    gcc-10.5.0
sh                           se7721_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250331    gcc-11.5.0
sparc                 randconfig-002-20250331    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250331    gcc-7.5.0
sparc64               randconfig-002-20250331    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250331    gcc-12
um                    randconfig-002-20250331    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250331    clang-20
x86_64      buildonly-randconfig-002-20250331    gcc-12
x86_64      buildonly-randconfig-003-20250331    clang-20
x86_64      buildonly-randconfig-004-20250331    clang-20
x86_64      buildonly-randconfig-005-20250331    clang-20
x86_64      buildonly-randconfig-006-20250331    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250331    gcc-11.5.0
xtensa                randconfig-002-20250331    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
