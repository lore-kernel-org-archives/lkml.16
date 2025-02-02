Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688371798F
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738481955; cv=none; b=m2uLq2kHPoO0QETmowgCI5FUeZxXhYT7baklXHqper9PLOQQ+YDkCl1ZC9QtqMnbjZD8E7wk3VgRy6BxnAYQv8pRdODIJNHTNcygawZILgCehz71uFjxYvrNE6thYk+pV0kew8YOf1fdsm7DhzV+jfQGttr6+yHe76REL3v/jlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738481955; c=relaxed/simple;
	bh=PAJnr8nW7aRE4rofdaa+ylG1z9XSN/S8IW8fM7AB8Is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QDIwEYJdPzjs+GHVAhCPes6a3EnSX0kyBLLyOjGZXwVuyiGEhsLZSM7Y6/tLeVmyLzuNmYBRTg/Un+XsfRYZjRkx1gGLNaPVZbOOoHNqCtspsisZ4ARFVGSRUpwLEm8Q0ZsfnFR4f1Pl/Pn8wIxTn/ci4PykLiQBpA7Kuqb2Ors=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8VnYxKX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8VnYxKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738481953; x=1770017953;
  h=date:from:to:cc:subject:message-id;
  bh=PAJnr8nW7aRE4rofdaa+ylG1z9XSN/S8IW8fM7AB8Is=;
  b=S8VnYxKX1bQR0OdKF4J9fFXVfITShguwd5P7fWDar0ZXjEoOE7Ylx7qh
   smBsBTVtpiT++qNqkyM+7k8e5m1ZaZOqw59s/NzMF7B3A3Hy5lDYE6jGF
   AzbXg/qScFeEm6lkNbu9FowMaTc/mIWPezFYey0PkGHwfQrUSBFiRXbHE
   6LDQ65Gx8pMtK1k7n9DQtof0bibMqK/edjw+m9GuQ1/o8bCyC+jsmj5UQ
   V4+1PmPC+z1a0EhRldCGbVEobNOVh9A1MqRjXactdYUt1xHDcdie9t+Hh
   a+veplooXnGFdwuC9NCONfmLEZ+2z5W98FA/fhRvqJIQJ+y0RljXA8R38
   Q==;
X-CSE-ConnectionGUID: 0yUG2b4UQvCrl5GIcS20nA==
X-CSE-MsgGUID: GDW9j6s+SeGlrq6LtxwAoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="38902141"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="38902141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 23:39:12 -0800
X-CSE-ConnectionGUID: R2zjSsC+TliHSwt7a1GUTQ==
X-CSE-MsgGUID: k/U71yYZTPW+X6GPrwa2rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="109776808"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2025 23:39:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teUZR-000pQN-0M;
	Sun, 02 Feb 2025 07:39:09 +0000
Date: Sun, 02 Feb 2025 15:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 5865750407ec5d6047fca2ac16d55c68d4208bc3
Message-ID: <202502021553.H4HA8aQn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 5865750407ec5d6047fca2ac16d55c68d4208bc3  Merge branch 'WIP.fixes'

elapsed time: 724m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250202    gcc-13.2.0
arc                   randconfig-002-20250202    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-21
arm                          collie_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-15
arm                         lpc18xx_defconfig    clang-19
arm                   milbeaut_m10v_defconfig    clang-21
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250202    gcc-14.2.0
arm                   randconfig-002-20250202    clang-15
arm                   randconfig-003-20250202    clang-21
arm                   randconfig-004-20250202    clang-15
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250202    gcc-14.2.0
arm64                 randconfig-002-20250202    clang-17
arm64                 randconfig-003-20250202    gcc-14.2.0
arm64                 randconfig-004-20250202    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250202    gcc-14.2.0
csky                  randconfig-002-20250202    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250202    clang-16
hexagon               randconfig-002-20250202    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250202    gcc-12
i386        buildonly-randconfig-002-20250202    gcc-12
i386        buildonly-randconfig-003-20250202    gcc-12
i386        buildonly-randconfig-004-20250202    gcc-12
i386        buildonly-randconfig-005-20250202    gcc-12
i386        buildonly-randconfig-006-20250202    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250202    gcc-12
i386                  randconfig-012-20250202    gcc-12
i386                  randconfig-013-20250202    gcc-12
i386                  randconfig-014-20250202    gcc-12
i386                  randconfig-015-20250202    gcc-12
i386                  randconfig-016-20250202    gcc-12
i386                  randconfig-017-20250202    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250202    gcc-14.2.0
loongarch             randconfig-002-20250202    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-19
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250202    gcc-14.2.0
nios2                 randconfig-002-20250202    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250202    gcc-14.2.0
parisc                randconfig-002-20250202    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       ebony_defconfig    clang-18
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250202    clang-17
powerpc               randconfig-002-20250202    gcc-14.2.0
powerpc               randconfig-003-20250202    gcc-14.2.0
powerpc64             randconfig-001-20250202    gcc-14.2.0
powerpc64             randconfig-002-20250202    clang-21
powerpc64             randconfig-003-20250202    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250202    clang-21
riscv                 randconfig-002-20250202    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250202    gcc-14.2.0
s390                  randconfig-002-20250202    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250202    gcc-14.2.0
sh                    randconfig-002-20250202    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250202    gcc-14.2.0
sparc                 randconfig-002-20250202    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250202    gcc-14.2.0
sparc64               randconfig-002-20250202    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250202    gcc-12
um                    randconfig-002-20250202    clang-21
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250202    clang-19
x86_64      buildonly-randconfig-002-20250202    clang-19
x86_64      buildonly-randconfig-003-20250202    gcc-12
x86_64      buildonly-randconfig-004-20250202    gcc-12
x86_64      buildonly-randconfig-005-20250202    clang-19
x86_64      buildonly-randconfig-006-20250202    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-071-20250202    gcc-12
x86_64                randconfig-072-20250202    gcc-12
x86_64                randconfig-073-20250202    gcc-12
x86_64                randconfig-074-20250202    gcc-12
x86_64                randconfig-075-20250202    gcc-12
x86_64                randconfig-076-20250202    gcc-12
x86_64                randconfig-077-20250202    gcc-12
x86_64                randconfig-078-20250202    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250202    gcc-14.2.0
xtensa                randconfig-002-20250202    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
