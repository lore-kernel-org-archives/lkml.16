Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AF120551C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748382097; cv=none; b=VNVYKhZx7flZyzxjWScTU+K2A5wQbpjcKd5UwnBQRaOiE7LBL8Oy1+TvQZRgCUUaYc5JfbZ36r7xk0bSjipRhgAnRqit+Qpzv3o2RoSCrS/QJL7ZcpPbP7rG4M4wzQ64h8S7LxcQjw6dELi3d+iGP5B05X1GZ+nfgh+1nI74zxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748382097; c=relaxed/simple;
	bh=D+D7rvzTL2LcU+B50O5M6RLKs5Tm4VttTW1ek688ZoE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C7tb025WDZPlkEcfhkHEhd7HqWv/3w3znWMDaj677cHzRtA7Qm244Z6rJAKBRc5RqIRGUCXeCuTCDTbXW3CTRi6zj3xKtpSJ2CWfjSL4e+uEjgpXL2oYrHaQ3yQ6snWhnV4OPme36iKVQxQzrJsxXlqY9XZ7FZOTfEnqVA8P0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaiDA7pw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaiDA7pw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748382096; x=1779918096;
  h=date:from:to:cc:subject:message-id;
  bh=D+D7rvzTL2LcU+B50O5M6RLKs5Tm4VttTW1ek688ZoE=;
  b=FaiDA7pwXPF89f676sk3Bwu3HHW2JRJ1F6mHAao4050Pd1OIZZE3c2dX
   qg+jGcMIOf4lTRhMV+1q57WGQ3ysmV6c8n6a6hH8Ts0ADrkwjZAAzgHgo
   0oxy2BYPbsG1izKUKSfpcbfIBQ2GvrT3+RLAY5eKmhZloTMeB0By2Pjol
   xYoRkjQxtFGxgE5BxTiKtTBHfOOniZTXlUz4uKsUEzaCJuaM9Gm0Hf4Tj
   b0hyoe3kAY7QpAuoFFvS0LdV11/ZHCinzyfVn+J1MoMmM7TYbHM5A6Gx7
   cA6YpSZhZwO6vQ4ic9ZgkY0oCXumf0Qs16mjQmEvqILCpBq1xq/VMCmVH
   w==;
X-CSE-ConnectionGUID: GsHeEklyQgKkDjgsRzH6Lg==
X-CSE-MsgGUID: AJfwnc9VQlu0Urz4bgQeUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54198763"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="54198763"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 14:41:35 -0700
X-CSE-ConnectionGUID: jRx6TJZLQYazjuq52a7F2A==
X-CSE-MsgGUID: aAJsdR8RS3+5fnKeT7Cxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142905400"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 May 2025 14:41:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK23A-000V1w-0q;
	Tue, 27 May 2025 21:41:32 +0000
Date: Wed, 28 May 2025 05:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 ec9b19cb9448c0e57502be36ad83ee88f768ed92
Message-ID: <202505280557.tErAARHT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: ec9b19cb9448c0e57502be36ad83ee88f768ed92  Merge branch into tip/master: 'x86/sgx'

elapsed time: 862m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250527    gcc-10.5.0
arc                   randconfig-002-20250527    gcc-10.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm                        realview_defconfig    clang-16
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250527    gcc-12.4.0
csky                  randconfig-002-20250527    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250527    clang-21
hexagon               randconfig-002-20250527    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250527    gcc-12
i386        buildonly-randconfig-002-20250527    clang-20
i386        buildonly-randconfig-003-20250527    clang-20
i386        buildonly-randconfig-004-20250527    clang-20
i386        buildonly-randconfig-005-20250527    gcc-11
i386        buildonly-randconfig-006-20250527    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250527    gcc-15.1.0
loongarch             randconfig-002-20250527    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250527    gcc-14.2.0
nios2                 randconfig-002-20250527    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250527    gcc-9.3.0
parisc                randconfig-002-20250527    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   motionpro_defconfig    clang-21
powerpc                     mpc83xx_defconfig    clang-21
powerpc               randconfig-001-20250527    gcc-6.5.0
powerpc               randconfig-002-20250527    clang-18
powerpc               randconfig-003-20250527    gcc-8.5.0
powerpc64             randconfig-001-20250527    clang-21
powerpc64             randconfig-002-20250527    clang-21
powerpc64             randconfig-003-20250527    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250527    gcc-8.5.0
riscv                 randconfig-002-20250527    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250527    gcc-6.5.0
s390                  randconfig-002-20250527    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250527    gcc-10.5.0
sh                    randconfig-002-20250527    gcc-15.1.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250527    gcc-11.5.0
sparc                 randconfig-002-20250527    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250527    gcc-5.5.0
sparc64               randconfig-002-20250527    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250527    clang-21
um                    randconfig-002-20250527    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250527    gcc-12
x86_64      buildonly-randconfig-002-20250527    clang-20
x86_64      buildonly-randconfig-003-20250527    gcc-12
x86_64      buildonly-randconfig-004-20250527    clang-20
x86_64      buildonly-randconfig-005-20250527    clang-20
x86_64      buildonly-randconfig-006-20250527    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250527    gcc-9.3.0
xtensa                randconfig-002-20250527    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
