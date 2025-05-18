Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F76101E6
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747549025; cv=none; b=VR+6os0xdeQe83wzK3fftn8AznkfFF9xetqhv5XLbLUP690lvSRMGE852VrlUBh5T31ImfD2Ah/y6Tjef20vJ3TDPJ6ePPlKNPIP1lZgED46xb20wR9x6tRB7L7MFgmNm5xDYZjvQNrD0uDCblEoBCon00lTQrv+TbL9uuxdhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747549025; c=relaxed/simple;
	bh=t/dqP1RchcDx/Tcxd4PEK6uv4CIgulQoLmnidU+wCzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rb7rtMRPfaLZ0M7TIQqZZQDl1+LqBnAg4MapVSc/OUnu4C1LluRPvfNZuAco+UDISMjGbCmF4l1fc8bu4bbqISgmSe3aJXsephchqjbA128z/NwlvEQlMjGnGQza+rlDliiPqI1jNjnjytWPG+EiwiaBRlIdyRcjVv2IiRXjJ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSaYeDiW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSaYeDiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747549023; x=1779085023;
  h=date:from:to:cc:subject:message-id;
  bh=t/dqP1RchcDx/Tcxd4PEK6uv4CIgulQoLmnidU+wCzs=;
  b=VSaYeDiWM2xYi25PhCIZRgWczYJuAbfFGfwuiSsXeVLluAw8o1RNTrkM
   QzZYYL0/VQwzxg91zJXTHpsRq+CfuRkOAJK64mXO7p3fD4t1GnmMAoEp9
   2ik1Bh8IFRmRWWgYVIW2UqOukjzIp7dK6GkvQQIPkDYJ8ev88NTqVzEZv
   ujrQ7gdExxQqi24sf3Hr/tcZzNn1woh5LPv4/wmKeWXfmxFWLUScAFD4y
   FNmOCpQuQqB7F1iWfvVLOwn+dB9/Ad3qcHL/FEqxm/+ZiB/N8cq4i24uy
   Ngv32fuxrSZc8UDmnXSLf16HDOdDGk4rtbwINWN3AXe0FFDu+UhS7MBK0
   A==;
X-CSE-ConnectionGUID: METzJdXTShCPbyPIpYkZNQ==
X-CSE-MsgGUID: WfNsKyGNQOm5PtR3hxOHJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49577767"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49577767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 23:17:02 -0700
X-CSE-ConnectionGUID: lU3nnlJoQuGK0CKmYhpurg==
X-CSE-MsgGUID: p3HJ6QBWSQW9KJCGTSfDGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="143850187"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 May 2025 23:17:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGXKV-000Kf9-0P;
	Sun, 18 May 2025 06:16:59 +0000
Date: Sun, 18 May 2025 14:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/merge] BUILD SUCCESS
 37ef4bfb86512ad4a79c049ab8702d92a13513d2
Message-ID: <202505181437.tebg1C3t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/merge
branch HEAD: 37ef4bfb86512ad4a79c049ab8702d92a13513d2  Merge branch 'x86/cache' into x86/merge, to resolve conflicts

elapsed time: 975m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250517    gcc-10.5.0
arc                   randconfig-002-20250517    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250517    clang-21
arm                   randconfig-002-20250517    gcc-8.5.0
arm                   randconfig-003-20250517    gcc-8.5.0
arm                   randconfig-004-20250517    clang-21
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250517    clang-17
arm64                 randconfig-002-20250517    clang-16
arm64                 randconfig-003-20250517    gcc-6.5.0
arm64                 randconfig-004-20250517    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250517    gcc-10.5.0
csky                  randconfig-002-20250517    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250517    clang-21
hexagon               randconfig-002-20250517    clang-21
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250517    clang-20
i386        buildonly-randconfig-002-20250517    clang-20
i386        buildonly-randconfig-003-20250517    clang-20
i386        buildonly-randconfig-004-20250517    gcc-12
i386        buildonly-randconfig-005-20250517    clang-20
i386        buildonly-randconfig-006-20250517    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250517    gcc-14.2.0
loongarch             randconfig-002-20250517    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        omega2p_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250517    gcc-14.2.0
nios2                 randconfig-002-20250517    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250517    gcc-5.5.0
parisc                randconfig-002-20250517    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   motionpro_defconfig    clang-21
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250517    gcc-6.5.0
powerpc               randconfig-002-20250517    gcc-6.5.0
powerpc               randconfig-003-20250517    clang-16
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250517    clang-21
powerpc64             randconfig-002-20250517    gcc-6.5.0
powerpc64             randconfig-003-20250517    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250517    clang-21
riscv                 randconfig-002-20250517    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250517    gcc-7.5.0
s390                  randconfig-002-20250517    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250517    gcc-12.4.0
sh                    randconfig-002-20250517    gcc-10.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250517    gcc-11.5.0
sparc                 randconfig-002-20250517    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250517    gcc-7.5.0
sparc64               randconfig-002-20250517    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250517    gcc-12
um                    randconfig-002-20250517    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250517    gcc-12
x86_64      buildonly-randconfig-002-20250517    gcc-12
x86_64      buildonly-randconfig-003-20250517    clang-20
x86_64      buildonly-randconfig-004-20250517    clang-20
x86_64      buildonly-randconfig-005-20250517    clang-20
x86_64      buildonly-randconfig-006-20250517    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250517    gcc-9.3.0
xtensa                randconfig-002-20250517    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
