Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191E0213E7D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743164767; cv=none; b=M3JBVZYA485Lm89Pr+gfRptDeNJt4A4C1GZ0U/sNf8tr5Us8o+DGv/Wd2yKoYoHIP97YvZyvnfvvZXqaAB8yn5lOJFzH8fDsu7oSfU/CHC9b+5UGd9NQvZnTVkcXDSa7QNrvfHvGttORcTyZP0GOcDIpmyRjuq3hlvyvdZXuyKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743164767; c=relaxed/simple;
	bh=H8qZWL3fW7mU/AbrZSG2+U4gL3iDhkyYbwD0qROcYIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fpq5Pyiw2li2N7/8JHBkdpZ2Yju2zJJtbnGGSmfuIDtyLxDh7mzur1/onW1CHwJYtWk0uRMjumEy/2RECpAcmJzOCL1nPNBIHv/0FYXf3yZRgf8/8ZztWglwck8tD/u8bUXy0iTZfFyPiUODdj/oSEZl7q5eStgZJoHn1R9wkdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/dZg+fH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/dZg+fH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743164767; x=1774700767;
  h=date:from:to:cc:subject:message-id;
  bh=H8qZWL3fW7mU/AbrZSG2+U4gL3iDhkyYbwD0qROcYIc=;
  b=A/dZg+fH6wteXJiE3wPG8CyVtbbMG55sWlHQdxOY5RLV+fYxDVWBXHbL
   ynqIYTT5uFT9S/fmWDazu1+WCFErg+GCTLNl/d36J9p7ldsdgMCBCzwzi
   KGc0jsqIWL+OoQBOJvWUx8B2hblY76PNZjct2Zo8CjxgIyFumbr2ALDcI
   nytfiorFlbc01RUU99FSgXdGt9LE2qtf+kH0X/ecG1tF86AVbDTC4FQkQ
   N1gDxbmuZoQ707uibe5bJzx37WOqM8pMea+HK7JvXQAHuy3QsufbALc3i
   9n2K5p/iSyw7iNCDhHAZ3CChDQXw23kVaBzr3B1xaqjWjwiNOAJ67DolD
   w==;
X-CSE-ConnectionGUID: Nuay7pOeSyS187keSbRc5w==
X-CSE-MsgGUID: 1vJsGpF6R1mr8M0PGFkjjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44245214"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44245214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:26:06 -0700
X-CSE-ConnectionGUID: TwrWSjT7S8iGFgmGQeQ+UA==
X-CSE-MsgGUID: t7zyYKBiSzSf3rhiNzzvzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="126358237"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2025 05:26:05 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty8mg-0007RW-01;
	Fri, 28 Mar 2025 12:26:02 +0000
Date: Fri, 28 Mar 2025 20:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 f1861fb575b028e35e6233295441d535f2e3f240
Message-ID: <202503282013.isFFcVup-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: f1861fb575b028e35e6233295441d535f2e3f240  Merge branch into tip/master: 'x86/tdx'

elapsed time: 1454m

configs tested: 210
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250327    gcc-14.2.0
arc                   randconfig-002-20250327    gcc-14.2.0
arc                           tb10x_defconfig    clang-21
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                           h3600_defconfig    clang-21
arm                      integrator_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                   randconfig-001-20250327    clang-21
arm                   randconfig-002-20250327    gcc-5.5.0
arm                   randconfig-003-20250327    clang-21
arm                   randconfig-004-20250327    clang-16
arm                       spear13xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250327    gcc-5.5.0
arm64                 randconfig-002-20250327    clang-21
arm64                 randconfig-003-20250327    clang-21
arm64                 randconfig-004-20250327    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250327    gcc-9.3.0
csky                  randconfig-002-20250327    gcc-14.2.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250327    clang-21
hexagon               randconfig-002-20250327    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250327    clang-20
i386        buildonly-randconfig-002-20250327    gcc-12
i386        buildonly-randconfig-003-20250327    clang-20
i386        buildonly-randconfig-004-20250327    clang-20
i386        buildonly-randconfig-005-20250327    clang-20
i386        buildonly-randconfig-006-20250327    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250328    gcc-12
i386                  randconfig-002-20250328    gcc-12
i386                  randconfig-003-20250328    gcc-12
i386                  randconfig-004-20250328    gcc-12
i386                  randconfig-005-20250328    gcc-12
i386                  randconfig-006-20250328    gcc-12
i386                  randconfig-007-20250328    gcc-12
i386                  randconfig-011-20250328    clang-20
i386                  randconfig-012-20250328    clang-20
i386                  randconfig-013-20250328    clang-20
i386                  randconfig-014-20250328    clang-20
i386                  randconfig-015-20250328    clang-20
i386                  randconfig-016-20250328    clang-20
i386                  randconfig-017-20250328    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250327    gcc-14.2.0
loongarch             randconfig-002-20250327    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    clang-21
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250327    gcc-11.5.0
nios2                 randconfig-002-20250327    gcc-13.3.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250327    gcc-14.2.0
parisc                randconfig-002-20250327    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250327    gcc-7.5.0
powerpc               randconfig-002-20250327    gcc-9.3.0
powerpc               randconfig-003-20250327    gcc-5.5.0
powerpc                     taishan_defconfig    clang-21
powerpc                     tqm8560_defconfig    clang-21
powerpc                      tqm8xx_defconfig    clang-21
powerpc                         wii_defconfig    clang-21
powerpc64             randconfig-001-20250327    gcc-9.3.0
powerpc64             randconfig-002-20250327    clang-21
powerpc64             randconfig-003-20250327    clang-16
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250327    clang-21
riscv                 randconfig-002-20250327    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250327    gcc-6.5.0
s390                  randconfig-002-20250327    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    clang-21
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250327    gcc-5.5.0
sh                    randconfig-002-20250327    gcc-9.3.0
sh                          rsk7203_defconfig    clang-21
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250327    gcc-12.4.0
sparc                 randconfig-002-20250327    gcc-10.3.0
sparc                       sparc64_defconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250327    gcc-6.5.0
sparc64               randconfig-002-20250327    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250327    clang-19
um                    randconfig-002-20250327    gcc-12
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250327    gcc-12
x86_64      buildonly-randconfig-002-20250327    gcc-12
x86_64      buildonly-randconfig-003-20250327    clang-20
x86_64      buildonly-randconfig-004-20250327    clang-20
x86_64      buildonly-randconfig-005-20250327    gcc-12
x86_64      buildonly-randconfig-006-20250327    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250328    gcc-12
x86_64                randconfig-002-20250328    gcc-12
x86_64                randconfig-003-20250328    gcc-12
x86_64                randconfig-004-20250328    gcc-12
x86_64                randconfig-005-20250328    gcc-12
x86_64                randconfig-006-20250328    gcc-12
x86_64                randconfig-007-20250328    gcc-12
x86_64                randconfig-008-20250328    gcc-12
x86_64                randconfig-071-20250328    clang-20
x86_64                randconfig-072-20250328    clang-20
x86_64                randconfig-073-20250328    clang-20
x86_64                randconfig-074-20250328    clang-20
x86_64                randconfig-075-20250328    clang-20
x86_64                randconfig-076-20250328    clang-20
x86_64                randconfig-077-20250328    clang-20
x86_64                randconfig-078-20250328    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250327    gcc-14.2.0
xtensa                randconfig-002-20250327    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
