Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE812C7FD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 22:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743288539; cv=none; b=pLNGBCLcMJyvW2n++/HmYe+WT/NdL0FcYBYgtx1x1QxwupGSdg0/4OVqTpSXEyi5nHJglwCMzj12ssLfSsx7MPyRtgAwEkGy+jq+df7VzvOLjhuqt/+q6IL+dtqByTuioruj4K0Wdq0g1oYngSiM1yAR8WwKJHHkbRa6vN0r2EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743288539; c=relaxed/simple;
	bh=trc7yI5/MNJ3aTRjcTSnfSsV0/LbOIMsENoZZNbkF6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jWdKJvg1okUP+zDnA14tmrKSsspr7dFrEofvJpWnBcg/JMKVijk0fudHuyf+utRCafd9pYxznkxNgjEDOad5x0SGuaSjgdjFw2ZVYgMurKW5ZYhFIO/B4yOxwIJDbksubZlG49EurmIf1Eo0Dt2wxNC6ePESe8yZckzIiOsqLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW7EuWTd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW7EuWTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743288538; x=1774824538;
  h=date:from:to:cc:subject:message-id;
  bh=trc7yI5/MNJ3aTRjcTSnfSsV0/LbOIMsENoZZNbkF6g=;
  b=EW7EuWTdZDOOrTsWfkTOxmRbyBP86zD3QgndhZ7YJT6iO+aJ7jJm717t
   wPHr1Wl8YzNeMweuVA/hq5EbqiayyZEiO01FTM/shasw6G+r2foF7kVzw
   btfHFtuITBYF4AQoYy7c3aIfA85sVkC/xwl2lMv5N5IllicxqaV137Pyf
   eMrQCCBwS/dklcSjeRRsvTuETckSY2m/PKXzsAY5SQ4e7M+QyLBYYc6jc
   63dN11SSjKWKoM1xA1myPM4Ev0aAnY/zPPDKBzQ97ivSyDLvJbEvumYrb
   T2tRrbHqFI+SYXytScHskeGuLcmytE4G7zUx5wNv5S/C1pLH06qs6Lb9P
   A==;
X-CSE-ConnectionGUID: EIB30J4HTfuwUv/amR6xxg==
X-CSE-MsgGUID: 06tyky4tSGyoDy86PzLrZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44724153"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44724153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 15:48:57 -0700
X-CSE-ConnectionGUID: D8rfB5CqSjOMoPOd544xMA==
X-CSE-MsgGUID: fdA6FkALQ9yaHrDW4BnsYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="148932768"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2025 15:48:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyeyw-0008Pb-0V;
	Sat, 29 Mar 2025 22:48:51 +0000
Date: Sun, 30 Mar 2025 06:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core/urgent] BUILD SUCCESS
 31ab12df723543047c3fc19cb8f8c4498ec6267f
Message-ID: <202503300601.u61AfYYR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/urgent
branch HEAD: 31ab12df723543047c3fc19cb8f8c4498ec6267f  x86/microcode/AMD: Fix __apply_microcode_amd()'s return value

elapsed time: 2018m

configs tested: 124
configs skipped: 191

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                         axm55xx_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                           spitz_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250328    gcc-12
i386        buildonly-randconfig-001-20250329    gcc-12
i386        buildonly-randconfig-002-20250328    gcc-12
i386        buildonly-randconfig-002-20250329    gcc-12
i386        buildonly-randconfig-003-20250328    clang-20
i386        buildonly-randconfig-003-20250329    clang-20
i386        buildonly-randconfig-004-20250328    gcc-12
i386        buildonly-randconfig-004-20250329    gcc-11
i386        buildonly-randconfig-005-20250329    gcc-12
i386        buildonly-randconfig-006-20250328    gcc-12
i386        buildonly-randconfig-006-20250329    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250330    clang-20
i386                  randconfig-002-20250330    clang-20
i386                  randconfig-003-20250330    clang-20
i386                  randconfig-004-20250330    clang-20
i386                  randconfig-005-20250330    clang-20
i386                  randconfig-006-20250330    clang-20
i386                  randconfig-007-20250330    clang-20
i386                  randconfig-011-20250330    clang-20
i386                  randconfig-012-20250330    clang-20
i386                  randconfig-013-20250330    clang-20
i386                  randconfig-014-20250330    clang-20
i386                  randconfig-015-20250330    clang-20
i386                  randconfig-016-20250330    clang-20
i386                  randconfig-017-20250330    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    clang-21
m68k                          multi_defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                                defconfig    gcc-12
sh                                  defconfig    gcc-12
sh                          lboxre2_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-21
sparc64                             defconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250328    clang-20
x86_64      buildonly-randconfig-001-20250329    clang-20
x86_64      buildonly-randconfig-002-20250328    clang-20
x86_64      buildonly-randconfig-002-20250329    gcc-12
x86_64      buildonly-randconfig-003-20250328    clang-20
x86_64      buildonly-randconfig-003-20250329    gcc-12
x86_64      buildonly-randconfig-004-20250328    clang-20
x86_64      buildonly-randconfig-004-20250329    clang-20
x86_64      buildonly-randconfig-005-20250328    clang-20
x86_64      buildonly-randconfig-005-20250329    clang-20
x86_64      buildonly-randconfig-006-20250328    clang-20
x86_64      buildonly-randconfig-006-20250329    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250330    clang-20
x86_64                randconfig-002-20250330    clang-20
x86_64                randconfig-003-20250330    clang-20
x86_64                randconfig-004-20250330    clang-20
x86_64                randconfig-005-20250330    clang-20
x86_64                randconfig-006-20250330    clang-20
x86_64                randconfig-007-20250330    clang-20
x86_64                randconfig-008-20250330    clang-20
x86_64                randconfig-071-20250330    clang-20
x86_64                randconfig-072-20250330    clang-20
x86_64                randconfig-073-20250330    clang-20
x86_64                randconfig-074-20250330    clang-20
x86_64                randconfig-075-20250330    clang-20
x86_64                randconfig-076-20250330    clang-20
x86_64                randconfig-077-20250330    clang-20
x86_64                randconfig-078-20250330    clang-20
x86_64                               rhel-9.4    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
