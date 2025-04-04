Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8815194A59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770184; cv=none; b=UK4R9Z6kJHmn5KnYTw+U1R24n1cJo+4xKw+0DcEOsJSvzfqYP6QRrmaxHhfYXnA5mk1Hj1qd3aAMiWvvLqkjGxkJjF1xyABkcR5xZwThi1mlMUMVGtTzf8cOAMx2gETHzBB1bvypxg9Lb/fNo9N2se5lZIcWu2e3ZeU5lRJzZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770184; c=relaxed/simple;
	bh=0tg7jVgRBQbMi3XkrUnIiUDI/dM9GoFZjjsV6C1P8dI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IU+LHuJEywmI70ojRajs6e1mxmeWePi4mZnIsSS9Nj+6MvumBep1jPnX1hSgqSwVPVp/QIdOybbYpG+cn0yfnPlqksHMFJMLsZ3CCHspgKOFChO6rpY/GXT8vWVjZW+Cg4qCzwW9Zh7+ko98nqffF27Hk1UGbqosRDP5rb/D9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdWdC8UW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdWdC8UW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743770182; x=1775306182;
  h=date:from:to:cc:subject:message-id;
  bh=0tg7jVgRBQbMi3XkrUnIiUDI/dM9GoFZjjsV6C1P8dI=;
  b=TdWdC8UWbOSFMIrDqn6YmfJjsaUxrOJEgR3lG1y7B59dF2fuubDDHBGo
   zJl0pX0kSrmiifxi1+BWjUlYNmCxCtvVaDb1V6ZBZrvsNVYrmA9GSnrr2
   F1EVfDSJngC5CY8IqkZ0TnC+U/26vNDhB81Xl0OAmZhR/m9Qu+K76M2ce
   C93OxJWscqG005HLlPq3WNzUmHz3QJXAV2lw4EhowKg9qEr8Hz80ybQfx
   AkL/+TAoa4ceRrbUQD6PdEy/T+neMV82Xvza0ppTCvAdi5YlC2hCeoDwp
   hzVWJMFcgCEouK9KtbRk8QPPdf7BnHr0SAOaG37io426C0/gn6Iw23TLD
   g==;
X-CSE-ConnectionGUID: RFttTuZXRReha+onQnleMg==
X-CSE-MsgGUID: 3caLjcvHRamVU5DzbiyN5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56574325"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56574325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:36:22 -0700
X-CSE-ConnectionGUID: ixQWKyaWQ6q4dtmBksWO4A==
X-CSE-MsgGUID: DqtLZxRwQgaGqZ3LjhT7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="158288680"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 05:36:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0gHT-0001Ej-05;
	Fri, 04 Apr 2025 12:36:19 +0000
Date: Fri, 04 Apr 2025 20:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/urgent] BUILD SUCCESS
 169eae7711ea4b745e2d33d53e7b88689b10e1a0
Message-ID: <202504042002.iBlOEc2q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: 169eae7711ea4b745e2d33d53e7b88689b10e1a0  rseq: Eliminate useless task_work on execve

elapsed time: 1450m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250404    gcc-14.2.0
arc                   randconfig-002-20250404    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-15
arm                   randconfig-001-20250404    clang-21
arm                   randconfig-002-20250404    gcc-7.5.0
arm                   randconfig-003-20250404    clang-21
arm                   randconfig-004-20250404    clang-21
arm                           sama7_defconfig    clang-21
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250404    gcc-5.5.0
arm64                 randconfig-002-20250404    gcc-7.5.0
arm64                 randconfig-003-20250404    gcc-9.5.0
arm64                 randconfig-004-20250404    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250403    gcc-14.2.0
csky                  randconfig-002-20250403    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250403    clang-21
hexagon               randconfig-002-20250403    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250403    clang-20
i386        buildonly-randconfig-002-20250403    clang-20
i386        buildonly-randconfig-003-20250403    clang-20
i386        buildonly-randconfig-004-20250403    gcc-12
i386        buildonly-randconfig-005-20250403    gcc-12
i386        buildonly-randconfig-006-20250403    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250403    gcc-12.4.0
loongarch             randconfig-002-20250403    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250403    gcc-10.5.0
nios2                 randconfig-002-20250403    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250403    gcc-13.3.0
parisc                randconfig-002-20250403    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250403    clang-16
powerpc               randconfig-002-20250403    gcc-6.5.0
powerpc               randconfig-003-20250403    clang-21
powerpc64             randconfig-001-20250403    clang-19
powerpc64             randconfig-002-20250403    clang-17
powerpc64             randconfig-003-20250403    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250403    clang-21
riscv                 randconfig-002-20250403    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250403    gcc-9.3.0
s390                  randconfig-002-20250403    gcc-7.5.0
s390                       zfcpdump_defconfig    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250403    gcc-6.5.0
sh                    randconfig-002-20250403    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250403    gcc-11.5.0
sparc                 randconfig-002-20250403    gcc-13.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250403    gcc-7.5.0
sparc64               randconfig-002-20250403    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                    randconfig-001-20250403    clang-19
um                    randconfig-002-20250403    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250403    clang-20
x86_64      buildonly-randconfig-002-20250403    clang-20
x86_64      buildonly-randconfig-003-20250403    clang-20
x86_64      buildonly-randconfig-004-20250403    clang-20
x86_64      buildonly-randconfig-005-20250403    gcc-11
x86_64      buildonly-randconfig-006-20250403    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250403    gcc-11.5.0
xtensa                randconfig-002-20250403    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
