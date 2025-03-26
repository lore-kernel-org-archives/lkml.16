Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C9223C8B5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743027391; cv=none; b=QWXWSFTesqVTBkD72DCMVfPsP7SU8O4JPps0vvZ3w+Cx04Cn57SAJDPSS1YyPS2fs7LZ/evf8UAhYpZNpddm/X2D9Q1Hzo/aphvcn1ZWu8HHwDH7pjHBHzaKc4OozFIw61QNR0cMVYPtPsUfNiutIoaVd30FPhibWrzGHSiVlXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743027391; c=relaxed/simple;
	bh=xsJUOB+ZqX6Mftvfk6F85LMbs1PejKMvvLifNHVqMdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DsGhrdlqqGvZ3R4a07yLVTEx4n3XrlyZ0TnL3XcVd99ROwliVYhtlgYQDQaSfBgf2ko3A4PiUrXk0doxZm0l4aCMJSyPy3YR2OOAU1jdiFthF25gkziWGQoDXpmKVpP9MgTnel5ztVASjQZjuRn5Xk74MzFK2UMQLkypVJy6K4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWFMz+nv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWFMz+nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743027389; x=1774563389;
  h=date:from:to:cc:subject:message-id;
  bh=xsJUOB+ZqX6Mftvfk6F85LMbs1PejKMvvLifNHVqMdE=;
  b=mWFMz+nvYn0sxfxAynRCY49upsglknwM0ns6UDQ+TK+umxDkd+UNLNsd
   IQCOLGe0j/4qSzYWKAOEWeX8brxY5b32Xkc4fZq0KtfJ/T0U+hLUVmU3S
   ihtuIilLqFOOhNMh/JkeCgUyQQE+4Aqbh+qYlN5stoFo4F85CS+E4I+V6
   F7jeS64vjGmT06L/WuJhXTi7gdOQcFmNlEqNIM9fbzctrgFa5YPx0O0NV
   h0R6jS3WVg5MM4oQP3SvbQBAC01HK7QLJZR055yX50Y2KulbukDzkWhcp
   3Wnavz5zIZ/82ceeAjLERFQhcO35WE1OI9hZcfR2/CX4CvqNdKfKPGvuV
   w==;
X-CSE-ConnectionGUID: wcVGX3FcRoye0FGIsUC4pA==
X-CSE-MsgGUID: faAPono2T82cOyuH8fuy0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43583435"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="43583435"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:16:28 -0700
X-CSE-ConnectionGUID: DUcobEpSSBSQumtJlH8XmQ==
X-CSE-MsgGUID: Ogkh06pSQBqn/7KAlJUW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="155922240"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2025 15:16:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txZ2v-00067p-1T;
	Wed, 26 Mar 2025 22:16:25 +0000
Date: Thu, 27 Mar 2025 06:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 dc84bc2aba85a1508f04a936f9f9a15f64ebfb31
Message-ID: <202503270603.5MwCnZGB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: dc84bc2aba85a1508f04a936f9f9a15f64ebfb31  x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()

elapsed time: 1447m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250326    gcc-14.2.0
arc                   randconfig-002-20250326    gcc-8.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-15
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250326    gcc-7.5.0
arm                   randconfig-002-20250326    clang-21
arm                   randconfig-003-20250326    gcc-8.5.0
arm                   randconfig-004-20250326    clang-21
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250326    clang-21
arm64                 randconfig-002-20250326    clang-21
arm64                 randconfig-003-20250326    gcc-8.5.0
arm64                 randconfig-004-20250326    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250326    gcc-14.2.0
csky                  randconfig-002-20250326    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250326    clang-21
hexagon               randconfig-002-20250326    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250326    gcc-12
i386        buildonly-randconfig-002-20250326    clang-20
i386        buildonly-randconfig-003-20250326    clang-20
i386        buildonly-randconfig-004-20250326    clang-20
i386        buildonly-randconfig-005-20250326    gcc-12
i386        buildonly-randconfig-006-20250326    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250326    gcc-14.2.0
loongarch             randconfig-002-20250326    gcc-12.4.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250326    gcc-12.4.0
nios2                 randconfig-002-20250326    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250326    gcc-13.3.0
parisc                randconfig-002-20250326    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      katmai_defconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc               randconfig-001-20250326    clang-21
powerpc               randconfig-002-20250326    gcc-6.5.0
powerpc               randconfig-003-20250326    clang-19
powerpc                     tqm8548_defconfig    clang-21
powerpc64             randconfig-001-20250326    clang-21
powerpc64             randconfig-002-20250326    gcc-8.5.0
powerpc64             randconfig-003-20250326    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250326    clang-21
riscv                 randconfig-002-20250326    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250326    clang-15
s390                  randconfig-002-20250326    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20250326    gcc-6.5.0
sh                    randconfig-002-20250326    gcc-6.5.0
sh                           se7705_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250326    gcc-11.5.0
sparc                 randconfig-002-20250326    gcc-5.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250326    gcc-5.5.0
sparc64               randconfig-002-20250326    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250326    clang-15
um                    randconfig-002-20250326    gcc-11
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250326    clang-20
x86_64      buildonly-randconfig-002-20250326    gcc-11
x86_64      buildonly-randconfig-003-20250326    clang-20
x86_64      buildonly-randconfig-004-20250326    clang-20
x86_64      buildonly-randconfig-005-20250326    clang-20
x86_64      buildonly-randconfig-006-20250326    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250326    gcc-7.5.0
xtensa                randconfig-002-20250326    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
