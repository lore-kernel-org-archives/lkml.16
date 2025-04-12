Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736018DF89
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744447914; cv=none; b=qgfpANv/GV73qpcc+ZfGc3I5x0g+wEljM0f+NG0MYp8AU8DlbyZ0etpTIQp4BSshoDs0PLS79/baY6LK3gwt/Rgcl2p8tDHBScOk/Jvgxc1YLdu6GfHW+WRL3lIA9OxqadMC8R8jwavJ5Is4X2MU4yGrbA2a6qV+NoHBn66rwbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744447914; c=relaxed/simple;
	bh=2eeQMeyVtMG4Jm9R6iPKMyk9NtJjQ8ukGumkh/jpLnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qeFkDl08MxgCPBsIPbN7DgkKACAfc++OyuqzBbt6yDL/O3u5m6k3uvepPRQSWLDGpYaDQEQuYYTV7rPVMxntHKOBAtnXg9cTA4TCoIpfO56VgqfaGWqgnT6Aq4vst1znkAQpR1bWFyEBc7z6M3m8QACsapD9pzz/biFDiS5WOvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbDFxiQl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbDFxiQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744447911; x=1775983911;
  h=date:from:to:cc:subject:message-id;
  bh=2eeQMeyVtMG4Jm9R6iPKMyk9NtJjQ8ukGumkh/jpLnw=;
  b=gbDFxiQlNGj1BTHjZEiU/e1kisbcd9dmx0AE+Owns05pmFEk6LRv2QC5
   NkPGthYhfH/1LwJLE8t4q9VJBotfoMWkfwOmttxREwymIyGUy37coor83
   Qaep/oUAz6p6GggUrVnZz3lMkxmIp2CyruEEHk/+ibnBo4npef7DgN0oR
   M62opwYnQJyY0WqPYElekw4L/VQXSEfbQN+Wx9BXh8qx9WIhdBO4sPXCl
   ZTqihoHNT5m3/vXTDcTdtPdkC2Zuqt6zXsiZn5S1n3a8OM3kIlJ/9MI4n
   uHBrp9VgwslBBQsgtf8y8lLwTioH1Neji+9MHzN16ueDpU2u3NbjBCFhr
   A==;
X-CSE-ConnectionGUID: /wFi71gBRnqdTg/bTERxTg==
X-CSE-MsgGUID: jYr1dCazSoKBaMghCB0qgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45698889"
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="45698889"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 01:51:50 -0700
X-CSE-ConnectionGUID: uO3PcpcGRZuGCAc669qPsQ==
X-CSE-MsgGUID: 6puVBft+SaSUKhwEi+JkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="129156281"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Apr 2025 01:51:50 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3WaZ-000Bfe-2I;
	Sat, 12 Apr 2025 08:51:47 +0000
Date: Sat, 12 Apr 2025 16:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250404] BUILD SUCCESS
 5cf93e6214cb5c0c0820c35ea35463f6dcdbd6d6
Message-ID: <202504121625.Vqzrl0Xw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250404
branch HEAD: 5cf93e6214cb5c0c0820c35ea35463f6dcdbd6d6  wifi: iwlwifi: mvm: d3: Avoid -Wflex-array-member-not-at-end warnings

elapsed time: 1446m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250411    gcc-14.2.0
arc                   randconfig-002-20250411    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                        multi_v5_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20250411    clang-21
arm                   randconfig-002-20250411    clang-21
arm                   randconfig-003-20250411    gcc-6.5.0
arm                   randconfig-004-20250411    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250411    gcc-9.5.0
arm64                 randconfig-002-20250411    gcc-9.5.0
arm64                 randconfig-003-20250411    clang-21
arm64                 randconfig-004-20250411    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250411    gcc-14.2.0
csky                  randconfig-002-20250411    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250411    clang-21
hexagon               randconfig-002-20250411    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250411    gcc-12
i386        buildonly-randconfig-002-20250411    gcc-12
i386        buildonly-randconfig-003-20250411    gcc-12
i386        buildonly-randconfig-004-20250411    clang-20
i386        buildonly-randconfig-005-20250411    gcc-11
i386        buildonly-randconfig-006-20250411    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250411    gcc-14.2.0
loongarch             randconfig-002-20250411    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250411    gcc-9.3.0
nios2                 randconfig-002-20250411    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250411    gcc-14.2.0
parisc                randconfig-002-20250411    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250411    gcc-9.3.0
powerpc               randconfig-002-20250411    clang-21
powerpc               randconfig-003-20250411    clang-21
powerpc64             randconfig-001-20250411    gcc-5.5.0
powerpc64             randconfig-002-20250411    gcc-5.5.0
powerpc64             randconfig-003-20250411    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250412    clang-20
riscv                 randconfig-002-20250412    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250412    clang-18
s390                  randconfig-002-20250412    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250412    gcc-14.2.0
sh                    randconfig-002-20250412    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250412    gcc-10.3.0
sparc                 randconfig-002-20250412    gcc-13.3.0
sparc64               randconfig-001-20250412    gcc-13.3.0
sparc64               randconfig-002-20250412    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250412    gcc-12
um                    randconfig-002-20250412    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250411    gcc-11
x86_64      buildonly-randconfig-002-20250411    gcc-11
x86_64      buildonly-randconfig-003-20250411    clang-20
x86_64      buildonly-randconfig-004-20250411    gcc-12
x86_64      buildonly-randconfig-005-20250411    clang-20
x86_64      buildonly-randconfig-006-20250411    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250412    gcc-14.2.0
xtensa                randconfig-002-20250412    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
