Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFAC1805A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751341540; cv=none; b=UItdaBItNRgkmfLuVS6UJW+WWzJ+u3GSU1yQGcFF82hhjuGK7TlDvyxBlOis/XOyscdgKRlS5276RerWacEV68OSb8+9I9i1irdSNdX4d3srlkfFBly0Y6EN4Z9WBFGgx4uWdN1CwxNa5VcSj+qXamFhDJmnuqJdZhgMqfEhklU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751341540; c=relaxed/simple;
	bh=KfOhB4yVXMUONz3s+pg6iL9K+NzM/gfPmdzMRaUtJuQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j6XBzekygn/pkUTCRrmtlKh4OzT8dREL9mSEkDYnw+VuQmd4bqfCN1BDMvak6vy4wT6ovKmPnKCJTNREOdhYfW2d9lHzpnF7L+EV85fT5nZAxDo9pUZWMf6Y0+ddKy1ilcHsJjDoNsAxQG8V8/ZI/78yWJs2VaLPmSh/TrovYwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShFXexPh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShFXexPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751341538; x=1782877538;
  h=date:from:to:cc:subject:message-id;
  bh=KfOhB4yVXMUONz3s+pg6iL9K+NzM/gfPmdzMRaUtJuQ=;
  b=ShFXexPhk/U+2cyVDUGHfGPmpmtaJm1X/P4M+R3lgV1vTX4N4AAMufKf
   0mkakY6/ukj8Abk1Gq82NrPzGjx2lGCqeYS8KWjAY3QDc/sw6tDYVDH5e
   SoVFuMWQJMrP8HFEQ9yiU3xr4QVrwTuM1T9EZLmzpmOUMKRNQNa9epodX
   wtschnSaldBvrz5I8MpkzyuVkemAVCpoTOG0/v/99Pao4S012cPcEN5Hg
   PIYhe3vurMolZiCkKY0HEHlmSsQwoUIFc9H0mliXwNKpu1/I84niZ5kb1
   r2dPDMDIl+9bIUTBH6icMYyUCzjM89nvDcqkeFq3vny4WcylOK85vVsrA
   w==;
X-CSE-ConnectionGUID: qjMBNwQaQB+UQdHmyxIv3g==
X-CSE-MsgGUID: /AFxwVb4QYCZMGaKJq9+Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53710097"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53710097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 20:45:33 -0700
X-CSE-ConnectionGUID: 50fSuvcrT7OIN0J7pVxQhQ==
X-CSE-MsgGUID: 6DSlBh7jQnmtF7tgcPDkuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159353409"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 20:45:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWRvy-000ZhQ-1j;
	Tue, 01 Jul 2025 03:45:26 +0000
Date: Tue, 01 Jul 2025 11:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD REGRESSION
 49ec9aaf45c8f4612330f2fd646e3440dc7d8f25
Message-ID: <202507011151.yOyc037v-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 49ec9aaf45c8f4612330f2fd646e3440dc7d8f25  Merge branch into tip/master: 'x86/sev'

Error/Warning (recently discovered and may have been fixed):

    drivers/net/ethernet/intel/iavf/iavf_main.c:2399:2: error: unexpected token

Error/Warning ids grouped by kconfigs:

recent_errors
`-- s390-allmodconfig
    `-- drivers-net-ethernet-intel-iavf-iavf_main.c:error:unexpected-token

elapsed time: 999m

configs tested: 120
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250630    gcc-10.5.0
arc                   randconfig-002-20250630    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250630    clang-21
arm                   randconfig-002-20250630    gcc-12.4.0
arm                   randconfig-003-20250630    gcc-14.3.0
arm                   randconfig-004-20250630    clang-21
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250630    gcc-9.5.0
arm64                 randconfig-002-20250630    gcc-14.3.0
arm64                 randconfig-003-20250630    clang-21
arm64                 randconfig-004-20250630    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250630    gcc-15.1.0
csky                  randconfig-002-20250630    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250630    clang-16
hexagon               randconfig-002-20250630    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250630    clang-20
i386        buildonly-randconfig-002-20250630    gcc-12
i386        buildonly-randconfig-003-20250630    clang-20
i386        buildonly-randconfig-004-20250630    gcc-12
i386        buildonly-randconfig-005-20250630    gcc-12
i386        buildonly-randconfig-006-20250630    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250630    gcc-15.1.0
loongarch             randconfig-002-20250630    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip27_defconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250630    gcc-14.2.0
nios2                 randconfig-002-20250630    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250630    gcc-8.5.0
parisc                randconfig-002-20250630    gcc-8.5.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      chrp32_defconfig    clang-19
powerpc                     mpc512x_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250630    clang-18
powerpc               randconfig-002-20250630    clang-21
powerpc               randconfig-003-20250630    gcc-13.3.0
powerpc64             randconfig-001-20250630    gcc-10.5.0
powerpc64             randconfig-002-20250630    gcc-14.3.0
powerpc64             randconfig-003-20250630    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250630    gcc-8.5.0
riscv                 randconfig-002-20250630    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250630    gcc-8.5.0
s390                  randconfig-002-20250630    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250630    gcc-15.1.0
sh                    randconfig-002-20250630    gcc-15.1.0
sh                             sh03_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250630    gcc-8.5.0
sparc                 randconfig-002-20250630    gcc-8.5.0
sparc64               randconfig-001-20250630    gcc-8.5.0
sparc64               randconfig-002-20250630    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250630    clang-21
um                    randconfig-002-20250630    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250630    gcc-12
x86_64      buildonly-randconfig-002-20250630    clang-20
x86_64      buildonly-randconfig-003-20250630    clang-20
x86_64      buildonly-randconfig-004-20250630    clang-20
x86_64      buildonly-randconfig-005-20250630    gcc-12
x86_64      buildonly-randconfig-006-20250630    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250630    gcc-13.3.0
xtensa                randconfig-002-20250630    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
