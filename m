Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8078C26BDA6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265106; cv=none; b=kKVwqwRsKnjixPwFD3ckRTl9g+/63bEhGeIQzmhTXvj7S0o0Cy928wd4qBbBJiMLXnr0IXyTBMfNm/QOOhr5Eb5RXmGiTreRXSfcr3uX7kazQDgL1Ii9DsEonvdAAUDIuMfy4z7/pIYhWnBuWkuuutX28ucaZrTTM9l0vTOB6LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265106; c=relaxed/simple;
	bh=vUcVFh5oiMDgY/y2FlfjAPc1cnIYseObH6/EIWY0I2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O9bs6iDE1SLvjLnzl3IKwcX78T6x7WhNRsoNmmwmGvGFnCsxkLgbQPLHlebgNqL1r7Rt6fqcqefqERV89yxROnarYf5fPUgDHretiMmnC20uV8bb9LaI36Fc1kgOun+uewewYomHRWzHjMHS1y7PWnYavlpba3hu3EMBeSzuev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kemah6cs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kemah6cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739265105; x=1770801105;
  h=date:from:to:cc:subject:message-id;
  bh=vUcVFh5oiMDgY/y2FlfjAPc1cnIYseObH6/EIWY0I2Q=;
  b=kemah6csdePiymYI7ZHatqtIm0ZDHrn969YXTWIbCHfLPzb3kTt0GdA3
   qzw0JQqVLs1y7Hi9/UT6W2PtCXypoMy/k4YT5FWN33CpHRkxVmsk8BI/9
   kMMfFTkB89tgy3ay8abAwSj3BHeAieiU/WO1uwQnuz+4qmazkmamlOvFH
   qbpu544kLDYXV6b/lPxQuKUMyPQpLLdp/n9Fj3eukYzi4QIuuLsNa2VLT
   5aWWInrs6vuWlxMsI4k7pZ53m/f6rnTsBrHBdbBa6AjVzCcjNYue1pp0W
   BVJJuqgtBnZpmXE8aIg8XV7jlwjyJHEuweOGw8B7dpEH3pfLmuzmUuMsg
   w==;
X-CSE-ConnectionGUID: +FrKbb+sQz+RodhoRXj36A==
X-CSE-MsgGUID: 3ZS33MAfS2SPxkHjd+sDVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39738016"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39738016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:11:44 -0800
X-CSE-ConnectionGUID: dmeMXns5QAiEzJTtDccF6Q==
X-CSE-MsgGUID: KjAt/Jp9SI23AhfEjhtnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="143301665"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 01:11:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thmIu-0013x7-21;
	Tue, 11 Feb 2025 09:11:40 +0000
Date: Tue, 11 Feb 2025 17:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 53f0f2db4f25ceac8050d28491a59fd94440d527
Message-ID: <202502111730.W7dugz7o-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 53f0f2db4f25ceac8050d28491a59fd94440d527  Merge branch into tip/master: 'sched/urgent'

elapsed time: 1414m

configs tested: 144
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-001-20250211    clang-19
arc                   randconfig-002-20250210    gcc-13.2.0
arc                   randconfig-002-20250211    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-15
arm                       multi_v4t_defconfig    clang-21
arm                        multi_v7_defconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-17
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-001-20250211    clang-19
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-002-20250211    clang-19
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-003-20250211    clang-19
arm                   randconfig-004-20250210    gcc-14.2.0
arm                   randconfig-004-20250211    clang-19
arm                         s3c6400_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-001-20250211    clang-19
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-002-20250211    clang-19
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-003-20250211    clang-19
arm64                 randconfig-004-20250210    gcc-14.2.0
arm64                 randconfig-004-20250211    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250210    clang-21
hexagon               randconfig-002-20250210    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-001-20250211    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-002-20250211    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-003-20250211    gcc-12
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-004-20250211    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-005-20250211    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386        buildonly-randconfig-006-20250211    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250210    gcc-14.2.0
loongarch             randconfig-002-20250210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250210    clang-21
powerpc               randconfig-002-20250210    clang-21
powerpc               randconfig-003-20250210    gcc-14.2.0
powerpc64             randconfig-001-20250210    gcc-14.2.0
powerpc64             randconfig-002-20250210    gcc-14.2.0
powerpc64             randconfig-003-20250210    gcc-14.2.0
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-002-20250210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-002-20250210    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-002-20250210    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250210    gcc-14.2.0
sparc                 randconfig-002-20250210    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250210    gcc-14.2.0
sparc64               randconfig-002-20250210    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250210    clang-18
um                    randconfig-002-20250210    clang-16
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-002-20250210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
