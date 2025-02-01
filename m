Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63F24690
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738380548; cv=none; b=fQdeE5SXGAc+ptkgVAVb3nHjhEMq1nAyDIJLVtacHbQBh3z51cWNuf4CWl8z6pQ/I9/5Y9d4zuXh6hpthO0SVcL15eCJesAfVR0HTaj8bbEw9R6wfC+Gj2Zq9msJbqR+1zxjqMFg4oUppQJ3ro6wu5CwYN2TRDawAauBCyZ+sPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738380548; c=relaxed/simple;
	bh=MnftW2GvY2z9IjGKonIczJ2OSqnKdMWZaAZSbv4chW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=djoSFAwWKShIv1WPPS5eQZ6K4Wns5guj6C4gg85AJHF2eYRwbRcAwf3vdyYfjDjMGsIMxJZZWM8yFYjzJK5YP7RrREICZ4sXRxlw0kqCRbEZ4sRjH+0bTCrGha1X7IoNj1exhsURCRNFpm0OwxLvs1/exJ7mXTB+kdUsjglGPTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZRkGjxY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZRkGjxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738380546; x=1769916546;
  h=date:from:to:cc:subject:message-id;
  bh=MnftW2GvY2z9IjGKonIczJ2OSqnKdMWZaAZSbv4chW0=;
  b=fZRkGjxY3qwoXYoQLGf6t4ZTrFJgx01xnNH2vaop+PuKIEGPpwc+L84Q
   5yNflsfmnwWMc/Zk2bDH6SXRP9QtMJy38ocW1XlHyMGLLsEsc+uRCEmPA
   9EkuHkaLUd7B16RhSG/NpnOrTuwAlQtJSMYIkNp3zx7aBMg3MW6YQW81I
   NHk8FJxerxGSIFgDYOOXPTFBDvw0kWZmM6Y4v78msD9IBlrH9NSaP3ilC
   cbTsFp6wvk/hx2WtxvOGl3WHELfH2WyfxnmFazNWn6fbR1vCGMAF/EmYV
   b0eg8PBa6qAe3foEH2TzwglzKoaOfVObwtGtAV9wtmNE+MUppj/jfyxrL
   Q==;
X-CSE-ConnectionGUID: VnIe8aV1S5aagGYXf/JEVg==
X-CSE-MsgGUID: cB5yXu/yStKM2pxI7N8WnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39217418"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; 
   d="scan'208";a="39217418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 19:29:05 -0800
X-CSE-ConnectionGUID: VgbAQ9CqRoWe6yEznppLYA==
X-CSE-MsgGUID: g4ws9TywT3azPr7cqrkdDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109633678"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jan 2025 19:29:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te4Bp-000nhp-2V;
	Sat, 01 Feb 2025 03:29:01 +0000
Date: Sat, 01 Feb 2025 11:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/urgent] BUILD SUCCESS
 9065ce69754dece78606c8bbb3821449272e56bf
Message-ID: <202502011100.ode1o6hU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: 9065ce69754dece78606c8bbb3821449272e56bf  sched/debug: Provide slice length for fair tasks

elapsed time: 995m

configs tested: 184
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
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
arm                            dove_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
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
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250201    clang-19
i386                  randconfig-002-20250201    clang-19
i386                  randconfig-003-20250201    clang-19
i386                  randconfig-004-20250201    clang-19
i386                  randconfig-005-20250201    clang-19
i386                  randconfig-006-20250201    clang-19
i386                  randconfig-007-20250201    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-002-20250131    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-002-20250131    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-002-20250131    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-003-20250131    clang-21
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-003-20250131    clang-15
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
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
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-001-20250201    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                    randconfig-002-20250201    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
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
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    clang-19
um                    randconfig-001-20250201    gcc-14.2.0
um                    randconfig-002-20250131    clang-21
um                    randconfig-002-20250201    gcc-14.2.0
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250201    clang-19
x86_64                randconfig-072-20250201    clang-19
x86_64                randconfig-073-20250201    clang-19
x86_64                randconfig-074-20250201    clang-19
x86_64                randconfig-075-20250201    clang-19
x86_64                randconfig-076-20250201    clang-19
x86_64                randconfig-077-20250201    clang-19
x86_64                randconfig-078-20250201    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                randconfig-001-20250201    gcc-14.2.0
xtensa                randconfig-002-20250201    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
