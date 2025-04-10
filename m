Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1828152B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744284651; cv=none; b=YLdyGfI+OItUoTAcp74I8zW71MZVHk54MwRh2x2nRuI1Jx7RsjjdoKK8SqAXkPztsgA5vw7ptAGt88ZrSuzagLCpP7EHirdeYqL6DOHkUNGxPuMny8sIHSk4GmH7aRM6zod2qIUyyzanztrVv8og1iVCUb2LuiPpIEwkGy1K0+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744284651; c=relaxed/simple;
	bh=2wj2H+xgpG567iUeEpxfyB3hJ0RlXzb8V5u5HvOrATY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YyyU8P12GMdiHoEYkGB2jwKtgfrOc363T2e7+2UlW+HJWXWYx6kcNGxKmTSXp19iLZZHCtI8h5sLtyzX6vVsakcY+ne40gq8afzeKjtOcgtc4k8cvF+JmeqKes2eJfl1IMUS9GHK703KLXqYPSGkm7qeD33yqPZImAjfcauFl4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq/Zziay; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lq/Zziay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744284648; x=1775820648;
  h=date:from:to:cc:subject:message-id;
  bh=2wj2H+xgpG567iUeEpxfyB3hJ0RlXzb8V5u5HvOrATY=;
  b=Lq/Zziayg2OcvC+u5hPTT54InOLoc2K9pRDjlXLaTZLh0RhdWXpvM+QE
   I2OR/ZmgvfBH7Ile+psE8m7QhnQHb4fjSRKt0Yj2KkaHH+jRe8BZ90uMq
   s9QP+UcpfgAEZX/HW6eHyxp3YJOqwbLKLbjqgEAUkTASD5toZaPzwK2S6
   LPWS44O76IL9lEjlhR7q5AAPlP95XezoKtvlj1QIoEEZWUodi9RR4O0QH
   VjDubnRRot7CmWsGIwghgNVmqlt/+3mwr6PplU70aL3vmYBWa8UIKTzcw
   iqZ4yWo4rec5BuOe40eHFG9seSt6f+z0X71XGWNQW1pw/llMIEud2nwNS
   A==;
X-CSE-ConnectionGUID: nuu+m8gQT5SxwHFT7Zsfcw==
X-CSE-MsgGUID: EZOal/BpSxa6dOcmSiRJEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45924368"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45924368"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 04:30:47 -0700
X-CSE-ConnectionGUID: 8LNYsLjYQFqdPdsUx9H9xw==
X-CSE-MsgGUID: 6r92pzuWTk2wEh2ebE8sGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129724569"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2025 04:30:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2q7I-000A0F-2g;
	Thu, 10 Apr 2025 11:30:44 +0000
Date: Thu, 10 Apr 2025 19:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/boot] BUILD SUCCESS
 d9fa398fe82728ee703ad2bd9cf5247df9626470
Message-ID: <202504101925.wQkSTScq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: d9fa398fe82728ee703ad2bd9cf5247df9626470  x86/boot/startup: Disable objtool validation for library code

elapsed time: 1473m

configs tested: 103
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250409    gcc-12.4.0
arc                   randconfig-002-20250409    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250409    gcc-7.5.0
arm                   randconfig-002-20250409    gcc-7.5.0
arm                   randconfig-003-20250409    gcc-7.5.0
arm                   randconfig-004-20250409    clang-14
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250409    clang-21
arm64                 randconfig-002-20250409    clang-21
arm64                 randconfig-003-20250409    clang-15
arm64                 randconfig-004-20250409    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250409    gcc-14.2.0
csky                  randconfig-002-20250409    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250409    clang-21
hexagon               randconfig-002-20250409    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250409    gcc-12
i386        buildonly-randconfig-002-20250409    clang-20
i386        buildonly-randconfig-003-20250409    gcc-11
i386        buildonly-randconfig-004-20250409    clang-20
i386        buildonly-randconfig-005-20250409    gcc-12
i386        buildonly-randconfig-006-20250409    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250409    gcc-14.2.0
loongarch             randconfig-002-20250409    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250409    gcc-10.5.0
nios2                 randconfig-002-20250409    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250409    gcc-13.3.0
parisc                randconfig-002-20250409    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250409    gcc-6.5.0
powerpc               randconfig-002-20250409    clang-21
powerpc               randconfig-003-20250409    clang-21
powerpc64             randconfig-001-20250409    clang-21
powerpc64             randconfig-002-20250409    gcc-8.5.0
powerpc64             randconfig-003-20250409    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250409    clang-21
riscv                 randconfig-002-20250409    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250409    gcc-9.3.0
s390                  randconfig-002-20250409    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250409    gcc-12.4.0
sh                    randconfig-002-20250409    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250409    gcc-13.3.0
sparc                 randconfig-002-20250409    gcc-7.5.0
sparc64               randconfig-001-20250409    gcc-11.5.0
sparc64               randconfig-002-20250409    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250409    gcc-12
um                    randconfig-002-20250409    clang-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250409    clang-20
x86_64      buildonly-randconfig-002-20250409    gcc-12
x86_64      buildonly-randconfig-003-20250409    clang-20
x86_64      buildonly-randconfig-004-20250409    clang-20
x86_64      buildonly-randconfig-005-20250409    gcc-12
x86_64      buildonly-randconfig-006-20250409    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250409    gcc-11.5.0
xtensa                randconfig-002-20250409    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
