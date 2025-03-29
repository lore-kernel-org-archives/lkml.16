Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF51CFEC3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258584; cv=none; b=kAChY9+/JwDy3RaiFA74G0sEzr2/9pc1FfuQU/zBkPRjTUYvbBJQc8TzP/QcAPS26XrBkS3+K8DhxjixtHFWSSa/JvJm8d7dd5qPWBqq259O8FJ3YsFK7+3uMax/wXJLU7MqTsHtbXPIOJdB+9NZ+5YfMAD/kuaU/Xpcjk5sBGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258584; c=relaxed/simple;
	bh=Fi4F8RQv3DGy1GiBd1AcwgqpKf/9p4SPpKi3oBfiZgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XyRLw0d5UQ1zEBIaQF8tXqmhu/wyw+j8ssFHuIJeQMOqwoo3PQ5NirvhYrC7b1jrn4Qn4i3o8jsnM6kX+biXBBRZ5rCoHxiije9tnTVMDFrUAsYtTKPCZ9aeDcso9K87m2a77rOkprig1uqROgB76DTevKiKhRTHljl5TNTDJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/Y2DmPF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/Y2DmPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743258582; x=1774794582;
  h=date:from:to:cc:subject:message-id;
  bh=Fi4F8RQv3DGy1GiBd1AcwgqpKf/9p4SPpKi3oBfiZgs=;
  b=A/Y2DmPFwTBeyRiIbtPFxlm7h5JyqXa1r92NrGt5n+mu3OWMcDGQntMF
   ZrxLXQlCRCS2xtPneWF/+avBltZrCapYyX2LJHJn//1A6XsecwyiAOiZk
   4lOuJb/tltiooILCcNR+mKnoSQs4TrvvT+gr2QtcuDdPB55rN/XkIKw6H
   uPgOn7VbHvHyfhNEq889jgffjQxi2oCI4CT3OxPb1KqtFu9y4sspXDCfb
   ZQi002XzvLfr8U2OgN5bby6T74rOQvNaTh9C9Qa+mYnFzR11L+QZJ0vqq
   YIawn96cdSO96+iHXVHUI2T2kvxLXH6A7Xf16NKTYrmI1tfM9gCQizjF3
   w==;
X-CSE-ConnectionGUID: kF9EZXkeRBSXTEXf8FFMGA==
X-CSE-MsgGUID: 6h7fEdz4QZOpglHnOUNy0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44614727"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44614727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 07:29:40 -0700
X-CSE-ConnectionGUID: HsdaDa0dSU6ASMRYODaiCg==
X-CSE-MsgGUID: IGSpX17uQUqcc4bTd0sMNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="162944552"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Mar 2025 07:29:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyXBo-0008AF-2q;
	Sat, 29 Mar 2025 14:29:36 +0000
Date: Sat, 29 Mar 2025 22:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:objtool/urgent] BUILD REGRESSION
 ae958b12940bcd4ffa32c44684e4f2878bc5e140
Message-ID: <202503292202.Sge7ZEUc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
branch HEAD: ae958b12940bcd4ffa32c44684e4f2878bc5e140  objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC

Error/Warning ids grouped by kconfigs:

recent_errors
`-- loongarch-randconfig-001-20250328
    `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)

elapsed time: 1443m

configs tested: 129
configs skipped: 4

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250328    gcc-12.4.0
arc                   randconfig-002-20250328    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-17
arm                            mps2_defconfig    clang-21
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250328    clang-18
arm                   randconfig-002-20250328    gcc-8.5.0
arm                   randconfig-003-20250328    clang-18
arm                   randconfig-004-20250328    gcc-8.5.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250328    gcc-8.5.0
arm64                 randconfig-002-20250328    clang-15
arm64                 randconfig-003-20250328    clang-16
arm64                 randconfig-004-20250328    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250328    gcc-12.4.0
csky                  randconfig-002-20250328    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250328    clang-21
hexagon               randconfig-002-20250328    clang-14
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250328    gcc-12
i386        buildonly-randconfig-002-20250328    gcc-12
i386        buildonly-randconfig-003-20250328    clang-20
i386        buildonly-randconfig-004-20250328    gcc-12
i386        buildonly-randconfig-005-20250328    clang-20
i386        buildonly-randconfig-006-20250328    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250328    gcc-14.2.0
loongarch             randconfig-002-20250328    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-21
mips                           gcw0_defconfig    clang-14
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250328    gcc-6.5.0
nios2                 randconfig-002-20250328    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250328    gcc-9.3.0
parisc                randconfig-002-20250328    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250328    clang-21
powerpc               randconfig-002-20250328    clang-21
powerpc               randconfig-003-20250328    clang-21
powerpc                     tqm8541_defconfig    clang-21
powerpc64             randconfig-001-20250328    clang-16
powerpc64             randconfig-002-20250328    clang-21
powerpc64             randconfig-003-20250328    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250328    gcc-8.5.0
riscv                 randconfig-002-20250328    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250328    gcc-6.5.0
s390                  randconfig-002-20250328    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250328    gcc-10.5.0
sh                    randconfig-002-20250328    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250328    gcc-13.3.0
sparc                 randconfig-002-20250328    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250328    gcc-11.5.0
sparc64               randconfig-002-20250328    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250328    clang-17
um                    randconfig-002-20250328    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250328    clang-20
x86_64      buildonly-randconfig-002-20250328    clang-20
x86_64      buildonly-randconfig-003-20250328    clang-20
x86_64      buildonly-randconfig-004-20250328    clang-20
x86_64      buildonly-randconfig-005-20250328    clang-20
x86_64      buildonly-randconfig-006-20250328    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250328    gcc-9.3.0
xtensa                randconfig-002-20250328    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
