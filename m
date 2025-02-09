Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF6E57D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739095110; cv=none; b=ZV9g38bs1ntoEurqEDY8jnDdzoYZoyDcZKs6q4TkObhsLcxxRRUmGLfX+9eu2cFeYnTF10EPM+fzsFwR1w896NIJQ430n8k6n2YJ3HrmL3jKw3u8mjzwBbYdOSwPP4cYCcyPN8YncG0KBAfWoIth3WH8tV36eni1ce6DJRbtjrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739095110; c=relaxed/simple;
	bh=zxwVVejQyRQQqtgRReFZD1e5w2z9Iz/8zJPLjwlgrXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SKdo9/kzJTFQSUXxGcgSX81akx01IPHGDaZtplTrtVqSsnhLSwfEWQIDL20i5IzmWXY9F38ka+gAOlOuNetruu/QN6Cg4w9tuSd8Bk+mVelG/uUrkyqqZ7rsKgJwGAgKNWTK0VmPvq+CqeHZ7tVvEeseBCj6QdWuaeKIz6Tj4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnnfQmQy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnnfQmQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739095108; x=1770631108;
  h=date:from:to:cc:subject:message-id;
  bh=zxwVVejQyRQQqtgRReFZD1e5w2z9Iz/8zJPLjwlgrXg=;
  b=nnnfQmQy0sns/vEY4kALE7F2AOSdP7eB+IrjmVyfdeo4lOYtotPXeLMT
   B8C5bLRwyVOiqTiC4vTCfVOp5s+8lvWjg7jpIOzsPvQ8iY03LHRsAnZnU
   oRzkyCuDLTsxP96KH9XWcppL1kmwCL5jcln/Pfo+86ACDJ/kS13SHTvGJ
   NCkMzShLH/1DLQihcnAAbpFmXxQohmxOcbJVolbUGmSGKXWeVcLTy2LNY
   gFHRIOVDdpOxxwaMX3UfUgyLvotARDwhR276PV7HoHqDDZXcNyNsis2Hi
   M3YxLItPbff4V3VNYuQpOXVV4j22U9XXaBYMLdpX/jaxGnGo6mnq2B1od
   g==;
X-CSE-ConnectionGUID: SScyBvO7S3K/y67V2J5ctA==
X-CSE-MsgGUID: 44p8p1KMQwmNrWL5LpUlsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39842585"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39842585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 01:58:28 -0800
X-CSE-ConnectionGUID: WCu2nsFnRy2VzXXpKkFTSQ==
X-CSE-MsgGUID: Q0bU8ZhBRNuilA10yu81xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="112154495"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 01:58:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th452-0011JX-1z;
	Sun, 09 Feb 2025 09:58:24 +0000
Date: Sun, 09 Feb 2025 17:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 835d6a417c22bf057377960c88812be5be5b9868
Message-ID: <202502091726.AEd3baeY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 835d6a417c22bf057377960c88812be5be5b9868  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1444m

configs tested: 232
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250208    gcc-13.2.0
arc                   randconfig-001-20250209    gcc-13.2.0
arc                   randconfig-002-20250208    gcc-13.2.0
arc                   randconfig-002-20250209    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                           imxrt_defconfig    clang-19
arm                   randconfig-001-20250208    gcc-14.2.0
arm                   randconfig-001-20250209    gcc-13.2.0
arm                   randconfig-002-20250208    clang-17
arm                   randconfig-002-20250209    gcc-13.2.0
arm                   randconfig-003-20250208    clang-21
arm                   randconfig-003-20250209    gcc-13.2.0
arm                   randconfig-004-20250208    gcc-14.2.0
arm                   randconfig-004-20250209    gcc-13.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250208    clang-21
arm64                 randconfig-001-20250209    gcc-13.2.0
arm64                 randconfig-002-20250208    clang-21
arm64                 randconfig-002-20250209    gcc-13.2.0
arm64                 randconfig-003-20250208    clang-21
arm64                 randconfig-003-20250209    gcc-13.2.0
arm64                 randconfig-004-20250208    clang-15
arm64                 randconfig-004-20250209    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250208    gcc-14.2.0
csky                  randconfig-001-20250209    gcc-14.2.0
csky                  randconfig-002-20250208    gcc-14.2.0
csky                  randconfig-002-20250209    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250208    clang-21
hexagon               randconfig-001-20250209    gcc-14.2.0
hexagon               randconfig-002-20250208    clang-21
hexagon               randconfig-002-20250209    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250208    gcc-11
i386        buildonly-randconfig-002-20250208    clang-19
i386        buildonly-randconfig-003-20250208    gcc-12
i386        buildonly-randconfig-004-20250208    clang-19
i386        buildonly-randconfig-005-20250208    clang-19
i386        buildonly-randconfig-006-20250208    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250209    clang-19
i386                  randconfig-002-20250209    clang-19
i386                  randconfig-003-20250209    clang-19
i386                  randconfig-004-20250209    clang-19
i386                  randconfig-005-20250209    clang-19
i386                  randconfig-006-20250209    clang-19
i386                  randconfig-007-20250209    clang-19
i386                  randconfig-011-20250209    clang-19
i386                  randconfig-012-20250209    clang-19
i386                  randconfig-013-20250209    clang-19
i386                  randconfig-014-20250209    clang-19
i386                  randconfig-015-20250209    clang-19
i386                  randconfig-016-20250209    clang-19
i386                  randconfig-017-20250209    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250208    gcc-14.2.0
loongarch             randconfig-001-20250209    gcc-14.2.0
loongarch             randconfig-002-20250208    gcc-14.2.0
loongarch             randconfig-002-20250209    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250208    gcc-14.2.0
nios2                 randconfig-001-20250209    gcc-14.2.0
nios2                 randconfig-002-20250208    gcc-14.2.0
nios2                 randconfig-002-20250209    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250208    gcc-14.2.0
parisc                randconfig-001-20250209    gcc-14.2.0
parisc                randconfig-002-20250208    gcc-14.2.0
parisc                randconfig-002-20250209    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   currituck_defconfig    clang-17
powerpc                      katmai_defconfig    clang-18
powerpc                 mpc836x_rdk_defconfig    clang-18
powerpc               randconfig-001-20250208    clang-19
powerpc               randconfig-001-20250209    gcc-14.2.0
powerpc               randconfig-002-20250208    clang-17
powerpc               randconfig-002-20250209    gcc-14.2.0
powerpc               randconfig-003-20250208    gcc-14.2.0
powerpc               randconfig-003-20250209    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-21
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250208    clang-21
powerpc64             randconfig-001-20250209    gcc-14.2.0
powerpc64             randconfig-002-20250208    gcc-14.2.0
powerpc64             randconfig-002-20250209    gcc-14.2.0
powerpc64             randconfig-003-20250208    clang-21
powerpc64             randconfig-003-20250209    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250209    clang-18
riscv                 randconfig-001-20250209    gcc-14.2.0
riscv                 randconfig-002-20250209    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250209    clang-21
s390                  randconfig-001-20250209    gcc-14.2.0
s390                  randconfig-002-20250209    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250209    gcc-14.2.0
sh                    randconfig-002-20250209    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250209    gcc-14.2.0
sparc                 randconfig-002-20250209    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250209    gcc-14.2.0
sparc64               randconfig-002-20250209    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250209    gcc-11
um                    randconfig-001-20250209    gcc-14.2.0
um                    randconfig-002-20250209    gcc-12
um                    randconfig-002-20250209    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250208    clang-19
x86_64      buildonly-randconfig-002-20250208    gcc-12
x86_64      buildonly-randconfig-003-20250208    gcc-12
x86_64      buildonly-randconfig-004-20250208    clang-19
x86_64      buildonly-randconfig-005-20250208    clang-19
x86_64      buildonly-randconfig-006-20250208    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250209    gcc-12
x86_64                randconfig-002-20250209    gcc-12
x86_64                randconfig-003-20250209    gcc-12
x86_64                randconfig-004-20250209    gcc-12
x86_64                randconfig-005-20250209    gcc-12
x86_64                randconfig-006-20250209    gcc-12
x86_64                randconfig-007-20250209    gcc-12
x86_64                randconfig-008-20250209    gcc-12
x86_64                randconfig-071-20250209    gcc-12
x86_64                randconfig-072-20250209    gcc-12
x86_64                randconfig-073-20250209    gcc-12
x86_64                randconfig-074-20250209    gcc-12
x86_64                randconfig-075-20250209    gcc-12
x86_64                randconfig-076-20250209    gcc-12
x86_64                randconfig-077-20250209    gcc-12
x86_64                randconfig-078-20250209    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250209    gcc-14.2.0
xtensa                randconfig-002-20250209    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
