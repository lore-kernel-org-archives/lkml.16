Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530EF18FDD5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925814; cv=none; b=SXDpOi7V5YqYwoizFv4/QUknkiOhgjFr3zrygQfS3Z5zIaWd77MktYASnwUbzLJUkhf9BZ+0gUDszR0BnjjNzyFTw3HimiMTrAE/5BlEtCSCftON9YuiWxwAmq1sLB9pk4cJFkNjauk9lpiWfzx9yDUYNvOReD0aE1CE0P1me38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925814; c=relaxed/simple;
	bh=cAbcrUr3iHWB2z0ft4FDiFBvw4ju9eArjwIjp8c2MwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PttDhSx6bWMFbYeYNZWWwB4kbcA6FjNufzaqvYNhOfi9Dfyq0DUekEHxUIAaCxae/CVXliAe6BRXY8v3tntBgFY+hGp6oeS3gzcefo6jp7GyP94tedhZXqmu79pLoKu1y1wSoKmUIqmwxdtloignkvjH1pivExCxkGK7BRq6+uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyJ8lyyb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyJ8lyyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738925812; x=1770461812;
  h=date:from:to:cc:subject:message-id;
  bh=cAbcrUr3iHWB2z0ft4FDiFBvw4ju9eArjwIjp8c2MwM=;
  b=HyJ8lyybNeiRJZsXQfNd7sHtNqq0f8XEo3UvD8Q1SjnWl2FqtYdNRA6j
   QOs6vFdsS3WyWpqNYl4bB/qP0JFIEfZ5dmG93mQwJZrefOfUZOtPZXM7y
   64fbD7Adpl62kOW+54cfRIVeNt/qTc4LvCH9rcIynDWyG0Yltg+hDQlba
   nMC5wnHpm+DGVAUEeQ342TZ+Sn+xO5nq5evmBktP9fjDWeIvrCySLYz3L
   p0ilrG0RcXQPoW3IIcvI3ksvZA1fsZ46S20vove3Y7C0RKkHgG5YZjbyN
   D39Slhfg7oJoOGnE3Abpqj6ubWZEv+GJCi5msseM0kppXApWf6eUBvWgi
   g==;
X-CSE-ConnectionGUID: efHigRK4SJqRI2fDX35tXg==
X-CSE-MsgGUID: guVfiB6nRQCSC7Y+39StVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39457690"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39457690"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:56:51 -0800
X-CSE-ConnectionGUID: KAy4M2reTlWzjZz//1PQHQ==
X-CSE-MsgGUID: x/k4PnZyTfyLWAhqZU7yow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111418755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Feb 2025 02:56:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgM2S-000yCV-2O;
	Fri, 07 Feb 2025 10:56:48 +0000
Date: Fri, 07 Feb 2025 18:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.02.05b] BUILD SUCCESS
 1ceda59f0cb3c09cd7e73511a86e40013d6d1396
Message-ID: <202502071825.p1hPbAGX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.02.05b
branch HEAD: 1ceda59f0cb3c09cd7e73511a86e40013d6d1396  fixup! printk: Flush console log from kernel_power_off()

elapsed time: 1443m

configs tested: 114
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250206    gcc-13.2.0
arc                   randconfig-002-20250206    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-21
arm                      jornada720_defconfig    clang-21
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250206    clang-21
arm                   randconfig-002-20250206    clang-19
arm                   randconfig-003-20250206    clang-21
arm                   randconfig-004-20250206    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250206    clang-21
arm64                 randconfig-002-20250206    clang-21
arm64                 randconfig-003-20250206    clang-15
arm64                 randconfig-004-20250206    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250206    gcc-14.2.0
csky                  randconfig-002-20250206    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon               randconfig-001-20250206    clang-21
hexagon               randconfig-002-20250206    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250206    clang-19
i386        buildonly-randconfig-002-20250206    gcc-12
i386        buildonly-randconfig-003-20250206    clang-19
i386        buildonly-randconfig-004-20250206    clang-19
i386        buildonly-randconfig-005-20250206    clang-19
i386        buildonly-randconfig-006-20250206    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250206    gcc-14.2.0
loongarch             randconfig-002-20250206    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250206    gcc-14.2.0
nios2                 randconfig-002-20250206    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250206    gcc-14.2.0
parisc                randconfig-002-20250206    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250206    clang-21
powerpc               randconfig-002-20250206    clang-19
powerpc               randconfig-003-20250206    clang-21
powerpc64             randconfig-001-20250206    clang-15
powerpc64             randconfig-002-20250206    clang-17
powerpc64             randconfig-003-20250206    clang-19
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250206    clang-19
riscv                 randconfig-002-20250206    clang-17
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250206    clang-21
s390                  randconfig-002-20250206    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250206    gcc-14.2.0
sparc                 randconfig-002-20250206    gcc-14.2.0
sparc64               randconfig-001-20250206    gcc-14.2.0
sparc64               randconfig-002-20250206    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250206    clang-15
um                    randconfig-002-20250206    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250206    clang-19
x86_64      buildonly-randconfig-002-20250206    clang-19
x86_64      buildonly-randconfig-003-20250206    clang-19
x86_64      buildonly-randconfig-004-20250206    clang-19
x86_64      buildonly-randconfig-005-20250206    clang-19
x86_64      buildonly-randconfig-006-20250206    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250206    gcc-14.2.0
xtensa                randconfig-002-20250206    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
