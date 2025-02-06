Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1B722540E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838295; cv=none; b=V5H33Vl144iTlEttl6NMX4c5C+ciff+EfHXnVoEhjmr9iIUmu+QoKYFo5valQLhbZG1m08cONoksgNxYM/443R2F5kb3LRFIHvXFSzKR38bFu8WUrx1JudRdXFgHA/h0sE6I0dg6G31szFIbuSWWIr01b72rNOE9rmhn7jHDhLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838295; c=relaxed/simple;
	bh=31c8hmGgQuapTJdvum2+hU7o816GmJ2H/I7CjcAC+IU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qk362qJ0iW84QOcBA5oUXiVourtoGpQAeYzi77RC5Sg8N35Zi5CKa5z4hfULiKtQwOW03hCDES11bOHVr8M/wBDNpRMZN+bHx9/9YvhbtaMlOahoWdIIHm/ocHRECNrojD0JZKd5ceZ7TUse9cO4dS3xTkFnvI5vRt3cNCRSc6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tlhhqijk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tlhhqijk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738838294; x=1770374294;
  h=date:from:to:cc:subject:message-id;
  bh=31c8hmGgQuapTJdvum2+hU7o816GmJ2H/I7CjcAC+IU=;
  b=Tlhhqijk8mQfv3LXCQ7PUPc9HUU9Rfw0gWN4Y+vbZeXQl4Z/LgrtLcn2
   sz3rcNgWtr0Ha11/dLgTddXKhWg7MIKSe0R7GR1fHLFcE3cD7ZC5ltqdA
   AUINlcKw4Wtr+lw6YWZxc3y6V396LaUOX69gY3Wq3bUVwXBN5U2SFQGxJ
   8qte3WtDqs6DgW9bMP0UzwvZhA7Ln+K2oxzL94qBUHQ6V1JlHHiw13ZyH
   uUaTLaQEG91yjL8iff0NcZrWSOeGJ+RS34+9SZQCP6qtXVgDD9RCILhSP
   5+7Qqn1fl9L1yjWe59HNG+KHvLwpnUpGlLUkgQ6mAPNOapPUiEQBtvQvg
   A==;
X-CSE-ConnectionGUID: 2T1rBN2JR2uDmS91lAR1eA==
X-CSE-MsgGUID: 20Rf6s+oQ5Oyg5AcKQskVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50827093"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50827093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:38:13 -0800
X-CSE-ConnectionGUID: fayqWkL9SqmFxaRut7Unow==
X-CSE-MsgGUID: z7TOQ0C8Qoq3vOS9kh3aRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134403496"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Feb 2025 02:33:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfzBr-000wkV-0F;
	Thu, 06 Feb 2025 10:32:59 +0000
Date: Thu, 06 Feb 2025 18:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124] BUILD REGRESSION
 5a735a68fd3450a07cc950b19df8f0d54037595a
Message-ID: <202502061830.tJE5y2yD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
branch HEAD: 5a735a68fd3450a07cc950b19df8f0d54037595a  ethtool: Avoid -Wflex-array-member-not-at-end warning

Error/Warning ids grouped by kconfigs:

recent_errors
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   `-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
|   `-- drivers-net-wireless-intel-iwlwifi-mvm-d3.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256
`-- sparc-allmodconfig
    |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_CCMP
    `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:conf-keylen-WLAN_KEY_LEN_GCMP_256

elapsed time: 1446m

configs tested: 128
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-004-20250205    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250205    clang-17
hexagon               randconfig-002-20250205    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-11
i386        buildonly-randconfig-005-20250205    clang-19
i386        buildonly-randconfig-006-20250205    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-21
mips                          eyeq5_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     asp8347_defconfig    clang-21
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250205    clang-16
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc64             randconfig-001-20250205    clang-18
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-003-20250205    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-002-20250205    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-002-20250205    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-004-20250205    gcc-12
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
