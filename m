Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E69A28E591
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784499; cv=none; b=gPus9CjWWl9JzC+iwCNkdYpXzxDf5xiYCqqmEcxaJu+Htu2hJJqNBU9iniz89ijYeYO8h0yoXFPAzGUNwBpsSuMBQ4bpKmPpSAItv8NKEz9Xkd0QCu0b8Lcuad1+Duby1DmIMEmExtlodA/1ISlupmnkiE7CWM/fojOEFhGmlPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784499; c=relaxed/simple;
	bh=tqb4vh3WPLb3hGBIWOYZtooUoFRJAdnr7weT9+vN0tw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ctGjsQT6Xh5VdpNbQhZMY645h1sx8chy7ZAtIZwf0M4EvaK6DmxzBDJ+gTJDwNOxIogf2aA4nkxmcBwIzNfdZ6Ahj8i/VS8Cm5YVJuhouF8KwfDEqJemz+wlnO61tsKCYws922nNBKixysBylorL2K1fEPVzpf1BeKFNgzWdKvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvyG0gCn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvyG0gCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746784498; x=1778320498;
  h=date:from:to:cc:subject:message-id;
  bh=tqb4vh3WPLb3hGBIWOYZtooUoFRJAdnr7weT9+vN0tw=;
  b=YvyG0gCnVMhmDhFwZjkGGse2AS4mkf4fY6v8jPKpeFjD3l0ssrOivFuM
   04Yd62G8wquhS2YRIHu9Nz4llOXr/4z4GZTOYzZZ3GSLnTmISD3dQCW0B
   +ecchVOo+IxDEWrgmfzt1iI+D55L2CCh7gP6FXgUIWQDrPfrFILPKoSop
   CVbY1E1HGRrf2igLeCesjj9tW+ntUAVxG8Ctc8t/kLYW6Lpw6ZUs/dJMo
   +ss0WgFbHvKvnSaTifKW83fU5putcHvDJW+G2UERVv0SuGoAqALY00D2y
   hmdj6dfX+Kr3P0jkQD7rbag/jPioKkWJMUM2c2NPaoXupmvN5MLZ8qiek
   g==;
X-CSE-ConnectionGUID: vodNQ4+yQta3NS4oLdxHQQ==
X-CSE-MsgGUID: PsuNH8tKQTK7eZJ7ZAynmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73987164"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="73987164"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:54:55 -0700
X-CSE-ConnectionGUID: EErHQbCWRtCkw2pmMboWYA==
X-CSE-MsgGUID: o4u/9P/0SkStaeP/XHv5HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="167502854"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 May 2025 02:54:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDKRP-000Btl-2w;
	Fri, 09 May 2025 09:54:51 +0000
Date: Fri, 09 May 2025 17:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/cleanups] BUILD SUCCESS
 aad823aa3a7d675a8d0de478a04307f63e3725db
Message-ID: <202505091753.ym5QcYdq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
branch HEAD: aad823aa3a7d675a8d0de478a04307f63e3725db  treewide, timers: Rename destroy_timer_on_stack() as timer_destroy_on_stack()

elapsed time: 928m

configs tested: 226
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250509    clang-21
arc                   randconfig-001-20250509    gcc-13.3.0
arc                   randconfig-002-20250509    clang-21
arc                   randconfig-002-20250509    gcc-13.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    clang-21
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-21
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250509    clang-21
arm                   randconfig-001-20250509    gcc-7.5.0
arm                   randconfig-002-20250509    clang-21
arm                   randconfig-002-20250509    gcc-6.5.0
arm                   randconfig-003-20250509    clang-21
arm                   randconfig-003-20250509    gcc-10.5.0
arm                   randconfig-004-20250509    clang-21
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250509    clang-21
arm64                 randconfig-001-20250509    gcc-7.5.0
arm64                 randconfig-002-20250509    clang-21
arm64                 randconfig-002-20250509    gcc-7.5.0
arm64                 randconfig-003-20250509    clang-21
arm64                 randconfig-004-20250509    clang-21
arm64                 randconfig-004-20250509    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250509    gcc-13.3.0
csky                  randconfig-001-20250509    gcc-14.2.0
csky                  randconfig-002-20250509    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250509    clang-20
hexagon               randconfig-001-20250509    gcc-13.3.0
hexagon               randconfig-002-20250509    clang-21
hexagon               randconfig-002-20250509    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250509    clang-20
i386        buildonly-randconfig-001-20250509    gcc-11
i386        buildonly-randconfig-002-20250509    clang-20
i386        buildonly-randconfig-002-20250509    gcc-12
i386        buildonly-randconfig-003-20250509    clang-20
i386        buildonly-randconfig-004-20250509    clang-20
i386        buildonly-randconfig-005-20250509    clang-20
i386        buildonly-randconfig-005-20250509    gcc-12
i386        buildonly-randconfig-006-20250509    clang-20
i386        buildonly-randconfig-006-20250509    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250509    clang-20
i386                  randconfig-002-20250509    clang-20
i386                  randconfig-003-20250509    clang-20
i386                  randconfig-004-20250509    clang-20
i386                  randconfig-005-20250509    clang-20
i386                  randconfig-006-20250509    clang-20
i386                  randconfig-007-20250509    clang-20
i386                  randconfig-011-20250509    gcc-12
i386                  randconfig-012-20250509    gcc-12
i386                  randconfig-013-20250509    gcc-12
i386                  randconfig-014-20250509    gcc-12
i386                  randconfig-015-20250509    gcc-12
i386                  randconfig-016-20250509    gcc-12
i386                  randconfig-017-20250509    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250509    gcc-13.3.0
loongarch             randconfig-002-20250509    gcc-13.3.0
loongarch             randconfig-002-20250509    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250509    gcc-13.3.0
nios2                 randconfig-002-20250509    gcc-13.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250509    gcc-13.3.0
parisc                randconfig-001-20250509    gcc-6.5.0
parisc                randconfig-002-20250509    gcc-13.3.0
parisc                randconfig-002-20250509    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250509    clang-16
powerpc               randconfig-001-20250509    gcc-13.3.0
powerpc               randconfig-002-20250509    gcc-13.3.0
powerpc               randconfig-002-20250509    gcc-5.5.0
powerpc               randconfig-003-20250509    gcc-13.3.0
powerpc               randconfig-003-20250509    gcc-7.5.0
powerpc64             randconfig-001-20250509    gcc-13.3.0
powerpc64             randconfig-001-20250509    gcc-7.5.0
powerpc64             randconfig-002-20250509    clang-21
powerpc64             randconfig-002-20250509    gcc-13.3.0
powerpc64             randconfig-003-20250509    gcc-10.5.0
powerpc64             randconfig-003-20250509    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250509    clang-21
riscv                 randconfig-002-20250509    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250509    clang-21
s390                  randconfig-002-20250509    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250509    gcc-9.3.0
sh                    randconfig-002-20250509    gcc-5.5.0
sh                          rsk7203_defconfig    clang-21
sh                          rsk7203_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-21
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250509    gcc-6.5.0
sparc                 randconfig-002-20250509    gcc-6.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250509    gcc-10.5.0
sparc64               randconfig-002-20250509    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250509    clang-21
um                    randconfig-002-20250509    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250509    gcc-11
x86_64      buildonly-randconfig-002-20250509    gcc-11
x86_64      buildonly-randconfig-003-20250509    clang-20
x86_64      buildonly-randconfig-003-20250509    gcc-11
x86_64      buildonly-randconfig-004-20250509    clang-20
x86_64      buildonly-randconfig-004-20250509    gcc-11
x86_64      buildonly-randconfig-005-20250509    gcc-11
x86_64      buildonly-randconfig-005-20250509    gcc-12
x86_64      buildonly-randconfig-006-20250509    gcc-11
x86_64      buildonly-randconfig-006-20250509    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250509    clang-20
x86_64                randconfig-002-20250509    clang-20
x86_64                randconfig-003-20250509    clang-20
x86_64                randconfig-004-20250509    clang-20
x86_64                randconfig-005-20250509    clang-20
x86_64                randconfig-006-20250509    clang-20
x86_64                randconfig-007-20250509    clang-20
x86_64                randconfig-008-20250509    clang-20
x86_64                randconfig-071-20250509    clang-20
x86_64                randconfig-072-20250509    clang-20
x86_64                randconfig-073-20250509    clang-20
x86_64                randconfig-074-20250509    clang-20
x86_64                randconfig-075-20250509    clang-20
x86_64                randconfig-076-20250509    clang-20
x86_64                randconfig-077-20250509    clang-20
x86_64                randconfig-078-20250509    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250509    gcc-12.4.0
xtensa                randconfig-002-20250509    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
