Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0023DE
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748219022; cv=none; b=Rz2zb5W3cm2AAqqSAq8bcWxF1vHMjioSvKIokfGRhzw0mZ0zyfZBrcs9c8uPUdoiO5nHn0gnCfG8z1PVCPMiw2rn9961n0/ibN2DJWLzwVb5EXsfiqCrjkv5/WDmbuWraw/TIMq/wgQC29bsjGz5zZ8mOSl+vsF+ce12uoEUMug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748219022; c=relaxed/simple;
	bh=Hd2jbD6YxuGB+iGkQ9UeYo4AszyQsxsrzmV/JhBY2WQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g5h3qYzPTwuGLA0jKQpLDD8IaddjQ5yChAkPcmJvs4wv8D7C9BELlZoXmCgYjb0+8t+zLxfu05uIAy10Tf0D3XxcDkakM1qSZBIEGxX6oFJnyCY8IajaZtv2MPnE59FDWkoF8Fl047Y8qoX32IiMrJpcy6NbI07266i3ytYHhjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3jaBaft; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3jaBaft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748219021; x=1779755021;
  h=date:from:to:cc:subject:message-id;
  bh=Hd2jbD6YxuGB+iGkQ9UeYo4AszyQsxsrzmV/JhBY2WQ=;
  b=d3jaBaftZm5VgnlbRMfdg5ZZze0lPuwk4qX3Q37iU5QYvJb++N/8NosC
   0W8SAFbXUtylVxalKksH4TLnFOnfzog79UlNrND8lJiJ/mbL+b2n4KijO
   YCA9Ptd9cF/CHBej5cGfhiPSTKyTSYLxse2rmE2fw5CJFug39ggfCcePm
   2NGg5A8P/SLdNmInSeLsnrdqcyYIxasOEJRwNYbxFnD5LA/WzIJ+K3vB8
   BzfTRnG5QiH4pZR0T6C0BpnqrpQkNjdQRZzutHcf3/5gy5H/DSSVMUvdX
   gsGHoyfluIOAhqbZM94099gsRKDgvL7W95A591GjHzjCpyqaS6c2AmUNd
   g==;
X-CSE-ConnectionGUID: cWa48njHSLe0Mxd15+fn6g==
X-CSE-MsgGUID: Lf26t5KVROGGzLVxUL94aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50242600"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="50242600"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 17:23:40 -0700
X-CSE-ConnectionGUID: s7VVtQLoTj2HfU5dpirdWw==
X-CSE-MsgGUID: cn0c4P6fRwWdLj9DQYgGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="142056160"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 May 2025 17:23:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJLcu-000S2o-0u;
	Mon, 26 May 2025 00:23:36 +0000
Date: Mon, 26 May 2025 08:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/core] BUILD SUCCESS
 94ec70880fd376dd5cc60ba2bd7ddf830b3d4f28
Message-ID: <202505260858.WvfW0qi8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
branch HEAD: 94ec70880fd376dd5cc60ba2bd7ddf830b3d4f28  Merge branch 'locking/futex' into locking/core, to pick up pending futex changes

elapsed time: 909m

configs tested: 178
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250525    gcc-12.4.0
arc                   randconfig-002-20250525    gcc-8.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    clang-21
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    clang-21
arm                           imxrt_defconfig    clang-21
arm                      integrator_defconfig    clang-21
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                   randconfig-001-20250525    clang-21
arm                   randconfig-002-20250525    clang-21
arm                   randconfig-003-20250525    gcc-8.5.0
arm                   randconfig-004-20250525    gcc-7.5.0
arm                             rpc_defconfig    clang-18
arm                        spear6xx_defconfig    clang-21
arm                           u8500_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250525    clang-21
arm64                 randconfig-002-20250525    gcc-8.5.0
arm64                 randconfig-003-20250525    gcc-6.5.0
arm64                 randconfig-004-20250525    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250525    gcc-11
i386        buildonly-randconfig-002-20250525    clang-20
i386        buildonly-randconfig-003-20250525    gcc-12
i386        buildonly-randconfig-004-20250525    gcc-12
i386        buildonly-randconfig-005-20250525    gcc-12
i386        buildonly-randconfig-006-20250525    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250526    clang-20
i386                  randconfig-002-20250526    clang-20
i386                  randconfig-003-20250526    clang-20
i386                  randconfig-004-20250526    clang-20
i386                  randconfig-005-20250526    clang-20
i386                  randconfig-006-20250526    clang-20
i386                  randconfig-007-20250526    clang-20
i386                  randconfig-011-20250526    gcc-11
i386                  randconfig-012-20250526    gcc-11
i386                  randconfig-013-20250526    gcc-11
i386                  randconfig-014-20250526    gcc-11
i386                  randconfig-015-20250526    gcc-11
i386                  randconfig-016-20250526    gcc-11
i386                  randconfig-017-20250526    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip28_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                        icon_defconfig    clang-21
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                    sam440ep_defconfig    clang-21
powerpc                 xes_mpc85xx_defconfig    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250525    clang-21
riscv                 randconfig-002-20250525    clang-21
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250525    clang-19
s390                  randconfig-002-20250525    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250525    gcc-6.5.0
sh                    randconfig-002-20250525    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250525    gcc-6.5.0
sparc                 randconfig-002-20250525    gcc-10.3.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250525    gcc-7.5.0
sparc64               randconfig-002-20250525    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250525    clang-18
um                    randconfig-002-20250525    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250525    clang-20
x86_64      buildonly-randconfig-002-20250525    clang-20
x86_64      buildonly-randconfig-003-20250525    clang-20
x86_64      buildonly-randconfig-004-20250525    gcc-12
x86_64      buildonly-randconfig-005-20250525    clang-20
x86_64      buildonly-randconfig-006-20250525    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250526    gcc-12
x86_64                randconfig-002-20250526    gcc-12
x86_64                randconfig-003-20250526    gcc-12
x86_64                randconfig-004-20250526    gcc-12
x86_64                randconfig-005-20250526    gcc-12
x86_64                randconfig-006-20250526    gcc-12
x86_64                randconfig-007-20250526    gcc-12
x86_64                randconfig-008-20250526    gcc-12
x86_64                randconfig-071-20250526    gcc-11
x86_64                randconfig-072-20250526    gcc-11
x86_64                randconfig-073-20250526    gcc-11
x86_64                randconfig-074-20250526    gcc-11
x86_64                randconfig-075-20250526    gcc-11
x86_64                randconfig-076-20250526    gcc-11
x86_64                randconfig-077-20250526    gcc-11
x86_64                randconfig-078-20250526    gcc-11
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250525    gcc-9.3.0
xtensa                randconfig-002-20250525    gcc-15.1.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
