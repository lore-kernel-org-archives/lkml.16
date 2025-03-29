Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7691DE8A2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743288549; cv=none; b=rUug2dlSCKZ0Bpx3wxO6n1kWLthaF5MvN5fO9CV2YuH0I3KjPEWOBXbR9sJXQwEWzVWz3NBkBcGU2Bb1+o6+lz4q/HBqflFBND3Iqk6nP7yzu0Zabdq0t1aqhlR9MB/9k05r85a+Co+hZ1rA8JRAx3eRsHqD2uWNukzbf9rPIRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743288549; c=relaxed/simple;
	bh=sTfQWOG6o1hgB3tKI1zexiDQHeCd3nX89zZ4Ic/t2/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ob/ieX06alCERLCQHE0+kmOUOoG75VJiLKL9c5fIXr+83tuorDp27xU9+PgbRhkaBVfaxlGl5U40QO8AMPsO8ImW3XpspIFinuMwSaIu7osO75tWuqVQyOzI7DTHfv5mrSyppqpsW2qG5h5wqtDAc20tRLuDxaL6wsw9MeAzJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGsknY/K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGsknY/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743288548; x=1774824548;
  h=date:from:to:cc:subject:message-id;
  bh=sTfQWOG6o1hgB3tKI1zexiDQHeCd3nX89zZ4Ic/t2/I=;
  b=mGsknY/KCj9zDfoZ+ySaR/pWZ0YBJUhDraynwcb8dONKwQLqvuy+lHYr
   kuJtRrodgZKxsbclgS+1QY3zvvVDAXFYrqQax/vMIwfhDtSqYnewnR28R
   jESoFt8QL5Xdv4Ea3+SVZTyGPQ4YimmlRcuX9V4I2pnKhCQutR6eDyVBB
   /zeMCbT76SfzjWLpdvhg6RfKz6/EIvbeTtDn+hFYaVSo+Za0C0pHYJYtU
   18RAmpXiX2cmwoiftGSM1GWouisPq+GotXW/TjCRc3cTmdMHXsIB5juZy
   RYgYNKssJqNUw/z0CLj2e/uc75n/1CYWfGdnqcCzOizT7MGe1NUGlbYd2
   A==;
X-CSE-ConnectionGUID: LXvjxQheSMOeLlcRgTwwtQ==
X-CSE-MsgGUID: E4PtcSemRaW5cVhgB8sB/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44724161"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44724161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 15:49:08 -0700
X-CSE-ConnectionGUID: Ict7YjMFSea6DTayaKAV+w==
X-CSE-MsgGUID: GepopvxLQoySsmcj2bp1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="148932790"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2025 15:49:06 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyez6-0008Pn-2J;
	Sat, 29 Mar 2025 22:49:01 +0000
Date: Sun, 30 Mar 2025 06:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 f710202b2a45addea3dcdcd862770ecbaf6597ef
Message-ID: <202503300623.ws9cNlrs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: f710202b2a45addea3dcdcd862770ecbaf6597ef  x86/tools: Drop duplicate unlikely() definition in insn_decoder_test.c

elapsed time: 1441m

configs tested: 113
configs skipped: 162

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                         axm55xx_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                           spitz_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250329    gcc-12
i386        buildonly-randconfig-002-20250329    gcc-12
i386        buildonly-randconfig-003-20250329    clang-20
i386        buildonly-randconfig-004-20250329    gcc-11
i386        buildonly-randconfig-005-20250329    gcc-12
i386        buildonly-randconfig-006-20250329    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250330    clang-20
i386                  randconfig-002-20250330    clang-20
i386                  randconfig-003-20250330    clang-20
i386                  randconfig-004-20250330    clang-20
i386                  randconfig-005-20250330    clang-20
i386                  randconfig-006-20250330    clang-20
i386                  randconfig-007-20250330    clang-20
i386                  randconfig-011-20250330    clang-20
i386                  randconfig-012-20250330    clang-20
i386                  randconfig-013-20250330    clang-20
i386                  randconfig-014-20250330    clang-20
i386                  randconfig-015-20250330    clang-20
i386                  randconfig-016-20250330    clang-20
i386                  randconfig-017-20250330    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    clang-21
m68k                          multi_defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                                defconfig    gcc-12
sh                                  defconfig    gcc-12
sh                          lboxre2_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-21
sparc64                             defconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250329    clang-20
x86_64      buildonly-randconfig-002-20250329    gcc-12
x86_64      buildonly-randconfig-003-20250329    gcc-12
x86_64      buildonly-randconfig-004-20250329    clang-20
x86_64      buildonly-randconfig-005-20250329    clang-20
x86_64      buildonly-randconfig-006-20250329    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250330    clang-20
x86_64                randconfig-002-20250330    clang-20
x86_64                randconfig-003-20250330    clang-20
x86_64                randconfig-004-20250330    clang-20
x86_64                randconfig-005-20250330    clang-20
x86_64                randconfig-006-20250330    clang-20
x86_64                randconfig-007-20250330    clang-20
x86_64                randconfig-008-20250330    clang-20
x86_64                randconfig-071-20250330    clang-20
x86_64                randconfig-072-20250330    clang-20
x86_64                randconfig-073-20250330    clang-20
x86_64                randconfig-074-20250330    clang-20
x86_64                randconfig-075-20250330    clang-20
x86_64                randconfig-076-20250330    clang-20
x86_64                randconfig-077-20250330    clang-20
x86_64                randconfig-078-20250330    clang-20
x86_64                               rhel-9.4    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
