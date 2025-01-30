Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0D17BB21
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266411; cv=none; b=XMuO+wkYFpXadWomETFXkfM/0tr9cLPqrJGXaNytXKsrAcRAbpwbtSbOc5lLfpTw5CpLHI8abyuCFPAS5GF/eEsnIxxO76R2trQ5gX1+Rzrr+bxjmz+QBFlObsC0KrfSohw1janN6rPV0X9u8agMcBVqm38Vinw1kKdhbQFseYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266411; c=relaxed/simple;
	bh=wIW3ARbNmAjYuzNwpAJyFJWCZfh2l1kKUnFL3N4PO4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kd76WM/31oRsjy9fTGvtLxXsjnWRYp8f/49ALxfi7PDwcT9/udNe+iGYMmwzrfZolMShcwOS/zk4wpxalS2obdHmej945209h/TB4yzt9regdqPpW6rDPzPDKnoMz60WN2WYQxsQzf4cc+saZubBkUxPGortlohSQxFIM2J42j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtnB4C5z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtnB4C5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738266409; x=1769802409;
  h=date:from:to:cc:subject:message-id;
  bh=wIW3ARbNmAjYuzNwpAJyFJWCZfh2l1kKUnFL3N4PO4I=;
  b=UtnB4C5zNSrfGIM5/LjGsMwpFk2ApPQNl1jdhhTC9QxXIe5KmUJk/7x3
   KAUoZPIP3xzAe9E7Fv4+JT5xWINJj89Ss/DBnTCJaXWuXf46B7WCRT96h
   N5LWNeWytmcl6wQpjZmwJpT4vNd4ysmTHkcJVK9P6acQbZb9AFCfB9SsU
   yMV5aX3NXGLh+1PzXy2bsBiQo+2lElbAXIK/y9ZWMOQYic6fInp/e4JhP
   q3oy+dW1nFwe23oCTeGANG+2c/psrVYhzDOVnE4ZIt3Zx8Ijcs29EaOHE
   QYKethO9IAsRjOQ2ornhcdHTXycy34S/SqQhXIdv+Emh0X7bjgDODMJxN
   Q==;
X-CSE-ConnectionGUID: 1aie1JhsQcK74BMYxqk1/A==
X-CSE-MsgGUID: H5cp5dBlSJyszEbFYh4h0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50252445"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50252445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 11:46:48 -0800
X-CSE-ConnectionGUID: j+ZPD5eDTem+jUIchxZx3A==
X-CSE-MsgGUID: Nq8UCjgcRhalsv5z6VGS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="109575425"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jan 2025 11:46:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdaUv-000kv9-0n;
	Thu, 30 Jan 2025 19:46:45 +0000
Date: Fri, 31 Jan 2025 03:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 25cb07b28aa8f42f3123a7b0bd09ea1d9a24fa28
Message-ID: <202501310321.54UWUfyZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 25cb07b28aa8f42f3123a7b0bd09ea1d9a24fa28  Merge branch into tip/master: 'x86/mm'

elapsed time: 1343m

configs tested: 215
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
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
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-20
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-20
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250130    clang-21
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    clang-21
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
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
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    clang-21
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    clang-21
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250130    clang-21
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    clang-21
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250130    clang-21
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    clang-21
parisc                randconfig-002-20250130    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
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
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
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
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-21
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
x86_64                randconfig-001-20250130    gcc-12
x86_64                randconfig-002-20250130    gcc-12
x86_64                randconfig-003-20250130    gcc-12
x86_64                randconfig-004-20250130    gcc-12
x86_64                randconfig-005-20250130    gcc-12
x86_64                randconfig-006-20250130    gcc-12
x86_64                randconfig-007-20250130    gcc-12
x86_64                randconfig-008-20250130    gcc-12
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
