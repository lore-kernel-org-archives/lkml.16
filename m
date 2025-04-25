Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993661F6694
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602002; cv=none; b=Uw/0aT97xTymG9GRp2JTTSt5BIUnBK0BYebuIhg8zGIdI8+iIpJPJrer0Rt8lkwZQqcMeGgDizNZWWvjhd0xk1iYqPYB6DjV/E2iBzpgO0P4voXUvFMFYThKapNUVfoy1blT8uAyCQkq1MsKv81PWS+Bz7DoD7j5cCmHz+7SahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602002; c=relaxed/simple;
	bh=lk8Kpydm7hHTHDCgggDG/rDTZgmksIP+EGsi4NJnT4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JiXdnl1RtIx4Ixi6PjaU0PXKSidrGNsjVcXoThCzE1VlKb0W8aXINf/TjlSeSVrqavAkaGOo2/4r5xe97pTHEzRXu3EAf1Mg6x1FKLDG5kyZ+JetvO2mM0zFDMWe/TtdfaWY6SicwrFZ8SUerVBm/KqgRjHdIBfRbyV3dbwWf04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1a5epBV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1a5epBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745602001; x=1777138001;
  h=date:from:to:cc:subject:message-id;
  bh=lk8Kpydm7hHTHDCgggDG/rDTZgmksIP+EGsi4NJnT4k=;
  b=Z1a5epBVga35/T9CDuBXxrt1MULWU6+aw8uJj+Zsr/wExqM+Gvs5hR9s
   QPpLdJF2dPcZBdIV5bmod9evAQoy0L67CStjnqukRvyZrgeNVplTBWDBS
   MvPVqMpAnosGuxH83T5PCBooL7KvPK/A6iX2TZjAb2z+tfidfqfPmbQWP
   JEwlZLlHba/bEc4eSCoADUAbBH+hbiEuVOLLY8999eP9DT334LXa6A6RG
   vdZkBsti3Jl9eHWF+fUXCQh2Pow1i2nqKH0W1gQLW2J5GkItfYeHAx6hb
   BR/oBtcng87klNSy3ikHHkQ/++Ios2O7rFsoFKeki4/uM4LP5xTyjG/0d
   g==;
X-CSE-ConnectionGUID: gztzvUOsTamoZ2ilYL68dQ==
X-CSE-MsgGUID: 94uOU9geTlyjISdNL9vruA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47145956"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47145956"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:26:39 -0700
X-CSE-ConnectionGUID: z2FOrhxQRW+G4XSe38ScEg==
X-CSE-MsgGUID: WPg3B3F2Rl+p0IxHuHtspg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133457870"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Apr 2025 10:26:38 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Mot-0005O9-2v;
	Fri, 25 Apr 2025 17:26:35 +0000
Date: Sat, 26 Apr 2025 01:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/platform] BUILD SUCCESS
 0fbe08e78dfd4a680806132673c520f0fc5f84d9
Message-ID: <202504260108.nusbaFtj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/platform
branch HEAD: 0fbe08e78dfd4a680806132673c520f0fc5f84d9  platform/x86/amd/pmc: Use FCH_PM_BASE definition

elapsed time: 1446m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250425    gcc-14.2.0
arc                   randconfig-002-20250425    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250425    clang-21
arm                   randconfig-002-20250425    gcc-6.5.0
arm                   randconfig-003-20250425    clang-21
arm                   randconfig-004-20250425    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250425    clang-21
arm64                 randconfig-002-20250425    gcc-7.5.0
arm64                 randconfig-003-20250425    gcc-7.5.0
arm64                 randconfig-004-20250425    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250425    gcc-13.3.0
csky                  randconfig-002-20250425    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250425    clang-21
hexagon               randconfig-002-20250425    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250425    gcc-12
i386        buildonly-randconfig-002-20250425    gcc-12
i386        buildonly-randconfig-003-20250425    clang-20
i386        buildonly-randconfig-004-20250425    gcc-12
i386        buildonly-randconfig-005-20250425    gcc-12
i386        buildonly-randconfig-006-20250425    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250425    gcc-14.2.0
loongarch             randconfig-002-20250425    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250425    gcc-5.5.0
nios2                 randconfig-002-20250425    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250425    gcc-10.5.0
parisc                randconfig-002-20250425    gcc-8.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250425    clang-21
powerpc               randconfig-002-20250425    gcc-9.3.0
powerpc               randconfig-003-20250425    gcc-9.3.0
powerpc64             randconfig-001-20250425    clang-21
powerpc64             randconfig-002-20250425    gcc-7.5.0
powerpc64             randconfig-003-20250425    gcc-10.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250425    gcc-14.2.0
riscv                 randconfig-002-20250425    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250425    clang-17
s390                  randconfig-002-20250425    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250425    gcc-7.5.0
sh                    randconfig-002-20250425    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250425    gcc-8.5.0
sparc                 randconfig-002-20250425    gcc-14.2.0
sparc64               randconfig-001-20250425    gcc-10.5.0
sparc64               randconfig-002-20250425    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250425    clang-21
um                    randconfig-002-20250425    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250425    gcc-12
x86_64      buildonly-randconfig-002-20250425    clang-20
x86_64      buildonly-randconfig-003-20250425    gcc-12
x86_64      buildonly-randconfig-004-20250425    gcc-12
x86_64      buildonly-randconfig-005-20250425    clang-20
x86_64      buildonly-randconfig-006-20250425    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250425    gcc-6.5.0
xtensa                randconfig-002-20250425    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
