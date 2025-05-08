Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E168C1E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684317; cv=none; b=l1PDdbj0QiSLHVAAvTxcg51u9nbvZj4zoTdq9miDysAYybUUzzrFI3juQrehjI27pexGD5YLbF+yyfpAhjlQrBUM3D4G2swVRVYEAtTNoEmil/4RsDTRNdRqhzF4KP40PKyPGhsY9hJk+IcScE1TePC2aDPUJ5DdgztIMuH1MAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684317; c=relaxed/simple;
	bh=4BxxUqwSht6IxJ1Ag6PdJ5dMa+BtXja0dZraKsp1qwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aIpBIzSD2V1HPTjcN/YzcUY8vwxaiKenQWJuCi7vYEp7kgi3bTwRm14slhAnmMxseOARulitAY90MNNx7yo5HHCSrqcWXf/FrlwITkCRM6UciS372KxAZuu1Fohc4SptSabN5CMJWayXMRJ/R1tm5NvzfyYwgg0qlCT6EOsl7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9bgPtYC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9bgPtYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746684316; x=1778220316;
  h=date:from:to:cc:subject:message-id;
  bh=4BxxUqwSht6IxJ1Ag6PdJ5dMa+BtXja0dZraKsp1qwM=;
  b=K9bgPtYCUPUjzI2zj1NLxQ312I1rLIaH9ixTMCVD4Jqt91I2Ym6Fhxgc
   9EUadmX7f0+paXwHA/FrivrJWZ/fYF34azEoJBzruHMD+bAFqfWPLDd2g
   xFM7Y7bswxqXsi86TLdIgLr+Mcsc4vFV6qnaioASPDI//WNSiA9+3pbU6
   w2n5YNqhXH5KWYEQMkjXFv5mbdwzEHFDbi/9FYjqUpYqdRlZUOdrunNR6
   OKqGO9SHptGxlpvVmaS7eeVV0yICbBxJI7hS6+Xl7D/0ItsP12bNBMfWq
   4HfDsSu/7BZDmFmaGflG5AXYXKw6FQCmqhum8bFUr95vjJr4Aa5TuqP6t
   w==;
X-CSE-ConnectionGUID: 7TkaxNSVSSiTJZmZFHf9UA==
X-CSE-MsgGUID: 4HxqBY/bRTykk/KieGAALw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59842414"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59842414"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 23:05:16 -0700
X-CSE-ConnectionGUID: /XkuCvfaQOWuxPAF+NldPw==
X-CSE-MsgGUID: 4NvnsFmKTn+9SqHJZWurHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="167132783"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 23:05:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCuNc-000AXz-2Z;
	Thu, 08 May 2025 06:05:12 +0000
Date: Thu, 08 May 2025 14:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/core] BUILD SUCCESS
 2117c1d503b4e0fd0c6776ae9fe4df2260643eae
Message-ID: <202505081454.TpZlmTiT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
branch HEAD: 2117c1d503b4e0fd0c6776ae9fe4df2260643eae  alarmtimer: Switch spin_{lock,unlock}_irqsave() to guards

elapsed time: 11430m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250430    gcc-14.2.0
arc                   randconfig-002-20250430    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-21
arm                                 defconfig    clang-21
arm                           imxrt_defconfig    clang-21
arm                        multi_v5_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250430    gcc-10.5.0
arm                   randconfig-002-20250430    gcc-7.5.0
arm                   randconfig-003-20250430    clang-21
arm                   randconfig-004-20250430    gcc-7.5.0
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250430    gcc-5.5.0
arm64                 randconfig-002-20250430    clang-21
arm64                 randconfig-003-20250430    gcc-5.5.0
arm64                 randconfig-004-20250430    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250430    gcc-14.2.0
csky                  randconfig-002-20250430    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250430    clang-21
hexagon               randconfig-002-20250430    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250430    gcc-12
i386        buildonly-randconfig-002-20250430    gcc-12
i386        buildonly-randconfig-003-20250430    gcc-12
i386        buildonly-randconfig-004-20250430    gcc-12
i386        buildonly-randconfig-005-20250430    clang-20
i386        buildonly-randconfig-006-20250430    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250430    gcc-14.2.0
loongarch             randconfig-002-20250430    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
mips                           ip27_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250430    gcc-11.5.0
nios2                 randconfig-002-20250430    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250430    gcc-14.2.0
parisc                randconfig-002-20250430    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250430    clang-21
powerpc               randconfig-002-20250430    gcc-9.3.0
powerpc               randconfig-003-20250430    gcc-7.5.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250430    gcc-10.5.0
powerpc64             randconfig-002-20250430    gcc-10.5.0
powerpc64             randconfig-003-20250430    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250430    gcc-7.5.0
riscv                 randconfig-002-20250430    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250430    clang-20
s390                  randconfig-002-20250430    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250430    gcc-5.5.0
sh                    randconfig-002-20250430    gcc-5.5.0
sh                           se7619_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250430    gcc-10.3.0
sparc                 randconfig-002-20250430    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250430    gcc-12.4.0
sparc64               randconfig-002-20250430    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250430    gcc-12
um                    randconfig-002-20250430    clang-16
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250430    clang-20
x86_64      buildonly-randconfig-002-20250430    clang-20
x86_64      buildonly-randconfig-003-20250430    gcc-12
x86_64      buildonly-randconfig-004-20250430    clang-20
x86_64      buildonly-randconfig-005-20250430    clang-20
x86_64      buildonly-randconfig-006-20250430    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250430    gcc-8.5.0
xtensa                randconfig-002-20250430    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
