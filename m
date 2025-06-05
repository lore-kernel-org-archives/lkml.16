Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2FE20330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749159334; cv=none; b=MhILRXlXSO0NjZk9DsenoZFYmKFIMLWRxw6+6f3dkSShlkOxgF/5obkXaVKVOXRWJFfM3xFwG1BiCme7m0PZN9KCBn4AeTopPDUk5XvOnDnmsCrXZEt1kYW7eO/CGLUN7dKyVlK6AA5k65A5N1QwXUGVmZadsNzwx7BNUrHRmLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749159334; c=relaxed/simple;
	bh=InJjN6zcsOZOTWHasrvyLwiyY8QNBp0ip4xNdsI2DFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TB0X1j2cGL3Q2qUc5ZXklY78nzFqm9GavcKzKtPgynXbhBGFG+FLw4NfKuQowVK3e9p7AymfXqpCwm+EILQKsyN9JZYSNIUOUUbCVFrfsANVUURFMZa066Hni5vuPt0NwVTUW2IUOA12xyo5HsJNFXni07TW+ArkdM1ibsy/wDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRR3y1JB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRR3y1JB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749159333; x=1780695333;
  h=date:from:to:cc:subject:message-id;
  bh=InJjN6zcsOZOTWHasrvyLwiyY8QNBp0ip4xNdsI2DFY=;
  b=dRR3y1JBFdI6QEHF/2zFXuDfA49qnRCdwtATheheiKM0J2y01kKkr/ix
   IqWtrK23LJlmEBnY0MKVKbPn6ua4WoyM4D0rjNK8NeuqibzamXWSe5jLj
   8LF+OciPbP/nVTvN26YP8uVbz7ATvpdOic0C7MHKInqkGp+U9ZQErqkao
   FE2v/Z/Pp+NcRu1bkKdVoY53TB5IbKHOQS9jd0SiMmPH4rXBzcpWBIPso
   QKYeXaVe4dwqEEhrTnAFZ/j9r8HytAczeLhz0kMdEWYGew1D1GrXG5WUy
   UWKLbmP28P8nHQtyXeHNEJD87COOG5CgcTUD7y8Ax0J+HxtN8yxEAFvV8
   Q==;
X-CSE-ConnectionGUID: obZcZLtSRZun+p6vQhl1tA==
X-CSE-MsgGUID: SiKVeNFxTaGR3tFnfQI0dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="73833222"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="73833222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 14:35:33 -0700
X-CSE-ConnectionGUID: HRaU8m3cR76pU4GGH9xVqA==
X-CSE-MsgGUID: swU/iRYzRJ6NfJl9jeCa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="150504252"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2025 14:35:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNIFF-0004Uv-0T;
	Thu, 05 Jun 2025 21:35:29 +0000
Date: Fri, 06 Jun 2025 05:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.06.04a] BUILD SUCCESS
 2e8c51d247e7324e3a2204da839069fbe222c9cd
Message-ID: <202506060509.G3EeWgyw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.06.04a
branch HEAD: 2e8c51d247e7324e3a2204da839069fbe222c9cd  torture: Add textid.txt file to --do-allmodconfig and --do-rcu-rust runs

elapsed time: 1442m

configs tested: 207
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250605    gcc-15.1.0
arc                   randconfig-002-20250605    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                            mmp2_defconfig    gcc-15.1.0
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-002-20250605    clang-17
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-004-20250605    clang-21
arm                           u8500_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-004-20250605    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250605    clang-21
csky                  randconfig-001-20250605    gcc-10.5.0
csky                  randconfig-002-20250605    clang-21
csky                  randconfig-002-20250605    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-002-20250605    clang-20
hexagon               randconfig-002-20250605    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250605    clang-20
i386        buildonly-randconfig-001-20250605    gcc-12
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-003-20250605    clang-20
i386        buildonly-randconfig-003-20250605    gcc-12
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-006-20250605    clang-20
i386        buildonly-randconfig-006-20250605    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250605    clang-20
i386                  randconfig-002-20250605    clang-20
i386                  randconfig-003-20250605    clang-20
i386                  randconfig-004-20250605    clang-20
i386                  randconfig-005-20250605    clang-20
i386                  randconfig-006-20250605    clang-20
i386                  randconfig-007-20250605    clang-20
i386                  randconfig-011-20250605    clang-20
i386                  randconfig-012-20250605    clang-20
i386                  randconfig-013-20250605    clang-20
i386                  randconfig-014-20250605    clang-20
i386                  randconfig-015-20250605    clang-20
i386                  randconfig-016-20250605    clang-20
i386                  randconfig-017-20250605    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250605    clang-21
loongarch             randconfig-001-20250605    gcc-12.4.0
loongarch             randconfig-002-20250605    clang-21
loongarch             randconfig-002-20250605    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                     loongson1b_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250605    clang-21
nios2                 randconfig-001-20250605    gcc-14.2.0
nios2                 randconfig-002-20250605    clang-21
nios2                 randconfig-002-20250605    gcc-11.5.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250605    clang-21
parisc                randconfig-001-20250605    gcc-9.3.0
parisc                randconfig-002-20250605    clang-21
parisc                randconfig-002-20250605    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                    gamecube_defconfig    gcc-15.1.0
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-003-20250605    clang-21
powerpc64             randconfig-001-20250605    clang-18
powerpc64             randconfig-001-20250605    clang-21
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-003-20250605    clang-21
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-002-20250605    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-002-20250605    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250605    clang-21
sh                    randconfig-001-20250605    gcc-12.4.0
sh                    randconfig-002-20250605    clang-21
sh                    randconfig-002-20250605    gcc-12.4.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250605    clang-21
sparc                 randconfig-001-20250605    gcc-11.5.0
sparc                 randconfig-002-20250605    clang-21
sparc                 randconfig-002-20250605    gcc-7.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250605    clang-21
sparc64               randconfig-001-20250605    gcc-12.4.0
sparc64               randconfig-002-20250605    clang-21
sparc64               randconfig-002-20250605    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250605    clang-21
um                    randconfig-002-20250605    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-002-20250605    gcc-12
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-005-20250605    gcc-12
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250605    gcc-12
x86_64                randconfig-002-20250605    gcc-12
x86_64                randconfig-003-20250605    gcc-12
x86_64                randconfig-004-20250605    gcc-12
x86_64                randconfig-005-20250605    gcc-12
x86_64                randconfig-006-20250605    gcc-12
x86_64                randconfig-007-20250605    gcc-12
x86_64                randconfig-008-20250605    gcc-12
x86_64                randconfig-071-20250605    clang-20
x86_64                randconfig-072-20250605    clang-20
x86_64                randconfig-073-20250605    clang-20
x86_64                randconfig-074-20250605    clang-20
x86_64                randconfig-075-20250605    clang-20
x86_64                randconfig-076-20250605    clang-20
x86_64                randconfig-077-20250605    clang-20
x86_64                randconfig-078-20250605    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250605    clang-21
xtensa                randconfig-001-20250605    gcc-7.5.0
xtensa                randconfig-002-20250605    clang-21
xtensa                randconfig-002-20250605    gcc-12.4.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
