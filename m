Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00CE18B03
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738837985; cv=none; b=jBUFZJ8uHpToC7PBaDglHYPk2uCXVa/6b2GLbPWU43cNVJXY5A4JALXJ35FNFMss2yMzlny81y3GvKxLRprezu51sSilxllHjiNzhBCClk0dZ9JsHFVZzkOUPFmHbnweEb436rF+3rlcS6SZlSj0hxPkiQH/+1g+AzP4pp6YJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738837985; c=relaxed/simple;
	bh=k4VcWdS+zI0w1iuIU8VcHoofzfGPypKeKc6+8uBbEBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qPdsYYl8sFAqQRFUnmioSZzjfp9t6ozsP0qrVUj7shvKBemsN262/i+zuAzZIdWZiw9Pp8t4oHG6hxVrcSOBlmgqFI2mN+lUczoik6meEg4jeRSco3uuGowxSiqPKSns4LHtxYteDlscxlCkhWbNicu9FPMSHuBt4bjSGyQrHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUvyIfr/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUvyIfr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738837983; x=1770373983;
  h=date:from:to:cc:subject:message-id;
  bh=k4VcWdS+zI0w1iuIU8VcHoofzfGPypKeKc6+8uBbEBI=;
  b=fUvyIfr/O+W44fhnh1/wob7e1pFgcVqejfTKavGIpPO4T4Re/U/WqPBU
   QZgbg0aprceBS0aFUZHw8v6iel5ty4dvT8gEDJWYYtYML79BQD6beNH6q
   ROtOXAJmuSue14syej0QJNMlNNYd1N6C7JdLE4Zb+5TMZDEQnBXVU5W5a
   hjS4MMjc22g+aX4wUxS61eq4N1h2CsGSpo8sRbSmb7I3va8vyw0Fc7dkS
   v4Tos0xC9MUXoODiu2TZmWjgM4VICgalZ4hzQ1hhvual033lJgZ2AiEIV
   bsvB4u9Blrgc2ioVt10r5ZRAPXQcn1MlHYT5vBOlRhbPwIQDkWefhkClP
   Q==;
X-CSE-ConnectionGUID: yS50XnGDSsmeXuL/F8TWVg==
X-CSE-MsgGUID: mx1tbfxYTa2ShVKxc4U0Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43095894"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43095894"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:33:03 -0800
X-CSE-ConnectionGUID: 77JlahbpQEihLM0d2CHqRw==
X-CSE-MsgGUID: SBqPHzgRRUuaXa8K5UjGgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116152257"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2025 02:33:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfzBr-000wkX-0K;
	Thu, 06 Feb 2025 10:32:59 +0000
Date: Thu, 06 Feb 2025 18:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/core] BUILD SUCCESS
 e02e9b0374c378aab016ae8ace60d9d98ab8caa6
Message-ID: <202502061850.ucSsZt18-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
branch HEAD: e02e9b0374c378aab016ae8ace60d9d98ab8caa6  perf/x86/intel: Support PEBS counters snapshotting

elapsed time: 1446m

configs tested: 204
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-001-20250206    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arc                   randconfig-002-20250206    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    clang-21
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            mmp2_defconfig    clang-21
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-001-20250206    gcc-13.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-002-20250206    gcc-13.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-003-20250206    gcc-13.2.0
arm                   randconfig-004-20250205    gcc-14.2.0
arm                   randconfig-004-20250206    gcc-13.2.0
arm                           u8500_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-001-20250206    gcc-13.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-002-20250206    gcc-13.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-003-20250206    gcc-13.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
arm64                 randconfig-004-20250206    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-001-20250206    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
csky                  randconfig-002-20250206    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250205    clang-17
hexagon               randconfig-001-20250206    gcc-14.2.0
hexagon               randconfig-002-20250205    clang-19
hexagon               randconfig-002-20250206    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-11
i386        buildonly-randconfig-005-20250205    clang-19
i386        buildonly-randconfig-006-20250205    clang-19
i386                                defconfig    clang-19
i386                  randconfig-011-20250206    gcc-12
i386                  randconfig-012-20250206    gcc-12
i386                  randconfig-013-20250206    gcc-12
i386                  randconfig-014-20250206    gcc-12
i386                  randconfig-015-20250206    gcc-12
i386                  randconfig-016-20250206    gcc-12
i386                  randconfig-017-20250206    gcc-12
loongarch                        alldefconfig    clang-21
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-001-20250206    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
loongarch             randconfig-002-20250206    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-001-20250206    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
nios2                 randconfig-002-20250206    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-001-20250206    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
parisc                randconfig-002-20250206    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    clang-21
powerpc               randconfig-001-20250205    clang-16
powerpc               randconfig-001-20250206    gcc-14.2.0
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-002-20250206    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc               randconfig-003-20250206    gcc-14.2.0
powerpc                  storcenter_defconfig    clang-21
powerpc64             randconfig-001-20250205    clang-18
powerpc64             randconfig-001-20250206    gcc-14.2.0
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-002-20250206    gcc-14.2.0
powerpc64             randconfig-003-20250205    clang-18
powerpc64             randconfig-003-20250206    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-001-20250206    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
riscv                 randconfig-002-20250206    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-001-20250206    gcc-14.2.0
s390                  randconfig-002-20250205    clang-19
s390                  randconfig-002-20250206    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                            migor_defconfig    clang-21
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-21
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-001-20250206    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc                 randconfig-002-20250206    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-001-20250206    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
sparc64               randconfig-002-20250206    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-001-20250206    gcc-14.2.0
um                    randconfig-002-20250205    clang-21
um                    randconfig-002-20250206    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-001-20250206    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-002-20250206    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-003-20250206    clang-19
x86_64      buildonly-randconfig-004-20250205    gcc-12
x86_64      buildonly-randconfig-004-20250206    clang-19
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-005-20250206    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64      buildonly-randconfig-006-20250206    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250206    gcc-12
x86_64                randconfig-002-20250206    gcc-12
x86_64                randconfig-003-20250206    gcc-12
x86_64                randconfig-004-20250206    gcc-12
x86_64                randconfig-005-20250206    gcc-12
x86_64                randconfig-006-20250206    gcc-12
x86_64                randconfig-007-20250206    gcc-12
x86_64                randconfig-008-20250206    gcc-12
x86_64                randconfig-071-20250206    gcc-12
x86_64                randconfig-072-20250206    gcc-12
x86_64                randconfig-073-20250206    gcc-12
x86_64                randconfig-074-20250206    gcc-12
x86_64                randconfig-075-20250206    gcc-12
x86_64                randconfig-076-20250206    gcc-12
x86_64                randconfig-077-20250206    gcc-12
x86_64                randconfig-078-20250206    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-001-20250206    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0
xtensa                randconfig-002-20250206    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
