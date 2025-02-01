Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B88C125
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738375619; cv=none; b=JHXQ8116PMfsdD8j48EVcUJbTcPo8NFgB2U+ipdIKqimUYXn8k9lifv3dQfkU6j1SAhkOAqRBKxBg4ND/Mo3WJkyoYfoIIP98Mt6M/JlYzVo//+WcTMVSVmL4nQQkGp8fc3QgWvmwXaGbtLpIDJB/+MIH0aeM079m908ns3+SNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738375619; c=relaxed/simple;
	bh=w66groh5AcmY8mRjKfaAKWDuN6YbiuEGvlmzs4KSbtc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HH0PHiStfK9xmq40CawZxSZqq5RU7QDCM92oAmYZJfXQzbprI/HNTJoH+ODwIwLPUpCmG8ZzrjVw4Rd8xPMfOP52Q43b8lMCoYXfa1lHvdeBe4+U0nTSCt8KZEub0TeYy13umq+X8+fn8wdePPeveffH9rqR3biU2Ur5eYTdeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQpiOkbn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQpiOkbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738375617; x=1769911617;
  h=date:from:to:cc:subject:message-id;
  bh=w66groh5AcmY8mRjKfaAKWDuN6YbiuEGvlmzs4KSbtc=;
  b=QQpiOkbnzXzJkMtP1YPhkyts4mMStv4e9xe4KYgIjSNL+eTfH6G2GqbQ
   vfNkwB2eG+r1G6b6N/BCHSjMkCVPPis/ssWRRj7BbCPCwH8oGIxZsyYX0
   JKVkhGn96NBqkbwFtt47MdkSOcQcIvr9qjWCMJXFx8evKOIn0yRrZLJzz
   STstzo1RrVt9mMBF/61Q+iK4K+G9XinhuepEXpYoAmhrEgT8PhRKOiO17
   A0m0Rrob6gO0MY+BtSFW6uEJEbmBni8RpTj3QRrspcJ+vP8AgvVWTF5Mt
   AYEq3l4xWZm2JHxcgKVpivL0EJ/KXpW3xdXczQ9GofOZcfdKL0BH52ywi
   A==;
X-CSE-ConnectionGUID: 52P0ut3NTaWmJKbJ9MjCsQ==
X-CSE-MsgGUID: TzckqT1cRU+9nSb9PVCxJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="26556332"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="26556332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 18:06:57 -0800
X-CSE-ConnectionGUID: RhM/DP3KRD+MCN/36N+i9Q==
X-CSE-MsgGUID: kwQH0tu0TL6KPfz/YvMeRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="140662692"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jan 2025 18:06:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te2uK-000nbX-39;
	Sat, 01 Feb 2025 02:06:52 +0000
Date: Sat, 01 Feb 2025 10:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:WIP.fixes] BUILD SUCCESS
 a6dff742c351947b32a68a110b9a01b75ceb0183
Message-ID: <202502011040.7mQcY4rL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.fixes
branch HEAD: a6dff742c351947b32a68a110b9a01b75ceb0183  dmaengine: tegra210-adma: Fix build error due to 64-by-32 division

elapsed time: 914m

configs tested: 163
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250131    gcc-13.2.0
arc                   randconfig-002-20250131    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                          ep93xx_defconfig    clang-21
arm                           h3600_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                          moxart_defconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250131    clang-15
arm64                 randconfig-002-20250131    gcc-14.2.0
arm64                 randconfig-003-20250131    clang-21
arm64                 randconfig-004-20250131    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250131    gcc-14.2.0
csky                  randconfig-002-20250131    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-002-20250131    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-21
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-002-20250131    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-002-20250131    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   currituck_defconfig    clang-17
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    clang-18
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-003-20250131    clang-21
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-003-20250131    clang-15
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-14.2.0
riscv                 randconfig-001-20250131    clang-19
riscv                 randconfig-001-20250201    gcc-14.2.0
riscv                 randconfig-002-20250131    clang-21
riscv                 randconfig-002-20250201    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250131    clang-16
s390                  randconfig-001-20250201    gcc-14.2.0
s390                  randconfig-002-20250131    gcc-14.2.0
s390                  randconfig-002-20250201    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-001-20250201    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                    randconfig-002-20250201    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-001-20250201    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc                 randconfig-002-20250201    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-001-20250201    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
sparc64               randconfig-002-20250201    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    clang-19
um                    randconfig-001-20250201    gcc-14.2.0
um                    randconfig-002-20250131    clang-21
um                    randconfig-002-20250201    gcc-14.2.0
um                           x86_64_defconfig    clang-15
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                randconfig-001-20250201    gcc-14.2.0
xtensa                randconfig-002-20250201    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
