Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6FD290097
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314255; cv=none; b=hb3w0MeFQGuC6CEDnmAxreGoAerOOP17rDYOCqzRtWpgvMtMr6SmGnIs4P2FgF9OIigAaPwf7eOor7yNfYht/AGCYz7qWgTn7xEbWcQeDea4gJU4QvbF9a0wInxnWKHBE+cRv3poSZElHnKGV660ucKHHwTpydbC3q27k9157yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314255; c=relaxed/simple;
	bh=F6w4fWy7bXFF1rI5X778iPQ0mWc+q8hNPiYToeJGI5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Af9qMp/I7Diue6srMHVMCFNPnuu+cfbfVrr6V26gdUzsWR8Xi51tb1h9hliq1Ey1q7Ce23z16hNSgUYqAxUncMGXyrIFivGyJ1WZySstvg2tNMrYw7FS+GKXAf3u+IIAtRBxUBHug1q7ZJZcuUITcrLaPM3k8rXZ18R+M2bhF4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkDkSnj3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkDkSnj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744314253; x=1775850253;
  h=date:from:to:cc:subject:message-id;
  bh=F6w4fWy7bXFF1rI5X778iPQ0mWc+q8hNPiYToeJGI5c=;
  b=HkDkSnj396u2hDLPMf7pjC/rykAnCTizqLDNDHHsC4KISUDzmCZIgNB1
   yZYer7a7B23JfzvtCOxmkNPcGxM1bjBDCH43vGpgeEZUg/pSm8ttpT5+1
   Rau89x/W7Y/6+vpIIhMigJ9cIoi7RaSX51UKy5yJ+xKiQTJ5V/wqYs5bH
   DQJBs9EQ8t1p7fnAbEfk4a8oPlnAG6BDnOw/ej7++BnAnla+mBEyiUbfY
   pa7m5pbYXBHEPNbYQqHleRSVDQZxD21MpnJWem2+lgregMD9Yu24XLFLl
   64wn77NnSuOQaza89V3yIK4MHFMYN8rrJNGN3NZVs8wl7lMDq90OouPdE
   w==;
X-CSE-ConnectionGUID: RazZ3lE2SXexaG/mAKDlGQ==
X-CSE-MsgGUID: Bc8J3XY7TiuiSXdwVo5dFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45993611"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45993611"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 12:44:12 -0700
X-CSE-ConnectionGUID: 06BFrVL9Rl6QKgWsNIJFRg==
X-CSE-MsgGUID: SYcEZSfmTUakLaqVSREsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134167028"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2025 12:44:12 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2xon-000ATl-0f;
	Thu, 10 Apr 2025 19:44:09 +0000
Date: Fri, 11 Apr 2025 03:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/msi] BUILD SUCCESS
 9357e329cdeb6f2d27b431a22d4965700bec478a
Message-ID: <202504110346.gCHA8tHb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/msi
branch HEAD: 9357e329cdeb6f2d27b431a22d4965700bec478a  genirq/msi: Rename msi_[un]lock_descs()

elapsed time: 1451m

configs tested: 87
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250410    gcc-14.2.0
arc                   randconfig-002-20250410    gcc-12.4.0
arm                   randconfig-001-20250410    clang-21
arm                   randconfig-002-20250410    clang-18
arm                   randconfig-003-20250410    gcc-7.5.0
arm                   randconfig-004-20250410    gcc-8.5.0
arm64                 randconfig-001-20250410    clang-21
arm64                 randconfig-002-20250410    clang-21
arm64                 randconfig-003-20250410    gcc-6.5.0
arm64                 randconfig-004-20250410    gcc-8.5.0
csky                  randconfig-001-20250410    gcc-14.2.0
csky                  randconfig-002-20250410    gcc-14.2.0
hexagon                          allmodconfig    clang-19
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20250410    clang-21
hexagon               randconfig-002-20250410    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250410    clang-20
i386        buildonly-randconfig-002-20250410    clang-20
i386        buildonly-randconfig-003-20250410    clang-20
i386        buildonly-randconfig-004-20250410    gcc-11
i386        buildonly-randconfig-005-20250410    clang-20
i386        buildonly-randconfig-006-20250410    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250410    gcc-12.4.0
loongarch             randconfig-002-20250410    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250410    gcc-14.2.0
nios2                 randconfig-002-20250410    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250410    gcc-5.5.0
parisc                randconfig-002-20250410    gcc-11.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250410    gcc-6.5.0
powerpc               randconfig-002-20250410    gcc-6.5.0
powerpc               randconfig-003-20250410    clang-21
powerpc64             randconfig-001-20250410    clang-21
powerpc64             randconfig-002-20250410    clang-21
powerpc64             randconfig-003-20250410    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250410    clang-21
riscv                 randconfig-002-20250410    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250410    clang-17
s390                  randconfig-002-20250410    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250410    gcc-12.4.0
sh                    randconfig-002-20250410    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250410    gcc-10.3.0
sparc                 randconfig-002-20250410    gcc-7.5.0
sparc64               randconfig-001-20250410    gcc-7.5.0
sparc64               randconfig-002-20250410    gcc-5.5.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250410    clang-21
um                    randconfig-002-20250410    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250410    clang-20
x86_64      buildonly-randconfig-002-20250410    gcc-12
x86_64      buildonly-randconfig-003-20250410    clang-20
x86_64      buildonly-randconfig-004-20250410    clang-20
x86_64      buildonly-randconfig-005-20250410    clang-20
x86_64      buildonly-randconfig-006-20250410    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250410    gcc-14.2.0
xtensa                randconfig-002-20250410    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
