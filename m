Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121428373
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746746640; cv=none; b=EsBznzI+kuofXBfPRU3wtlS2SR5lCqLnjsxurVO9jCLfLE2e3VK6Wbj2zE8Woq9KqFUTZHOgOfekEr814r2LR2O5QvOfsa77sq08fsLgSVkreJeKXA1qVBJtspgW+9zGo4ql9A4Ovdieq7//3SIo0mlVEOVjNilFQqZ1zU56Z5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746746640; c=relaxed/simple;
	bh=l1xUiQo3VWclVlxyTUr5iG3KbRtOVorYnCLWamLYvIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WQGYExgL/8FuR/snR1gDEHqmG2rqkp3nDdYoVLHFdLi3aW8qDQDXDHKoxWnUFax2n8eQz6IMqKTe6DQDpNw+8wh3+ZgZUPnN0eXw8ZeM0S4fJGbFL0bQxzN3JRAw610vUNziyaCqfNe17HsyV5UgNgD45/gh4QPz4YpBq59YTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=musonRQW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="musonRQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746746639; x=1778282639;
  h=date:from:to:cc:subject:message-id;
  bh=l1xUiQo3VWclVlxyTUr5iG3KbRtOVorYnCLWamLYvIY=;
  b=musonRQW/x23MgxiHKpVYmE/hbazA2bEjOx4HGZFMx90pZQsU+UWlKqZ
   4IYktUVmYtw5CWQ8AKtIFeKfj+1RD8WNDQg80i1iDWRvUaEkEzfmtpYqY
   TUeHNgJKHXgL/WJI67YqHegsYl2ThAqhR8IeIxpSgClav1XdWoL4MXH6U
   rhAgfOGVeTgo/3gB3UgH1xO42swdB/cyCp4hNgNh1Tjhy01cgF81lCSUD
   zR6IV7TPhLXA2OJvvUjpO+tw7bRVPw5fIrofOlMXfjsf7Hn0eJSYKu+kl
   E5erT9rOcUuG3MlJtYCL5ZmW3bQcZUaoUZTDU0w9Fyye2M4PAGKKYT3Dg
   A==;
X-CSE-ConnectionGUID: tbVtc/I9RZa/ZVUoxLAKpg==
X-CSE-MsgGUID: 3tSsV9d1Q+2t7JMA1mjkVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47814954"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="47814954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:23:58 -0700
X-CSE-ConnectionGUID: sBiNOmLRTWKuM8a7iLWJNg==
X-CSE-MsgGUID: lO1KVnk5T2yw3dJDCXtfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="141647079"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2025 16:23:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDAap-000BSt-0e;
	Thu, 08 May 2025 23:23:55 +0000
Date: Fri, 09 May 2025 07:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/core] BUILD SUCCESS
 c855506257063f444044d0a85a2e9ad9ab1c7ecd
Message-ID: <202505090708.Et15oGSg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
branch HEAD: c855506257063f444044d0a85a2e9ad9ab1c7ecd  genirq/cpuhotplug: Fix up lock guards conversion brainf..t

elapsed time: 744m

configs tested: 222
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
arc                          axs101_defconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    clang-18
arc                 nsimosci_hs_smp_defconfig    clang-18
arc                   randconfig-001-20250509    gcc-13.3.0
arc                   randconfig-002-20250509    gcc-13.3.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                       omap2plus_defconfig    clang-21
arm                   randconfig-001-20250509    gcc-7.5.0
arm                   randconfig-002-20250509    gcc-6.5.0
arm                   randconfig-003-20250509    gcc-10.5.0
arm                   randconfig-004-20250509    clang-21
arm                         s5pv210_defconfig    clang-18
arm                        shmobile_defconfig    clang-21
arm                          sp7021_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250509    gcc-7.5.0
arm64                 randconfig-002-20250509    gcc-7.5.0
arm64                 randconfig-003-20250509    clang-21
arm64                 randconfig-004-20250509    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250509    gcc-13.3.0
csky                  randconfig-001-20250509    gcc-14.2.0
csky                  randconfig-002-20250509    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250509    clang-20
hexagon               randconfig-001-20250509    gcc-13.3.0
hexagon               randconfig-002-20250509    clang-21
hexagon               randconfig-002-20250509    gcc-13.3.0
i386                             alldefconfig    clang-18
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
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
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250509    gcc-13.3.0
nios2                 randconfig-002-20250509    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    clang-18
parisc                randconfig-001-20250509    gcc-13.3.0
parisc                randconfig-001-20250509    gcc-6.5.0
parisc                randconfig-002-20250509    gcc-13.3.0
parisc                randconfig-002-20250509    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
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
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250509    clang-21
riscv                 randconfig-001-20250509    gcc-12.4.0
riscv                 randconfig-002-20250509    clang-21
riscv                 randconfig-002-20250509    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250509    clang-21
s390                  randconfig-001-20250509    gcc-12.4.0
s390                  randconfig-002-20250509    clang-17
s390                  randconfig-002-20250509    gcc-12.4.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    clang-21
sh                    randconfig-001-20250509    gcc-12.4.0
sh                    randconfig-001-20250509    gcc-9.3.0
sh                    randconfig-002-20250509    gcc-12.4.0
sh                    randconfig-002-20250509    gcc-5.5.0
sh                            shmin_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250509    gcc-12.4.0
sparc                 randconfig-001-20250509    gcc-6.5.0
sparc                 randconfig-002-20250509    gcc-12.4.0
sparc                 randconfig-002-20250509    gcc-6.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250509    gcc-10.5.0
sparc64               randconfig-001-20250509    gcc-12.4.0
sparc64               randconfig-002-20250509    gcc-12.4.0
sparc64               randconfig-002-20250509    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250509    clang-21
um                    randconfig-001-20250509    gcc-12.4.0
um                    randconfig-002-20250509    gcc-12
um                    randconfig-002-20250509    gcc-12.4.0
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
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250509    gcc-12.4.0
xtensa                randconfig-002-20250509    gcc-12.4.0
xtensa                randconfig-002-20250509    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
