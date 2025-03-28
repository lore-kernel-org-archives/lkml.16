Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1A1537C6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743164587; cv=none; b=JgS2nOLgvqIkJUwcLsS+F0wHqSkmndzhCBTS7tDKKh5L4sJ+0EBOxNkt/+GMmRGvFaSEW9jlKYo/QH9Q3Q+YtMfUy29Y73jOhKKn2dq2sdRSEicQssyWv09NLhDzZnrQxBfpdyfBKG/wrQNINaMuSmj/4WVI5tzGP2V0kUM9fZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743164587; c=relaxed/simple;
	bh=9t3YWOs28KPRVvSy9A3UtMro4rOCLu5sLn1qBxDe9ts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YytFK6BpLlc5I6I9Vsy5ZkLaW2jKyj1o49IVxwprF+mzn4zJpKU1zzqVlTjaxLkuXTHgwey6mo18oSy0e57pjWsEsuYXYVQ4iIPfzd+n9y2rOvycWD75lRTqG8C9293uA0SRLBU94SjRby2wQmf4CyH5soZhKk/p45wFRyPkVB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzkNeOBA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzkNeOBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743164585; x=1774700585;
  h=date:from:to:cc:subject:message-id;
  bh=9t3YWOs28KPRVvSy9A3UtMro4rOCLu5sLn1qBxDe9ts=;
  b=UzkNeOBA+HentU3T+jxxIHrN9bgGISahLKgJD3Avqk0AS2PU7PctKIVA
   CSRAwPZ+IWJywo1u+1+ILSTqUkw13fXI7OezxJJBY8ZcooZmz8T8C3atL
   lP5lhGQrkdtj1CUfFHrjRPj7Ao1rpcxk3OxLO6pYwK+xZKfUiRtXJG2t/
   NGB1SHLDQeZbwz44B4fBHkcTlPN5Y6vYD7iV4kTIYGsQoFyOZMRA7ET7O
   2DJTgThEQRRJ5zGu/OFuquYgsO/MaLskbyt62ytBraB+L9jbWkYxvm015
   GjKyJ4c9UnSqGtHeauwBzI56SEzP7QCrjSsVQ/msaqt2zaGE9xsRrnrFd
   g==;
X-CSE-ConnectionGUID: xPADJ68hQyuT5geM7vHxLw==
X-CSE-MsgGUID: VzUEjGyCTLS88pFzNTlY/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55524650"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55524650"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:23:05 -0700
X-CSE-ConnectionGUID: rhlv9obgTxuQWNT6TVNHfg==
X-CSE-MsgGUID: 9gX0aio5Thuzloa0FF6KTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="156368628"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2025 05:23:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8jl-0007R4-1s;
	Fri, 28 Mar 2025 12:23:01 +0000
Date: Fri, 28 Mar 2025 20:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 9438b89257aa8835c93c3fe5daaaecaec2fe5865
Message-ID: <202503282044.bQUJ1YNH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 9438b89257aa8835c93c3fe5daaaecaec2fe5865  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1451m

configs tested: 205
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250327    gcc-14.2.0
arc                   randconfig-002-20250327    gcc-14.2.0
arc                           tb10x_defconfig    clang-21
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250327    clang-21
arm                   randconfig-002-20250327    gcc-5.5.0
arm                   randconfig-003-20250327    clang-21
arm                   randconfig-004-20250327    clang-16
arm                         s5pv210_defconfig    gcc-14.2.0
arm                       spear13xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250327    gcc-5.5.0
arm64                 randconfig-002-20250327    clang-21
arm64                 randconfig-003-20250327    clang-21
arm64                 randconfig-004-20250327    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250327    gcc-9.3.0
csky                  randconfig-002-20250327    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250327    clang-21
hexagon               randconfig-002-20250327    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250327    clang-20
i386        buildonly-randconfig-002-20250327    gcc-12
i386        buildonly-randconfig-003-20250327    clang-20
i386        buildonly-randconfig-004-20250327    clang-20
i386        buildonly-randconfig-005-20250327    clang-20
i386        buildonly-randconfig-006-20250327    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250328    gcc-12
i386                  randconfig-002-20250328    gcc-12
i386                  randconfig-003-20250328    gcc-12
i386                  randconfig-004-20250328    gcc-12
i386                  randconfig-005-20250328    gcc-12
i386                  randconfig-006-20250328    gcc-12
i386                  randconfig-007-20250328    gcc-12
i386                  randconfig-011-20250328    clang-20
i386                  randconfig-012-20250328    clang-20
i386                  randconfig-013-20250328    clang-20
i386                  randconfig-014-20250328    clang-20
i386                  randconfig-015-20250328    clang-20
i386                  randconfig-016-20250328    clang-20
i386                  randconfig-017-20250328    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250327    gcc-14.2.0
loongarch             randconfig-002-20250327    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    clang-21
mips                         db1xxx_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250327    gcc-11.5.0
nios2                 randconfig-002-20250327    gcc-13.3.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250327    gcc-14.2.0
parisc                randconfig-002-20250327    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250327    gcc-7.5.0
powerpc               randconfig-002-20250327    gcc-9.3.0
powerpc               randconfig-003-20250327    gcc-5.5.0
powerpc                     taishan_defconfig    clang-17
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc                         wii_defconfig    clang-21
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250327    gcc-9.3.0
powerpc64             randconfig-002-20250327    clang-21
powerpc64             randconfig-003-20250327    clang-16
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250327    clang-21
riscv                 randconfig-002-20250327    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250327    gcc-6.5.0
s390                  randconfig-002-20250327    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250327    gcc-5.5.0
sh                    randconfig-002-20250327    gcc-9.3.0
sh                          rsk7203_defconfig    clang-21
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250327    gcc-12.4.0
sparc                 randconfig-002-20250327    gcc-10.3.0
sparc                       sparc64_defconfig    clang-21
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250327    gcc-6.5.0
sparc64               randconfig-002-20250327    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250327    clang-19
um                    randconfig-002-20250327    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250327    gcc-12
x86_64      buildonly-randconfig-002-20250327    gcc-12
x86_64      buildonly-randconfig-003-20250327    clang-20
x86_64      buildonly-randconfig-004-20250327    clang-20
x86_64      buildonly-randconfig-005-20250327    gcc-12
x86_64      buildonly-randconfig-006-20250327    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250328    gcc-12
x86_64                randconfig-002-20250328    gcc-12
x86_64                randconfig-003-20250328    gcc-12
x86_64                randconfig-004-20250328    gcc-12
x86_64                randconfig-005-20250328    gcc-12
x86_64                randconfig-006-20250328    gcc-12
x86_64                randconfig-007-20250328    gcc-12
x86_64                randconfig-008-20250328    gcc-12
x86_64                randconfig-071-20250328    clang-20
x86_64                randconfig-072-20250328    clang-20
x86_64                randconfig-073-20250328    clang-20
x86_64                randconfig-074-20250328    clang-20
x86_64                randconfig-075-20250328    clang-20
x86_64                randconfig-076-20250328    clang-20
x86_64                randconfig-077-20250328    clang-20
x86_64                randconfig-078-20250328    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250327    gcc-14.2.0
xtensa                randconfig-002-20250327    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
