Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D0EEBB
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747028923; cv=none; b=H8uLxghRFG7SUhudFtXCrjJZ7UAlSV1y1pyi9mFNmQY4e4jl2fotX28xH42QFhxvwCPpxXmRnZrWCbfIFg0H+8ZNTX8isXQdq92qtHsJByQ4ry3zlhFtF9ln23cGFlVHb/EeYOpAy0nR9f/cGE5EsfAWOr8GQSF+9vmpU9l/2fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747028923; c=relaxed/simple;
	bh=AludmXvqJax0cCwzc+uc9DR9zmVbzmwgDWiDCxHkpLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jxmSobhFU9FCefSTtdILamv4SaCWJ3EfvTpGRdRa4QvZ1v+IT8QBzul736PxoL55b9rQQGouFxWdXrdGyl6wKeyNuNO5dWuw1c4NNxdlMWFn3lPkcXJpWj9QAgPNBYR5k9uNMkgMtALHUsm44AJGuDlV35Z8O+iaAY8pwHpHRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Asr/+Znb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Asr/+Znb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747028922; x=1778564922;
  h=date:from:to:cc:subject:message-id;
  bh=AludmXvqJax0cCwzc+uc9DR9zmVbzmwgDWiDCxHkpLM=;
  b=Asr/+ZnbgXIAOLghPOLl+Dx3E6er9GWLC3YWF7zZNLyHh8wSiifkicM+
   OntiVAKySQBKoXvsObSWurMOPkH/w0xsIcNYvktB7C8jpdlPB6TbwrPfj
   GhFOnCa4+GUF+BjvXzFp2axqx6QP1idLdMxf2HYUJRaiDyVOTffHzA2oT
   Bf9EQN3X3SmOXmaqHNPKnvwaMwNa9gV18hz0ZLBy/TwObRIrqBQG5PcZD
   l8GX+PIzULqMPMgnzVLN8RzUIHPGs84AGeKS60e7xD2oO/TgCaoPq7pLm
   Ts/0frrs+pZgLRlItYiHy+lcnal9YZhergPofgkhUooAT4oPvg45D0eBa
   w==;
X-CSE-ConnectionGUID: uA2vafdHS4GDABbZVHLneg==
X-CSE-MsgGUID: TNZ1Xmn7TaG8XCveFmD7sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="60215593"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="60215593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 22:48:41 -0700
X-CSE-ConnectionGUID: nEjXZVJdQ9ehm89WtViisg==
X-CSE-MsgGUID: oZihMtOfQRakYIduyMJOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="141310582"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 May 2025 22:48:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEM1l-000ED1-1U;
	Mon, 12 May 2025 05:48:37 +0000
Date: Mon, 12 May 2025 13:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 132e896f0ee5608d44e0fe1405d8fbd650c0973b
Message-ID: <202505121358.eKogWZ8t-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 132e896f0ee5608d44e0fe1405d8fbd650c0973b  Merge branch into tip/master: 'x86/urgent'

elapsed time: 799m

configs tested: 140
configs skipped: 4

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
arc                   randconfig-001-20250512    gcc-14.2.0
arc                   randconfig-002-20250512    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                        keystone_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250512    gcc-7.5.0
arm                   randconfig-002-20250512    clang-17
arm                   randconfig-003-20250512    gcc-6.5.0
arm                   randconfig-004-20250512    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250512    gcc-7.5.0
arm64                 randconfig-002-20250512    clang-21
arm64                 randconfig-003-20250512    clang-21
arm64                 randconfig-004-20250512    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250512    gcc-9.3.0
csky                  randconfig-002-20250512    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250512    clang-20
hexagon               randconfig-002-20250512    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250512    gcc-11
i386        buildonly-randconfig-002-20250512    clang-20
i386        buildonly-randconfig-003-20250512    clang-20
i386        buildonly-randconfig-004-20250512    gcc-12
i386        buildonly-randconfig-005-20250512    clang-20
i386        buildonly-randconfig-006-20250512    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250512    gcc-13.3.0
loongarch             randconfig-002-20250512    gcc-13.3.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250512    gcc-7.5.0
nios2                 randconfig-002-20250512    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250512    gcc-12.4.0
parisc                randconfig-002-20250512    gcc-10.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250512    gcc-5.5.0
powerpc               randconfig-002-20250512    clang-21
powerpc               randconfig-003-20250512    gcc-7.5.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250512    clang-21
powerpc64             randconfig-002-20250512    gcc-5.5.0
powerpc64             randconfig-003-20250512    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250512    gcc-7.5.0
riscv                 randconfig-002-20250512    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250512    clang-18
s390                  randconfig-002-20250512    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250512    gcc-11.5.0
sh                    randconfig-002-20250512    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250512    gcc-10.3.0
sparc                 randconfig-002-20250512    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250512    gcc-6.5.0
sparc64               randconfig-002-20250512    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250512    gcc-12
um                    randconfig-002-20250512    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250512    gcc-12
x86_64      buildonly-randconfig-002-20250512    gcc-12
x86_64      buildonly-randconfig-003-20250512    clang-20
x86_64      buildonly-randconfig-004-20250512    clang-20
x86_64      buildonly-randconfig-005-20250512    clang-20
x86_64      buildonly-randconfig-006-20250512    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250512    gcc-12.4.0
xtensa                randconfig-002-20250512    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
