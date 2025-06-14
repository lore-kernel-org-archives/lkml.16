Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D40BA49
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749909296; cv=none; b=DoKV1wLb9MtdwNDf6mwkyZGXhIs9+adY1Mo5u+KGMmRr8Z9A5c5vTIwihVeX6K6kyvb4SkO6Ugc+Uan5VfSr7CJXNuSpuHiPpvxJljIL9HOA05QODn54o+0YGjvvKuYjh3c5oulUZDLZoqgtJ/NDVyCw+0+aJkYQfA6Buheid+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749909296; c=relaxed/simple;
	bh=GxOdTy2L5Hgqh1MUMu2h8i6Q7tCmlzXxNe5RPrR1Okc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aDU0Hjmr8w9WJPxH3ANCR6/HnaQcbn5+vhlGlbH1s3G1N6r6J5LBbnVjQeEhzRhvv2YAHvleyLKrLZUHm3dtEEH8v73NzWzuuJ5oLyzIL+bzTTHJy4m+M7C2/smiW9OC3q5Za77D7b2+5Am9GMZ2FL47J6TCm7eN5uyxsQRPp5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxSpBWdA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxSpBWdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749909295; x=1781445295;
  h=date:from:to:cc:subject:message-id;
  bh=GxOdTy2L5Hgqh1MUMu2h8i6Q7tCmlzXxNe5RPrR1Okc=;
  b=hxSpBWdANbJjvdVN+1m1Y/a3ieK3fxXjnKM1qa7WzsD2zMmkLchdqHae
   hulcn9xaMwIx8muMqyz+H48keBqQrWFwjY2tFRdCM+8oydf6mnzbzfCVT
   jLXeHSvVqHx9RLrNeUNdnqLA3hHNMO2MrTfHgsUPbsCABBBnn9+WOAf4f
   6Omx4PSznJ9TZ/13LE+EDAVYiE1qXaBh0BQD6y2Hi+z6NeO+eWINhZ5UA
   YxrEscaThxyqodZgCC+P9tWBC/mm1wPAFMjsSyEmaPh165Z4RwtFeQS6v
   nb4isfHaOfoERPBfpXNH5U9OSklr0o0WTIfsxTCfsk/Zrn2tH3eDUpUvD
   g==;
X-CSE-ConnectionGUID: y5KtRXZ/TbOg57WgYZFMUA==
X-CSE-MsgGUID: ya1uUYz6RAOnDbYqr263Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55912769"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55912769"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 06:54:55 -0700
X-CSE-ConnectionGUID: ybKuAYfaTEqlkJ67r130IA==
X-CSE-MsgGUID: d2BDlpynS3qrq1mqXYkbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="153220052"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jun 2025 06:54:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQRLP-000DXx-0Z;
	Sat, 14 Jun 2025 13:54:51 +0000
Date: Sat, 14 Jun 2025 21:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/urgent] BUILD SUCCESS
 8a2277a3c9e4cc5398f80821afe7ecbe9bdf2819
Message-ID: <202506142130.92NLnPhI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
branch HEAD: 8a2277a3c9e4cc5398f80821afe7ecbe9bdf2819  genirq/irq_sim: Initialize work context pointers properly

elapsed time: 1454m

configs tested: 102
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250613    gcc-12.4.0
arc                   randconfig-002-20250613    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250613    clang-21
arm                   randconfig-002-20250613    clang-20
arm                   randconfig-003-20250613    gcc-8.5.0
arm                   randconfig-004-20250613    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250613    gcc-15.1.0
arm64                 randconfig-002-20250613    clang-21
arm64                 randconfig-003-20250613    clang-21
arm64                 randconfig-004-20250613    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250614    gcc-13.3.0
csky                  randconfig-002-20250614    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250614    clang-21
hexagon               randconfig-002-20250614    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250613    gcc-12
i386        buildonly-randconfig-002-20250613    gcc-11
i386        buildonly-randconfig-003-20250613    gcc-12
i386        buildonly-randconfig-004-20250613    clang-20
i386        buildonly-randconfig-005-20250613    clang-20
i386        buildonly-randconfig-006-20250613    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250614    gcc-15.1.0
loongarch             randconfig-002-20250614    gcc-15.1.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250614    gcc-13.3.0
nios2                 randconfig-002-20250614    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250614    gcc-8.5.0
parisc                randconfig-002-20250614    gcc-11.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250614    gcc-13.3.0
powerpc               randconfig-002-20250614    clang-21
powerpc               randconfig-003-20250614    gcc-12.4.0
powerpc64             randconfig-001-20250614    gcc-11.5.0
powerpc64             randconfig-002-20250614    clang-21
powerpc64             randconfig-003-20250614    gcc-12.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250613    gcc-8.5.0
riscv                 randconfig-002-20250613    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250613    clang-21
s390                  randconfig-002-20250613    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250613    gcc-15.1.0
sh                    randconfig-002-20250613    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250613    gcc-10.3.0
sparc                 randconfig-002-20250613    gcc-13.3.0
sparc64               randconfig-001-20250613    gcc-15.1.0
sparc64               randconfig-002-20250613    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250613    gcc-12
um                    randconfig-002-20250613    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250613    clang-20
x86_64      buildonly-randconfig-002-20250613    gcc-12
x86_64      buildonly-randconfig-003-20250613    gcc-12
x86_64      buildonly-randconfig-004-20250613    gcc-12
x86_64      buildonly-randconfig-005-20250613    clang-20
x86_64      buildonly-randconfig-006-20250613    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250613    gcc-8.5.0
xtensa                randconfig-002-20250613    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
