Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7376CDF49
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747114274; cv=none; b=bEdwK/GkfivPJuXccvfShcsLEhdikqHi7nNvra3ZGVztPrw8p9Sft7Ig6aqje8noIb+dT1S6ZpYBJwkUsAkwKgYC8nhM5ToyKniMt7ijCyko6WjPaDgznBRevvK4Xiy3/5UyCdWjyd/RuuuSqlSaGDTb2CDItVlLdhz7pr1I47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747114274; c=relaxed/simple;
	bh=ZuMZa2xceHhI23AkpoN9E1cra7t+j+J+6HQ+KGqopwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QhYptAJsDE5cqAW+4dXrklgM4GNbNtmdbCjGMMwrKkHCmHgiBGEN6+gifinaAq1w+RD8LtH7GrQuw+Z0djalrHAz08Vs+4i4qZwAfMUTeQjfOw4bsWKf9qXN56v04kWTx9ZbP2ucFZyqjj/zcy3GB7BbSc+Rx8Hcu+rnB1hX2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Io3Z/dGQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Io3Z/dGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747114273; x=1778650273;
  h=date:from:to:cc:subject:message-id;
  bh=ZuMZa2xceHhI23AkpoN9E1cra7t+j+J+6HQ+KGqopwc=;
  b=Io3Z/dGQTSciEJWezzFFOLdlmXBNda2VDSwIVsJll4ODOq/G9J0H+/YZ
   6xLN1iVNkhoIXYc9cncBWEDpNKyxUhNm71UF3zSaWd5gqH1hI4MOC7PLk
   NsC8tFevX5wu4GrdZZ3LmZJEunYxJjuK1/rCgzEBxVjv32m8YKJeMPI/Z
   XForIc/gcEw6pEpW+qpG0wAMqLm9S7WMKn2/kq31kbokctESkr6gmMvU7
   tjQ3UnkryrqNOnsdYxdyp/Xp8/fVXTdE8LzKJkRqlBpcdAebNnmzcnVe3
   irNE5NmEha3WC27YtiW1wdKAf1qjcyLYJUQ56FtLlmgOSQNqFTS0Y2AFb
   w==;
X-CSE-ConnectionGUID: f2nN5EW8T5+s8kpz2sLxhw==
X-CSE-MsgGUID: C4ve7vcKTdSAq6QDOwbAow==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66346217"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="66346217"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:31:12 -0700
X-CSE-ConnectionGUID: c3XnzzP2RdWIK3aF6znAgw==
X-CSE-MsgGUID: uye+WaQYQvmv/kXhg0IXrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="168685163"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2025 22:31:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEiEO-000Fjl-2o;
	Tue, 13 May 2025 05:31:08 +0000
Date: Tue, 13 May 2025 13:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 199e2b193826957b5b2b5777abcb44078c5f66c0
Message-ID: <202505131350.Uyq91saH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 199e2b193826957b5b2b5777abcb44078c5f66c0  Merge branch into tip/master: 'x86/urgent'

elapsed time: 943m

configs tested: 108
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20250512    gcc-14.2.0
arc                   randconfig-002-20250512    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250512    gcc-7.5.0
arm                   randconfig-002-20250512    clang-17
arm                   randconfig-003-20250512    gcc-6.5.0
arm                   randconfig-004-20250512    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250512    gcc-7.5.0
arm64                 randconfig-002-20250512    clang-21
arm64                 randconfig-003-20250512    clang-21
arm64                 randconfig-004-20250512    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250513    gcc-14.2.0
csky                  randconfig-002-20250513    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250513    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250512    gcc-11
i386        buildonly-randconfig-002-20250512    clang-20
i386        buildonly-randconfig-003-20250512    clang-20
i386        buildonly-randconfig-004-20250512    gcc-12
i386        buildonly-randconfig-005-20250512    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250513    gcc-14.2.0
loongarch             randconfig-002-20250513    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250513    gcc-10.5.0
nios2                 randconfig-002-20250513    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250513    gcc-11.5.0
parisc                randconfig-002-20250513    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc512x_defconfig    clang-21
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-002-20250513    gcc-8.5.0
powerpc               randconfig-003-20250513    clang-21
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-003-20250513    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250512    gcc-7.5.0
riscv                 randconfig-002-20250512    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250512    clang-18
s390                  randconfig-002-20250512    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250512    gcc-11.5.0
sh                    randconfig-002-20250512    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250512    gcc-10.3.0
sparc                 randconfig-002-20250512    gcc-8.5.0
sparc64               randconfig-001-20250512    gcc-6.5.0
sparc64               randconfig-002-20250512    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250512    gcc-12
um                    randconfig-002-20250512    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250512    gcc-12
x86_64      buildonly-randconfig-002-20250512    gcc-12
x86_64      buildonly-randconfig-003-20250512    clang-20
x86_64      buildonly-randconfig-004-20250512    clang-20
x86_64      buildonly-randconfig-005-20250512    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250512    gcc-12.4.0
xtensa                randconfig-002-20250512    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
