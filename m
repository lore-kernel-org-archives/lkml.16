Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCBF10E0
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684981; cv=none; b=Ik8MqziAYsnj2m8L5kxJ2j3a2sW5BHqOmrocytB71ThpIQYw3ShMoTVVVTzzStAM2T8TGAL8n5334ZpqJ6d3XgOqBrAUu9HabNlQGYltPkj64mFeU1wS+tYxqy/Etzg5YfTL/AOQuDOVc2EkatiOhurDPHZPTr5ZfhtPDdV+6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684981; c=relaxed/simple;
	bh=fKVqh4A1L1qiL2ZXg9Mja2MZpqTaKnvJzBwUS9wobHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jp3NDj0PdVd3BTYYxr1Qq7G/A18vyAgsKN4W3iiy/cESuYzwXl1x3locpihwNlLf7OoWHFGiB9kYOOTb8XZlayU1sKFb6JQ/D3z/Kb5twTWC3StjQqIRQTa5dTPucrz1XsJERJHBj2wZNAA1WKIwXCyy24qSRwVwlWg74q7U0u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgeOtqN3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgeOtqN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746684981; x=1778220981;
  h=date:from:to:cc:subject:message-id;
  bh=fKVqh4A1L1qiL2ZXg9Mja2MZpqTaKnvJzBwUS9wobHw=;
  b=kgeOtqN3BpDXu2oriB0ziCGR5xaFxtx2rdEzGZj9ff8WVMVbLs4M9RGT
   2VZWzfT7+kXLRB9a0Xr3DvT6DRl52Ij23LU6ciERhMvnolhXG4ZOqFXiJ
   Lg8B+S/Z0PBPpQoPBkiwrevRWpK2ciTYcTuji4tF9Br4TXeLpJdjTBtP6
   fQnGGywgJinJCXZNFOH6oPq9vQdIFfqN5F2lVXMoZD+xPPDz9IjfLFAmZ
   7xsW8zl9W+GtvjGHq6XUxd7aaiwQa0E1w+30VK4W2mBzkEmfDzOOXHPv2
   U3TrWNlK4hfEtmzK4VbBl0u7Pek9xhYsjUwp7WJdl9Ensj2wBgGOA8d4L
   Q==;
X-CSE-ConnectionGUID: GisnnFTDTqynPcVhFFIDtA==
X-CSE-MsgGUID: 73imK+piTgS+1JN7KUZiCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47551233"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="47551233"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 23:16:20 -0700
X-CSE-ConnectionGUID: gH0fp82XQP2JsfXT7mHUrA==
X-CSE-MsgGUID: Qgy4+OsQTYWjylSIsa+L4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="159509952"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 23:16:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCuYK-000Abf-2E;
	Thu, 08 May 2025 06:16:16 +0000
Date: Thu, 08 May 2025 14:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/urgent] BUILD SUCCESS
 94cff94634e506a4a44684bee1875d2dbf782722
Message-ID: <202505081435.zQzDlS87-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
branch HEAD: 94cff94634e506a4a44684bee1875d2dbf782722  clocksource/i8253: Use raw_spinlock_irqsave() in clockevent_i8253_disable()

elapsed time: 3823m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250506    gcc-8.5.0
arc                   randconfig-002-20250506    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250506    clang-21
arm                   randconfig-002-20250506    clang-21
arm                   randconfig-003-20250506    clang-17
arm                   randconfig-004-20250506    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250506    clang-21
arm64                 randconfig-002-20250506    gcc-8.5.0
arm64                 randconfig-003-20250506    clang-21
arm64                 randconfig-004-20250506    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250506    gcc-14.2.0
csky                  randconfig-002-20250506    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250506    clang-21
hexagon               randconfig-002-20250506    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250506    clang-20
i386        buildonly-randconfig-002-20250506    clang-20
i386        buildonly-randconfig-003-20250506    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386        buildonly-randconfig-005-20250506    clang-20
i386        buildonly-randconfig-006-20250506    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250506    gcc-14.2.0
loongarch             randconfig-002-20250506    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250506    gcc-8.5.0
nios2                 randconfig-002-20250506    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250506    gcc-11.5.0
parisc                randconfig-002-20250506    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250506    clang-21
powerpc               randconfig-002-20250506    gcc-8.5.0
powerpc               randconfig-003-20250506    gcc-8.5.0
powerpc64             randconfig-001-20250506    clang-20
powerpc64             randconfig-002-20250506    gcc-8.5.0
powerpc64             randconfig-003-20250506    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250506    clang-19
riscv                 randconfig-002-20250506    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250506    gcc-9.3.0
s390                  randconfig-002-20250506    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250506    gcc-12.4.0
sh                    randconfig-002-20250506    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250506    gcc-11.5.0
sparc                 randconfig-002-20250506    gcc-6.5.0
sparc64               randconfig-001-20250506    gcc-7.5.0
sparc64               randconfig-002-20250506    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250506    clang-17
um                    randconfig-002-20250506    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250506    clang-20
x86_64      buildonly-randconfig-002-20250506    gcc-12
x86_64      buildonly-randconfig-003-20250506    gcc-12
x86_64      buildonly-randconfig-004-20250506    clang-20
x86_64      buildonly-randconfig-005-20250506    clang-20
x86_64      buildonly-randconfig-006-20250506    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250506    gcc-13.3.0
xtensa                randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
