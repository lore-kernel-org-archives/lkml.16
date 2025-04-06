Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10271137E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743966949; cv=none; b=PejSYtO8cYYa+0bV5Ndd5iLd/9ofprtSgJBOYBrvMFI8qHDeJokIhdC3F61FxvcL8TVHmn4TFpLljE2uTm74fDp6gE4x8DFclTMwub8V6JYHyrlEb/Xcd4ee+IHsT3Kss+CG3OuKgbk8ukz2FBLXvJEBN5noizX+DOb/qSMMB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743966949; c=relaxed/simple;
	bh=JArHlkccVnGPjAbky/RjFU3HcXdGRuLIPe/yZN9Q86U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dAwEtMIGTDil4mW03NmNylmzdDP2OJqMu/ComRayWc7IGtneo9uJkueaPyMoa8Artl5feZztDc30NxL0eARfixV4QqRUL/zlA1CEaCgAluQSqfp8mnzUCbl4HqlEl7G5tvaXZePMpRsebRo5Z+N8JosCjFqF+Yp1eGkrtsKVKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAZUV22w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAZUV22w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743966948; x=1775502948;
  h=date:from:to:cc:subject:message-id;
  bh=JArHlkccVnGPjAbky/RjFU3HcXdGRuLIPe/yZN9Q86U=;
  b=AAZUV22wEVDluLB2yjl+FkKZn72S7KFVJ/PNY47hVYUw6f1o/vuQbiCz
   cXYEwhU+mfdOusJWZnVIKXhNa0j3MtYZQHFgB93Q1rMB52qAR0aagutzc
   7EPkXyu9QmqveHE1eVX0OlcLQlVIfvdLFZ+NVPAlU7MGmidxTtKZCKGyw
   02rq3lzwTTjH77qD0DtLWVyIZ1axvkNiFlu/76hXJ7XrAnTSVfq8QVNXC
   JIchBDaP+fBlDhWeClJZtqhafhdLOF6M9cZkUBrN4KngQV4w/ihLKDVMo
   dhVGFIm8HvCG1JlYFeb19RfOErfBmvfb8mUFVTXaDKjMyePzufIMO4tLl
   A==;
X-CSE-ConnectionGUID: mH+6sRM7Sie5ifm8fnk+PQ==
X-CSE-MsgGUID: j3DcXJ7tS2ONbLhMMMZubQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45233888"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45233888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 12:15:47 -0700
X-CSE-ConnectionGUID: Hxxge7ZKSVa1Q2sKWiK6HA==
X-CSE-MsgGUID: vM/ocxE4QYqMZcNjypRq3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132602347"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2025 12:15:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1VT6-0002kR-0A;
	Sun, 06 Apr 2025 19:15:44 +0000
Date: Mon, 07 Apr 2025 03:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250404] BUILD SUCCESS
 caac602b561e383484d501b50f5b64914634a0bf
Message-ID: <202504070319.uHvsj0A8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250404
branch HEAD: caac602b561e383484d501b50f5b64914634a0bf  wifi: iwlwifi: mvm: d3: Avoid -Wflex-array-member-not-at-end warnings

elapsed time: 1444m

configs tested: 132
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250406    gcc-14.2.0
arc                   randconfig-002-20250406    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-16
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250406    clang-21
arm                   randconfig-002-20250406    gcc-7.5.0
arm                   randconfig-003-20250406    gcc-7.5.0
arm                   randconfig-004-20250406    gcc-10.5.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250406    clang-21
arm64                 randconfig-002-20250406    gcc-5.5.0
arm64                 randconfig-003-20250406    clang-21
arm64                 randconfig-004-20250406    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250406    gcc-14.2.0
csky                  randconfig-002-20250406    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250406    clang-21
hexagon               randconfig-002-20250406    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250406    clang-20
i386        buildonly-randconfig-002-20250406    clang-20
i386        buildonly-randconfig-003-20250406    gcc-12
i386        buildonly-randconfig-004-20250406    clang-20
i386        buildonly-randconfig-005-20250406    gcc-11
i386        buildonly-randconfig-006-20250406    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250406    gcc-14.2.0
loongarch             randconfig-002-20250406    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250406    gcc-5.5.0
nios2                 randconfig-002-20250406    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250406    gcc-10.5.0
parisc                randconfig-002-20250406    gcc-12.4.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    clang-21
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250406    gcc-7.5.0
powerpc               randconfig-002-20250406    clang-14
powerpc               randconfig-003-20250406    gcc-7.5.0
powerpc64             randconfig-001-20250406    clang-17
powerpc64             randconfig-002-20250406    gcc-7.5.0
powerpc64             randconfig-003-20250406    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250406    gcc-7.5.0
riscv                 randconfig-002-20250406    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250406    clang-15
s390                  randconfig-002-20250406    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250406    gcc-13.3.0
sh                    randconfig-002-20250406    gcc-11.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250406    gcc-10.3.0
sparc                 randconfig-002-20250406    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250406    gcc-10.5.0
sparc64               randconfig-002-20250406    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250406    gcc-12
um                    randconfig-002-20250406    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250406    clang-20
x86_64      buildonly-randconfig-002-20250406    gcc-12
x86_64      buildonly-randconfig-003-20250406    gcc-12
x86_64      buildonly-randconfig-004-20250406    gcc-11
x86_64      buildonly-randconfig-005-20250406    gcc-12
x86_64      buildonly-randconfig-006-20250406    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250406    gcc-14.2.0
xtensa                randconfig-002-20250406    gcc-12.4.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
