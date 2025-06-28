Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716CB2BAF9
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751116761; cv=none; b=GyPXmr+D1YG5/EE2t6AkL6HUt5e6E4+qVfXEgalq/GiY+MbAMnYjQvna0Sd7m5FWr+y9y4A90wZZK+GScKMWqYb0o4VtRCBpeNbH40x1MzFxj4fXxSRh/5vc/JTPKf3DxJooHTDyMvZIMnKIjFuQUxhTO5hOMzC/RA1J3STfW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751116761; c=relaxed/simple;
	bh=Dbxi3Bny8+UdnTgFWb11hTkWBqmjm9gzfLwgb1pNLKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mcsIsSgg7lhktkWFeu9i6LMjfH3WNFeVXOaYCjPJFRfclISM9ua24Z8lhNmUMxX7CCyPocGBevDTf6wpor0MkZxU9IYuAW0Pu9DVaiG5B8306vZm9tI5vEYZQ6qYB/kf+12F4nmEdoVIP6oepTPLSMIn094t/bWU+7J1MRY3OhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTPr7yHx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTPr7yHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751116760; x=1782652760;
  h=date:from:to:cc:subject:message-id;
  bh=Dbxi3Bny8+UdnTgFWb11hTkWBqmjm9gzfLwgb1pNLKI=;
  b=bTPr7yHxIxlo3iof3GfQKBtZvydvRzeYMTo/COesqQWthDUYRaxokEEE
   05zsFlOMjTMqol9vpnVRcn6165W7o2R7cATn1qU5quBDzlfUwyN6WYRA0
   oabpFFTJrzpG9RIgvgx5XG5g14jOUCbyyB7r9vlCkA1LDAFl2A1MYDRpR
   2J7MKDKdPmiyqi6TAHmKFmXVHBbcOoCdYknv0Z80fiY8b2ejfFkglk2O/
   mbSS/ZKu7Ca5ioo6NL15FS+F3WiyHqtbPbNQJV1h22isPcuxIFHTfS8fG
   jW+T+wfUgfYuTds8JDC8Z2IpM7u++akBOYt+jyoS4L3nsEd9FEO+duXYL
   g==;
X-CSE-ConnectionGUID: RdAYQjzeShuVfz3uVUfzaA==
X-CSE-MsgGUID: bQSWpFVrR4GMunmtU2U3yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53278011"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53278011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 06:19:19 -0700
X-CSE-ConnectionGUID: 0z3vnR6NR8WUl893WZkqag==
X-CSE-MsgGUID: 853rQHErS3mad5vz89arfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153213297"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jun 2025 06:19:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVVSd-000X4D-2U;
	Sat, 28 Jun 2025 13:19:15 +0000
Date: Sat, 28 Jun 2025 21:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core/bugs] BUILD SUCCESS
 e7e26cfad96c57c81156693cbf63032d899fe7c9
Message-ID: <202506282132.fnvnMVqb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/bugs
branch HEAD: e7e26cfad96c57c81156693cbf63032d899fe7c9  bugs/s390: Remove private WARN_ON() implementation

elapsed time: 1453m

configs tested: 119
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250627    gcc-8.5.0
arc                   randconfig-002-20250627    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                           h3600_defconfig    gcc-15.1.0
arm                   randconfig-001-20250627    gcc-15.1.0
arm                   randconfig-002-20250627    gcc-10.5.0
arm                   randconfig-003-20250627    clang-21
arm                   randconfig-004-20250627    gcc-8.5.0
arm                        spear3xx_defconfig    clang-17
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
loongarch             randconfig-001-20250628    gcc-12.4.0
loongarch             randconfig-002-20250628    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250628    gcc-8.5.0
nios2                 randconfig-002-20250628    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250628    gcc-8.5.0
parisc                randconfig-002-20250628    gcc-12.4.0
powerpc                     akebono_defconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc               randconfig-001-20250628    gcc-8.5.0
powerpc               randconfig-002-20250628    clang-19
powerpc               randconfig-003-20250628    clang-21
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250628    clang-20
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250628    clang-21
riscv                 randconfig-002-20250628    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250628    clang-21
s390                  randconfig-002-20250628    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250628    gcc-15.1.0
sh                    randconfig-002-20250628    gcc-9.3.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250628    gcc-8.5.0
sparc                 randconfig-002-20250628    gcc-12.4.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64               randconfig-001-20250628    gcc-8.5.0
sparc64               randconfig-002-20250628    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250628    gcc-12
um                    randconfig-002-20250628    clang-20
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
xtensa                randconfig-001-20250628    gcc-11.5.0
xtensa                randconfig-002-20250628    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
