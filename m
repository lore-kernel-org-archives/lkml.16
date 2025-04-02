Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA91E991D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630324; cv=none; b=gln/BSf3oj/H+yERR/IRi9PAchlp0mKcAuloO2+bZOhXj4yraGa4sJuNRAkODxt2TvnetYLu+6El6ksK+xZkDdxYTfansCUBR9C5lBaaXQC8ro0pOEnkPalGF6t7QHFUVLTg7pkQlgxVKj+JDS6MUn6R5HFEHej8+7nb6oyUgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630324; c=relaxed/simple;
	bh=CiibQL+0rhSV/dTVMFKvlJXpQTqVe9ahIUJwC1WjLBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PmckT5LVr7ZC4NetOa/9eN10fjtSFMb09CXMDzStKKuNMruKpQqLpaOORfrkFTDn2J1AixEHOTe7iUaSoWlzdiMDTAUP4DlXS+VxUtH9QAgia43BRoxmNFzBBUzUJFAedPfLCZoAVwpJ6dqtnVUeco12u9uh/XtPiYxf1WMrGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaKf5LdI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaKf5LdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743630322; x=1775166322;
  h=date:from:to:cc:subject:message-id;
  bh=CiibQL+0rhSV/dTVMFKvlJXpQTqVe9ahIUJwC1WjLBE=;
  b=UaKf5LdInXQk7BBk0L3wph1TaZDW/bifkGGvYS+E+IkrUX7Rx6GR8oLQ
   0Dt3RZl7pbKSuRReBgE83kfsLp0exY5pb92L6IARFTbaXMgGkCf9UWq7D
   iXs0bFwqNd1yBwGsANADyKmlz3rnrNz/caOMa4ZhrcaUAo69pmV31a/is
   cbvp5yq/Xpcs9p6gL+A+U8H1aggrplqzfLYpJERgdiCxqN0Boo6HG9qxS
   msftRchrFNOzasPxdF2Lw6kXcAeAmLD9vXLzPIZk2UHo2V4XueDHOyiRU
   yMQzyaKp9nXpNDvrEcnkp8QX85SRBiRi5j2DkDsitLDO4ZU7KzLZ2FfSb
   w==;
X-CSE-ConnectionGUID: fSWSX4JMRpeiM8oBj3kUAw==
X-CSE-MsgGUID: MEc0YQUyQuSMGeZfwNanXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44165605"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="44165605"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:45:19 -0700
X-CSE-ConnectionGUID: TgkDnGr4TN6Lmnx05t1n6A==
X-CSE-MsgGUID: xh94SqoJS/u4w7oAayVgfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="126632881"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Apr 2025 14:45:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u05tb-000B2p-2l;
	Wed, 02 Apr 2025 21:45:15 +0000
Date: Thu, 03 Apr 2025 05:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 e5f1e8af9c9e151ecd665f6d2e36fb25fec3b110
Message-ID: <202504030500.m7NRLcUS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: e5f1e8af9c9e151ecd665f6d2e36fb25fec3b110  x86/fred: Fix system hang during S4 resume with FRED enabled

elapsed time: 1445m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250402    gcc-14.2.0
arc                   randconfig-002-20250402    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250402    clang-20
arm                   randconfig-002-20250402    clang-16
arm                   randconfig-003-20250402    clang-20
arm                   randconfig-004-20250402    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250402    gcc-5.5.0
arm64                 randconfig-002-20250402    gcc-7.5.0
arm64                 randconfig-003-20250402    gcc-9.5.0
arm64                 randconfig-004-20250402    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250402    gcc-9.3.0
csky                  randconfig-002-20250402    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250402    clang-21
hexagon               randconfig-002-20250402    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250402    gcc-12
i386        buildonly-randconfig-002-20250402    gcc-12
i386        buildonly-randconfig-003-20250402    gcc-12
i386        buildonly-randconfig-004-20250402    gcc-12
i386        buildonly-randconfig-005-20250402    gcc-11
i386        buildonly-randconfig-006-20250402    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250402    gcc-14.2.0
loongarch             randconfig-002-20250402    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250402    gcc-7.5.0
nios2                 randconfig-002-20250402    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250402    gcc-14.2.0
parisc                randconfig-002-20250402    gcc-12.4.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-21
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250402    clang-21
powerpc               randconfig-002-20250402    gcc-9.3.0
powerpc               randconfig-003-20250402    clang-21
powerpc64             randconfig-001-20250402    clang-21
powerpc64             randconfig-002-20250402    clang-21
powerpc64             randconfig-003-20250402    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250402    gcc-9.3.0
riscv                 randconfig-002-20250402    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250402    clang-15
s390                  randconfig-002-20250402    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250402    gcc-7.5.0
sh                    randconfig-002-20250402    gcc-7.5.0
sh                           se7343_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250402    gcc-12.4.0
sparc                 randconfig-002-20250402    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250402    gcc-14.2.0
sparc64               randconfig-002-20250402    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                    randconfig-001-20250402    gcc-12
um                    randconfig-002-20250402    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250402    clang-20
x86_64      buildonly-randconfig-002-20250402    gcc-12
x86_64      buildonly-randconfig-003-20250402    clang-20
x86_64      buildonly-randconfig-004-20250402    gcc-12
x86_64      buildonly-randconfig-005-20250402    clang-20
x86_64      buildonly-randconfig-006-20250402    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250402    gcc-8.5.0
xtensa                randconfig-002-20250402    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
