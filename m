Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A051B4247
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955435; cv=none; b=gOm/H4uzG7XC82T/z3+cj0nn6ihx+9FYM8bcE+kdzE1ugq52Cp1MOPPcyLB1ga6CjJx2M4+J2qgenMdHIUFVi9QKu4VuW0tiKOmMsLQYqU7OaaXDNW/qfokfYFLbl6EGzp3XeRg5dHAM5mGeQF5gE46UX9ztMk6VkJQLxs/U2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955435; c=relaxed/simple;
	bh=oeGLI18xrtCItOrGE/bZTPpI8VKJoADN1gmXFz3BQKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QbGMnmoxV0VvBKTpFpdgGTqcF1wfxkVVBlVRmRsnLXBvXjiLVvlP+vKVLVIgLtPEnmc9CQFr00Yo97T11N8+BYjIHlMZEjH1LVs+AGISEA5CTAu30XlI62GBazFsMdIBS2eDO5rmwE8o7PksbunKMuTrm/FcUOwTNf5zuxPAH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cM1hg0JT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM1hg0JT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750955434; x=1782491434;
  h=date:from:to:cc:subject:message-id;
  bh=oeGLI18xrtCItOrGE/bZTPpI8VKJoADN1gmXFz3BQKI=;
  b=cM1hg0JTMCCuA+q6Zlyf4mjCgeTrHd1eeWR7s6THglqYCIcC1GjTqcNp
   6iIZ2UPL4XY56wrGJkSm+Xu91SY6yidhD5pcWJ2aMet/a3I/1i1zGu1em
   arX6160ghZEVHMJAwsODNQRsqN+XKr0iGcnuUGHGER0tZNrdSFInBx9WW
   y8VmNuwuuwQ6rTQddqBdIdOUPq2pDwzfKXBifpx+R7Zqxa8emGlKpMaBg
   Ea23o+KrVXVrhTwm4V7AWplLaCxkfg7xjOzBCMwaWvNTsRpxUxdbvY8wJ
   62/yBFJTYIyGq6U/ZtJiqLe8L1IIqo9dtBHpnmwxdh32OP07TJOIM8LXH
   A==;
X-CSE-ConnectionGUID: hINuNj8bTEWHPx+DZJ+/wQ==
X-CSE-MsgGUID: 29T8iAJOQoOI0hqTSD74dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64613963"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="64613963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:30:33 -0700
X-CSE-ConnectionGUID: 9HXNB22PTRefXs7W+R/YeQ==
X-CSE-MsgGUID: gzIw1w+gRzy8dh4zPnODgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="152074195"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Jun 2025 09:30:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUpUc-000UGi-00;
	Thu, 26 Jun 2025 16:30:30 +0000
Date: Fri, 27 Jun 2025 00:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/ptp] BUILD SUCCESS
 180d8b4ce91fe0cf7a9cb236bb01f14587ba4bf0
Message-ID: <202506270027.Gx9znWVY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/ptp
branch HEAD: 180d8b4ce91fe0cf7a9cb236bb01f14587ba4bf0  timekeeping: Add AUX offset to struct timekeeper

elapsed time: 1444m

configs tested: 81
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250626    clang-20
arc                   randconfig-001-20250626    gcc-12.4.0
arc                   randconfig-002-20250626    clang-20
arc                   randconfig-002-20250626    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250626    clang-20
arm                   randconfig-001-20250626    clang-21
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-003-20250626    clang-20
arm                   randconfig-003-20250626    gcc-10.5.0
arm                   randconfig-004-20250626    clang-20
arm                   randconfig-004-20250626    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250626    clang-20
arm64                 randconfig-001-20250626    clang-21
arm64                 randconfig-002-20250626    clang-17
arm64                 randconfig-002-20250626    clang-20
arm64                 randconfig-003-20250626    clang-20
arm64                 randconfig-003-20250626    gcc-8.5.0
arm64                 randconfig-004-20250626    clang-20
arm64                 randconfig-004-20250626    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-006-20250626    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
