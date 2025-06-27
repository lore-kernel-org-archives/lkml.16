Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7CC249E5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996905; cv=none; b=tb1Zyv2JMKLRJwHhFiT9GP8S+t+BgATlLc/NbHowZGDPs3yXWni9lbR5L9fCNYx6TTFNAcSw6rY7c2x7eS0HIPpdrpc3lAr5Ok3aKW9IfuVnRJMrythfJrUqAVUjEo5re+8s2f3K9aOgeYdoNwgq41lg5PcDOg5YmXsmeWFRKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996905; c=relaxed/simple;
	bh=4OSKNRAw8wj5R+QIDkd86TtJQKZ9t7E+NO90UsGFKqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5BzihsauZRRzt0MfUFGFvB3MVf613ENZaSecnO98W51I5ZxmrcKOKrbXKs478gHh1D2lkig/f0ndrEsGmF6qHYaAoTHMmcpzopWzItgrxLRIIgMLUk70V8pkDnoMDiN8t0qrhsBR6G7j1NWEiXinmzfBa/GVl/TzGZym9uRds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrHXGqU7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrHXGqU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750996903; x=1782532903;
  h=date:from:to:cc:subject:message-id;
  bh=4OSKNRAw8wj5R+QIDkd86TtJQKZ9t7E+NO90UsGFKqw=;
  b=mrHXGqU7hBfv2ClDIE2XFSEDIIYPcjFL5ux8a3zNbL8RMqxTMuZEyx2d
   OUC+JXsovmA3w87ku7WSnZFmvsxHyxkIl4Mc6r4i6da6SSzFkOqbh5nww
   t4cmmBdS6hCD+zVEo39e+0Ye2v/NecFWdRFyE4LLLjd3BRX4Geiqb7JYt
   0Nrf9EGwQRk+JGigHdxcF1bK7jQBwcwnqWRqWe4LsfnwC6l4jhW2ftkah
   XEFw1b5Stx9btz8fntNyvq2q8AyWfxmNI4LGg/cxfdiX4BSfW/eWScCw7
   FnrbHyxqGhmiBcmBVDFxoB+TWXMbHEd3f0TWIvXI9JbSXsZznGKzNKs5j
   A==;
X-CSE-ConnectionGUID: riHNkVcKRf2X6VO8xWrwHQ==
X-CSE-MsgGUID: +HCw1AK/SG+NRHAkxmomGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="75852224"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="75852224"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 21:01:43 -0700
X-CSE-ConnectionGUID: bxTQH+YcQRGSgG3Wxs6cQw==
X-CSE-MsgGUID: 6tLRQca8T8WrmyeY4uFp1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="152217983"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Jun 2025 21:01:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV0HK-000VmA-1w;
	Fri, 27 Jun 2025 04:01:30 +0000
Date: Fri, 27 Jun 2025 12:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 1476b218327b89bbb64c14619a2d34f0c320f2c3
Message-ID: <202506271202.ysjHhrTU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 1476b218327b89bbb64c14619a2d34f0c320f2c3  perf/aux: Fix pending disable flow when the AUX ring buffer overruns

elapsed time: 1077m

configs tested: 112
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250626    gcc-12.4.0
arc                   randconfig-001-20250627    gcc-10.5.0
arc                   randconfig-002-20250626    gcc-13.3.0
arc                   randconfig-002-20250627    gcc-10.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250626    clang-21
arm                   randconfig-001-20250627    gcc-10.5.0
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-002-20250627    gcc-10.5.0
arm                   randconfig-003-20250626    gcc-10.5.0
arm                   randconfig-003-20250627    gcc-10.5.0
arm                   randconfig-004-20250626    clang-21
arm                   randconfig-004-20250627    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250626    clang-21
arm64                 randconfig-001-20250627    gcc-10.5.0
arm64                 randconfig-002-20250626    clang-17
arm64                 randconfig-002-20250627    gcc-10.5.0
arm64                 randconfig-003-20250626    gcc-8.5.0
arm64                 randconfig-003-20250627    gcc-10.5.0
arm64                 randconfig-004-20250626    clang-21
arm64                 randconfig-004-20250627    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-001-20250627    gcc-12
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-002-20250627    gcc-12
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-003-20250627    gcc-12
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-004-20250627    gcc-12
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-005-20250627    gcc-12
i386        buildonly-randconfig-006-20250626    clang-20
i386        buildonly-randconfig-006-20250627    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-001-20250627    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-002-20250627    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-003-20250627    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-004-20250627    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-005-20250627    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64      buildonly-randconfig-006-20250627    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
