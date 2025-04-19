Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCEE18FC74
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745052133; cv=none; b=tIyGVY6bQ8zoZtzjbp6cMU1RaVBVyoIJ/nUKSf6O+IlRbxDhmbrDCsx82grewPBTfKo+jtnPpnuWcUZjX390za6VFYdq0fSubSxktqhXFLnr5UJC+JVu8LSVvwrcIsmWulQY5GDx6mvN1hJMNiM9zd37MPg6Y8hwbSGe+aAIhvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745052133; c=relaxed/simple;
	bh=VD4ieh/6pleX8dgHWc0yEESTSgNf7u28mW1o2I/GRo0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NMTZeS6sgBAUTM5i0rRMXgQO63swD0L8vQ1jsP/SlN5Kd7an9Tc+aGtW27vLrtcg6gkYgmEuouTu60f9UZXJ/ZKt66pbgo/QADHcyQizezQaLhND1MVDLWrh4XAMFyUIpnTDcY2XS6eYrLmXC+ASoHJc/XTU1SUkls8Fh37UCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ee2jMolj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ee2jMolj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745052131; x=1776588131;
  h=date:from:to:cc:subject:message-id;
  bh=VD4ieh/6pleX8dgHWc0yEESTSgNf7u28mW1o2I/GRo0=;
  b=Ee2jMoljd8XnbM8iE0/eozB3z2p3ix0Ws3luHdnmn1zxy/KjXJJxEHAj
   eri0NZoWz7RPM4v/JQOd1BeHrxwuCgkAe3pLxq/qS27XxcCt4/RWJtqFx
   X+OR74XXKAjOU/whZzlGyS1EKswtXo6BSHyVjFiw+9e8WFd2smecYZo4H
   48DCzi0DNhMw/szl9hz4Vv5oghrsg2xuhnWvpmHxeO5PUpfurhy3Y6+UJ
   He21TK/7vLd7ivIFSk84FH6YPPVujJopx3Vlv3/b1FHDEmgHGIeWOLmXL
   JiEPDE1RBAn8fVpBdTjiWaUIKSWDOmb3+GBWYgxhhWeYGlk+Dt8B3uhlL
   Q==;
X-CSE-ConnectionGUID: 9wYt1JTXRCWkrupciUchkw==
X-CSE-MsgGUID: 5iAiP9CISiacbPAi9nYHgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="64203008"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="64203008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 01:42:10 -0700
X-CSE-ConnectionGUID: JkLsu06GRca8edBun0g2OA==
X-CSE-MsgGUID: uJo4GohSR9yyzUBfUTWKGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="154468804"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2025 01:42:09 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u63m2-0003jF-2U;
	Sat, 19 Apr 2025 08:42:06 +0000
Date: Sat, 19 Apr 2025 16:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/merge] BUILD SUCCESS
 460cbdd57411be28605c60ebb2bbed63a6036456
Message-ID: <202504191654.XPvsMPkF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/merge
branch HEAD: 460cbdd57411be28605c60ebb2bbed63a6036456  Merge branch 'perf/merge' into x86/merge, to avoid conflicts

elapsed time: 1449m

configs tested: 152
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
arc                   randconfig-001-20250418    gcc-14.2.0
arc                   randconfig-002-20250418    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250418    gcc-8.5.0
arm                   randconfig-002-20250418    gcc-7.5.0
arm                   randconfig-003-20250418    gcc-8.5.0
arm                   randconfig-004-20250418    clang-21
arm                        shmobile_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250418    clang-21
arm64                 randconfig-002-20250418    clang-21
arm64                 randconfig-003-20250418    clang-21
arm64                 randconfig-004-20250418    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250418    gcc-14.2.0
csky                  randconfig-002-20250418    gcc-10.5.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250418    clang-21
hexagon               randconfig-002-20250418    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250418    clang-20
i386        buildonly-randconfig-002-20250418    gcc-12
i386        buildonly-randconfig-003-20250418    clang-20
i386        buildonly-randconfig-004-20250418    gcc-12
i386        buildonly-randconfig-005-20250418    gcc-11
i386        buildonly-randconfig-006-20250418    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250419    clang-20
i386                  randconfig-002-20250419    clang-20
i386                  randconfig-003-20250419    clang-20
i386                  randconfig-004-20250419    clang-20
i386                  randconfig-005-20250419    clang-20
i386                  randconfig-006-20250419    clang-20
i386                  randconfig-007-20250419    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250418    gcc-14.2.0
loongarch             randconfig-002-20250418    gcc-12.4.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
mips                           ip32_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250418    gcc-10.5.0
nios2                 randconfig-002-20250418    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250418    gcc-11.5.0
parisc                randconfig-002-20250418    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250418    gcc-8.5.0
powerpc               randconfig-002-20250418    gcc-6.5.0
powerpc               randconfig-003-20250418    clang-21
powerpc64             randconfig-001-20250418    clang-21
powerpc64             randconfig-002-20250418    clang-21
powerpc64             randconfig-003-20250418    clang-17
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250418    clang-21
riscv                 randconfig-002-20250418    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250418    gcc-7.5.0
s390                  randconfig-002-20250418    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250418    gcc-12.4.0
sh                    randconfig-002-20250418    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250418    gcc-10.3.0
sparc                 randconfig-002-20250418    gcc-7.5.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250418    gcc-9.3.0
sparc64               randconfig-002-20250418    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250418    clang-21
um                    randconfig-002-20250418    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250418    clang-20
x86_64      buildonly-randconfig-002-20250418    clang-20
x86_64      buildonly-randconfig-003-20250418    clang-20
x86_64      buildonly-randconfig-004-20250418    clang-20
x86_64      buildonly-randconfig-005-20250418    clang-20
x86_64      buildonly-randconfig-006-20250418    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250419    clang-20
x86_64                randconfig-072-20250419    clang-20
x86_64                randconfig-073-20250419    clang-20
x86_64                randconfig-074-20250419    clang-20
x86_64                randconfig-075-20250419    clang-20
x86_64                randconfig-076-20250419    clang-20
x86_64                randconfig-077-20250419    clang-20
x86_64                randconfig-078-20250419    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250418    gcc-7.5.0
xtensa                randconfig-002-20250418    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
