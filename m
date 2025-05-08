Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667AD2A1D8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746675933; cv=none; b=Zrvb4FGE3hXIvhlMl2Er10IoL2SUK1Gtzqh7wvxwrDaSkuMVUpMIw3CPvn35JMLw/RvQYL+nrt9ddZnOar/pOW9yUux/T+YIf+g2d4TBgodI+6n/w1M+wcw7psk5g2p5KrVjm6hPSWxGgAh3x4wF+iWZDrrpgiK1zD3gZ7S29t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746675933; c=relaxed/simple;
	bh=iiSEqE9CXPzFrBJ3CYssRHZykYi8tUnffSbdgthlOkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l/yJ1nosKnn41AF/8TfL3is4ugFzZKF56lO2PZFYMcr7IlHn6kx+9ayTZ0lLEy3wdDe+Blm5EH4Q8k+Y7jMKJDhk37t9B1IF7emYdI0Lj0t+timTHYir/3BeOx+/1W5l/Czp+HU2cbsp8cO3x6odcGvbszwmjIf/Qnf1p71Pfes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QG88r8yY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QG88r8yY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746675931; x=1778211931;
  h=date:from:to:cc:subject:message-id;
  bh=iiSEqE9CXPzFrBJ3CYssRHZykYi8tUnffSbdgthlOkQ=;
  b=QG88r8yYX2+ohiJ3sPn20Mx//xa5R+RYnZ1RfhQv7ufire0bcucqeiWm
   Hm1R52QAWHwhWNxNr0cp5kfL7qJPWG+t85W68GAvxrKbd/I+GygTD0mnj
   JJoKQwpeFuDf7wa9iGM0qNHEl3wCVDKE84ANv3VFKNATAMTCE4kzWQxuP
   CWH757ifUHiTQIai2uRvPo8yO1BOQTHa9NNsPiQ5ihgKLtfnIouEVeAM+
   Vl451y8yFkVJMfexxcwzxUxVA1BIEDOVcUCkQqwKnL969kNCfw/g1Zq9k
   2Tj3C1CKJ1Mz0Hs+fJhubL0rrrjjQo1jJbOj6LssR2K9081l7b5R3laWG
   Q==;
X-CSE-ConnectionGUID: /xNRZulBQgqqKqaRLzSuRg==
X-CSE-MsgGUID: a+mthpiJRUenB1iU5vcwNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52091681"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52091681"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 20:45:30 -0700
X-CSE-ConnectionGUID: tIpGesvLR7mPvsreLZjCVA==
X-CSE-MsgGUID: 45O6FG7vQxePIdfTuvqhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="135860506"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2025 20:45:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCsCM-0009pF-09;
	Thu, 08 May 2025 03:45:26 +0000
Date: Thu, 08 May 2025 11:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/sgx] BUILD SUCCESS
 e59236b5a09e168fdf961a10d2519cef44f5d6b4
Message-ID: <202505081115.88HeVuGx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sgx
branch HEAD: e59236b5a09e168fdf961a10d2519cef44f5d6b4  x86/sgx: Use SHA-256 library API instead of crypto_shash API

elapsed time: 13388m

configs tested: 568
configs skipped: 149

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-21
arc                   randconfig-001-20250429    gcc-14.2.0
arc                   randconfig-001-20250501    clang-21
arc                   randconfig-001-20250502    gcc-8.5.0
arc                   randconfig-002-20250429    gcc-14.2.0
arc                   randconfig-002-20250501    clang-21
arc                   randconfig-002-20250502    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                         assabet_defconfig    gcc-14.2.0
arm                        clps711x_defconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                      integrator_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-16
arm                          moxart_defconfig    clang-21
arm                        multi_v5_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250429    gcc-14.2.0
arm                   randconfig-001-20250501    clang-21
arm                   randconfig-001-20250502    gcc-8.5.0
arm                   randconfig-002-20250429    gcc-14.2.0
arm                   randconfig-002-20250501    clang-21
arm                   randconfig-002-20250502    gcc-8.5.0
arm                   randconfig-003-20250429    gcc-14.2.0
arm                   randconfig-003-20250501    clang-21
arm                   randconfig-003-20250502    gcc-8.5.0
arm                   randconfig-004-20250429    gcc-14.2.0
arm                   randconfig-004-20250501    clang-21
arm                   randconfig-004-20250502    gcc-8.5.0
arm                         s5pv210_defconfig    clang-21
arm                        spear6xx_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    clang-21
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250429    gcc-14.2.0
arm64                 randconfig-001-20250501    clang-21
arm64                 randconfig-001-20250502    gcc-8.5.0
arm64                 randconfig-002-20250429    gcc-14.2.0
arm64                 randconfig-002-20250501    clang-21
arm64                 randconfig-002-20250502    gcc-8.5.0
arm64                 randconfig-003-20250429    gcc-14.2.0
arm64                 randconfig-003-20250501    clang-21
arm64                 randconfig-003-20250502    gcc-8.5.0
arm64                 randconfig-004-20250429    gcc-14.2.0
arm64                 randconfig-004-20250501    clang-21
arm64                 randconfig-004-20250502    gcc-8.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250429    clang-21
csky                  randconfig-001-20250501    gcc-7.5.0
csky                  randconfig-001-20250501    gcc-8.5.0
csky                  randconfig-001-20250502    gcc-8.5.0
csky                  randconfig-001-20250503    gcc-8.5.0
csky                  randconfig-002-20250429    clang-21
csky                  randconfig-002-20250501    gcc-7.5.0
csky                  randconfig-002-20250501    gcc-8.5.0
csky                  randconfig-002-20250502    gcc-8.5.0
csky                  randconfig-002-20250503    gcc-8.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250429    clang-21
hexagon               randconfig-001-20250501    gcc-7.5.0
hexagon               randconfig-001-20250501    gcc-8.5.0
hexagon               randconfig-001-20250502    gcc-8.5.0
hexagon               randconfig-001-20250503    gcc-8.5.0
hexagon               randconfig-002-20250429    clang-21
hexagon               randconfig-002-20250501    gcc-7.5.0
hexagon               randconfig-002-20250501    gcc-8.5.0
hexagon               randconfig-002-20250502    gcc-8.5.0
hexagon               randconfig-002-20250503    gcc-8.5.0
i386                             alldefconfig    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250429    clang-20
i386        buildonly-randconfig-001-20250501    clang-20
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-001-20250503    clang-20
i386        buildonly-randconfig-001-20250506    gcc-12
i386        buildonly-randconfig-002-20250429    clang-20
i386        buildonly-randconfig-002-20250501    clang-20
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-002-20250503    clang-20
i386        buildonly-randconfig-002-20250506    gcc-12
i386        buildonly-randconfig-003-20250429    clang-20
i386        buildonly-randconfig-003-20250501    clang-20
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-003-20250503    clang-20
i386        buildonly-randconfig-003-20250506    gcc-12
i386        buildonly-randconfig-004-20250429    clang-20
i386        buildonly-randconfig-004-20250501    clang-20
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386        buildonly-randconfig-005-20250429    clang-20
i386        buildonly-randconfig-005-20250501    clang-20
i386        buildonly-randconfig-005-20250502    clang-20
i386        buildonly-randconfig-005-20250503    clang-20
i386        buildonly-randconfig-005-20250506    gcc-12
i386        buildonly-randconfig-006-20250429    clang-20
i386        buildonly-randconfig-006-20250501    clang-20
i386        buildonly-randconfig-006-20250502    clang-20
i386        buildonly-randconfig-006-20250503    clang-20
i386        buildonly-randconfig-006-20250506    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250429    gcc-12
i386                  randconfig-001-20250501    gcc-12
i386                  randconfig-001-20250502    clang-20
i386                  randconfig-001-20250503    clang-20
i386                  randconfig-001-20250506    gcc-12
i386                  randconfig-002-20250429    gcc-12
i386                  randconfig-002-20250501    gcc-12
i386                  randconfig-002-20250502    clang-20
i386                  randconfig-002-20250503    clang-20
i386                  randconfig-002-20250506    gcc-12
i386                  randconfig-003-20250429    gcc-12
i386                  randconfig-003-20250501    gcc-12
i386                  randconfig-003-20250502    clang-20
i386                  randconfig-003-20250503    clang-20
i386                  randconfig-003-20250506    gcc-12
i386                  randconfig-004-20250429    gcc-12
i386                  randconfig-004-20250501    gcc-12
i386                  randconfig-004-20250502    clang-20
i386                  randconfig-004-20250503    clang-20
i386                  randconfig-004-20250506    gcc-12
i386                  randconfig-005-20250429    gcc-12
i386                  randconfig-005-20250501    gcc-12
i386                  randconfig-005-20250502    clang-20
i386                  randconfig-005-20250503    clang-20
i386                  randconfig-005-20250506    gcc-12
i386                  randconfig-006-20250429    gcc-12
i386                  randconfig-006-20250501    gcc-12
i386                  randconfig-006-20250502    clang-20
i386                  randconfig-006-20250503    clang-20
i386                  randconfig-006-20250506    gcc-12
i386                  randconfig-007-20250429    gcc-12
i386                  randconfig-007-20250501    gcc-12
i386                  randconfig-007-20250502    clang-20
i386                  randconfig-007-20250503    clang-20
i386                  randconfig-007-20250506    gcc-12
i386                  randconfig-011-20250429    clang-20
i386                  randconfig-011-20250501    clang-20
i386                  randconfig-011-20250502    gcc-12
i386                  randconfig-011-20250503    clang-20
i386                  randconfig-011-20250505    clang-20
i386                  randconfig-011-20250506    gcc-12
i386                  randconfig-012-20250429    clang-20
i386                  randconfig-012-20250501    clang-20
i386                  randconfig-012-20250502    gcc-12
i386                  randconfig-012-20250503    clang-20
i386                  randconfig-012-20250505    clang-20
i386                  randconfig-012-20250506    gcc-12
i386                  randconfig-013-20250429    clang-20
i386                  randconfig-013-20250501    clang-20
i386                  randconfig-013-20250502    gcc-12
i386                  randconfig-013-20250503    clang-20
i386                  randconfig-013-20250505    clang-20
i386                  randconfig-013-20250506    gcc-12
i386                  randconfig-014-20250429    clang-20
i386                  randconfig-014-20250501    clang-20
i386                  randconfig-014-20250502    gcc-12
i386                  randconfig-014-20250503    clang-20
i386                  randconfig-014-20250505    clang-20
i386                  randconfig-014-20250506    gcc-12
i386                  randconfig-015-20250429    clang-20
i386                  randconfig-015-20250501    clang-20
i386                  randconfig-015-20250502    gcc-12
i386                  randconfig-015-20250503    clang-20
i386                  randconfig-015-20250505    clang-20
i386                  randconfig-015-20250506    gcc-12
i386                  randconfig-016-20250429    clang-20
i386                  randconfig-016-20250501    clang-20
i386                  randconfig-016-20250502    gcc-12
i386                  randconfig-016-20250503    clang-20
i386                  randconfig-016-20250505    clang-20
i386                  randconfig-016-20250506    gcc-12
i386                  randconfig-017-20250429    clang-20
i386                  randconfig-017-20250501    clang-20
i386                  randconfig-017-20250502    gcc-12
i386                  randconfig-017-20250503    clang-20
i386                  randconfig-017-20250505    clang-20
i386                  randconfig-017-20250506    gcc-12
loongarch                        alldefconfig    clang-16
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250429    clang-21
loongarch             randconfig-001-20250501    gcc-7.5.0
loongarch             randconfig-001-20250501    gcc-8.5.0
loongarch             randconfig-001-20250502    gcc-8.5.0
loongarch             randconfig-001-20250503    gcc-8.5.0
loongarch             randconfig-002-20250429    clang-21
loongarch             randconfig-002-20250501    gcc-7.5.0
loongarch             randconfig-002-20250501    gcc-8.5.0
loongarch             randconfig-002-20250502    gcc-8.5.0
loongarch             randconfig-002-20250503    gcc-8.5.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-21
mips                  cavium_octeon_defconfig    clang-21
mips                          eyeq6_defconfig    clang-21
mips                           ip28_defconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
mips                        maltaup_defconfig    clang-16
mips                         rt305x_defconfig    clang-21
mips                         rt305x_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250429    clang-21
nios2                 randconfig-001-20250501    gcc-7.5.0
nios2                 randconfig-001-20250501    gcc-8.5.0
nios2                 randconfig-001-20250502    gcc-8.5.0
nios2                 randconfig-001-20250503    gcc-8.5.0
nios2                 randconfig-002-20250429    clang-21
nios2                 randconfig-002-20250501    gcc-7.5.0
nios2                 randconfig-002-20250501    gcc-8.5.0
nios2                 randconfig-002-20250502    gcc-8.5.0
nios2                 randconfig-002-20250503    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-21
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250429    clang-21
parisc                randconfig-001-20250501    gcc-7.5.0
parisc                randconfig-001-20250501    gcc-8.5.0
parisc                randconfig-001-20250502    gcc-8.5.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250429    clang-21
parisc                randconfig-002-20250501    gcc-7.5.0
parisc                randconfig-002-20250501    gcc-8.5.0
parisc                randconfig-002-20250502    gcc-8.5.0
parisc                randconfig-002-20250503    gcc-8.5.0
parisc64                         alldefconfig    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                       ebony_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-16
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    clang-16
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                 mpc836x_rdk_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250429    clang-21
powerpc               randconfig-001-20250501    gcc-7.5.0
powerpc               randconfig-001-20250501    gcc-8.5.0
powerpc               randconfig-001-20250502    gcc-8.5.0
powerpc               randconfig-001-20250503    gcc-8.5.0
powerpc               randconfig-002-20250429    clang-21
powerpc               randconfig-002-20250501    gcc-7.5.0
powerpc               randconfig-002-20250501    gcc-8.5.0
powerpc               randconfig-002-20250502    gcc-8.5.0
powerpc               randconfig-002-20250503    gcc-8.5.0
powerpc               randconfig-003-20250429    clang-21
powerpc               randconfig-003-20250501    gcc-7.5.0
powerpc               randconfig-003-20250501    gcc-8.5.0
powerpc               randconfig-003-20250502    gcc-8.5.0
powerpc               randconfig-003-20250503    gcc-8.5.0
powerpc                     sequoia_defconfig    gcc-14.2.0
powerpc                    socrates_defconfig    clang-21
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    clang-21
powerpc                     tqm8560_defconfig    clang-16
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250429    clang-21
powerpc64             randconfig-001-20250501    gcc-7.5.0
powerpc64             randconfig-001-20250501    gcc-8.5.0
powerpc64             randconfig-001-20250502    gcc-8.5.0
powerpc64             randconfig-001-20250503    gcc-8.5.0
powerpc64             randconfig-002-20250429    clang-21
powerpc64             randconfig-002-20250501    gcc-7.5.0
powerpc64             randconfig-002-20250501    gcc-8.5.0
powerpc64             randconfig-002-20250502    gcc-8.5.0
powerpc64             randconfig-002-20250503    gcc-8.5.0
powerpc64             randconfig-003-20250429    clang-21
powerpc64             randconfig-003-20250501    gcc-7.5.0
powerpc64             randconfig-003-20250501    gcc-8.5.0
powerpc64             randconfig-003-20250502    gcc-8.5.0
powerpc64             randconfig-003-20250503    gcc-8.5.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250429    gcc-12
riscv                 randconfig-001-20250501    gcc-14.2.0
riscv                 randconfig-001-20250502    gcc-13.3.0
riscv                 randconfig-001-20250503    gcc-10.5.0
riscv                 randconfig-002-20250429    gcc-12
riscv                 randconfig-002-20250501    gcc-14.2.0
riscv                 randconfig-002-20250502    gcc-13.3.0
riscv                 randconfig-002-20250503    gcc-10.5.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250429    gcc-12
s390                  randconfig-001-20250501    gcc-14.2.0
s390                  randconfig-001-20250502    gcc-13.3.0
s390                  randconfig-001-20250503    gcc-10.5.0
s390                  randconfig-002-20250429    gcc-12
s390                  randconfig-002-20250501    gcc-14.2.0
s390                  randconfig-002-20250502    gcc-13.3.0
s390                  randconfig-002-20250503    gcc-10.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                             espt_defconfig    clang-21
sh                 kfr2r09-romimage_defconfig    clang-21
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250429    gcc-12
sh                    randconfig-001-20250501    gcc-14.2.0
sh                    randconfig-001-20250502    gcc-13.3.0
sh                    randconfig-001-20250503    gcc-10.5.0
sh                    randconfig-002-20250429    gcc-12
sh                    randconfig-002-20250501    gcc-14.2.0
sh                    randconfig-002-20250502    gcc-13.3.0
sh                    randconfig-002-20250503    gcc-10.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    clang-21
sh                   rts7751r2dplus_defconfig    clang-16
sh                          sdk7780_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                           se7721_defconfig    clang-21
sh                           se7780_defconfig    clang-21
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250429    gcc-12
sparc                 randconfig-001-20250501    gcc-14.2.0
sparc                 randconfig-001-20250502    gcc-13.3.0
sparc                 randconfig-001-20250503    gcc-10.5.0
sparc                 randconfig-002-20250429    gcc-12
sparc                 randconfig-002-20250501    gcc-14.2.0
sparc                 randconfig-002-20250502    gcc-13.3.0
sparc                 randconfig-002-20250503    gcc-10.5.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250429    gcc-12
sparc64               randconfig-001-20250501    gcc-14.2.0
sparc64               randconfig-001-20250502    gcc-13.3.0
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-002-20250429    gcc-12
sparc64               randconfig-002-20250501    gcc-14.2.0
sparc64               randconfig-002-20250502    gcc-13.3.0
sparc64               randconfig-002-20250503    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250429    gcc-12
um                    randconfig-001-20250501    gcc-14.2.0
um                    randconfig-001-20250502    gcc-13.3.0
um                    randconfig-001-20250503    gcc-10.5.0
um                    randconfig-002-20250429    gcc-12
um                    randconfig-002-20250501    gcc-14.2.0
um                    randconfig-002-20250502    gcc-13.3.0
um                    randconfig-002-20250503    gcc-10.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250429    clang-20
x86_64      buildonly-randconfig-001-20250429    gcc-12
x86_64      buildonly-randconfig-001-20250501    gcc-12
x86_64      buildonly-randconfig-001-20250502    clang-20
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250429    clang-20
x86_64      buildonly-randconfig-002-20250429    gcc-12
x86_64      buildonly-randconfig-002-20250501    gcc-12
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250429    clang-20
x86_64      buildonly-randconfig-003-20250501    gcc-12
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250429    clang-20
x86_64      buildonly-randconfig-004-20250429    gcc-12
x86_64      buildonly-randconfig-004-20250501    gcc-12
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250429    clang-20
x86_64      buildonly-randconfig-005-20250501    gcc-12
x86_64      buildonly-randconfig-005-20250502    clang-20
x86_64      buildonly-randconfig-005-20250503    gcc-12
x86_64      buildonly-randconfig-006-20250429    clang-20
x86_64      buildonly-randconfig-006-20250429    gcc-12
x86_64      buildonly-randconfig-006-20250501    gcc-12
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64      buildonly-randconfig-006-20250503    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250429    clang-20
x86_64                randconfig-001-20250501    clang-20
x86_64                randconfig-001-20250502    clang-20
x86_64                randconfig-001-20250503    clang-20
x86_64                randconfig-001-20250506    clang-20
x86_64                randconfig-002-20250429    clang-20
x86_64                randconfig-002-20250501    clang-20
x86_64                randconfig-002-20250502    clang-20
x86_64                randconfig-002-20250503    clang-20
x86_64                randconfig-002-20250506    clang-20
x86_64                randconfig-003-20250429    clang-20
x86_64                randconfig-003-20250501    clang-20
x86_64                randconfig-003-20250502    clang-20
x86_64                randconfig-003-20250503    clang-20
x86_64                randconfig-003-20250506    clang-20
x86_64                randconfig-004-20250429    clang-20
x86_64                randconfig-004-20250501    clang-20
x86_64                randconfig-004-20250502    clang-20
x86_64                randconfig-004-20250503    clang-20
x86_64                randconfig-004-20250506    clang-20
x86_64                randconfig-005-20250429    clang-20
x86_64                randconfig-005-20250501    clang-20
x86_64                randconfig-005-20250502    clang-20
x86_64                randconfig-005-20250503    clang-20
x86_64                randconfig-005-20250506    clang-20
x86_64                randconfig-006-20250429    clang-20
x86_64                randconfig-006-20250501    clang-20
x86_64                randconfig-006-20250502    clang-20
x86_64                randconfig-006-20250503    clang-20
x86_64                randconfig-006-20250506    clang-20
x86_64                randconfig-007-20250429    clang-20
x86_64                randconfig-007-20250501    clang-20
x86_64                randconfig-007-20250502    clang-20
x86_64                randconfig-007-20250503    clang-20
x86_64                randconfig-007-20250506    clang-20
x86_64                randconfig-008-20250429    clang-20
x86_64                randconfig-008-20250501    clang-20
x86_64                randconfig-008-20250502    clang-20
x86_64                randconfig-008-20250503    clang-20
x86_64                randconfig-008-20250506    clang-20
x86_64                randconfig-071-20250429    gcc-12
x86_64                randconfig-071-20250501    gcc-12
x86_64                randconfig-071-20250502    clang-20
x86_64                randconfig-071-20250503    clang-20
x86_64                randconfig-071-20250506    clang-20
x86_64                randconfig-072-20250429    gcc-12
x86_64                randconfig-072-20250501    gcc-12
x86_64                randconfig-072-20250502    clang-20
x86_64                randconfig-072-20250503    clang-20
x86_64                randconfig-072-20250506    clang-20
x86_64                randconfig-073-20250429    gcc-12
x86_64                randconfig-073-20250501    gcc-12
x86_64                randconfig-073-20250502    clang-20
x86_64                randconfig-073-20250503    clang-20
x86_64                randconfig-073-20250506    clang-20
x86_64                randconfig-074-20250429    gcc-12
x86_64                randconfig-074-20250501    gcc-12
x86_64                randconfig-074-20250502    clang-20
x86_64                randconfig-074-20250503    clang-20
x86_64                randconfig-074-20250506    clang-20
x86_64                randconfig-075-20250429    gcc-12
x86_64                randconfig-075-20250501    gcc-12
x86_64                randconfig-075-20250502    clang-20
x86_64                randconfig-075-20250503    clang-20
x86_64                randconfig-075-20250506    clang-20
x86_64                randconfig-076-20250429    gcc-12
x86_64                randconfig-076-20250501    gcc-12
x86_64                randconfig-076-20250502    clang-20
x86_64                randconfig-076-20250503    clang-20
x86_64                randconfig-076-20250506    clang-20
x86_64                randconfig-077-20250429    gcc-12
x86_64                randconfig-077-20250501    gcc-12
x86_64                randconfig-077-20250502    clang-20
x86_64                randconfig-077-20250503    clang-20
x86_64                randconfig-077-20250506    clang-20
x86_64                randconfig-078-20250429    gcc-12
x86_64                randconfig-078-20250501    gcc-12
x86_64                randconfig-078-20250502    clang-20
x86_64                randconfig-078-20250503    clang-20
x86_64                randconfig-078-20250506    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250429    gcc-12
xtensa                randconfig-001-20250501    gcc-14.2.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-002-20250429    gcc-12
xtensa                randconfig-002-20250501    gcc-14.2.0
xtensa                randconfig-002-20250502    gcc-13.3.0
xtensa                randconfig-002-20250503    gcc-10.5.0
xtensa                         virt_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
