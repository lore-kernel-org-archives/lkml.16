Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EF19D092
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751796458; cv=none; b=OoAYGNo5DpPzV22pjcugOkA2PZNlD3MQ8IgWtMT3qZtgTyCPsWbUK1yTxDqhtzm9C43Lqu9gxLOIv+CpZXdLdbO9xoA6Tc/6nN7JNvT07X8uQ/hf3fW2ZM2WhbcASVWhaBN9xK1gXPiz3xnIMmJIazxRQs8Ip3LmLwKXR0uQABE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751796458; c=relaxed/simple;
	bh=XqIrucQsltQ/dUKIhFeaygB0TAAeHN/6G5y01VMcvqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rs8GLKUx0CZ2AsMqLI4yUFHGEIQQZ9j5NcK05yh53OUCTslpWnyBjdiZLctGNbgkOR15kKO+1APOhWs6rCR7TBc/TKPW6PFeJaLKGTEh9hEonIeSSUbkVIHP9lL9vELhlceI7iwEUYe95Bgz87qvEqEvkTpV1l+aEVnmixL3Oko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsC3Bchd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsC3Bchd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751796457; x=1783332457;
  h=date:from:to:cc:subject:message-id;
  bh=XqIrucQsltQ/dUKIhFeaygB0TAAeHN/6G5y01VMcvqM=;
  b=WsC3BchdnNsneX6SNBEOl/lSD91salA0Q1SxD12TwcSVPZUaMUjv942A
   i/Ke8/BVBkoftjtP3oLit5Y6y5Z19u3GMAOgCYKRKrajiDKl24Ct8d3ho
   zI97LZ/fJTAxG3solScN/ow+3jfEpSr0hPIoVpDkjn6VzSwH1yAW4lDCd
   eoSX6fajeIUyTFTZJkwe5l6mTtxWycyxSPTjFelc/72TWZ8USIa/Rh+rd
   NEaByDz/bMa6z/kx3vWMEIVf1lm3Ee1bdfnWjqHOAyj1DeFijE6mAZxkG
   qYoSUM/jRw4B6MX9qtSCNx8S4aYLDJQpxCjCgjqMWt3G1xvh0JenQhJF4
   w==;
X-CSE-ConnectionGUID: 9zn7WECySoifyAvMUT09uw==
X-CSE-MsgGUID: 9ZpeLcVBQJysY4uZ5kPy/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="64284599"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="64284599"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 03:07:37 -0700
X-CSE-ConnectionGUID: 81Q5OJk5QqOOQrZEjAw89g==
X-CSE-MsgGUID: +wTOODjBT7iTsg+9DpnHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="159240068"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2025 03:07:35 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYMHV-00050t-0U;
	Sun, 06 Jul 2025 10:07:33 +0000
Date: Sun, 06 Jul 2025 18:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 14cf20bfadb3f5058350cd1be4856836fcb5afe3
Message-ID: <202507061822.Dc10OSV2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 14cf20bfadb3f5058350cd1be4856836fcb5afe3  Merge sched/urgent into tip/urgent

elapsed time: 870m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250706    gcc-8.5.0
arc                   randconfig-002-20250706    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250706    clang-21
arm                   randconfig-002-20250706    clang-21
arm                   randconfig-003-20250706    gcc-8.5.0
arm                   randconfig-004-20250706    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250706    clang-21
arm64                 randconfig-002-20250706    clang-21
arm64                 randconfig-003-20250706    clang-17
arm64                 randconfig-004-20250706    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250706    gcc-9.3.0
csky                  randconfig-002-20250706    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250706    clang-21
hexagon               randconfig-002-20250706    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250706    gcc-12
i386        buildonly-randconfig-002-20250706    gcc-12
i386        buildonly-randconfig-003-20250706    clang-20
i386        buildonly-randconfig-004-20250706    clang-20
i386        buildonly-randconfig-005-20250706    gcc-12
i386        buildonly-randconfig-006-20250706    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250706    clang-18
loongarch             randconfig-002-20250706    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250706    gcc-9.3.0
nios2                 randconfig-002-20250706    gcc-13.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250706    gcc-15.1.0
parisc                randconfig-002-20250706    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc               randconfig-001-20250706    gcc-8.5.0
powerpc               randconfig-002-20250706    clang-21
powerpc               randconfig-003-20250706    clang-21
powerpc64             randconfig-001-20250706    gcc-8.5.0
powerpc64             randconfig-002-20250706    clang-17
powerpc64             randconfig-003-20250706    gcc-13.4.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250706    gcc-11.5.0
riscv                 randconfig-002-20250706    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250706    gcc-8.5.0
s390                  randconfig-002-20250706    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250706    gcc-14.3.0
sh                    randconfig-002-20250706    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250706    gcc-8.5.0
sparc                 randconfig-002-20250706    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250706    gcc-10.5.0
sparc64               randconfig-002-20250706    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250706    gcc-12
um                    randconfig-002-20250706    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250706    gcc-12
x86_64      buildonly-randconfig-002-20250706    gcc-12
x86_64      buildonly-randconfig-003-20250706    clang-20
x86_64      buildonly-randconfig-004-20250706    clang-20
x86_64      buildonly-randconfig-005-20250706    clang-20
x86_64      buildonly-randconfig-006-20250706    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250706    gcc-8.5.0
xtensa                randconfig-002-20250706    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
