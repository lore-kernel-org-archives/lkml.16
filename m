Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF041DE3CA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582756; cv=none; b=dPoamiC4z2X7R6TVtpp+MtKlGKQpFykhLVEqVxmZfiSIP0JaiS0kPAR2VPlIskClUWiiPbkpCmzU2MQbfMGdDTcCf0ZZBwTa4O3jv2C0vq0mQuBDu7J3bgnowFsZWV649SbT61TBC6FUaqUzYF52IZsu1NkltvONTOSz+yPPkjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582756; c=relaxed/simple;
	bh=Fc+GxBb2C0yTd8LXtDmUhZCp2u6IEYL0EKUoLUtd4Ao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jnnADnt/hrMnAP11Y8mTBbsA8WXuTzqSIIxEXtpGTZeMpdNRoiK+DfVyWq8hSQZDpzRk0diP2uGjxRorFNbSC6mdxNvAjMmy+HUXePVKJ9YEM4foQbQs/P5BPa1RCAwTcRcQUywBp6h7KcXLoqDmQ2ckAGlUAPPp4w7PTl0GUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHQpWbvd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHQpWbvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743582755; x=1775118755;
  h=date:from:to:cc:subject:message-id;
  bh=Fc+GxBb2C0yTd8LXtDmUhZCp2u6IEYL0EKUoLUtd4Ao=;
  b=UHQpWbvdZvGsfJ/lFNc2PFV+amcSeGa3HmS7pHXQfRcRUGuJntdHFQg/
   ErTLVQQAWzMwhaRycrdUZK6QZuWYzosfbn4eks/CtaVHiKlmVkmlmwA7j
   iuDT6eeHjUtoCUOLDNlJkgi8QparhU0CxuhdTuhPmCnmH0+MV9W78udt9
   71BqrKHn7R1NiwL6kSuOY5uTccQ0Yanq7qsBn+qq0PAaCA8SWkmTMDyGI
   jAD5WNzRCOJEzisvVD301BLirxBr/QKMIqC0VL7IAtghETQDlz99LEJOH
   UAXz/vBIGYEGp0dcWMZr5eywGpa2UepiBD8+MLzWiNZ0XWa8PDGR0YgMc
   A==;
X-CSE-ConnectionGUID: +VXUbsMpTVOQUw+Er1QUkw==
X-CSE-MsgGUID: jbC5DO+NTASTeodf0o4ZkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="32529120"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="32529120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 01:32:18 -0700
X-CSE-ConnectionGUID: Qm09yILGS8GAwDM5ksV6ng==
X-CSE-MsgGUID: OcCbMnXKQ7yj1iIMR0n8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="157618771"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2025 01:32:17 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tztWB-000AZw-2b;
	Wed, 02 Apr 2025 08:32:15 +0000
Date: Wed, 02 Apr 2025 16:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:objtool/urgent] BUILD SUCCESS
 7c977393b8277ed319e92e4b598b26598c9d30c0
Message-ID: <202504021610.qaxjGNBr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
branch HEAD: 7c977393b8277ed319e92e4b598b26598c9d30c0  objtool/loongarch: Add unwind hints in prepare_frametrace()

elapsed time: 1450m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250401    gcc-12.4.0
arc                   randconfig-002-20250401    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                   randconfig-001-20250401    gcc-7.5.0
arm                   randconfig-002-20250401    gcc-8.5.0
arm                   randconfig-003-20250401    clang-18
arm                   randconfig-004-20250401    clang-14
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250401    clang-21
arm64                 randconfig-002-20250401    clang-20
arm64                 randconfig-003-20250401    gcc-8.5.0
arm64                 randconfig-004-20250401    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250401    gcc-14.2.0
csky                  randconfig-002-20250401    gcc-10.5.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250401    clang-21
hexagon               randconfig-002-20250401    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250401    gcc-12
i386        buildonly-randconfig-002-20250401    clang-20
i386        buildonly-randconfig-003-20250401    clang-20
i386        buildonly-randconfig-004-20250401    clang-20
i386        buildonly-randconfig-005-20250401    gcc-12
i386        buildonly-randconfig-006-20250401    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250401    gcc-14.2.0
loongarch             randconfig-002-20250401    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250401    gcc-8.5.0
nios2                 randconfig-002-20250401    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250401    gcc-11.5.0
parisc                randconfig-002-20250401    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250401    clang-21
powerpc               randconfig-002-20250401    gcc-8.5.0
powerpc               randconfig-003-20250401    clang-20
powerpc64             randconfig-001-20250401    clang-21
powerpc64             randconfig-002-20250401    clang-17
powerpc64             randconfig-003-20250401    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250401    clang-21
riscv                 randconfig-002-20250401    clang-14
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250401    clang-15
s390                  randconfig-002-20250401    gcc-9.3.0
s390                       zfcpdump_defconfig    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250401    gcc-12.4.0
sh                    randconfig-002-20250401    gcc-12.4.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250401    gcc-11.5.0
sparc                 randconfig-002-20250401    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250401    gcc-9.3.0
sparc64               randconfig-002-20250401    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250401    gcc-12
um                    randconfig-002-20250401    gcc-11
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250401    clang-20
x86_64      buildonly-randconfig-002-20250401    gcc-12
x86_64      buildonly-randconfig-003-20250401    clang-20
x86_64      buildonly-randconfig-004-20250401    clang-20
x86_64      buildonly-randconfig-005-20250401    gcc-12
x86_64      buildonly-randconfig-006-20250401    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250401    gcc-9.3.0
xtensa                randconfig-002-20250401    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
