Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0341EF38F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744918746; cv=none; b=A4j+rlfT7w/kjVticjHTdPr0jqjH07anU/sRrKAc2ILYlFHK4SWX//HRPuKt8mstW40q2YpEd79LqcxhbcKFvVaARSYSuCHKDSN2bfPE3lvtMBksga9aBMbKhuulQoNKzz8Mxtvn6CLM4rwdCopWZN6QWiy6PRWWUVa861hhWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744918746; c=relaxed/simple;
	bh=R/Ipikfc2rjA7ImqFrl3gfMKbJu5j/aFlp+2ggZ8PEQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a+YHk3uzfDbivhKo0xXiSbNldxLZKt61EyxziY8sb5xkjbCsUOS6AKtlwhqyeoZMB7A/vkEcmX1DLljAyLthpaYIFtWQwuthohrXdvyUNQxTHx+AGhoJxSqHaUiZEx7uHfPhN1L9jjtq82gnO2krtqVXz2ZsGxDwAJH1dy/i73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTahhCkb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTahhCkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744918745; x=1776454745;
  h=date:from:to:cc:subject:message-id;
  bh=R/Ipikfc2rjA7ImqFrl3gfMKbJu5j/aFlp+2ggZ8PEQ=;
  b=LTahhCkbpSXaNjqDY/PuYtD/CyA5A5VdWdcRWmJyFPURA7M/8+CZlTSt
   YJO7l1BqxEuL2RuUDvnqvQ57pyUPsOGpejxAqD5Xl1P3rrIBRb+IcW5bR
   s/l/DFtATditH4/kya+x/qFtTVPXv9CPk+kC7CFbrcaiJ0XtK8MNig0hE
   T33e+xT9DUCuvf+CXUd/85Uv/R9xkkgWphfD2goQypjTEyfveq+YwNuoK
   CHFWvOXvkuyvGtgbesDXPuJv9uGgR5zuHJ51yJPWLCYLAijsur+b3UEMC
   +1xqU8pAanOQF33MmwDNg/Z0JMc0ikoJQmIjVks/2dt8IkSjdntVzxPdZ
   w==;
X-CSE-ConnectionGUID: 8qUTuNfBQben8JFFXvhJTg==
X-CSE-MsgGUID: W+162JmEROeLRWs3XHu+YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="63947666"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="63947666"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 12:39:05 -0700
X-CSE-ConnectionGUID: TcoQycNnTbKcd/BMSwOltQ==
X-CSE-MsgGUID: 22Fk+thlQAS/H5bGG3x9ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="130677707"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2025 12:39:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5V4f-0001zZ-0N;
	Thu, 17 Apr 2025 19:39:01 +0000
Date: Fri, 18 Apr 2025 03:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/core] BUILD SUCCESS
 c70fc32f44431bb30f9025ce753ba8be25acbba3
Message-ID: <202504180306.O4SqblhL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
branch HEAD: c70fc32f44431bb30f9025ce753ba8be25acbba3  sched/fair: Adhere to place_entity() constraints

elapsed time: 1461m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250417    gcc-13.3.0
arc                   randconfig-002-20250417    gcc-13.3.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250417    gcc-7.5.0
arm                   randconfig-002-20250417    clang-16
arm                   randconfig-003-20250417    gcc-10.5.0
arm                   randconfig-004-20250417    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250417    gcc-7.5.0
arm64                 randconfig-002-20250417    gcc-5.5.0
arm64                 randconfig-003-20250417    clang-21
arm64                 randconfig-004-20250417    gcc-9.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250417    gcc-13.3.0
csky                  randconfig-002-20250417    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250417    clang-21
hexagon               randconfig-002-20250417    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250417    clang-20
i386        buildonly-randconfig-002-20250417    gcc-12
i386        buildonly-randconfig-003-20250417    gcc-12
i386        buildonly-randconfig-004-20250417    gcc-12
i386        buildonly-randconfig-005-20250417    clang-20
i386        buildonly-randconfig-006-20250417    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250417    gcc-14.2.0
loongarch             randconfig-002-20250417    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250417    gcc-11.5.0
nios2                 randconfig-002-20250417    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250417    gcc-12.4.0
parisc                randconfig-002-20250417    gcc-6.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc               randconfig-001-20250417    clang-21
powerpc               randconfig-002-20250417    gcc-9.3.0
powerpc               randconfig-003-20250417    gcc-9.3.0
powerpc64             randconfig-001-20250417    clang-21
powerpc64             randconfig-002-20250417    clang-21
powerpc64             randconfig-003-20250417    gcc-5.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250417    gcc-7.5.0
riscv                 randconfig-002-20250417    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250417    gcc-7.5.0
s390                  randconfig-002-20250417    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250417    gcc-13.3.0
sh                    randconfig-002-20250417    gcc-7.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250417    gcc-12.4.0
sparc                 randconfig-002-20250417    gcc-14.2.0
sparc64               randconfig-001-20250417    gcc-14.2.0
sparc64               randconfig-002-20250417    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250417    gcc-12
um                    randconfig-002-20250417    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250417    clang-20
x86_64      buildonly-randconfig-002-20250417    clang-20
x86_64      buildonly-randconfig-003-20250417    gcc-12
x86_64      buildonly-randconfig-004-20250417    clang-20
x86_64      buildonly-randconfig-005-20250417    clang-20
x86_64      buildonly-randconfig-006-20250417    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250417    gcc-8.5.0
xtensa                randconfig-002-20250417    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
