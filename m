Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C3206F02
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279654; cv=none; b=cYnsGsO8t5EzeYCqXX6T5P6xoLqA/GmXvdvMxYn0w6pRJp687CjdPoZEjhf0VJWapzkNBJkaWwdl2TUKWjaLWQmJ1bUIAl4mzVj0kX2Vygt5+txfasokZPTTXz9VBxXyT/EF5wri87mQzF49GuzLOk0mQykz5BN+gzwFav7Lhv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279654; c=relaxed/simple;
	bh=KGGIDK/qWuETtrL5vqZ6idk9pnGSMZoRfQDzgkKvI20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pz4f12+0VwYVA364PedihlDRKx3Qwb95kOoTEU/ydXaDStePfdPdQQUtEt9/q8jGRufU4Dz1/jdlCYIH1LJgO2+deC0UmFS/7hlvjo7PAd8H2n6NBYhd3m7oFqq/zCE8O12fbrrviD7YHKjeNJOJTWdc2UQnK+idNjFteHVgS6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWn4pBE/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWn4pBE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739279653; x=1770815653;
  h=date:from:to:cc:subject:message-id;
  bh=KGGIDK/qWuETtrL5vqZ6idk9pnGSMZoRfQDzgkKvI20=;
  b=cWn4pBE/gep+V2GjxUm/YXFLutAf2/8pWckWgQU6LxRdDe/16GbJsaks
   KHl7Fih04a1PtduAu+n26SCx+qQGlgQjelIGRNfHoWftSqIWsVUZy+d+L
   zA1qFfhFS/XTYMFO1LUycJuUg6Hm/XRoZV0Uw7vomIpzjd3UndkD0L8VT
   oOLcTJ6DDsRVDI7vlxYiufDa01Xv4396bvxLEPpwpHAUFlmXa+BEefqAd
   nujUqDYRkj8PltXxhGbgQ6ESXqP/ML1zFu5J/JJT7Pya/7NzU3caLlDGF
   mbUj7Wd/ahUG1Xkmu4clCx4jRQWIpZoEy77UEAApSqFb84+yWYjG4xQCJ
   g==;
X-CSE-ConnectionGUID: kfjrJiyoSOa9N7sC6Id1yA==
X-CSE-MsgGUID: x+GcR5YVQ6uL89WWQ5sPvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42733818"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="42733818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 05:14:12 -0800
X-CSE-ConnectionGUID: 8nDzXQ6tQ6elWnqPrPxC4w==
X-CSE-MsgGUID: ynambehEQl2wsbfvvMHASQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117423779"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2025 05:14:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thq5Y-0014CB-1K;
	Tue, 11 Feb 2025 13:14:08 +0000
Date: Tue, 11 Feb 2025 21:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/fpu] BUILD SUCCESS
 ccb7735a1ea22621f21c3133e4f5f3da5fe5f5b7
Message-ID: <202502112149.Db97BTvF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
branch HEAD: ccb7735a1ea22621f21c3133e4f5f3da5fe5f5b7  x86/fpu: Fully optimize out WARN_ON_FPU()

elapsed time: 825m

configs tested: 137
configs skipped: 133

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    clang-21
arc                              allnoconfig    gcc-14.2.0
arc                  randconfig-001-20250211    clang-19
arc                  randconfig-002-20250211    clang-19
arm                              allnoconfig    gcc-14.2.0
arm                  randconfig-001-20250211    clang-19
arm                  randconfig-002-20250211    clang-19
arm                  randconfig-003-20250211    clang-19
arm                  randconfig-004-20250211    clang-19
arm                       realview_defconfig    gcc-14.2.0
arm                        vf610m4_defconfig    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250211    clang-19
arm64                randconfig-002-20250211    clang-19
arm64                randconfig-003-20250211    clang-19
arm64                randconfig-004-20250211    clang-19
csky                             allnoconfig    gcc-14.2.0
csky                               defconfig    gcc-14.2.0
csky                 randconfig-001-20250211    clang-18
csky                 randconfig-002-20250211    clang-18
hexagon                         allmodconfig    clang-21
hexagon                          allnoconfig    gcc-14.2.0
hexagon                         allyesconfig    clang-21
hexagon              randconfig-001-20250211    clang-18
hexagon              randconfig-002-20250211    clang-18
i386                            allmodconfig    clang-19
i386                            allmodconfig    gcc-12
i386                             allnoconfig    clang-19
i386                             allnoconfig    gcc-12
i386                            allyesconfig    clang-19
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250211    gcc-12
i386       buildonly-randconfig-002-20250211    gcc-12
i386       buildonly-randconfig-003-20250211    gcc-12
i386       buildonly-randconfig-004-20250211    gcc-12
i386       buildonly-randconfig-005-20250211    gcc-12
i386       buildonly-randconfig-006-20250211    clang-19
i386       buildonly-randconfig-006-20250211    gcc-12
i386                               defconfig    clang-19
i386                 randconfig-001-20250211    gcc-12
i386                 randconfig-002-20250211    gcc-12
i386                 randconfig-003-20250211    gcc-12
i386                 randconfig-004-20250211    gcc-12
i386                 randconfig-005-20250211    gcc-12
i386                 randconfig-006-20250211    gcc-12
i386                 randconfig-007-20250211    gcc-12
i386                 randconfig-011-20250211    gcc-11
i386                 randconfig-012-20250211    gcc-11
i386                 randconfig-013-20250211    gcc-11
i386                 randconfig-014-20250211    gcc-11
i386                 randconfig-015-20250211    gcc-11
i386                 randconfig-016-20250211    gcc-11
i386                 randconfig-017-20250211    gcc-11
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250211    clang-18
loongarch            randconfig-002-20250211    clang-18
m68k                         amiga_defconfig    gcc-14.2.0
m68k                         hp300_defconfig    gcc-14.2.0
m68k                           q40_defconfig    gcc-14.2.0
mips                         ath79_defconfig    gcc-14.2.0
mips                       omega2p_defconfig    gcc-14.2.0
nios2                randconfig-001-20250211    clang-18
nios2                randconfig-002-20250211    clang-18
openrisc                         allnoconfig    clang-21
parisc                           allnoconfig    clang-21
parisc               generic-32bit_defconfig    gcc-14.2.0
parisc               randconfig-001-20250211    clang-18
parisc               randconfig-002-20250211    clang-18
powerpc                          allnoconfig    clang-21
powerpc                       cell_defconfig    gcc-14.2.0
powerpc                        ps3_defconfig    gcc-14.2.0
powerpc              randconfig-001-20250211    clang-18
powerpc              randconfig-002-20250211    clang-18
powerpc              randconfig-003-20250211    clang-18
powerpc64            randconfig-001-20250211    clang-18
powerpc64            randconfig-002-20250211    clang-18
powerpc64            randconfig-003-20250211    clang-18
riscv                            allnoconfig    clang-21
riscv                randconfig-001-20250211    clang-15
riscv                randconfig-002-20250211    clang-15
s390                            allmodconfig    gcc-14.2.0
s390                             allnoconfig    clang-21
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250211    clang-15
s390                 randconfig-002-20250211    clang-15
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250211    clang-15
sh                   randconfig-002-20250211    clang-15
sh                         rsk7201_defconfig    gcc-14.2.0
sh                          se7722_defconfig    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250211    clang-15
sparc                randconfig-002-20250211    clang-15
sparc64              randconfig-001-20250211    clang-15
sparc64              randconfig-002-20250211    clang-15
um                              allmodconfig    clang-21
um                               allnoconfig    clang-21
um                              allyesconfig    clang-21
um                   randconfig-001-20250211    clang-15
um                   randconfig-002-20250211    clang-15
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250211    clang-19
x86_64     buildonly-randconfig-001-20250211    gcc-12
x86_64     buildonly-randconfig-002-20250211    gcc-12
x86_64     buildonly-randconfig-003-20250211    clang-19
x86_64     buildonly-randconfig-003-20250211    gcc-12
x86_64     buildonly-randconfig-004-20250211    gcc-11
x86_64     buildonly-randconfig-004-20250211    gcc-12
x86_64     buildonly-randconfig-005-20250211    clang-19
x86_64     buildonly-randconfig-005-20250211    gcc-12
x86_64     buildonly-randconfig-006-20250211    gcc-12
x86_64                             defconfig    clang-19
x86_64                             defconfig    gcc-11
x86_64                                 kexec    clang-19
x86_64               randconfig-001-20250211    gcc-11
x86_64               randconfig-002-20250211    gcc-11
x86_64               randconfig-003-20250211    gcc-11
x86_64               randconfig-004-20250211    gcc-11
x86_64               randconfig-005-20250211    gcc-11
x86_64               randconfig-006-20250211    gcc-11
x86_64               randconfig-007-20250211    gcc-11
x86_64               randconfig-008-20250211    gcc-11
x86_64               randconfig-071-20250211    clang-19
x86_64               randconfig-072-20250211    clang-19
x86_64               randconfig-073-20250211    clang-19
x86_64               randconfig-074-20250211    clang-19
x86_64               randconfig-075-20250211    clang-19
x86_64               randconfig-076-20250211    clang-19
x86_64               randconfig-077-20250211    clang-19
x86_64               randconfig-078-20250211    clang-19
x86_64                              rhel-9.4    clang-19
xtensa               randconfig-001-20250211    clang-15
xtensa               randconfig-002-20250211    clang-15
xtensa                   xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
