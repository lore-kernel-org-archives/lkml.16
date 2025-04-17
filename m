Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272412459C2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896338; cv=none; b=nKrSJVVx0hkAQTd02TyIWT2wrnlZkJmltQP4xG1kVGTndxmf0mSQh3mknzS9R+BBDVHbM9xg2NLeCFrV0Me7C17E2BHgxByeov5N8LRT5h3fJy0MJbf1eoyCsfjkUa/0z8XP671+iTRWwvI56SdLRBZ5ieQIxAWfYV5Z/vGcVbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896338; c=relaxed/simple;
	bh=yO/X2Lc+Vc+y6EqE1GD2spaSU9G2Rtby76SZq5hc96M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hHYSzpgparwC4rv8XvOaFSkDfGNYOayrYXTe3GJX3mGthtcAPdb8jXsvN2a7nHr9Kxs2P0N+cuLMWzD9GsNIufL9WZmrJAkkSZF5g87+jiscwPlmLM2bCPcJcmEB8TD5l0yiKCQUO/I5eEcsxWxm54RS4ettGXz5pOgg1elPT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6lFVZLC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6lFVZLC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744896337; x=1776432337;
  h=date:from:to:cc:subject:message-id;
  bh=yO/X2Lc+Vc+y6EqE1GD2spaSU9G2Rtby76SZq5hc96M=;
  b=X6lFVZLCrPwit0AUjxo+A//qWaO1TLIfZ8Eqgqu2BFoFEmnUVqMr5yO7
   rEiW3FYwZ26X2xmxrkSEDRjTaKY38fQ/r4FENnLcykWslnVCzqQgotjng
   STC5ZpX32LCO3BjUu+dz2h737XwYlkTv1329KSBGauaNhn1fJ0/0XHyrg
   CvobwNNiojZ9cVprYSJnIg8iK6+qUaCbfwDs9aNkMNYKYp8aaItINGjGO
   XNrTltDSD1ygrs0kiKoW6eIZWjuVKVBa35IZzmvUbc4E0zuSjsYfSN4dZ
   D6i/64VHYhS1qHXKl49s7Y/M1Ts2I2UwF2vDsbLq96z/Bm8aUuk5o3+c5
   Q==;
X-CSE-ConnectionGUID: cE+f+nmSTweppia+yp/9Gg==
X-CSE-MsgGUID: SogsETIuRiWXUWFjqtgimQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68974395"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="68974395"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:25:31 -0700
X-CSE-ConnectionGUID: obA4W5sfReqBIzepQaHiVw==
X-CSE-MsgGUID: JWa6Mqy3QnedP5n0jlGfbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135658125"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Apr 2025 06:25:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5PFA-000MrY-0j;
	Thu, 17 Apr 2025 13:25:28 +0000
Date: Thu, 17 Apr 2025 21:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/core] BUILD SUCCESS
 41c95ac4839401cb15e6c9a7756226f6af52ea49
Message-ID: <202504172148.phYvacnI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
branch HEAD: 41c95ac4839401cb15e6c9a7756226f6af52ea49  genirq/irqdesc: Use sysfs_emit() to instead of s*printf()

elapsed time: 1447m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250417    gcc-13.3.0
arc                   randconfig-002-20250417    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                       imx_v4_v5_defconfig    clang-21
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250417    gcc-7.5.0
arm                   randconfig-002-20250417    clang-16
arm                   randconfig-003-20250417    gcc-10.5.0
arm                   randconfig-004-20250417    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250417    gcc-7.5.0
arm64                 randconfig-002-20250417    gcc-5.5.0
arm64                 randconfig-003-20250417    clang-21
arm64                 randconfig-004-20250417    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250417    gcc-13.3.0
csky                  randconfig-002-20250417    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250417    clang-21
hexagon               randconfig-002-20250417    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250416    gcc-12
i386        buildonly-randconfig-003-20250416    gcc-12
i386        buildonly-randconfig-004-20250416    gcc-11
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250417    gcc-14.2.0
loongarch             randconfig-002-20250417    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250417    gcc-11.5.0
nios2                 randconfig-002-20250417    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250417    gcc-12.4.0
parisc                randconfig-002-20250417    gcc-6.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250417    clang-21
powerpc               randconfig-002-20250417    gcc-9.3.0
powerpc               randconfig-003-20250417    gcc-9.3.0
powerpc64             randconfig-001-20250417    clang-21
powerpc64             randconfig-002-20250417    clang-21
powerpc64             randconfig-003-20250417    gcc-5.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250417    gcc-7.5.0
riscv                 randconfig-002-20250417    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250417    gcc-7.5.0
s390                  randconfig-002-20250417    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250417    gcc-13.3.0
sh                    randconfig-002-20250417    gcc-7.5.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250417    gcc-12.4.0
sparc                 randconfig-002-20250417    gcc-14.2.0
sparc64               randconfig-001-20250417    gcc-14.2.0
sparc64               randconfig-002-20250417    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250417    gcc-12
um                    randconfig-002-20250417    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250417    clang-20
x86_64      buildonly-randconfig-002-20250417    clang-20
x86_64      buildonly-randconfig-003-20250417    gcc-12
x86_64      buildonly-randconfig-004-20250417    clang-20
x86_64      buildonly-randconfig-005-20250417    clang-20
x86_64      buildonly-randconfig-006-20250417    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250417    gcc-8.5.0
xtensa                randconfig-002-20250417    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
