Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705D933FD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 02:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746670440; cv=none; b=oLUserqaX5QpL1XuP6zu0nBxeFZczNvnux/MGaVkvy4vNkbGyC1RUPhO9NAW7Ny/8sZtv6VvPA9Noed6HsB2KHidhfT1Gqra8l3La/ckcBdUhfoXb5HN5+JE+odOMoCJCuHAKBLXMeyNxHdKAtlrq29WDvmgrq81uLKuyokh/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746670440; c=relaxed/simple;
	bh=+Q252jHG9JN92fi3VdPj4HXb4/qTqJcPO864/86+b78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C8mF57ekBm0d1OILwtEtEd5sI7xaoeHegU7nG0QZc2NVBlnsa2SPNS4VSJBr9NelfMnU/qyU8ZP2pP67EIwoe6z9d1fOFJwpnaGaKa2KjHkXYXL2Uobk3N7WpmACzdiEVdtccMpARZA/ESgHxOECn7HGYIG0NjN9GZxCh3MuRZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVEsJrqZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVEsJrqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746670438; x=1778206438;
  h=date:from:to:cc:subject:message-id;
  bh=+Q252jHG9JN92fi3VdPj4HXb4/qTqJcPO864/86+b78=;
  b=SVEsJrqZ5hQI00PZnckAoSgzmE+ebIY0uknoEkDQBLMBdJZfLGOcl+2e
   Y20RIUPLm6tJUGzWVikPW+M96QXOqDGECu3AYfbU/SbAdVs2gQNTpurlU
   KDvPGdCmW85h8Nm3JccY6XJ24XLVUBO4HzHj3Sf9ALdwtXygNW4FLhRDO
   e4N7tSRydt2NLdeAPmWFJg3DV3w7cNdpL5j5fkXsklHreaGRLtc7wXJl7
   kffOqOuPTLT7u0rxyGlVYjDccXel5R5G2dWim/bEy/qCHznADrIO2NEOJ
   GUbyvlNmvs8nQc4gaaKbOQBX5SINb18pQrIb62puBl0d7PE1y/IBfwRQc
   Q==;
X-CSE-ConnectionGUID: igIRLyUXRme2DtgUQsda3Q==
X-CSE-MsgGUID: /VXLOPHsS+yiNFzl0euXPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48514332"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48514332"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 19:13:58 -0700
X-CSE-ConnectionGUID: YRInsQYyQBSMXw5VbcNfpw==
X-CSE-MsgGUID: Uch6KoezQHOwI9ogyWHPAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141349254"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 19:13:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCqlm-0009Kb-1f;
	Thu, 08 May 2025 02:13:54 +0000
Date: Thu, 08 May 2025 10:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/urgent] BUILD SUCCESS
 38a05c0b87833f5b188ae43b428b1f792df2b384
Message-ID: <202505081045.YtW3s1v5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 38a05c0b87833f5b188ae43b428b1f792df2b384  irqchip/qcom-mpm: Prevent crash when trying to handle non-wake GPIOs

elapsed time: 7582m

configs tested: 101
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250503    gcc-14.2.0
arc                   randconfig-002-20250503    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250503    gcc-6.5.0
arm                   randconfig-002-20250503    clang-21
arm                   randconfig-003-20250503    gcc-6.5.0
arm                   randconfig-004-20250503    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250503    gcc-9.5.0
arm64                 randconfig-002-20250503    clang-21
arm64                 randconfig-003-20250503    clang-21
arm64                 randconfig-004-20250503    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250503    gcc-14.2.0
csky                  randconfig-002-20250503    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250503    clang-21
hexagon               randconfig-002-20250503    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250503    gcc-12
i386        buildonly-randconfig-002-20250503    gcc-12
i386        buildonly-randconfig-003-20250503    gcc-12
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-005-20250503    gcc-12
i386        buildonly-randconfig-006-20250503    gcc-12
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250503    gcc-14.2.0
loongarch             randconfig-002-20250503    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250503    gcc-11.5.0
nios2                 randconfig-002-20250503    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250503    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250503    gcc-5.5.0
powerpc               randconfig-002-20250503    gcc-9.3.0
powerpc               randconfig-003-20250503    clang-21
powerpc64             randconfig-001-20250503    gcc-7.5.0
powerpc64             randconfig-002-20250503    gcc-10.5.0
powerpc64             randconfig-003-20250503    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250503    clang-20
riscv                 randconfig-002-20250503    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250503    gcc-7.5.0
s390                  randconfig-002-20250503    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250503    gcc-5.5.0
sh                    randconfig-002-20250503    gcc-5.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250503    gcc-8.5.0
sparc                 randconfig-002-20250503    gcc-14.2.0
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-002-20250503    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250503    clang-21
um                    randconfig-002-20250503    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250503    clang-20
x86_64      buildonly-randconfig-006-20250503    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-002-20250503    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
