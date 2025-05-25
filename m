Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B8136E37
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748141704; cv=none; b=gdvBUW1NmmpRJ1mLDoxPuHj0D2TTFhFR14VdoUQ1xCEgB0h44n5zyK2vHy6PyFyeN8eujh5jyQ1xjnCtW3tf1ewzY4khckIPY8c6SCFKqvtG33Lng1PTVMwlj7ztbe9QI2+5KErfCC4ALqkc71hKVTo0+54UiiQJMY36GJ12o/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748141704; c=relaxed/simple;
	bh=pP0OEczPCzFS/2edfw/31NlMT1s3iDzm7+hbx9p5oaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DgchAOJAYlMOI0fssgfqbfkxEwWwPHe+K605BN2djCJtMFXwyQ+isLKhAhvuwgrTOLe5Kckb5o6hmp0+A8BCFbbAR0rxtGlmTndNjtjPLlc4vxarMGEN/p4W91ArxL2HCAt1YIZIizj6FCxD7a5OSlLcuXIgI/TJcILtij+G6lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXBKK4yg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXBKK4yg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748141703; x=1779677703;
  h=date:from:to:cc:subject:message-id;
  bh=pP0OEczPCzFS/2edfw/31NlMT1s3iDzm7+hbx9p5oaA=;
  b=VXBKK4yglvmSew9mlgQc1xTPw71QoL+q9xnc1c3KmXtcXQ0BnGk/MD52
   uOwZ4z72X8j0gZiI8LKD+qJGZM0pyGZuNGt7Q/YMIyghzyY8x631uQEhd
   XUM2kftQI8aao5yF7mq6RxgzhIeC7giIOtF149HKPp+UHmYu9CWHqvYIm
   +l4roS/Qc0nLUsdZJDYRaUe025zynuFc9GhDVMK1CyR/5HbzI3SaeJTgv
   4UVykh8EiXaqm2wOFSdFftHScgz4PFMBIpQcbQVDdk3HN7idphCSrw8Wf
   FoPsUM74uSmRI6lME0yFvN63wRyXNY+V7481x3EXwh2z2lX12PcVyJTVQ
   A==;
X-CSE-ConnectionGUID: +46o5tyqR7WXOEHfG95kSg==
X-CSE-MsgGUID: wu57EMaNQxOTC/3yYx6KRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50308839"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="50308839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 19:55:02 -0700
X-CSE-ConnectionGUID: 75YhLYvOTBeOUvWnmsUYQA==
X-CSE-MsgGUID: iqmhbb6nTTuUGkaBC7XNWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="142774803"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 May 2025 19:55:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ1Vq-000RaS-2J;
	Sun, 25 May 2025 02:54:58 +0000
Date: Sun, 25 May 2025 10:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD REGRESSION
 4df0681d0b0244368a8a0982b24ceb536c3b5165
Message-ID: <202505251013.OtgOobhp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 4df0681d0b0244368a8a0982b24ceb536c3b5165  Merge branch into tip/master: 'x86/sgx'

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202505242035.SN55pavs-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202505242058.6AYU4Wd3-lkp@intel.com

    arch/powerpc/include/asm/perf_event.h:47:0: warning: "PERF_REG_EXTENDED_MASK" redefined
    arch/powerpc/include/asm/perf_event.h:47:32: error: 'PERF_REG_EXTENDED_MASK' undeclared (first use in this function); did you mean 'PERF_REG_EXTENDED_MAX'?
    arch/powerpc/include/asm/perf_event.h:47:33: error: 'PERF_REG_EXTENDED_MASK' undeclared (first use in this function); did you mean 'PERF_REG_EXTENDED_MAX'?
    arch/powerpc/include/asm/perf_event.h:47:9: warning: "PERF_REG_EXTENDED_MASK" redefined
    include/linux/perf_regs.h:16:32: error: expected identifier or '(' before numeric constant
    include/linux/perf_regs.h:16:33: error: expected identifier or '(' before numeric constant
    include/linux/perf_regs.h:40:16: error: 'PERF_SAMPLE_REGS_ABI_NONE' undeclared (first use in this function)
    include/linux/perf_regs.h:40:9: error: 'PERF_SAMPLE_REGS_ABI_NONE' undeclared (first use in this function)
    include/linux/perf_regs.h:40:9: error: use of undeclared identifier 'PERF_SAMPLE_REGS_ABI_NONE'
    include/linux/perf_regs.h:41:1: warning: control reaches end of non-void function [-Wreturn-type]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- alpha-allyesconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- arc-allmodconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- arc-allyesconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- hexagon-allmodconfig
|   `-- include-linux-perf_regs.h:error:use-of-undeclared-identifier-PERF_SAMPLE_REGS_ABI_NONE
|-- hexagon-allyesconfig
|   `-- include-linux-perf_regs.h:error:use-of-undeclared-identifier-PERF_SAMPLE_REGS_ABI_NONE
|-- hexagon-randconfig-002-20250524
|   `-- include-linux-perf_regs.h:error:use-of-undeclared-identifier-PERF_SAMPLE_REGS_ABI_NONE
|-- m68k-allmodconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- m68k-allnoconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- m68k-allyesconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- m68k-atari_defconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- m68k-m5407c3_defconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- microblaze-allmodconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- microblaze-allnoconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- microblaze-allyesconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- nios2-allnoconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- openrisc-allnoconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- openrisc-allyesconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- openrisc-defconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- openrisc-virt_defconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- parisc-allmodconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- parisc-allyesconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- parisc-defconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- powerpc-allmodconfig
|   |-- arch-powerpc-include-asm-perf_event.h:error:PERF_REG_EXTENDED_MASK-undeclared-(first-use-in-this-function)
|   |-- arch-powerpc-include-asm-perf_event.h:warning:PERF_REG_EXTENDED_MASK-redefined
|   `-- include-linux-perf_regs.h:error:expected-identifier-or-(-before-numeric-constant
|-- powerpc-randconfig-002-20250524
|   |-- arch-powerpc-include-asm-perf_event.h:error:PERF_REG_EXTENDED_MASK-undeclared-(first-use-in-this-function)
|   |-- arch-powerpc-include-asm-perf_event.h:warning:PERF_REG_EXTENDED_MASK-redefined
|   `-- include-linux-perf_regs.h:error:expected-identifier-or-(-before-numeric-constant
|-- sh-allmodconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- sh-allnoconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- sh-allyesconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- sh-kfr2r09_defconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- sh-randconfig-001-20250524
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- sh-rsk7264_defconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- sh-rts7751r2dplus_defconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- sparc-allmodconfig
|   |-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|   `-- include-linux-perf_regs.h:warning:control-reaches-end-of-non-void-function
|-- sparc-allnoconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- sparc-allyesconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- sparc64-randconfig-001-20250524
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- um-allmodconfig
|   `-- include-linux-perf_regs.h:error:use-of-undeclared-identifier-PERF_SAMPLE_REGS_ABI_NONE
|-- um-allyesconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- um-randconfig-001-20250524
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- xtensa-allnoconfig
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
|-- xtensa-randconfig-001-20250524
|   `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)
`-- xtensa-randconfig-002-20250524
    `-- include-linux-perf_regs.h:error:PERF_SAMPLE_REGS_ABI_NONE-undeclared-(first-use-in-this-function)

elapsed time: 982m

configs tested: 125
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250524    gcc-15.1.0
arc                   randconfig-002-20250524    gcc-15.1.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-21
arm                            dove_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250524    gcc-7.5.0
arm                   randconfig-002-20250524    gcc-7.5.0
arm                   randconfig-003-20250524    clang-20
arm                   randconfig-004-20250524    gcc-7.5.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250524    gcc-5.5.0
arm64                 randconfig-002-20250524    gcc-7.5.0
arm64                 randconfig-003-20250524    clang-19
arm64                 randconfig-004-20250524    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250524    gcc-11.5.0
csky                  randconfig-002-20250524    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250524    clang-21
hexagon               randconfig-002-20250524    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250524    clang-20
i386        buildonly-randconfig-002-20250524    gcc-12
i386        buildonly-randconfig-003-20250524    gcc-12
i386        buildonly-randconfig-004-20250524    gcc-12
i386        buildonly-randconfig-005-20250524    clang-20
i386        buildonly-randconfig-006-20250524    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250524    gcc-13.3.0
loongarch             randconfig-002-20250524    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250524    gcc-13.3.0
nios2                 randconfig-002-20250524    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250524    gcc-6.5.0
parisc                randconfig-002-20250524    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      bamboo_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250524    gcc-5.5.0
powerpc               randconfig-002-20250524    gcc-7.5.0
powerpc               randconfig-003-20250524    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250524    gcc-7.5.0
powerpc64             randconfig-002-20250524    gcc-10.5.0
powerpc64             randconfig-003-20250524    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250524    clang-21
riscv                 randconfig-002-20250524    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250524    clang-17
s390                  randconfig-002-20250524    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250524    gcc-13.3.0
sh                    randconfig-002-20250524    gcc-7.5.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250524    gcc-6.5.0
sparc                 randconfig-002-20250524    gcc-6.5.0
sparc64               randconfig-001-20250524    gcc-8.5.0
sparc64               randconfig-002-20250524    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250524    gcc-12
um                    randconfig-002-20250524    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250524    gcc-12
x86_64      buildonly-randconfig-002-20250524    gcc-12
x86_64      buildonly-randconfig-003-20250524    gcc-12
x86_64      buildonly-randconfig-004-20250524    gcc-12
x86_64      buildonly-randconfig-005-20250524    gcc-11
x86_64      buildonly-randconfig-006-20250524    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250524    gcc-8.5.0
xtensa                randconfig-002-20250524    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
