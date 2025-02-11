Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E532505A2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288136; cv=none; b=iCzpxc6EvUcb8tQOEAnyFGE30G/3pBSzpG33U/DdIYxfFeVOgC9FA7tpug6QTF4Gvs1QFfJq1vm3r5zam0b9k2KY+yBT1EEIYHfTT1Mky+XyApsi24DW2anbvLGVyVZf/MAFRvMZ23VFh1kLDplyMGVI6Yl6R0v3R1q6GY5SoXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288136; c=relaxed/simple;
	bh=XYME3j8LcMG4Xm3goYgLJf2gYcQJFjciYNIEwcjGDJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P/ld0E657S3SR1t8IcEdj7/ReikqR3Ud3gJPampmpJuZHq5aDXaRQK8a7d0uWeqoBwrrjQ8YTBaLWsJTBURtdFCJEh8y7pjWXKFADqd3p0zzK+Qg5nGOMg5iwQSFF2L2s0K5hbyzxeMMrHi49VJrMf4KhKdMaRN+Jqjcj4Nfk24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YA/Q2VA2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YA/Q2VA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739288133; x=1770824133;
  h=date:from:to:cc:subject:message-id;
  bh=XYME3j8LcMG4Xm3goYgLJf2gYcQJFjciYNIEwcjGDJU=;
  b=YA/Q2VA2HGDyyB1G9BphpWqFsrTrAHGpOVDHOXgIXNXzsSpZBurgxMfu
   8RnIPYFKhpc/yNaHC1FUj3hyXMMM9oyQxjuxFYHJfUex0aUwSSNRzSp/B
   2jCJgFH7Q8z6DWgSj5O5lvWBYMyAtvaEtbxhJdWtNIbkp5cKM7v++9dEo
   A6Urk9t8OlZlnTl7zMsNYSXx4awNV9GC2SFGyoWZkOq4dUiXj5jksMczF
   aEJcTCTYmkodB39Gbdgf+GtwrS4thBoZAGOvnzz7PT4+arIJDpD6NMFqH
   FBTuMHvT0gG3cF8vqW66u14WJoW0NS9inT5ylG4pco1Bh1fOanIu+wfSP
   g==;
X-CSE-ConnectionGUID: Io2usWLbTBO7Yq+byUAxIw==
X-CSE-MsgGUID: S9xwXBh1RBSt31VPzc39Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43841991"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43841991"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:35:26 -0800
X-CSE-ConnectionGUID: q+EPNDCBQKqTrx4E2u5VhQ==
X-CSE-MsgGUID: EFgo64PlSoOVBCoqBCPbUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117163544"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 07:35:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thsIG-0014MP-0s;
	Tue, 11 Feb 2025 15:35:24 +0000
Date: Tue, 11 Feb 2025 23:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/core] BUILD SUCCESS
 2ea97b76d6712bfb0408e5b81ffd7bc4551d3153
Message-ID: <202502112357.bEDkOWrU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
branch HEAD: 2ea97b76d6712bfb0408e5b81ffd7bc4551d3153  hrtimers: Make hrtimer_update_function() less expensive

elapsed time: 1121m

configs tested: 218
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250211    clang-19
arc                   randconfig-001-20250211    gcc-13.2.0
arc                   randconfig-002-20250211    clang-19
arc                   randconfig-002-20250211    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250211    clang-19
arm                   randconfig-001-20250211    gcc-14.2.0
arm                   randconfig-002-20250211    clang-19
arm                   randconfig-002-20250211    clang-21
arm                   randconfig-003-20250211    clang-19
arm                   randconfig-003-20250211    gcc-14.2.0
arm                   randconfig-004-20250211    clang-19
arm                   randconfig-004-20250211    gcc-14.2.0
arm                        realview_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250211    clang-17
arm64                 randconfig-001-20250211    clang-19
arm64                 randconfig-002-20250211    clang-19
arm64                 randconfig-003-20250211    clang-19
arm64                 randconfig-003-20250211    gcc-14.2.0
arm64                 randconfig-004-20250211    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250211    clang-18
csky                  randconfig-001-20250211    gcc-14.2.0
csky                  randconfig-002-20250211    clang-18
csky                  randconfig-002-20250211    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250211    clang-18
hexagon               randconfig-002-20250211    clang-18
hexagon               randconfig-002-20250211    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250211    gcc-12
i386        buildonly-randconfig-002-20250211    gcc-12
i386        buildonly-randconfig-003-20250211    gcc-12
i386        buildonly-randconfig-004-20250211    gcc-12
i386        buildonly-randconfig-005-20250211    gcc-12
i386        buildonly-randconfig-006-20250211    clang-19
i386        buildonly-randconfig-006-20250211    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250211    gcc-12
i386                  randconfig-002-20250211    gcc-12
i386                  randconfig-003-20250211    gcc-12
i386                  randconfig-004-20250211    gcc-12
i386                  randconfig-005-20250211    gcc-12
i386                  randconfig-006-20250211    gcc-12
i386                  randconfig-007-20250211    gcc-12
i386                  randconfig-011-20250211    gcc-11
i386                  randconfig-012-20250211    gcc-11
i386                  randconfig-013-20250211    gcc-11
i386                  randconfig-014-20250211    gcc-11
i386                  randconfig-015-20250211    gcc-11
i386                  randconfig-016-20250211    gcc-11
i386                  randconfig-017-20250211    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250211    clang-18
loongarch             randconfig-001-20250211    gcc-14.2.0
loongarch             randconfig-002-20250211    clang-18
loongarch             randconfig-002-20250211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250211    clang-18
nios2                 randconfig-001-20250211    gcc-14.2.0
nios2                 randconfig-002-20250211    clang-18
nios2                 randconfig-002-20250211    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250211    clang-18
parisc                randconfig-001-20250211    gcc-14.2.0
parisc                randconfig-002-20250211    clang-18
parisc                randconfig-002-20250211    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250211    clang-15
powerpc               randconfig-001-20250211    clang-18
powerpc               randconfig-002-20250211    clang-18
powerpc               randconfig-002-20250211    clang-21
powerpc               randconfig-003-20250211    clang-18
powerpc               randconfig-003-20250211    clang-19
powerpc64             randconfig-001-20250211    clang-18
powerpc64             randconfig-001-20250211    clang-21
powerpc64             randconfig-002-20250211    clang-18
powerpc64             randconfig-002-20250211    gcc-14.2.0
powerpc64             randconfig-003-20250211    clang-17
powerpc64             randconfig-003-20250211    clang-18
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250211    clang-15
riscv                 randconfig-001-20250211    gcc-14.2.0
riscv                 randconfig-002-20250211    clang-15
riscv                 randconfig-002-20250211    clang-19
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250211    clang-15
s390                  randconfig-001-20250211    clang-21
s390                  randconfig-002-20250211    clang-15
s390                  randconfig-002-20250211    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250211    clang-15
sh                    randconfig-001-20250211    gcc-14.2.0
sh                    randconfig-002-20250211    clang-15
sh                    randconfig-002-20250211    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250211    clang-15
sparc                 randconfig-001-20250211    gcc-14.2.0
sparc                 randconfig-002-20250211    clang-15
sparc                 randconfig-002-20250211    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250211    clang-15
sparc64               randconfig-001-20250211    gcc-14.2.0
sparc64               randconfig-002-20250211    clang-15
sparc64               randconfig-002-20250211    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250211    clang-15
um                    randconfig-001-20250211    clang-17
um                    randconfig-002-20250211    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250211    clang-19
x86_64      buildonly-randconfig-001-20250211    gcc-12
x86_64      buildonly-randconfig-002-20250211    gcc-12
x86_64      buildonly-randconfig-003-20250211    clang-19
x86_64      buildonly-randconfig-003-20250211    gcc-12
x86_64      buildonly-randconfig-004-20250211    gcc-11
x86_64      buildonly-randconfig-004-20250211    gcc-12
x86_64      buildonly-randconfig-005-20250211    clang-19
x86_64      buildonly-randconfig-005-20250211    gcc-12
x86_64      buildonly-randconfig-006-20250211    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250211    gcc-11
x86_64                randconfig-002-20250211    gcc-11
x86_64                randconfig-003-20250211    gcc-11
x86_64                randconfig-004-20250211    gcc-11
x86_64                randconfig-005-20250211    gcc-11
x86_64                randconfig-006-20250211    gcc-11
x86_64                randconfig-007-20250211    gcc-11
x86_64                randconfig-008-20250211    gcc-11
x86_64                randconfig-071-20250211    clang-19
x86_64                randconfig-072-20250211    clang-19
x86_64                randconfig-073-20250211    clang-19
x86_64                randconfig-074-20250211    clang-19
x86_64                randconfig-075-20250211    clang-19
x86_64                randconfig-076-20250211    clang-19
x86_64                randconfig-077-20250211    clang-19
x86_64                randconfig-078-20250211    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250211    clang-15
xtensa                randconfig-001-20250211    gcc-14.2.0
xtensa                randconfig-002-20250211    clang-15
xtensa                randconfig-002-20250211    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
