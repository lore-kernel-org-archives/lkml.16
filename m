Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF72135A6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682091; cv=none; b=SDt78S2H7+no3dmGXFkn7Va9AtlaIa0BURk0VBM/UuypjToR0RubLHVAiMt1hPHMFsYIxYaK/Rduu3wSyFCjmwb4AtswhD6NrhjvszbRBIpteiipXcL+Ve64NblJmORRaEWiRwDjsrAs4dXE4j+fDeBlnU0q2yJ+rUmsMf95Y8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682091; c=relaxed/simple;
	bh=FUFpxnbef4u9bLhpo7/mowH2/p0U0jyJnf/i9I0IXTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TJodKeI9/tRXZkAzpJk359lloN3JaVSngxpDIkruoOI4V7qMFJK2ESrmV95okdricXFkB71AK43ng7rNNPE8uoz4Q7zclRK25dK5PsNmC3HWNJqPbcqCs3bcrj0l2svHr/W+6v+uP77HH4djX3LFHIEaRlk6ryMkrOSlChlHW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhkEDO5f; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhkEDO5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746682090; x=1778218090;
  h=date:from:to:cc:subject:message-id;
  bh=FUFpxnbef4u9bLhpo7/mowH2/p0U0jyJnf/i9I0IXTY=;
  b=UhkEDO5fRe3NlmhxqqM89xrnCpqKu7rvVh1A4H7O/QFPR4/aGNKE3I2q
   //XmdnV3SQXay2OQgkIYfkIViBFJRNSINvN5OXexDt0sh5UhFy5/5pdms
   B1lfJBZBK9xzzeAMe1RODHH4if7oIgEA/OH59PicCSgAxKtdSqMQR0YBZ
   WL+4Z7B7p+fou+tv+qAwSSEXiDsZiQZlkZYnE9iltkIvVr8tu/WjYzilr
   N7iwNzWgM2wa6M32G3Q1UAlh6UZmssBY5ZPxFZW1Cw2hDZFk+oY5BBVZm
   JqSurJryHidjDv/WaKlDqFtb9+ijXnkP6kqPjuZl7wTakbAVGacgvj1Gd
   w==;
X-CSE-ConnectionGUID: NivpoaHrR6iAvyx6kSM1Og==
X-CSE-MsgGUID: R441Nqe8TMi4zOJsWqdwdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52098297"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52098297"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:28:08 -0700
X-CSE-ConnectionGUID: YXTfaTenREmcyFFA/VTxBw==
X-CSE-MsgGUID: zCfgb1ZwQKCv+UdJ5iWdFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141390961"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 22:28:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtnc-000AMo-1r;
	Thu, 08 May 2025 05:28:00 +0000
Date: Thu, 08 May 2025 13:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/cpu] BUILD SUCCESS
 c1ab4ce3cb759f69fb9085a060e568b73e8f5cd8
Message-ID: <202505081359.B4eg9AOw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cpu
branch HEAD: c1ab4ce3cb759f69fb9085a060e568b73e8f5cd8  tools/arch/x86: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>

elapsed time: 2425m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250506    gcc-8.5.0
arc                   randconfig-002-20250506    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250506    clang-21
arm                   randconfig-002-20250506    clang-21
arm                   randconfig-003-20250506    clang-17
arm                   randconfig-004-20250506    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250506    clang-21
arm64                 randconfig-002-20250506    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250506    gcc-14.2.0
csky                  randconfig-002-20250506    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250506    clang-21
hexagon               randconfig-002-20250506    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
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
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-002-20250506    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20250506    clang-19
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
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
sparc64               randconfig-002-20250506    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
