Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC61DE8A6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845288; cv=none; b=kg3KXXK9sl2EPfvzM/G6A/gqPd9C3IHRNW86qEqMUehjISQn47UOGeQabh6EhuIt49QE89st6fNJDx91yNZwqOJu6CTHKRiY+2DKUXYscJCkmkZNSsYDaxRlQaogxEaY8ohv/+Uf4DAX5n80exZE6EeTyD4TQ3RBbi0vO+eQiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845288; c=relaxed/simple;
	bh=gIUt5+jAOiQiL5aUzC6pdPtSt8DQv0IQeU8VRASExSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHqhqTBVRoEM8jOD0TBF20FM1z5uYtsIFH9rIgy9GIS96/UQ4LjEJbDg/dozKN3uUuaATqCj/kEsobDp2HEUCIw9n7zPK63HgWZYIdtGkfagkfAKw5o7NEYDQ0pQs7H1cCdmHAroJAn0ejcn5XooMa2RXwB+skLMRyabBpxGCVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRS4PGDi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRS4PGDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743845286; x=1775381286;
  h=date:from:to:cc:subject:message-id;
  bh=gIUt5+jAOiQiL5aUzC6pdPtSt8DQv0IQeU8VRASExSs=;
  b=NRS4PGDi8NQkcXAGlu63wYiY+1w++uU9Wug12ljZJxgSbB+Bu8VhmLLM
   rikIKqjVIbPQMCaZhO2p9Qijho046ZJe/9HeOpZ4HNoqDfrJBEl8TXwA0
   Ox8shUZdMmA+arA+h1mcVNQJb27jmOi4FUgXKn3tNveS4ZNSRvetrZXL0
   JA0OwM+NYAPEpl5E4Kv5PGEqM7NjKPQa6UC52U/VnPH2y6Qmu+aklHRAi
   QM1UPPmMSGqZCadaCVPdECsS7LGmi2RhERBX8ZL8NN0w9zurGzwAER82K
   KMc7CXLwxt/8YjJwQYfDsTDIG7j+XmlbKUKMIAg7wgRcYahwhNXzmzgOp
   A==;
X-CSE-ConnectionGUID: rTmvpqWBQOalfKkInvX7iQ==
X-CSE-MsgGUID: 0/E6LAr1TzmpoYOiTk/BJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56653122"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="56653122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 02:28:05 -0700
X-CSE-ConnectionGUID: nQ/nbY9yQqKf5ZCSAAXLCQ==
X-CSE-MsgGUID: rncuE1SdSxqFKToRtAdMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="132648024"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2025 02:28:03 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0zon-0001vf-1c;
	Sat, 05 Apr 2025 09:28:01 +0000
Date: Sat, 05 Apr 2025 17:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/core] BUILD SUCCESS
 3e816361e94a0e79b1aabf44abec552e9698b196
Message-ID: <202504051734.s5tvGwOI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
branch HEAD: 3e816361e94a0e79b1aabf44abec552e9698b196  sched/tracepoints: Move and extend the sched_process_exit() tracepoint

elapsed time: 1453m

configs tested: 137
configs skipped: 3

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
arc                   randconfig-001-20250404    gcc-14.2.0
arc                   randconfig-002-20250404    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-21
arm                                 defconfig    clang-14
arm                        keystone_defconfig    gcc-14.2.0
arm                   randconfig-001-20250404    clang-21
arm                   randconfig-002-20250404    gcc-7.5.0
arm                   randconfig-003-20250404    clang-21
arm                   randconfig-004-20250404    clang-21
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250404    gcc-5.5.0
arm64                 randconfig-002-20250404    gcc-7.5.0
arm64                 randconfig-003-20250404    gcc-9.5.0
arm64                 randconfig-004-20250404    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250404    gcc-13.3.0
csky                  randconfig-002-20250404    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250404    clang-15
hexagon               randconfig-002-20250404    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250404    gcc-12
i386        buildonly-randconfig-002-20250404    gcc-12
i386        buildonly-randconfig-003-20250404    gcc-12
i386        buildonly-randconfig-004-20250404    gcc-12
i386        buildonly-randconfig-005-20250404    gcc-12
i386        buildonly-randconfig-006-20250404    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250404    gcc-14.2.0
loongarch             randconfig-002-20250404    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250404    gcc-5.5.0
nios2                 randconfig-002-20250404    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250404    gcc-8.5.0
parisc                randconfig-002-20250404    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                    gamecube_defconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-15
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250404    gcc-5.5.0
powerpc               randconfig-002-20250404    gcc-9.3.0
powerpc               randconfig-003-20250404    clang-21
powerpc                     tqm8541_defconfig    clang-21
powerpc64             randconfig-001-20250404    gcc-10.5.0
powerpc64             randconfig-002-20250404    clang-21
powerpc64             randconfig-003-20250404    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250404    gcc-14.2.0
riscv                 randconfig-002-20250404    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250404    clang-15
s390                  randconfig-002-20250404    clang-17
s390                       zfcpdump_defconfig    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250404    gcc-5.5.0
sh                    randconfig-002-20250404    gcc-5.5.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250404    gcc-14.2.0
sparc                 randconfig-002-20250404    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250404    gcc-10.5.0
sparc64               randconfig-002-20250404    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250404    gcc-12
um                    randconfig-002-20250404    clang-21
um                           x86_64_defconfig    clang-15
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250404    clang-20
x86_64      buildonly-randconfig-002-20250404    clang-20
x86_64      buildonly-randconfig-003-20250404    clang-20
x86_64      buildonly-randconfig-004-20250404    gcc-12
x86_64      buildonly-randconfig-005-20250404    gcc-12
x86_64      buildonly-randconfig-006-20250404    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250404    gcc-14.2.0
xtensa                randconfig-002-20250404    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
