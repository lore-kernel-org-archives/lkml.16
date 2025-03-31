Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4D214A90
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743450239; cv=none; b=NwsSfCikE+9WQCxOFbOcKQCzGy88/gGnXbmIoS3OQs3Zyc049oYchCJ2iJsYEtLSpbAMGUejszRNQK2NagaoLCA+bANfNIQPAx7p8Bg2to5JRJl8dCwa9W9yRGh1c4Y1wGf+vwNzasm2zZyNijAQ2FbOJRPVtMd+n0ZnPn7pg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743450239; c=relaxed/simple;
	bh=KcD7JXVsuf+knMRP3v4w6UAyybilC2awFuE0kKm5tBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m2UAg52X7qfQuo5xt9CApijpjAX1LBr9Se1/rKnE5xlAvub547gA/jqp3dvNAqCb7z4aMfiFQqYhgqvGmPcNQb4+Cxk5kvlZ4rvMOQHcUoEcOB7v3wTYY7Monmllc7t/QkFKwPonDwA/TEeIvSzGjDA1Ld5ogwydTUK4bsu+tTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5rPLNKb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5rPLNKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743450238; x=1774986238;
  h=date:from:to:cc:subject:message-id;
  bh=KcD7JXVsuf+knMRP3v4w6UAyybilC2awFuE0kKm5tBM=;
  b=J5rPLNKb1g6V0AGujSj8orgpOQcvweeUNnqDOzKLdrB4poL4DwNjEkyt
   SZmGDcH0Cudja5htSyFaZNetJRE60HIWaZbPddaDyiHyRMUVEM0iINH6q
   epvdtZJVqY2Xh3Go4kqdrX05Nh3TpQ5NNwjq2on354J4cuGwYNN9ofAaF
   Lo16EMlI28mA5lPAg34oeCMkMcRBldv0ftiDyUtapzrjQKNv+/kotsxiB
   C/ZxibRTA8Q0U5Tz4xl9RabiI5DT88Ke9c8Lh+hLUgF+ly7QPAO2Rux/l
   XbMtFMLs7VTbyLMYKdTBvl++jyDuyF1JoStfG3L6B+MTQCHmR+biv7URL
   g==;
X-CSE-ConnectionGUID: EPvgtZMhS1uIh5T0AWyGzw==
X-CSE-MsgGUID: 8JMswVFZThqvP9Dy8M5h/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48538371"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="48538371"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 12:43:56 -0700
X-CSE-ConnectionGUID: EMbxw5KnSuu7nJNoG7uRhQ==
X-CSE-MsgGUID: 8hRVfxNOS+qpja1Jafu24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126646380"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2025 12:43:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzL32-0009Pf-0L;
	Mon, 31 Mar 2025 19:43:52 +0000
Date: Tue, 01 Apr 2025 03:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/urgent] BUILD SUCCESS
 9939188c730d68b8b6b5210b7770021656181730
Message-ID: <202504010306.5fv9KNnZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: 9939188c730d68b8b6b5210b7770021656181730  sched/isolation: Make CONFIG_CPU_ISOLATION depend on CONFIG_SMP

elapsed time: 1444m

configs tested: 138
configs skipped: 6

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
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250331    gcc-8.5.0
arc                   randconfig-002-20250331    gcc-8.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-15
arm                                 defconfig    clang-14
arm                           h3600_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-16
arm                           imxrt_defconfig    clang-21
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250331    clang-21
arm                   randconfig-002-20250331    clang-21
arm                   randconfig-003-20250331    clang-21
arm                   randconfig-004-20250331    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250331    gcc-8.5.0
arm64                 randconfig-002-20250331    clang-21
arm64                 randconfig-003-20250331    clang-14
arm64                 randconfig-004-20250331    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250331    gcc-10.5.0
csky                  randconfig-002-20250331    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250331    clang-20
hexagon               randconfig-002-20250331    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250331    clang-20
i386        buildonly-randconfig-002-20250331    gcc-12
i386        buildonly-randconfig-003-20250331    clang-20
i386        buildonly-randconfig-004-20250331    clang-20
i386        buildonly-randconfig-005-20250331    clang-20
i386        buildonly-randconfig-006-20250331    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250331    gcc-14.2.0
loongarch             randconfig-002-20250331    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250331    gcc-6.5.0
nios2                 randconfig-002-20250331    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250331    gcc-9.3.0
parisc                randconfig-002-20250331    gcc-11.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250331    clang-21
powerpc               randconfig-002-20250331    clang-16
powerpc               randconfig-003-20250331    clang-18
powerpc64             randconfig-001-20250331    gcc-6.5.0
powerpc64             randconfig-002-20250331    gcc-8.5.0
powerpc64             randconfig-003-20250331    clang-19
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250331    clang-14
riscv                 randconfig-002-20250331    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250331    clang-15
s390                  randconfig-002-20250331    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250331    gcc-10.5.0
sh                    randconfig-002-20250331    gcc-10.5.0
sh                          rsk7269_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250331    gcc-11.5.0
sparc                 randconfig-002-20250331    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250331    gcc-7.5.0
sparc64               randconfig-002-20250331    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250331    gcc-12
um                    randconfig-002-20250331    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250331    clang-20
x86_64      buildonly-randconfig-002-20250331    gcc-12
x86_64      buildonly-randconfig-003-20250331    clang-20
x86_64      buildonly-randconfig-004-20250331    clang-20
x86_64      buildonly-randconfig-005-20250331    clang-20
x86_64      buildonly-randconfig-006-20250331    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250331    gcc-11.5.0
xtensa                randconfig-002-20250331    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
