Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1181143748
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113666; cv=none; b=C+VSjpUFBfFu9PQSQTqlhnrgLUW4IGobi0i9psty4zQuqMyIcPXLnMm437sg7ZDlI0yhk2Q/g2YesmCiJnWV0LEX/pMVwh+/BoTfuEX1Au3aHtyxmgnHkHCzn+Zb66o/z8olSkm67HbeLEsIOSUrDNOCs7P77xcEFJ1Ngq5IQVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113666; c=relaxed/simple;
	bh=gSxIdXtYmcivvKpBLGZrWlGvySrV7wkElDZFKloXtBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R5JSlG2nXDa4WPHL6Xku9PrWOI/CBSQ/wBYH6bZ8ievsY/WyJKmi+PZXYmHRevwZWHfGvw+VmcvBZck0ptTSEf3drtx0tngyo7AopYG4+UK/WcmRBKuy96qWZ24kuUEoR/TKJvnU2Q4elQ/8nWA8VrEXjps9BDzgHRlj1tjhOLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WG+n27uQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WG+n27uQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749113664; x=1780649664;
  h=date:from:to:cc:subject:message-id;
  bh=gSxIdXtYmcivvKpBLGZrWlGvySrV7wkElDZFKloXtBc=;
  b=WG+n27uQbKUMCupvUByozE9U9F0rA39C+5I8irzBpQBfLKMtUqvTNddL
   08YrvjFm12Vm843LE144oYAU1rxoSXPADGrnfHR+4p29DGJEKJelAOhgr
   6sm7+j4S7/OlW/XBHJVBJfwaEAu5H/tFlpGUZQ7zr9bGQMRShaZ6L3MLI
   RzPNJRu4ZMd5ldt8R+zjltlLbdzWqXyFrowtmNWjhSIH5Qol46/Ioxk0m
   z8QriJqBKideHOqLDtJkSkh4QZHre2aJ2jTZIoXYy+ZEdcutq/bxj314V
   6/RIRMSMeDdvO2TjnIpiwxtISwAbo8hvGkHOxajma/3deuho7zRwfhYz3
   Q==;
X-CSE-ConnectionGUID: XA0+nor4Qfq5EmfCE00m2A==
X-CSE-MsgGUID: Pk4vzTbgTBmCdge1TSAJBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="38851794"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="38851794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 01:54:24 -0700
X-CSE-ConnectionGUID: 08eXJlAsRYi3q66HT/35vA==
X-CSE-MsgGUID: cCuVNNHSQ4GPw2VWpg0aYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="145789459"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2025 01:54:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN6Me-0003vd-1e;
	Thu, 05 Jun 2025 08:54:20 +0000
Date: Thu, 05 Jun 2025 16:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/urgent] BUILD SUCCESS
 9cc82d99b13c1ad04e3dff9182b7953a8dba10b6
Message-ID: <202506051638.hsXzmXfs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 9cc82d99b13c1ad04e3dff9182b7953a8dba10b6  PCI/MSI: Size device MSI domain with the maximum number of vectors

elapsed time: 1345m

configs tested: 287
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                        nsimosci_defconfig    clang-19
arc                   randconfig-001-20250604    gcc-12.4.0
arc                   randconfig-001-20250605    clang-21
arc                   randconfig-002-20250604    gcc-12.4.0
arc                   randconfig-002-20250605    clang-21
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-19
arm                          exynos_defconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                      integrator_defconfig    clang-21
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-21
arm                            mmp2_defconfig    gcc-15.1.0
arm                          pxa910_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250604    gcc-14.3.0
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-002-20250604    clang-18
arm                   randconfig-002-20250605    clang-21
arm                   randconfig-003-20250604    gcc-10.5.0
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-004-20250604    clang-21
arm                   randconfig-004-20250605    clang-21
arm                             rpc_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    clang-21
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250604    gcc-8.5.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-002-20250604    clang-21
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-003-20250604    gcc-8.5.0
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-004-20250604    gcc-12.3.0
arm64                 randconfig-004-20250605    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250604    gcc-12.4.0
csky                  randconfig-001-20250605    clang-21
csky                  randconfig-002-20250604    gcc-15.1.0
csky                  randconfig-002-20250605    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250604    clang-21
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-002-20250604    clang-21
hexagon               randconfig-002-20250605    clang-21
i386                             alldefconfig    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250604    clang-20
i386        buildonly-randconfig-001-20250605    clang-20
i386        buildonly-randconfig-002-20250604    gcc-12
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-003-20250604    gcc-12
i386        buildonly-randconfig-003-20250605    clang-20
i386        buildonly-randconfig-004-20250604    gcc-12
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-005-20250604    clang-20
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-006-20250604    gcc-12
i386        buildonly-randconfig-006-20250605    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250605    clang-20
i386                  randconfig-002-20250605    clang-20
i386                  randconfig-003-20250605    clang-20
i386                  randconfig-004-20250605    clang-20
i386                  randconfig-005-20250605    clang-20
i386                  randconfig-006-20250605    clang-20
i386                  randconfig-007-20250605    clang-20
i386                  randconfig-011-20250605    clang-20
i386                  randconfig-012-20250605    clang-20
i386                  randconfig-013-20250605    clang-20
i386                  randconfig-014-20250605    clang-20
i386                  randconfig-015-20250605    clang-20
i386                  randconfig-016-20250605    clang-20
i386                  randconfig-017-20250605    clang-20
loongarch                        alldefconfig    clang-19
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    clang-19
loongarch             randconfig-001-20250604    gcc-15.1.0
loongarch             randconfig-001-20250605    clang-21
loongarch             randconfig-002-20250604    gcc-15.1.0
loongarch             randconfig-002-20250605    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250604    gcc-13.3.0
nios2                 randconfig-001-20250605    clang-21
nios2                 randconfig-002-20250604    gcc-8.5.0
nios2                 randconfig-002-20250605    clang-21
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250604    gcc-8.5.0
parisc                randconfig-001-20250605    clang-21
parisc                randconfig-002-20250604    gcc-14.3.0
parisc                randconfig-002-20250605    clang-21
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-21
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc                        icon_defconfig    clang-21
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    clang-21
powerpc                       ppc64_defconfig    clang-21
powerpc                       ppc64_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    clang-21
powerpc               randconfig-001-20250604    clang-21
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-002-20250604    clang-18
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-003-20250604    gcc-8.5.0
powerpc               randconfig-003-20250605    clang-21
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250604    gcc-12.4.0
powerpc64             randconfig-001-20250605    clang-21
powerpc64             randconfig-002-20250604    gcc-11.5.0
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-003-20250604    clang-21
powerpc64             randconfig-003-20250605    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250604    clang-19
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-002-20250604    gcc-8.5.0
riscv                 randconfig-002-20250605    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250604    clang-18
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-002-20250604    gcc-9.3.0
s390                  randconfig-002-20250605    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-15.1.0
sh                          landisk_defconfig    clang-21
sh                    randconfig-001-20250604    gcc-11.5.0
sh                    randconfig-001-20250605    clang-21
sh                    randconfig-002-20250604    gcc-15.1.0
sh                    randconfig-002-20250605    clang-21
sh                          rsk7201_defconfig    clang-21
sh                          rsk7264_defconfig    gcc-15.1.0
sh                          rsk7269_defconfig    clang-21
sh                           se7619_defconfig    clang-21
sh                           se7721_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250604    gcc-10.3.0
sparc                 randconfig-001-20250605    clang-21
sparc                 randconfig-002-20250604    gcc-11.5.0
sparc                 randconfig-002-20250605    clang-21
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250604    gcc-14.3.0
sparc64               randconfig-001-20250605    clang-21
sparc64               randconfig-002-20250604    gcc-15.1.0
sparc64               randconfig-002-20250605    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250604    clang-17
um                    randconfig-001-20250605    clang-21
um                    randconfig-002-20250604    clang-21
um                    randconfig-002-20250605    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250604    gcc-12
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-002-20250604    gcc-12
x86_64      buildonly-randconfig-002-20250605    clang-20
x86_64      buildonly-randconfig-003-20250604    gcc-12
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-004-20250604    gcc-12
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-005-20250604    gcc-12
x86_64      buildonly-randconfig-005-20250605    clang-20
x86_64      buildonly-randconfig-006-20250604    clang-20
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250605    gcc-12
x86_64                randconfig-002-20250605    gcc-12
x86_64                randconfig-003-20250605    gcc-12
x86_64                randconfig-004-20250605    gcc-12
x86_64                randconfig-005-20250605    gcc-12
x86_64                randconfig-006-20250605    gcc-12
x86_64                randconfig-007-20250605    gcc-12
x86_64                randconfig-008-20250605    gcc-12
x86_64                randconfig-071-20250605    clang-20
x86_64                randconfig-072-20250605    clang-20
x86_64                randconfig-073-20250605    clang-20
x86_64                randconfig-074-20250605    clang-20
x86_64                randconfig-075-20250605    clang-20
x86_64                randconfig-076-20250605    clang-20
x86_64                randconfig-077-20250605    clang-20
x86_64                randconfig-078-20250605    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250604    gcc-13.3.0
xtensa                randconfig-001-20250605    clang-21
xtensa                randconfig-002-20250604    gcc-11.5.0
xtensa                randconfig-002-20250605    clang-21
xtensa                    xip_kc705_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
