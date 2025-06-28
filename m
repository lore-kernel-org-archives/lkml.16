Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D5A42AB0
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751116823; cv=none; b=K/or9e+gQLq+MkbocpF9TWyPl58cgKdbvGW1uo2cPKUGpcQpHA2+JRsDwbjexpzl3XqBMesZEl0AlIVQh6/m8tvaPvwTwzh9ModBPSb+T59L7xOwn2AE15a4cHaHE3oYR6lFZC50x+DL90GfvaNqrMDUxYoNgSqryJd3BnALbwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751116823; c=relaxed/simple;
	bh=oswXhyBbvpRNRv19VZj/3Z9Hvi/fg17xyTkDcMlj98g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mNTq/Rotal5+ILq/iZ0wxdXM12XKIAdQoyUasJt0Kx7CuYCizJD31J+HDLMzt3Jcw7lTa7ozq0RY1m44230A1N6Z3l74qf4qTSXhG/ik9Qcb4smtbERrecR8T2/AtdfNV44zDHmsPl0KYtdHnF+YCBBgHw2UImjbfmPwtP2lUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0PtT+YB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0PtT+YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751116821; x=1782652821;
  h=date:from:to:cc:subject:message-id;
  bh=oswXhyBbvpRNRv19VZj/3Z9Hvi/fg17xyTkDcMlj98g=;
  b=B0PtT+YBN/a+na3SV4UOQhgQLTQidKAFlou7/n/qtkH2OmxlBLTylWQR
   gUyUvC4np9HKGIi3oXczknLhiTdwkvbbHuxLCRxVVZkeuSMNw7eBpdMdA
   6cd8SuTOkcAVWCMX7HeqHb39XeV2V61zuIQltVeV8El7AbZb86tmzM3q2
   nw88iyjAvrN1SXw1G+zdlmnhheOiZ9ajlUVxUv3rxwapJL6oZfMFwMaq9
   u2Oon6+sqtED68pnOyUmH3faq2e/Muuxnd9rb7F4sKLGQ4h3QcTnyuQzd
   qBb0vwMLyAGdBVwOPpzd1PLMT71zl+278GGlkNmxFwSte6I3cCm0prO9y
   Q==;
X-CSE-ConnectionGUID: axJZVpqMQTe7WPjBMYaQWw==
X-CSE-MsgGUID: c2glFs90SyOq0qDEool5fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53278044"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53278044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 06:20:19 -0700
X-CSE-ConnectionGUID: CcjX4sauQtOHtdDYYqkq6w==
X-CSE-MsgGUID: US/Y/UI8ShWDAnjnK0hFwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153213506"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jun 2025 06:20:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVVTc-000X4L-0f;
	Sat, 28 Jun 2025 13:20:16 +0000
Date: Sat, 28 Jun 2025 21:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/sev] BUILD SUCCESS
 a7549636f67f973474ebe1ad262acc2aa4d1327d
Message-ID: <202506282135.V0nvwzrK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sev
branch HEAD: a7549636f67f973474ebe1ad262acc2aa4d1327d  x86/sev: Let sev_es_efi_map_ghcbs() map the CA pages too

elapsed time: 1454m

configs tested: 126
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250627    gcc-8.5.0
arc                   randconfig-002-20250627    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     davinci_all_defconfig    clang-19
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250627    gcc-15.1.0
arm                   randconfig-002-20250627    gcc-10.5.0
arm                   randconfig-003-20250627    clang-21
arm                   randconfig-004-20250627    gcc-8.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250627    clang-17
arm64                 randconfig-002-20250627    gcc-10.5.0
arm64                 randconfig-003-20250627    gcc-12.3.0
arm64                 randconfig-004-20250627    clang-19
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250628    gcc-14.3.0
csky                  randconfig-002-20250628    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250628    clang-21
hexagon               randconfig-002-20250628    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250627    gcc-12
i386        buildonly-randconfig-002-20250627    gcc-12
i386        buildonly-randconfig-003-20250627    gcc-12
i386        buildonly-randconfig-004-20250627    gcc-12
i386        buildonly-randconfig-005-20250627    clang-20
i386        buildonly-randconfig-006-20250627    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250628    gcc-12.4.0
loongarch             randconfig-002-20250628    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ci20_defconfig    clang-21
mips                     loongson1b_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250628    gcc-8.5.0
nios2                 randconfig-002-20250628    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250628    gcc-8.5.0
parisc                randconfig-002-20250628    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      bamboo_defconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                 canyonlands_defconfig    clang-21
powerpc               randconfig-001-20250628    gcc-8.5.0
powerpc               randconfig-002-20250628    clang-19
powerpc               randconfig-003-20250628    clang-21
powerpc64             randconfig-001-20250628    clang-20
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250627    gcc-8.5.0
riscv                 randconfig-002-20250627    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250627    clang-21
s390                  randconfig-002-20250627    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250627    gcc-9.3.0
sh                    randconfig-002-20250627    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250627    gcc-11.5.0
sparc                 randconfig-002-20250627    gcc-8.5.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250627    gcc-11.5.0
sparc64               randconfig-002-20250627    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250627    gcc-12
um                    randconfig-002-20250627    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250627    clang-20
x86_64      buildonly-randconfig-002-20250627    clang-20
x86_64      buildonly-randconfig-003-20250627    clang-20
x86_64      buildonly-randconfig-004-20250627    clang-20
x86_64      buildonly-randconfig-005-20250627    gcc-12
x86_64      buildonly-randconfig-006-20250627    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250627    gcc-13.3.0
xtensa                randconfig-002-20250627    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
