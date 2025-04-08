Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAB223714
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137465; cv=none; b=KbBDQBfCxgLxMxv5E9Rip7Kx++ZTUeij6BfAPWGh8vizugofqcq0Z3lBTsUZ9l/KWlr9lW3gHBmrInAgKiKhBR9BZXJqk7p2STCYuO5Hd7I9JkYD4DdarjBWkZkTQwgGdIAYpLKFV4niuTIIoUIOdmPKqzEtiT9/jBN7EGBoAq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137465; c=relaxed/simple;
	bh=nqYQ4MB/QCpMbndIiva6JRZaqkE3Auzm9/TDPgLBNYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oTryl5YeTZ9HOKd3I625ghFvZsit+3XbE90gKRbAVqZYcQAvuIiTpsNtaKkXnp3KfxEj3xBwIbBZcxaAz1JkGpFqMarhHCxDKURal7pwbnOiYXuVPsGOHeF+r7zy6eh04UrFZBehs05RkGCeKPbJNORKGh9qoe1uDOrK8KYYLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jayOWpkR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jayOWpkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744137463; x=1775673463;
  h=date:from:to:cc:subject:message-id;
  bh=nqYQ4MB/QCpMbndIiva6JRZaqkE3Auzm9/TDPgLBNYM=;
  b=jayOWpkRXdxMQmFjtpguABWulPGtBt0be4/IvI7WcWoJR4VrYdrkAg+V
   nw6Adzm6u/uxceata8kW0EacT2ePBk8ecTDj+bJ+oALEnogcf5KOAWqYE
   TkhWHPqjUT52RqseWTjrI6qzMQjIAP+ScDHfHzUwzvQLMViAussAUcF0s
   7c7lHtmKxXYvDQb4ddAlcEGQZ0BuAnvxZzMaKkZXQ3+tfga508GhreN2x
   lZs1tGXJ9Q0xfnk2ThGrgiDASjR801XPItX9BBJrerGOdWty7NSLuP6hP
   zYsVgqNHGUW1p1ZbrYkh/Hboz8p5dutxeYHpx67yvmnKTSv4GEWL2aO1z
   Q==;
X-CSE-ConnectionGUID: gkFkTNJeQpi52mWQM7WT9w==
X-CSE-MsgGUID: 5SNNe7ZfSruEamTnyK2ZCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63131568"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="63131568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 11:37:43 -0700
X-CSE-ConnectionGUID: K7TZ+Bs+Sj2+VdwiuR+mJA==
X-CSE-MsgGUID: 8cdsXHuRToerDow2uZ48tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128889114"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2025 11:37:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2DpL-0007sn-1Q;
	Tue, 08 Apr 2025 18:37:39 +0000
Date: Wed, 09 Apr 2025 02:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/boot] BUILD SUCCESS
 4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
Message-ID: <202504090230.MhteOLWs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: 4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e  x86/boot: Move the EFI mixed mode startup code back under arch/x86, into startup/

elapsed time: 1452m

configs tested: 95
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20250408    gcc-14.2.0
arc                   randconfig-002-20250408    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                   randconfig-001-20250408    clang-21
arm                   randconfig-002-20250408    gcc-10.5.0
arm                   randconfig-003-20250408    clang-17
arm                   randconfig-004-20250408    gcc-6.5.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                 randconfig-001-20250408    clang-21
arm64                 randconfig-002-20250408    gcc-9.5.0
arm64                 randconfig-003-20250408    gcc-9.5.0
arm64                 randconfig-004-20250408    clang-20
csky                  randconfig-001-20250408    gcc-14.2.0
csky                  randconfig-002-20250408    gcc-9.3.0
hexagon                          alldefconfig    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250408    clang-21
hexagon               randconfig-002-20250408    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250408    clang-20
i386        buildonly-randconfig-002-20250408    clang-20
i386        buildonly-randconfig-003-20250408    gcc-12
i386        buildonly-randconfig-004-20250408    gcc-12
i386        buildonly-randconfig-005-20250408    gcc-12
i386        buildonly-randconfig-006-20250408    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250408    gcc-14.2.0
loongarch             randconfig-002-20250408    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                           ip28_defconfig    gcc-14.2.0
nios2                 randconfig-001-20250408    gcc-13.3.0
nios2                 randconfig-002-20250408    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250408    gcc-6.5.0
parisc                randconfig-002-20250408    gcc-8.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250408    gcc-5.5.0
powerpc               randconfig-002-20250408    gcc-9.3.0
powerpc               randconfig-003-20250408    gcc-5.5.0
powerpc64             randconfig-001-20250408    clang-21
powerpc64             randconfig-002-20250408    gcc-5.5.0
powerpc64             randconfig-003-20250408    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250408    gcc-9.3.0
riscv                 randconfig-002-20250408    clang-21
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250408    gcc-8.5.0
s390                  randconfig-002-20250408    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250408    gcc-13.3.0
sh                    randconfig-002-20250408    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250408    gcc-10.3.0
sparc                 randconfig-002-20250408    gcc-6.5.0
sparc64               randconfig-001-20250408    gcc-6.5.0
sparc64               randconfig-002-20250408    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250408    clang-21
um                    randconfig-002-20250408    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250408    clang-20
x86_64      buildonly-randconfig-002-20250408    clang-20
x86_64      buildonly-randconfig-003-20250408    clang-20
x86_64      buildonly-randconfig-004-20250408    gcc-12
x86_64      buildonly-randconfig-005-20250408    clang-20
x86_64      buildonly-randconfig-006-20250408    clang-20
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250408    gcc-6.5.0
xtensa                randconfig-002-20250408    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
