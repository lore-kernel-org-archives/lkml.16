Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DF33A1BA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 00:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745628497; cv=none; b=hmLjJ2KajDJ0LUBzOD8OyUQdE/otk2bil0R2fidbkArfZMxOxFS85J3WJpxHBxMd+Z/oJv7liUXf+MbHKocganEODB8jEC1cy5OeVERoJXT3IessnMuBFiwrRCrwZ2OUeyCHAa2XCGyHuE6gE4JQXgPYB/SOumQnkgvpccKMHfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745628497; c=relaxed/simple;
	bh=7Kk2vMdBhupGcFY8Fme/eN8/HO3KGx2W8S8JbOws1LQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pgD2qlRVgSEQtCABKjQ1+rx7CzjBWn4oEEyPN5acoYbLDNhpTdKmaKz21WSauIc38vLMb77nUimUO38FavH7PAR5RyUEslED9s8JdDu7M3205171f1KpzquvP+icD6E8KjQRSjjeN7vTnLPipKKpoJTzzjxQuUVOeC4MGzlZUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIhA4+7T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIhA4+7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745628495; x=1777164495;
  h=date:from:to:cc:subject:message-id;
  bh=7Kk2vMdBhupGcFY8Fme/eN8/HO3KGx2W8S8JbOws1LQ=;
  b=GIhA4+7T/32BBU4n5Yob5wSgsr1jbn9RNvo+wHHuNapqIzeK+B2vbeMO
   MMZIt8rSLkkeQIn3e/JG/OW/O2HVihqxOgslbL5NfqKKfbFPC4h2OJKq9
   C+sx3GYH1xs1ThS97kmq9HeLiGey4NganiM/AkbJwFHUMxawJIzjbbrRq
   pzoEI0gHpPnUIeJVSDgS8tjRAw7qq+yZym4ftcNcrK5WZ3x2aqpM4drSR
   oZHDHxr6FO6Mqa9t6pDurAonOeC7QQwK4PAShd9l3e4P51WIu7IqjIelO
   r5UOpyWQFTasJUaz2yJJ6+E3rWHs/X9bcx/7IWjnMO1XarECDjXioNWZQ
   Q==;
X-CSE-ConnectionGUID: eGYbcRVZTIqoE9WAWIZ2bQ==
X-CSE-MsgGUID: jmXFGqeVTcqvjwS5oo6/uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58666949"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="58666949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 17:48:14 -0700
X-CSE-ConnectionGUID: aTyS6+TPRbSxIrIFyOtHyQ==
X-CSE-MsgGUID: tkwHN214T4uz9mYyYq24Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="156267455"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2025 17:48:13 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8TiF-0005cb-0z;
	Sat, 26 Apr 2025 00:48:11 +0000
Date: Sat, 26 Apr 2025 08:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu/next] BUILD SUCCESS
 c0940db189bc8e5616eae1d2b8ea10b9a5632e47
Message-ID: <202504260844.fXMoyNHI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: c0940db189bc8e5616eae1d2b8ea10b9a5632e47  Merge branches 'lkmm.2025.04.22a' and 'ratelimit-next.2025.04.24a' into HEAD

elapsed time: 1445m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250425    gcc-14.2.0
arc                   randconfig-001-20250426    gcc-8.5.0
arc                   randconfig-002-20250425    gcc-13.3.0
arc                   randconfig-002-20250426    gcc-10.5.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250425    clang-21
arm                   randconfig-001-20250426    clang-21
arm                   randconfig-002-20250425    gcc-6.5.0
arm                   randconfig-002-20250426    gcc-7.5.0
arm                   randconfig-003-20250425    clang-21
arm                   randconfig-003-20250426    clang-21
arm                   randconfig-004-20250425    gcc-6.5.0
arm                   randconfig-004-20250426    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250425    clang-21
arm64                 randconfig-001-20250426    clang-16
arm64                 randconfig-002-20250425    gcc-7.5.0
arm64                 randconfig-002-20250426    gcc-8.5.0
arm64                 randconfig-003-20250425    gcc-7.5.0
arm64                 randconfig-003-20250426    clang-17
arm64                 randconfig-004-20250425    gcc-9.5.0
arm64                 randconfig-004-20250426    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250425    gcc-13.3.0
csky                  randconfig-001-20250426    gcc-14.2.0
csky                  randconfig-002-20250425    gcc-14.2.0
csky                  randconfig-002-20250426    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250425    clang-21
hexagon               randconfig-001-20250426    clang-19
hexagon               randconfig-002-20250425    clang-21
hexagon               randconfig-002-20250426    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250425    gcc-12
i386        buildonly-randconfig-001-20250426    gcc-12
i386        buildonly-randconfig-002-20250425    gcc-12
i386        buildonly-randconfig-002-20250426    gcc-12
i386        buildonly-randconfig-003-20250425    clang-20
i386        buildonly-randconfig-003-20250426    clang-20
i386        buildonly-randconfig-004-20250425    gcc-12
i386        buildonly-randconfig-004-20250426    clang-20
i386        buildonly-randconfig-005-20250425    gcc-12
i386        buildonly-randconfig-005-20250426    gcc-12
i386        buildonly-randconfig-006-20250425    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250425    gcc-14.2.0
loongarch             randconfig-001-20250426    gcc-14.2.0
loongarch             randconfig-002-20250425    gcc-13.3.0
loongarch             randconfig-002-20250426    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250425    gcc-5.5.0
nios2                 randconfig-001-20250426    gcc-10.5.0
nios2                 randconfig-002-20250425    gcc-13.3.0
nios2                 randconfig-002-20250426    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250425    gcc-10.5.0
parisc                randconfig-001-20250426    gcc-7.5.0
parisc                randconfig-002-20250425    gcc-8.5.0
parisc                randconfig-002-20250426    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250425    clang-21
powerpc               randconfig-001-20250426    gcc-6.5.0
powerpc               randconfig-002-20250425    gcc-9.3.0
powerpc               randconfig-002-20250426    clang-21
powerpc               randconfig-003-20250425    gcc-9.3.0
powerpc               randconfig-003-20250426    gcc-8.5.0
powerpc                     redwood_defconfig    clang-21
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250425    clang-21
powerpc64             randconfig-001-20250426    gcc-6.5.0
powerpc64             randconfig-002-20250425    gcc-7.5.0
powerpc64             randconfig-002-20250426    clang-21
powerpc64             randconfig-003-20250425    gcc-10.5.0
powerpc64             randconfig-003-20250426    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250425    gcc-14.2.0
riscv                 randconfig-001-20250426    gcc-14.2.0
riscv                 randconfig-002-20250425    clang-19
riscv                 randconfig-002-20250426    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250425    clang-17
s390                  randconfig-001-20250426    clang-21
s390                  randconfig-002-20250425    gcc-7.5.0
s390                  randconfig-002-20250426    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250425    gcc-7.5.0
sh                    randconfig-001-20250426    gcc-14.2.0
sh                    randconfig-002-20250425    gcc-9.3.0
sh                    randconfig-002-20250426    gcc-12.4.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250425    gcc-8.5.0
sparc                 randconfig-001-20250426    gcc-10.3.0
sparc                 randconfig-002-20250425    gcc-14.2.0
sparc                 randconfig-002-20250426    gcc-10.3.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64               randconfig-001-20250425    gcc-10.5.0
sparc64               randconfig-001-20250426    gcc-7.5.0
sparc64               randconfig-002-20250425    gcc-6.5.0
sparc64               randconfig-002-20250426    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250425    clang-21
um                    randconfig-001-20250426    clang-21
um                    randconfig-002-20250425    clang-21
um                    randconfig-002-20250426    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250425    gcc-12
x86_64      buildonly-randconfig-001-20250426    gcc-12
x86_64      buildonly-randconfig-002-20250425    clang-20
x86_64      buildonly-randconfig-002-20250426    clang-20
x86_64      buildonly-randconfig-003-20250425    gcc-12
x86_64      buildonly-randconfig-003-20250426    gcc-12
x86_64      buildonly-randconfig-004-20250425    gcc-12
x86_64      buildonly-randconfig-004-20250426    clang-20
x86_64      buildonly-randconfig-005-20250425    clang-20
x86_64      buildonly-randconfig-005-20250426    clang-20
x86_64      buildonly-randconfig-006-20250425    gcc-12
x86_64      buildonly-randconfig-006-20250426    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250425    gcc-6.5.0
xtensa                randconfig-001-20250426    gcc-14.2.0
xtensa                randconfig-002-20250425    gcc-8.5.0
xtensa                randconfig-002-20250426    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
