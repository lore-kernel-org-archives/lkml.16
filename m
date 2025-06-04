Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C60202C45
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063704; cv=none; b=n8JEEKGqphzICKgWdlocLa05xGCnDlnTtR3l004IUAUtjVKRSMJhlKrzGVeiQMMGzJvX9hUYGIrtzAmd8H2oAnWUEUVzpxZJR0z+61bjx3k4l44lOIqz5LJ0TOikfObr0pCQf77Ivpkudjpk1Fqth/fl8LDSolc7rlqoN0pVqEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063704; c=relaxed/simple;
	bh=0qNQt1AtXNAZQbkPpd3pq82k8L3i65q5AQtq4rHphBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E3vSVYdfoCIqO40RCzWo9FX2Cu6m0kUX85rhzi2PluvjQ8A0x8MSLaZXkwxv/C/HUK+miKKp/rPf8MFLwwzmCiiyVkFChMP1QmbEpHz4AZqrZKEDpfJ0ReutsZFwv3Q7KCyaz83JvF6XzA9iFwpoH1S1BTRsnAbOD5fUHUv6QEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckSEgSd3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckSEgSd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749063703; x=1780599703;
  h=date:from:to:cc:subject:message-id;
  bh=0qNQt1AtXNAZQbkPpd3pq82k8L3i65q5AQtq4rHphBI=;
  b=ckSEgSd3KMBgJgrJmME8nOccOnTVbZ8Ss6FUA7ZX8tcQW1I1Bt+n+O9F
   DsAL6fq5wnLbl/zEg0aXOXCqjgIQxnFFbiSruW2jR0g6XzVX6vUbYBt0F
   j7gMJ0PyOJ1CybQ80AwyRWU7qiv6wWVKxNQ/DQk6aMlFvFOfmyiZtdNmF
   KTH7iqg8/lJaSw6ABB61+N5+VyXGCNqzFaaIQx9T+8qLNR1zd3AH22/Kg
   Xg2cSf55ejjnNRuYbyokv0FbMMWSSi6XGCUt0slwXaFfR8kYgN1UUn/+2
   bLCoEgncciLMPNP9U/92VMJqiIfynQknVi0BDfPNcmRlWTshKZrRsx6+W
   A==;
X-CSE-ConnectionGUID: HX4fiEvVTWO5VnimSwtMcQ==
X-CSE-MsgGUID: SB9xaYv2QyC35BOP6pmtIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62221739"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="62221739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 12:01:25 -0700
X-CSE-ConnectionGUID: P1kJUs7gRvSRZhKsB6h4CQ==
X-CSE-MsgGUID: oNU6dr2VQJGOnUIlIV0sGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145873171"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2025 12:01:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMtMX-0003P3-2m;
	Wed, 04 Jun 2025 19:01:21 +0000
Date: Thu, 05 Jun 2025 03:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 9362569b217891020ef02d31dfdda7657bb8f394
Message-ID: <202506050312.XLFf87Qa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 9362569b217891020ef02d31dfdda7657bb8f394  Merge branch into tip/master: 'x86/urgent'

elapsed time: 735m

configs tested: 94
configs skipped: 136

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                        vdk_hs38_defconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250604    clang-20
i386        buildonly-randconfig-002-20250604    gcc-12
i386        buildonly-randconfig-003-20250604    gcc-12
i386        buildonly-randconfig-004-20250604    gcc-12
i386        buildonly-randconfig-005-20250604    clang-20
i386        buildonly-randconfig-006-20250604    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250604    clang-20
i386                  randconfig-002-20250604    clang-20
i386                  randconfig-003-20250604    clang-20
i386                  randconfig-004-20250604    clang-20
i386                  randconfig-005-20250604    clang-20
i386                  randconfig-006-20250604    clang-20
i386                  randconfig-007-20250604    clang-20
i386                  randconfig-011-20250604    gcc-12
i386                  randconfig-012-20250604    gcc-12
i386                  randconfig-013-20250604    gcc-12
i386                  randconfig-014-20250604    gcc-12
i386                  randconfig-015-20250604    gcc-12
i386                  randconfig-016-20250604    gcc-12
i386                  randconfig-017-20250604    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                           sun3_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-21
nios2                               defconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
parisc                            allnoconfig    clang-21
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-21
powerpc                           allnoconfig    clang-21
powerpc                     ep8248e_defconfig    clang-21
riscv                             allnoconfig    clang-21
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250604    gcc-12
x86_64      buildonly-randconfig-002-20250604    gcc-12
x86_64      buildonly-randconfig-003-20250604    gcc-12
x86_64      buildonly-randconfig-004-20250604    gcc-12
x86_64      buildonly-randconfig-005-20250604    gcc-12
x86_64      buildonly-randconfig-006-20250604    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250604    clang-20
x86_64                randconfig-002-20250604    clang-20
x86_64                randconfig-003-20250604    clang-20
x86_64                randconfig-004-20250604    clang-20
x86_64                randconfig-005-20250604    clang-20
x86_64                randconfig-006-20250604    clang-20
x86_64                randconfig-007-20250604    clang-20
x86_64                randconfig-008-20250604    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
