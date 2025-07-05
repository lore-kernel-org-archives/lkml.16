Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD80E19DF8D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686516; cv=none; b=RI9iXXCpEBZe3qWNL2DSSvCz6xhDiN81a8uxDrZM/6Whwg1wEpPbcBkgRcxXfMpc+4DKexwJ25maqjdr8j+fG9sQHjygQgE4GXFuAhG6fzpFAAbEUHmm4JWA1k6qJUCIQd1yvQF6QFXbgwkhHGr3iuH3B0hnubJ2rhxoXzH4n0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686516; c=relaxed/simple;
	bh=iUnSzTgNL4vbeCjdqkTBisG2qrIdBQV60b+ClUbJ084=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f+FzrESRdC2TjoO0ZCxtt07OQnyyxE3h55CEWdpLRlwqENvSb9W/TBJs7FLATQJD6lC9c3VvMUkYzWfTGifBvdrDuJHUjati5/7+5tAkkr13EUDRhfo101erMCUSZuebVbgAX/INjNexKFku4F42U6zVFo3Ett6WgoDc9wgk7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCj8bQ48; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCj8bQ48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751686514; x=1783222514;
  h=date:from:to:cc:subject:message-id;
  bh=iUnSzTgNL4vbeCjdqkTBisG2qrIdBQV60b+ClUbJ084=;
  b=hCj8bQ48reGVID7Igd/JQ+bfygFUq4qCMuXMOy7m/pqSPt0j0Fibt5YA
   fnqFYAdr5QmBFj2Ea17Io05PYcnARUd1Kou+Hfv+DhMLzQviN4C/6Z0Uo
   s9VLfZzeLA+NGuRo2MFlg0zXkkV3w3lOGLUhdFjrYX/e20KoPXEfWk39D
   YV0w9bHrK5SnhXc/v3tVj2raqz+1xs14rbLhzvnzk3zsd6sEcuHu5D324
   i9gdr4yLnUMuwzBiSIJD3wwxbWpUCK7CFg1jWTUvM+0pu2A7IjLmlDpvQ
   zv1JJq7cpMqsF4yDj7OSozqGM3OlsjDFsA+TY88/qpzziU/brqlY+ByIG
   Q==;
X-CSE-ConnectionGUID: xxOr1zUcQ26q1NFy8AwPHg==
X-CSE-MsgGUID: rNLdJX+CSjWMQfZhj0RN1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64601943"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="64601943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 20:35:14 -0700
X-CSE-ConnectionGUID: 8ODy+63nQ+iwCy+kiUe04g==
X-CSE-MsgGUID: UkKgm2dpQo6sImVDC+PW9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="154171185"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2025 20:35:13 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXtgE-0004Fn-1j;
	Sat, 05 Jul 2025 03:35:10 +0000
Date: Sat, 05 Jul 2025 11:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/urgent] BUILD SUCCESS
 fc975cfb36393db1db517fbbe366e550bcdcff14
Message-ID: <202507051136.wzflbsUH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: fc975cfb36393db1db517fbbe366e550bcdcff14  sched/deadline: Fix dl_server runtime calculation formula

elapsed time: 1009m

configs tested: 152
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250704    gcc-8.5.0
arc                   randconfig-002-20250704    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250704    gcc-8.5.0
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-003-20250704    gcc-8.5.0
arm                   randconfig-004-20250704    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250704    gcc-14.3.0
arm64                 randconfig-002-20250704    clang-21
arm64                 randconfig-003-20250704    clang-16
arm64                 randconfig-004-20250704    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250704    gcc-15.1.0
csky                  randconfig-002-20250704    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250704    clang-21
hexagon               randconfig-002-20250704    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250704    gcc-12
i386        buildonly-randconfig-002-20250704    clang-20
i386        buildonly-randconfig-003-20250704    clang-20
i386        buildonly-randconfig-004-20250704    clang-20
i386        buildonly-randconfig-005-20250704    clang-20
i386        buildonly-randconfig-006-20250704    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250705    gcc-12
i386                  randconfig-002-20250705    gcc-12
i386                  randconfig-003-20250705    gcc-12
i386                  randconfig-004-20250705    gcc-12
i386                  randconfig-005-20250705    gcc-12
i386                  randconfig-006-20250705    gcc-12
i386                  randconfig-007-20250705    gcc-12
i386                  randconfig-011-20250705    clang-20
i386                  randconfig-012-20250705    clang-20
i386                  randconfig-013-20250705    clang-20
i386                  randconfig-014-20250705    clang-20
i386                  randconfig-015-20250705    clang-20
i386                  randconfig-016-20250705    clang-20
i386                  randconfig-017-20250705    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250704    gcc-15.1.0
loongarch             randconfig-002-20250704    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250704    gcc-8.5.0
nios2                 randconfig-002-20250704    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250704    gcc-14.3.0
parisc                randconfig-002-20250704    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250704    clang-21
powerpc               randconfig-002-20250704    gcc-9.3.0
powerpc               randconfig-003-20250704    clang-21
powerpc64             randconfig-001-20250704    clang-18
powerpc64             randconfig-002-20250704    gcc-10.5.0
powerpc64             randconfig-003-20250704    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250704    clang-21
riscv                 randconfig-002-20250704    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250704    gcc-15.1.0
s390                  randconfig-002-20250704    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250704    gcc-15.1.0
sh                    randconfig-002-20250704    gcc-13.4.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250704    gcc-11.5.0
sparc                 randconfig-002-20250704    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250704    gcc-13.4.0
sparc64               randconfig-002-20250704    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250704    clang-21
um                    randconfig-002-20250704    clang-21
um                           x86_64_defconfig    clang-21
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250704    clang-20
x86_64      buildonly-randconfig-002-20250704    gcc-12
x86_64      buildonly-randconfig-003-20250704    clang-20
x86_64      buildonly-randconfig-004-20250704    clang-20
x86_64      buildonly-randconfig-005-20250704    clang-20
x86_64      buildonly-randconfig-006-20250704    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250705    clang-20
x86_64                randconfig-072-20250705    clang-20
x86_64                randconfig-073-20250705    clang-20
x86_64                randconfig-074-20250705    clang-20
x86_64                randconfig-075-20250705    clang-20
x86_64                randconfig-076-20250705    clang-20
x86_64                randconfig-077-20250705    clang-20
x86_64                randconfig-078-20250705    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250704    gcc-12.4.0
xtensa                randconfig-002-20250704    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
