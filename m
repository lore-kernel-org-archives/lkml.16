Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36EB22C322
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744778642; cv=none; b=hpQENTQRAdDgbEA1N1jx5YETSNFWEFQbsPiUr+YntHXNLBnkdnTuUTe1IkXQOedsMjjnfhwjv9TWbALZdO7E4lCPatq7h47p83123kZFzcxFzO5MON6BcD4M1jO0w2iM2nNR1JAG9N2YVQXZ0QpbttmmU+0nKuKlpt6TAXhkS7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744778642; c=relaxed/simple;
	bh=jTyJML6ihTQRT+ad4rMpOUabYcYRP2xi4wobRhfPy+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rSLYjaSCfCHnS7O9dvY0xQU2wQI9xm4L+Dy6DaZY+gG457T4sUY8jKCegpMgIcstf6Oad9F+N8/yIOZDFkhm6wmWaRUbzRL1nnLPuRVVuK7TBlI4c98vh1VoZzy6cbU+/AT0/hY4Ozo7qFiRwD85hVkTZbacS500oilc+DOIz7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMymSafZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMymSafZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744778640; x=1776314640;
  h=date:from:to:cc:subject:message-id;
  bh=jTyJML6ihTQRT+ad4rMpOUabYcYRP2xi4wobRhfPy+k=;
  b=JMymSafZ+7TrZS2F44+AhAbc8jp7Wo+fbJwws7XkBISKxQHj02ZqOHDV
   OsJW77UfITVB7tT0TXnIINvqB/pwVS+Kg9bicGVu+B5D66UVvlErkQ+sD
   UxepGcVjRycxBtfjOO8fLMG6KUzHSahslPOqELKHYmaGWRxai3J2VItuK
   HEXzQ7QxfaZkIteqgX8p9wE27fjWzJwDf9/AfBjKuMq7pcWSzdKHYnt3W
   3LwIADO+EHpmzrE03fBXMxuPVg5n42BArc1BMt1A8OkvxWebl0LNNL+Sa
   a3Hrn0dTqOxzbmCdQck+7zjOwWtbK4STKswnRy2FaIrya7i7qU6h9xIRT
   A==;
X-CSE-ConnectionGUID: 3KvD6bfFRCaRAYPy5xgg8g==
X-CSE-MsgGUID: sPMpYyHWTT2O3AkqgpJp/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56487274"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56487274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 21:44:00 -0700
X-CSE-ConnectionGUID: A0kgyDubSumryDXOO3U41w==
X-CSE-MsgGUID: jw63/pZcS1G7Fndw6zZo9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131286527"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Apr 2025 21:43:59 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4kkK-000GpO-2E;
	Tue, 15 Apr 2025 18:10:56 +0000
Date: Wed, 16 Apr 2025 02:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/drivers] BUILD SUCCESS
 e96b93a97c90181627cef6e70a0dbc8dbdae4adc
Message-ID: <202504160218.02emiRCi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
branch HEAD: e96b93a97c90181627cef6e70a0dbc8dbdae4adc  irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller

elapsed time: 1454m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250415    gcc-14.2.0
arc                   randconfig-002-20250415    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250415    clang-21
arm                   randconfig-002-20250415    clang-21
arm                   randconfig-003-20250415    gcc-10.5.0
arm                   randconfig-004-20250415    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250415    clang-16
arm64                 randconfig-002-20250415    gcc-7.5.0
arm64                 randconfig-003-20250415    gcc-9.5.0
arm64                 randconfig-004-20250415    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250415    gcc-13.3.0
csky                  randconfig-002-20250415    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250415    clang-20
hexagon               randconfig-002-20250415    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250415    clang-20
i386        buildonly-randconfig-002-20250415    clang-20
i386        buildonly-randconfig-003-20250415    clang-20
i386        buildonly-randconfig-004-20250415    clang-20
i386        buildonly-randconfig-005-20250415    gcc-12
i386        buildonly-randconfig-006-20250415    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250415    gcc-14.2.0
loongarch             randconfig-002-20250415    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250415    gcc-13.3.0
nios2                 randconfig-002-20250415    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250415    gcc-12.4.0
parisc                randconfig-002-20250415    gcc-10.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-21
powerpc               randconfig-001-20250415    gcc-5.5.0
powerpc               randconfig-002-20250415    clang-17
powerpc               randconfig-003-20250415    gcc-7.5.0
powerpc                     redwood_defconfig    clang-21
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250415    gcc-7.5.0
powerpc64             randconfig-002-20250415    clang-17
powerpc64             randconfig-003-20250415    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250415    gcc-14.2.0
riscv                 randconfig-002-20250415    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250415    clang-21
s390                  randconfig-002-20250415    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250415    gcc-11.5.0
sh                    randconfig-002-20250415    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250415    gcc-6.5.0
sparc                 randconfig-002-20250415    gcc-12.4.0
sparc64               randconfig-001-20250415    gcc-14.2.0
sparc64               randconfig-002-20250415    gcc-12.4.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250415    clang-21
um                    randconfig-002-20250415    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250415    clang-20
x86_64      buildonly-randconfig-002-20250415    gcc-11
x86_64      buildonly-randconfig-003-20250415    gcc-12
x86_64      buildonly-randconfig-004-20250415    clang-20
x86_64      buildonly-randconfig-005-20250415    clang-20
x86_64      buildonly-randconfig-006-20250415    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250415    gcc-6.5.0
xtensa                randconfig-002-20250415    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
