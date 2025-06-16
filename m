Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06F71A8F84
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750114214; cv=none; b=FlirM2GkhbRTgQgOkCNugdH6x/BxuSh05E4ukn/Q2HhYZm0RctyV7cNc3koV5DKStU8Ih5dfWqusEA/eo4/74MAKIFHPC7JHbwgB3z8RtuQ+BkJbeb+Xv8j9rS6z6MdTZQ8uu2kZYGlTNhOW6fBLxPUwtGGxAROTH4BvejwSLms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750114214; c=relaxed/simple;
	bh=KBl172RmL5CJhPHTYFCoPPA7nJOc6bW3UVe/x1IceVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mO88vUKDRyFkHGskMfjcJgRqtXwHI0ae4/vvmWOk5VaDcc3mPgfv6McQrwdkbj/4YmmO9pVebV4cIjsaig+Dg7CtEGlYoV8igV0go6iBe2plArqJtBW03NZcu8qV1Xn8WjdR8HLaxZ0jAUJjTz9cxvJIPS0VmqspoJPbfbJzpKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0Od9VzB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0Od9VzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750114213; x=1781650213;
  h=date:from:to:cc:subject:message-id;
  bh=KBl172RmL5CJhPHTYFCoPPA7nJOc6bW3UVe/x1IceVQ=;
  b=B0Od9VzBWwLF2Mh/mzwnRl4ibiiIZyxFSZ8P1sFXKCe7yJTLIk57s4Ds
   4Y9qo5c/TGziYv5NdTQOFbRusddoNUUgzcfynkgEWQLlOG+LhTmhak/kI
   n56VtyHx6pmlhyqWMtYcuRc/JJo9NmzbW3tzX5zIvecMATgG8Sg47mqUz
   uG5O10i1nt5B/ZKTeaW7rW1FsBQSN/+lZEKyp7qJVo6u7HHJkJpMHtPqu
   gDcyP/ztE4du741fg6QuRgf7E3rq9pDA/u/OFOrgIedCrM15J8iQ5hZTz
   zLhg8jM3pqLqqNVy2skfw4O7GaCC08dR0AmCwM65NIqyj826IuEZZYUV8
   g==;
X-CSE-ConnectionGUID: EotnOIdySi2hgG+wegY1SQ==
X-CSE-MsgGUID: T5Has0EsSTCkvsxn+sA+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54885058"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="54885058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 15:50:12 -0700
X-CSE-ConnectionGUID: Is2EaGTIQUODSQ/rGRlmkw==
X-CSE-MsgGUID: GB1ab/KISU6/1O9HMKg3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179470101"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2025 15:50:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRIeW-000FPI-2M;
	Mon, 16 Jun 2025 22:50:08 +0000
Date: Tue, 17 Jun 2025 06:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 48359ecaaad13bdd08f4070167b0855245767228
Message-ID: <202506170623.m8i4QC01-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 48359ecaaad13bdd08f4070167b0855245767228  Merge branch into tip/master: 'x86/urgent'

elapsed time: 864m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250616    gcc-15.1.0
arc                   randconfig-002-20250616    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250616    gcc-12.4.0
arm                   randconfig-002-20250616    gcc-15.1.0
arm                   randconfig-003-20250616    clang-21
arm                   randconfig-004-20250616    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250616    gcc-8.5.0
arm64                 randconfig-002-20250616    gcc-15.1.0
arm64                 randconfig-003-20250616    clang-19
arm64                 randconfig-004-20250616    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250616    gcc-13.3.0
csky                  randconfig-002-20250616    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250616    clang-21
hexagon               randconfig-002-20250616    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250616    gcc-12
i386        buildonly-randconfig-002-20250616    gcc-11
i386        buildonly-randconfig-003-20250616    clang-20
i386        buildonly-randconfig-004-20250616    gcc-12
i386        buildonly-randconfig-005-20250616    gcc-12
i386        buildonly-randconfig-006-20250616    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250616    gcc-15.1.0
loongarch             randconfig-002-20250616    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250616    gcc-8.5.0
nios2                 randconfig-002-20250616    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250616    gcc-8.5.0
parisc                randconfig-002-20250616    gcc-9.3.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250616    clang-21
powerpc               randconfig-002-20250616    clang-21
powerpc               randconfig-003-20250616    clang-21
powerpc64             randconfig-001-20250616    gcc-8.5.0
powerpc64             randconfig-002-20250616    clang-21
powerpc64             randconfig-003-20250616    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250616    clang-19
riscv                 randconfig-002-20250616    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250616    gcc-11.5.0
s390                  randconfig-002-20250616    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250616    gcc-12.4.0
sh                    randconfig-002-20250616    gcc-12.4.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250616    gcc-13.3.0
sparc                 randconfig-002-20250616    gcc-8.5.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250616    gcc-13.3.0
sparc64               randconfig-002-20250616    gcc-8.5.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250616    clang-20
um                    randconfig-002-20250616    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250616    clang-20
x86_64      buildonly-randconfig-002-20250616    clang-20
x86_64      buildonly-randconfig-003-20250616    clang-20
x86_64      buildonly-randconfig-004-20250616    clang-20
x86_64      buildonly-randconfig-005-20250616    gcc-12
x86_64      buildonly-randconfig-006-20250616    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250616    gcc-13.3.0
xtensa                randconfig-002-20250616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
