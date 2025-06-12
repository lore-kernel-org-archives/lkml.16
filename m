Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638D53365
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735438; cv=none; b=ExC5z+HqL3RvyXq+xeqCX7T9ztoexPuYvhvwGk24Lp0pXikuwBuGcqKAixFm8NrTJqDRaN2pt3Scans2xecoj4OZ3pxNYHzj1rtZM+DfC66AJhj8LtUQUqnKi2oYm2VpWzhqkm2u5USeM/RG/2GFzVTrC5ESgDmjfauO1Anwql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735438; c=relaxed/simple;
	bh=b1chWvs0kkS5sG9TN9SCqifGxc4EAsgJlIt1Q52fOPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I1IMaKBbH2EAwG3s9GxFYokI9mSuaagyIxSZO345MDpVGCBwYkGoEcIDY/XO+lP4M8yLHBCebmC894QEwp/HYNxvAUSPbxfeMwlkZSgJYTxinLZMW0G8ZixxqJPOJx/9wq06yGogwQIbl/70pwG7gktRcr1R+FbEUSiMjnHcz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWCbXyLF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWCbXyLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749735436; x=1781271436;
  h=date:from:to:cc:subject:message-id;
  bh=b1chWvs0kkS5sG9TN9SCqifGxc4EAsgJlIt1Q52fOPU=;
  b=QWCbXyLF8taCWY0yi9RVPUmd88ggisVonK2nkIf8AlCF1oak5wPUz35q
   BxBG/2PUVcxD7yS0g7IJeMyurh7oTGR0hEe5JuolOY311e0UU07eOtmhY
   gsj7KcR2tiX0I5nYT5d/AjCzLL8gEZ7dtz38J/84YEADb4YXYpFXNkTPo
   SJAfxUlC+ZzZK6mmJEJe0KwuQV5+LqZJHSBMNPGngLyGZ5OYbf/EJfegv
   weo9IyixhZbEYpP2AzUBXtdmDGEzEMSUGsWtnljAxF6+YY/MCCpp+vB9U
   3f5ZfTwg2Mc+zTpfopF8+CA6hAGUEttcnhd/Evt1jmU22juAICUzZkdCT
   A==;
X-CSE-ConnectionGUID: 0nkmV1uPQv2piAgGEtpmmQ==
X-CSE-MsgGUID: D5GCRV19TDS54U/fQngTIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62566699"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="62566699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:37:16 -0700
X-CSE-ConnectionGUID: grgOYM1AQ+ugyyQniGtBuA==
X-CSE-MsgGUID: IkR79PZnRjmb38sD679ktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="151353101"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2025 06:37:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPi7E-000BZi-2V;
	Thu, 12 Jun 2025 13:37:12 +0000
Date: Thu, 12 Jun 2025 21:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 bc4394e5e79cdda1b0997e0be1d65e242f523f02
Message-ID: <202506122106.rWkU5MiM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: bc4394e5e79cdda1b0997e0be1d65e242f523f02  perf: Fix the throttle error of some clock events

elapsed time: 1466m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                        multi_v7_defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250611    gcc-11.5.0
arm                   randconfig-002-20250611    clang-21
arm                   randconfig-003-20250611    gcc-13.3.0
arm                   randconfig-004-20250611    gcc-13.3.0
arm                        realview_defconfig    clang-16
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250611    gcc-6.5.0
arm64                 randconfig-002-20250611    gcc-9.5.0
arm64                 randconfig-003-20250611    gcc-13.3.0
arm64                 randconfig-004-20250611    gcc-5.5.0
csky                             alldefconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250612    gcc-11.5.0
csky                  randconfig-002-20250612    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250612    clang-21
hexagon               randconfig-002-20250612    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250611    gcc-12
i386        buildonly-randconfig-002-20250611    gcc-12
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250611    gcc-12
i386        buildonly-randconfig-005-20250611    gcc-11
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250612    gcc-13.3.0
loongarch             randconfig-002-20250612    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250612    gcc-14.2.0
nios2                 randconfig-002-20250612    gcc-5.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250612    gcc-5.5.0
parisc                randconfig-002-20250612    gcc-10.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250612    clang-21
powerpc               randconfig-002-20250612    gcc-7.5.0
powerpc               randconfig-003-20250612    clang-17
powerpc64             randconfig-001-20250612    gcc-12.4.0
powerpc64             randconfig-002-20250612    clang-21
powerpc64             randconfig-003-20250612    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250611    clang-21
riscv                 randconfig-002-20250611    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250611    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250611    gcc-5.5.0
sh                    randconfig-002-20250611    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-11.5.0
sparc                 randconfig-002-20250611    gcc-6.5.0
sparc64               randconfig-001-20250611    gcc-7.5.0
sparc64               randconfig-002-20250611    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250611    clang-21
um                    randconfig-002-20250611    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    gcc-12
x86_64      buildonly-randconfig-005-20250611    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250611    gcc-13.3.0
xtensa                randconfig-002-20250611    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
