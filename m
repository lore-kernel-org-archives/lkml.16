Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E993242904
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896942; cv=none; b=fwyhMIh/o9yCuJ3DbjxvNP5qLC1R7RDAHC960hR2b1YkU1buKRqXvtUz3uTWuxIJTZz5e6AUQAL1cWwkw+xuoTeBWoxM7nu687oXtlsOa5nWFxhtM7o4YGyjn/HUw8CdRd5mk8MQFauCcc5XUH5R7oeIkPbMHZYhiyIkVhq6DTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896942; c=relaxed/simple;
	bh=9+waGCNIm0OPgHizo1NKmPeiIC961/3UFO6NV5b7X0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jJ383uYn9Cpkk9h538d2jGA/ZxTh8yp5m7dnMc5t+r7HI3PIXi7QpGpUNi1ZYfi8aDO/p4fPTOkJak/hqUFy/pLUTB6luj1Zu9nAgAZWnrBoZUUXz8cm2Xl59Hl/OduuqsBVTYMpdikKWfi4O6v7aRiaHxzNcXaVgIMle0BtVJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VITLWMnD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VITLWMnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744896941; x=1776432941;
  h=date:from:to:cc:subject:message-id;
  bh=9+waGCNIm0OPgHizo1NKmPeiIC961/3UFO6NV5b7X0c=;
  b=VITLWMnDdWCFYIxd5aDCQlUfJZPrj2GEUWXHUGMjY1B9h9NpBsM3auU7
   RdAQZMr+Z+ZlkO/AxErUXA6CArPO8Df7g20MgXHj5ouo2cf2BZACQXTzS
   mlSvvUBAjXlmfgL4y1mZGu75/J6p9OhRJ63LwbeNnZJiCfEnlzwFwVCwd
   F9LSmZee7bs9aRZ8iSiQe0/1wO0W5tlEMAvoIvH2UEbtKY5YbhXvOqb4r
   kvyHiQmEhLPhqZJ4gEkkq5CcR87t8EQPQdzRNmVe/IvR7mmHqFZbgysYz
   mGnNHUeOXVrEzG4sBYYhN1xv8WOERq6jKpEYdCbjuDgKuMwA9j/maBDNj
   A==;
X-CSE-ConnectionGUID: j3xJU82mQ+mGt9Ssp8vGgg==
X-CSE-MsgGUID: f8klAz/hS+Ob24Rmbpl8CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50132338"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50132338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:35:39 -0700
X-CSE-ConnectionGUID: gqm5unVPTJ2rtmsZ4m5x+g==
X-CSE-MsgGUID: f6pOaH1DS2uzeaoV9hHS7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135971101"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Apr 2025 06:35:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5POy-000N2t-0U;
	Thu, 17 Apr 2025 13:35:36 +0000
Date: Thu, 17 Apr 2025 21:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/urgent] BUILD SUCCESS
 9b3ae50cb902322a2b5922b9fcf8132d9b4c2a24
Message-ID: <202504172117.vHb1QAxw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 9b3ae50cb902322a2b5922b9fcf8132d9b4c2a24  irqchip/irq-bcm2712-mip: Enable driver when ARCH_BCM2835 is enabled

elapsed time: 1458m

configs tested: 112
configs skipped: 2

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
arm                            mmp2_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                   randconfig-001-20250417    gcc-7.5.0
arm                   randconfig-002-20250417    clang-16
arm                   randconfig-003-20250417    gcc-10.5.0
arm                   randconfig-004-20250417    gcc-6.5.0
arm                         s5pv210_defconfig    gcc-14.2.0
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
mips                        bcm63xx_defconfig    clang-21
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250417    gcc-11.5.0
nios2                 randconfig-002-20250417    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250417    gcc-12.4.0
parisc                randconfig-002-20250417    gcc-6.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    clang-21
powerpc               randconfig-001-20250417    clang-21
powerpc               randconfig-002-20250417    gcc-9.3.0
powerpc               randconfig-003-20250417    gcc-9.3.0
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250417    clang-21
powerpc64             randconfig-002-20250417    clang-21
powerpc64             randconfig-003-20250417    gcc-5.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250417    gcc-7.5.0
riscv                 randconfig-002-20250417    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250417    gcc-7.5.0
s390                  randconfig-002-20250417    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250417    gcc-13.3.0
sh                    randconfig-002-20250417    gcc-7.5.0
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
xtensa                randconfig-001-20250417    gcc-8.5.0
xtensa                randconfig-002-20250417    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
