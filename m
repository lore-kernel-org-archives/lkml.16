Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9E28F4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 01:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746669110; cv=none; b=de9MWgt7YhmpIMxYRfHuPS7UYehOfJiBYtx+pBSTVBKTyDOShWkXwcFMj99xgmsMpONrkGouyEN8L6t+w+Rm1uj2DrJO4LrPmIBeVHp5tGaFaYhASjFjKR4oBSJtNn8ZbTiBmGut0rYhiFzpzvqkyfDlcfFFyAv3Afrz97gLup4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746669110; c=relaxed/simple;
	bh=zqjbVQi4JDmwyBUJ5oTFxFnQbCXlY3hRw3gnpCMljos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mW3psWnLWl/+SREOKIGE2FPJRwmbhr+pEjpfJg/i3gdxS6XUpjyENRTsr+r91WpLuG5Z+ZilHYL2tj3ogQGk9SJDxzeVw8/1KZ7nodOcnBErdv2EL9p5uXk3tHqcXL58d2T/nTEBG0wvQ3xtCKmgkL2EfiWZqySljywumdrm2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbbWFcCj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbbWFcCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746669109; x=1778205109;
  h=date:from:to:cc:subject:message-id;
  bh=zqjbVQi4JDmwyBUJ5oTFxFnQbCXlY3hRw3gnpCMljos=;
  b=JbbWFcCjEn8OFlke+LfGGwoF7ayFFUxyC/GsDCKXB8ohwwTIKpTil6Hf
   XDhgCHLFjsLORtWD9X0TYyjqx9vsNFicdvX9POenJTz5yCgYugU0uJauf
   vNQ4eINFmUATU29oDbvVTB8I38LLGDHHzIiA9d94L8nJ3Fkwiel49Sh6A
   kGCb557eyVBVWd8jnHokJ3thrkrtYIl/T4DeUvCkp5tgc+zAD8EHOYxDl
   v9TE84daPbb7lELXNhPAWpnw4j88m5zSiA0kIuhVUn1Q0K2lNBwnxH6XO
   JteNiMCZqCJWbaWW795fQfOihkucdzc9mBWWgU2Btj4KfT4URpXLMYYPZ
   Q==;
X-CSE-ConnectionGUID: 2Y6y4UXsT9mX5jGNlCKdcQ==
X-CSE-MsgGUID: xF6dMjldS0qO+J2XdhuW6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59420980"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59420980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 18:51:48 -0700
X-CSE-ConnectionGUID: WpoDTuuaTsKsaFoVJA7CJw==
X-CSE-MsgGUID: dJ2CvvMGSxSSOq7e382yzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141016636"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2025 18:50:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCqPP-0009Da-2z;
	Thu, 08 May 2025 01:50:47 +0000
Date: Thu, 08 May 2025 09:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/bugs] BUILD SUCCESS
 1f4bb068b498a544ae913764a797449463ef620c
Message-ID: <202505080902.z0hSN58I-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
branch HEAD: 1f4bb068b498a544ae913764a797449463ef620c  x86/bugs: Restructure SRSO mitigation

elapsed time: 8121m

configs tested: 224
configs skipped: 140

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                       aspeed_g5_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                          pxa910_defconfig    clang-21
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    clang-21
arm64                               defconfig    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250503    gcc-8.5.0
csky                  randconfig-002-20250503    gcc-8.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250503    gcc-8.5.0
hexagon               randconfig-002-20250503    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-001-20250503    clang-20
i386        buildonly-randconfig-001-20250506    gcc-12
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-002-20250503    clang-20
i386        buildonly-randconfig-002-20250506    gcc-12
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-003-20250503    clang-20
i386        buildonly-randconfig-003-20250506    gcc-12
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386        buildonly-randconfig-005-20250502    gcc-12
i386        buildonly-randconfig-005-20250503    clang-20
i386        buildonly-randconfig-005-20250506    gcc-12
i386        buildonly-randconfig-006-20250502    gcc-12
i386        buildonly-randconfig-006-20250503    clang-20
i386        buildonly-randconfig-006-20250506    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250503    clang-20
i386                  randconfig-001-20250506    gcc-12
i386                  randconfig-002-20250503    clang-20
i386                  randconfig-002-20250506    gcc-12
i386                  randconfig-003-20250503    clang-20
i386                  randconfig-003-20250506    gcc-12
i386                  randconfig-004-20250503    clang-20
i386                  randconfig-004-20250506    gcc-12
i386                  randconfig-005-20250503    clang-20
i386                  randconfig-005-20250506    gcc-12
i386                  randconfig-006-20250503    clang-20
i386                  randconfig-006-20250506    gcc-12
i386                  randconfig-007-20250503    clang-20
i386                  randconfig-007-20250506    gcc-12
i386                  randconfig-011-20250503    clang-20
i386                  randconfig-011-20250506    gcc-12
i386                  randconfig-012-20250503    clang-20
i386                  randconfig-012-20250506    gcc-12
i386                  randconfig-013-20250503    clang-20
i386                  randconfig-013-20250506    gcc-12
i386                  randconfig-014-20250503    clang-20
i386                  randconfig-014-20250506    gcc-12
i386                  randconfig-015-20250503    clang-20
i386                  randconfig-015-20250506    gcc-12
i386                  randconfig-016-20250503    clang-20
i386                  randconfig-016-20250506    gcc-12
i386                  randconfig-017-20250503    clang-20
i386                  randconfig-017-20250506    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250503    gcc-8.5.0
loongarch             randconfig-002-20250503    gcc-8.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    clang-21
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
mips                           ip30_defconfig    clang-21
mips                      maltaaprp_defconfig    clang-21
mips                         rt305x_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250503    gcc-8.5.0
nios2                 randconfig-002-20250503    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250503    gcc-8.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc               randconfig-001-20250503    gcc-8.5.0
powerpc               randconfig-002-20250503    gcc-8.5.0
powerpc               randconfig-003-20250503    gcc-8.5.0
powerpc                    socrates_defconfig    clang-21
powerpc64             randconfig-001-20250503    gcc-8.5.0
powerpc64             randconfig-002-20250503    gcc-8.5.0
powerpc64             randconfig-003-20250503    gcc-8.5.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250503    gcc-10.5.0
riscv                 randconfig-002-20250503    gcc-10.5.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250503    gcc-10.5.0
s390                  randconfig-002-20250503    gcc-10.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    clang-21
sh                    randconfig-001-20250503    gcc-10.5.0
sh                    randconfig-002-20250503    gcc-10.5.0
sh                          rsk7269_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250503    gcc-10.5.0
sparc                 randconfig-002-20250503    gcc-10.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-002-20250503    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250503    gcc-10.5.0
um                    randconfig-002-20250503    gcc-10.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250502    gcc-12
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250502    gcc-12
x86_64      buildonly-randconfig-005-20250503    gcc-12
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64      buildonly-randconfig-006-20250503    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250503    clang-20
x86_64                randconfig-001-20250506    clang-20
x86_64                randconfig-002-20250503    clang-20
x86_64                randconfig-002-20250506    clang-20
x86_64                randconfig-003-20250503    clang-20
x86_64                randconfig-003-20250506    clang-20
x86_64                randconfig-004-20250503    clang-20
x86_64                randconfig-004-20250506    clang-20
x86_64                randconfig-005-20250503    clang-20
x86_64                randconfig-005-20250506    clang-20
x86_64                randconfig-006-20250503    clang-20
x86_64                randconfig-006-20250506    clang-20
x86_64                randconfig-007-20250503    clang-20
x86_64                randconfig-007-20250506    clang-20
x86_64                randconfig-008-20250503    clang-20
x86_64                randconfig-008-20250506    clang-20
x86_64                randconfig-071-20250503    clang-20
x86_64                randconfig-071-20250506    clang-20
x86_64                randconfig-072-20250503    clang-20
x86_64                randconfig-072-20250506    clang-20
x86_64                randconfig-073-20250503    clang-20
x86_64                randconfig-073-20250506    clang-20
x86_64                randconfig-074-20250503    clang-20
x86_64                randconfig-074-20250506    clang-20
x86_64                randconfig-075-20250503    clang-20
x86_64                randconfig-075-20250506    clang-20
x86_64                randconfig-076-20250503    clang-20
x86_64                randconfig-076-20250506    clang-20
x86_64                randconfig-077-20250503    clang-20
x86_64                randconfig-077-20250506    clang-20
x86_64                randconfig-078-20250503    clang-20
x86_64                randconfig-078-20250506    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    clang-21
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-002-20250503    gcc-10.5.0
xtensa                    xip_kc705_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
