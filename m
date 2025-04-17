Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED622578D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882430; cv=none; b=i5McZw8zZrCvdCQ7LW3X2U6m4YQ21X0aETVa4X4QwSvZCpZlsh7TaFN5L1w5HPVFSUPNDBkJterVOvBen84EXIwU1UcccccqlCD/JcvBx2DgSjjFUpVHQ7M8LHbZgVmYKtnJEQxeUSFoQMDUWUPjZy9lj5NGCpiB4Z9xxoG6IRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882430; c=relaxed/simple;
	bh=ufQQBl4yiqfztI0ePKqmADbmuBRErCp02cxIUaHidiw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k8wpfrKW44smPyiOYyxmd5GDpeDzkuNozq0p/vM4hryVQOlFngYuRIAWrgoatUfAm7RTPXpEc90ORcLnWpIn448+5HSBPySqv7lp1xnhsWwoCvXeRmFKcDVDXXVLSAS8kQ/OjO6zXziFoo3m3KJs1zpMu+R7ujAvklKLYdtQcNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUR/szGh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUR/szGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744882428; x=1776418428;
  h=date:from:to:cc:subject:message-id;
  bh=ufQQBl4yiqfztI0ePKqmADbmuBRErCp02cxIUaHidiw=;
  b=mUR/szGhgkjnJHCVbCfqZZXKP6KPCL/FYUNgO+UQEtkxXEl7vJcGSx21
   m2/CHh7mb4KS6LqjMClNdnbN2pbxeshHdO2WKe4l+dp/OhHP6At5IB/g8
   AumANl9pf2rvpxH241rdutOonKec5Mz3uE2aallww1DBZd7XkDIwCGw5m
   fGuks8UHK8aY9DWAx1ntOUK+BrE+P849RyT4i6wrVN2fHIh+9fT66Z72A
   W84/Q8sIga4PuBImpm3wjY00BHchMT7gMqv+YNhP5cn0rpufV3RE61KT1
   M3+hwjrfHOamNA9hnlIxcGUwYTbieO2zv7wd4NlupUwCD3FUTaGoh+dEn
   w==;
X-CSE-ConnectionGUID: Hff4eUtvRwaXXgurIzVY/A==
X-CSE-MsgGUID: 6lj4+sQvTzGcKbS7RfaXbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46626560"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46626560"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:33:48 -0700
X-CSE-ConnectionGUID: 7ttnbjcbT+OACKUGxdkdtA==
X-CSE-MsgGUID: DMyIULxCRYCmKZ54yvpl9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135562456"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2025 02:33:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Lcu-000MBT-22;
	Thu, 17 Apr 2025 09:33:44 +0000
Date: Thu, 17 Apr 2025 17:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/fpu] BUILD SUCCESS
 de8304c319bc020ef79d109909ad40e944d82c82
Message-ID: <202504171705.q0qTBnvL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
branch HEAD: de8304c319bc020ef79d109909ad40e944d82c82  x86/fpu: Rename fpu_reset_fpregs() to fpu_reset_fpstate_regs()

elapsed time: 1450m

configs tested: 99
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250417    gcc-13.3.0
arc                   randconfig-002-20250417    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250417    gcc-7.5.0
arm                   randconfig-002-20250417    clang-16
arm                   randconfig-003-20250417    gcc-10.5.0
arm                   randconfig-004-20250417    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250417    gcc-7.5.0
arm64                 randconfig-002-20250417    gcc-5.5.0
arm64                 randconfig-003-20250417    clang-21
arm64                 randconfig-004-20250417    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250416    gcc-14.2.0
csky                  randconfig-002-20250416    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250416    clang-21
hexagon               randconfig-002-20250416    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250416    gcc-12
i386        buildonly-randconfig-003-20250416    gcc-12
i386        buildonly-randconfig-004-20250416    gcc-11
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-14.2.0
loongarch             randconfig-002-20250416    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250416    gcc-6.5.0
nios2                 randconfig-002-20250416    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250416    gcc-11.5.0
parisc                randconfig-002-20250416    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250416    gcc-8.5.0
powerpc               randconfig-002-20250416    clang-21
powerpc               randconfig-003-20250416    clang-21
powerpc64             randconfig-001-20250416    clang-21
powerpc64             randconfig-002-20250416    clang-21
powerpc64             randconfig-003-20250416    gcc-6.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250416    clang-20
riscv                 randconfig-002-20250416    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250416    clang-21
s390                  randconfig-002-20250416    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250416    gcc-14.2.0
sh                    randconfig-002-20250416    gcc-6.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250416    gcc-11.5.0
sparc                 randconfig-002-20250416    gcc-11.5.0
sparc64               randconfig-001-20250416    gcc-5.5.0
sparc64               randconfig-002-20250416    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250416    clang-21
um                    randconfig-002-20250416    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250416    gcc-12
x86_64      buildonly-randconfig-002-20250416    gcc-12
x86_64      buildonly-randconfig-003-20250416    gcc-12
x86_64      buildonly-randconfig-004-20250416    clang-20
x86_64      buildonly-randconfig-005-20250416    clang-20
x86_64      buildonly-randconfig-006-20250416    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250416    gcc-7.5.0
xtensa                randconfig-002-20250416    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
