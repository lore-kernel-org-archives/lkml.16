Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50A4690
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 21:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745097624; cv=none; b=YQxjebr1NI8t63aiqI8ulr0YM2/Y683VhfF9t9Q8fvsqp2kfMjtnwVG+4YoZYi57qFqOfTogfnLHmbvxcyHwDm57QD/KVURj+y4hCLQlCaLt8HaKSLbONB8sjstrD6gCrxYSVHCGhvA9YayndNDHRHpgJ1gbQWpmz2vX0KjGx5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745097624; c=relaxed/simple;
	bh=Mo3ycnVVd22fk3RAOwPf+HgZtSLnV/ctONbZl3cGa6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nSCOPyCIVse3RE/XLYrbWYyReuZKYG5/H1/xI7wtIEyC2Vn+CyWIa6E80TGlnYWWbYZ6GJWBvcxcunaZB1o6APMqgP8zDMinvKZKuiMxSP0CEYDwOILApPx8QKSnFs/hdccxd+2QdwKAt/5yNUpzeQwzCAQkwZ1Fu1aQg1yeHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m82ZvIJK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m82ZvIJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745097622; x=1776633622;
  h=date:from:to:cc:subject:message-id;
  bh=Mo3ycnVVd22fk3RAOwPf+HgZtSLnV/ctONbZl3cGa6Q=;
  b=m82ZvIJKIGr0xf+4x0JN9rl9q2WrKdA0nBUCvNT64F48Xa8FSaDYAcEo
   a9J9T+CEvGqvT6Hd7iFlXFrshhhndkqwJMdLvU2m1tiEKlK6qxRQwpLvH
   O5Tn6TDAPnxqYAt/44pWZ3LjE6HqVJBjP7o3HsfgOaaOyDLrEfeLBpks7
   yYTPb1w6Ih0TaYLE5iT+9OOa4tsAceylIxBuEVNYVT0VY9xv9W/G/K8H9
   tqSYeX3JyqDyEeHH0foz2c7jZPhmytXnZqBbNEwnb7ewPIfHzCMYhG+pG
   GQDD5gR2Z2yDDmEJSbafmxWFAEmF3/vfa1v3yHl2nV2T4UOzSbJFBsUO9
   Q==;
X-CSE-ConnectionGUID: apx5MdlASo276+k0M5oRhQ==
X-CSE-MsgGUID: ZUXyLFPiTvuervQikV+owA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50517014"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="50517014"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 14:20:21 -0700
X-CSE-ConnectionGUID: NxdebIyEQ8mD0nc+EcGkdA==
X-CSE-MsgGUID: q+RYsN3NQiSoEMGwbdz4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131919153"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2025 14:20:20 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Fbm-0004Bm-1Z;
	Sat, 19 Apr 2025 21:20:18 +0000
Date: Sun, 20 Apr 2025 05:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:jfern.2025.04.18a] BUILD SUCCESS
 7fca2a80b81a0ea2dafcbcbd18f492bde1a29744
Message-ID: <202504200550.hWuB2Wbh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git jfern.2025.04.18a
branch HEAD: 7fca2a80b81a0ea2dafcbcbd18f492bde1a29744  Merge branches 'rcu/misc-for-6.16', 'rcu/seq-counters-for-6.16' and 'rcu/torture-for-6.16' into rcu/for-next

elapsed time: 1742m

configs tested: 180
configs skipped: 5

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
arc                   randconfig-001-20250419    gcc-14.2.0
arc                   randconfig-002-20250419    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                      integrator_defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                        keystone_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-16
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250419    gcc-6.5.0
arm                   randconfig-002-20250419    gcc-7.5.0
arm                   randconfig-003-20250419    clang-18
arm                   randconfig-004-20250419    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250419    gcc-7.5.0
arm64                 randconfig-002-20250419    gcc-9.5.0
arm64                 randconfig-003-20250419    gcc-5.5.0
arm64                 randconfig-004-20250419    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250419    gcc-11.5.0
csky                  randconfig-002-20250419    gcc-11.5.0
hexagon                          alldefconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250419    clang-21
hexagon               randconfig-002-20250419    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250419    gcc-11
i386        buildonly-randconfig-002-20250419    gcc-12
i386        buildonly-randconfig-003-20250419    clang-20
i386        buildonly-randconfig-004-20250419    clang-20
i386        buildonly-randconfig-005-20250419    clang-20
i386        buildonly-randconfig-006-20250419    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250420    gcc-12
i386                  randconfig-012-20250420    gcc-12
i386                  randconfig-013-20250420    gcc-12
i386                  randconfig-014-20250420    gcc-12
i386                  randconfig-015-20250420    gcc-12
i386                  randconfig-016-20250420    gcc-12
i386                  randconfig-017-20250420    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250419    gcc-14.2.0
loongarch             randconfig-002-20250419    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250419    gcc-7.5.0
nios2                 randconfig-002-20250419    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250419    gcc-10.5.0
parisc                randconfig-002-20250419    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250419    gcc-5.5.0
powerpc               randconfig-002-20250419    gcc-9.3.0
powerpc               randconfig-003-20250419    gcc-5.5.0
powerpc64             randconfig-001-20250419    gcc-5.5.0
powerpc64             randconfig-002-20250419    gcc-10.5.0
powerpc64             randconfig-003-20250419    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250419    gcc-14.2.0
riscv                 randconfig-002-20250419    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250419    clang-21
s390                  randconfig-002-20250419    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250419    gcc-5.5.0
sh                    randconfig-002-20250419    gcc-11.5.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250419    gcc-12.4.0
sparc                 randconfig-002-20250419    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250419    gcc-8.5.0
sparc64               randconfig-002-20250419    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250419    clang-19
um                    randconfig-002-20250419    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250419    gcc-12
x86_64      buildonly-randconfig-002-20250419    gcc-11
x86_64      buildonly-randconfig-003-20250419    gcc-12
x86_64      buildonly-randconfig-004-20250419    gcc-11
x86_64      buildonly-randconfig-005-20250419    gcc-12
x86_64      buildonly-randconfig-006-20250419    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250419    gcc-10.5.0
xtensa                randconfig-002-20250419    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
