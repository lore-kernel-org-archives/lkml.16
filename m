Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55838F5E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587642; cv=none; b=U4D1iENOX1X2uBwGmt7VG6zT4kpWYmafsNebY2IPVvMU08iizqDn6Y8vVmVKpFO31Fg4/hgg+PiLXv1rxTmQNqep51vgYgInIbhXbrKFjOwW7WAYiKbNvXPJy7uDN72Cl3w6r//Cz//dLsGa9PzX/NGZMG5NL3EDKDHJ9Tfy5Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587642; c=relaxed/simple;
	bh=3jsUga/RuVJsJKru6oDA0/wawEtiKa4NKBxuGAADDTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n0wJzVomV1Vq69ZC2GfVNRdqlgTOq2kHNTi2IVj8OcT3X+p/Z7qlhjd+OmpbUFS8eY1uYRrGHpXbEs6nEX2qdJ8ZUlcHF/M5Xwp2NmmZVVgb52ElEmq68EPh+bkvBQXwHU8mP5Ea0uYS85C/ondZcby+DYouxuOKlFyF8DkcJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkbfaxFh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkbfaxFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745587639; x=1777123639;
  h=date:from:to:cc:subject:message-id;
  bh=3jsUga/RuVJsJKru6oDA0/wawEtiKa4NKBxuGAADDTg=;
  b=fkbfaxFhMD9vuaXiZVbhoRdwPe7zcNeih9nQ6HvEcw5Rnm90VYn59Ewk
   AA4BRP4M5p1m/jtRW49iNEQaj2+BUTzIIqUrCxwQtcNW/GxWchE7cfpFZ
   kkySrWrmZ3uwRuSADhQQN48f30vGZRPKLThzaC/4U2RG9Sact6TGXI7oO
   yXfMTyseseZvPueGaWFa/HYSjSW2IxiqRrjhwmhbKYU5wzCF2jCnyKQC0
   S7XFzH4B8LO77vVUsZuJsCXHSaF3EV9WAqg5FhhhEbFKaKQPUCONrWsWl
   k6WWE8+jbYAuDRM3gZ6zrAey6VH6i6Iccxv6SOCqfT1XneIVEOW8tlI0G
   w==;
X-CSE-ConnectionGUID: eT4oSmskSGqSY5Iv4DRJaA==
X-CSE-MsgGUID: wB41TklkRQeIe6qbuaPZHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51058258"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51058258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 06:27:18 -0700
X-CSE-ConnectionGUID: g0CAmWOeT5qULh0wfO0OlQ==
X-CSE-MsgGUID: ayHy4+GpRniHf2rBHj19gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="156140312"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2025 06:27:19 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8J5I-0005EH-1w;
	Fri, 25 Apr 2025 13:27:16 +0000
Date: Fri, 25 Apr 2025 21:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/drivers] BUILD SUCCESS
 76b66e8c9d159eb3d1699e0fa80ceacf9a9ae627
Message-ID: <202504252146.xeeHdOS0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
branch HEAD: 76b66e8c9d159eb3d1699e0fa80ceacf9a9ae627  irqchip/sg2042-msi: Fix wrong type cast in sg2044_msi_irq_ack()

elapsed time: 1457m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250424    gcc-8.5.0
arc                   randconfig-002-20250424    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-19
arm                   randconfig-001-20250424    gcc-7.5.0
arm                   randconfig-002-20250424    gcc-7.5.0
arm                   randconfig-003-20250424    clang-21
arm                   randconfig-004-20250424    clang-21
arm                           sama7_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250424    clang-21
arm64                 randconfig-002-20250424    gcc-8.5.0
arm64                 randconfig-003-20250424    clang-21
arm64                 randconfig-004-20250424    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250424    gcc-12.4.0
csky                  randconfig-002-20250424    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250424    clang-21
hexagon               randconfig-002-20250424    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250424    gcc-12
i386        buildonly-randconfig-002-20250424    clang-20
i386        buildonly-randconfig-003-20250424    clang-20
i386        buildonly-randconfig-004-20250424    clang-20
i386        buildonly-randconfig-005-20250424    gcc-12
i386        buildonly-randconfig-006-20250424    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250424    gcc-14.2.0
loongarch             randconfig-002-20250424    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250424    gcc-10.5.0
nios2                 randconfig-002-20250424    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250424    gcc-9.3.0
parisc                randconfig-002-20250424    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250424    clang-21
powerpc               randconfig-002-20250424    clang-17
powerpc               randconfig-003-20250424    clang-21
powerpc64             randconfig-001-20250424    clang-21
powerpc64             randconfig-002-20250424    clang-21
powerpc64             randconfig-003-20250424    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250424    clang-21
riscv                 randconfig-002-20250424    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250424    gcc-9.3.0
s390                  randconfig-002-20250424    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250424    gcc-12.4.0
sh                    randconfig-002-20250424    gcc-6.5.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250424    gcc-10.3.0
sparc                 randconfig-002-20250424    gcc-11.5.0
sparc64               randconfig-001-20250424    gcc-9.3.0
sparc64               randconfig-002-20250424    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250424    clang-21
um                    randconfig-002-20250424    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250424    gcc-12
x86_64      buildonly-randconfig-002-20250424    clang-20
x86_64      buildonly-randconfig-003-20250424    gcc-12
x86_64      buildonly-randconfig-004-20250424    clang-20
x86_64      buildonly-randconfig-005-20250424    clang-20
x86_64      buildonly-randconfig-006-20250424    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250424    gcc-14.2.0
xtensa                randconfig-002-20250424    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
