Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E51017A586
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415821; cv=none; b=HjjG8uVFvX/L7m+RtpGw5EzJ0RtVsrxxvtqv2AUNphyeAncJQ6mY3RkKz97ROTBPe8gW5TiJIlfl1rq3GhinMeWabTE/EMQfPIbytWwjmHu8/6ll5H5W3tivSySsGGyN7ebPZ4IiN8S2pUsD4HUHr/EdoKJ++hB0ikQSmV6jAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415821; c=relaxed/simple;
	bh=fcA3yqC9FLTwrOIqJ48AyYlXbpnEriTq0f+JmO8hbKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GSO6X9hNg4kFmjm+0QGFP5BId0uqf3Woy5HQiO7lqCo8UhMH4lqX7u7hW4DJOD5EKD3pNs4EeoPXEgbbyqpZP73foNsmgwnoWEy6VBZEWunyILQhAZGnnu8SzqDvJc+F4DF/2n2VxQJwpN2py3g36M+KksU/x+V68BS02+7MTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lY9qpcnt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lY9qpcnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745415819; x=1776951819;
  h=date:from:to:cc:subject:message-id;
  bh=fcA3yqC9FLTwrOIqJ48AyYlXbpnEriTq0f+JmO8hbKg=;
  b=lY9qpcntvtUOFaqUJBWBmV2xI2eQOufXzcdERcha2/CdzoNXfNtDgyCf
   GUW+TscwLJz7lRqJ4RKV5++z4Cc6J5yL6dIy7qzoyYgU6VmJF8bX0UEw2
   vKHWMk4NjP5rede6DMQ57/2/PvAgBf6CHAHeQ81ibWVZfWKlfC4PQvwL0
   IccnDwYZ0KNLhn/MEB90VvhpXD9xBQeqv7Q9Hgy4OGr9m/AxB6XkRkz53
   nhUlrveflo3+KKTFnP1kBtC9ZpnS4kpiSoBgJb33JWmDHNxYim9Tr0Lof
   qlqDbGPz9J2tSNIXnBPlJJBDX6gh2cSbLaZ55gukEpuDc9JRLj74Alm9q
   A==;
X-CSE-ConnectionGUID: ELTp5GQGTsuinDb9gPaleA==
X-CSE-MsgGUID: 7Pl2N2tGTrKEJEgHwSJp0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47190631"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47190631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:43:38 -0700
X-CSE-ConnectionGUID: Z+grD+f5TUedgQ3l8GXp1Q==
X-CSE-MsgGUID: O0lKdpkATCexJZolzSX63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132238412"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Apr 2025 06:43:37 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7aNy-00026G-1j;
	Wed, 23 Apr 2025 13:43:34 +0000
Date: Wed, 23 Apr 2025 21:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/entry] BUILD SUCCESS
 bdb30d565f4b53e91abaccf83ecd718e5ba0f7c1
Message-ID: <202504232128.9sSx3CqO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/entry
branch HEAD: bdb30d565f4b53e91abaccf83ecd718e5ba0f7c1  x86/vdso: Remove redundant #ifdeffery around in_ia32_syscall()

elapsed time: 1463m

configs tested: 181
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250423    gcc-14.2.0
arc                   randconfig-002-20250423    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                   randconfig-001-20250423    gcc-14.2.0
arm                   randconfig-002-20250423    gcc-14.2.0
arm                   randconfig-003-20250423    gcc-14.2.0
arm                   randconfig-004-20250423    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250423    gcc-14.2.0
arm64                 randconfig-002-20250423    gcc-14.2.0
arm64                 randconfig-003-20250423    gcc-14.2.0
arm64                 randconfig-004-20250423    gcc-14.2.0
csky                             allmodconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250423    gcc-7.5.0
csky                  randconfig-002-20250423    gcc-7.5.0
hexagon                          allmodconfig    clang-19
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250423    gcc-7.5.0
hexagon               randconfig-002-20250423    gcc-7.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250422    clang-20
i386        buildonly-randconfig-001-20250423    gcc-12
i386        buildonly-randconfig-002-20250422    clang-20
i386        buildonly-randconfig-002-20250423    gcc-12
i386        buildonly-randconfig-003-20250422    gcc-12
i386        buildonly-randconfig-003-20250423    gcc-12
i386        buildonly-randconfig-004-20250422    gcc-12
i386        buildonly-randconfig-004-20250423    gcc-12
i386        buildonly-randconfig-005-20250422    clang-20
i386        buildonly-randconfig-005-20250423    gcc-12
i386        buildonly-randconfig-006-20250422    clang-20
i386        buildonly-randconfig-006-20250423    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250423    gcc-12
i386                  randconfig-002-20250423    gcc-12
i386                  randconfig-003-20250423    gcc-12
i386                  randconfig-004-20250423    gcc-12
i386                  randconfig-005-20250423    gcc-12
i386                  randconfig-006-20250423    gcc-12
i386                  randconfig-007-20250423    gcc-12
i386                  randconfig-011-20250423    clang-20
i386                  randconfig-012-20250423    clang-20
i386                  randconfig-013-20250423    clang-20
i386                  randconfig-014-20250423    clang-20
i386                  randconfig-015-20250423    clang-20
i386                  randconfig-016-20250423    clang-20
i386                  randconfig-017-20250423    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250423    gcc-7.5.0
loongarch             randconfig-002-20250423    gcc-7.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    clang-21
m68k                                defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
nios2                            allmodconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250423    gcc-7.5.0
nios2                 randconfig-002-20250423    gcc-7.5.0
openrisc                         alldefconfig    clang-21
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250423    gcc-7.5.0
parisc                randconfig-002-20250423    gcc-7.5.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-21
powerpc               randconfig-001-20250423    gcc-7.5.0
powerpc               randconfig-002-20250423    gcc-7.5.0
powerpc               randconfig-003-20250423    gcc-7.5.0
powerpc                     sequoia_defconfig    clang-21
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20250423    gcc-7.5.0
powerpc64             randconfig-002-20250423    gcc-7.5.0
powerpc64             randconfig-003-20250423    gcc-7.5.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20250423    gcc-12
riscv                 randconfig-002-20250423    gcc-12
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250423    gcc-12
s390                  randconfig-002-20250423    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.1.0
sh                    randconfig-001-20250423    gcc-12
sh                    randconfig-002-20250423    gcc-12
sh                          rsk7201_defconfig    gcc-14.1.0
sh                           se7619_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250423    gcc-12
sparc                 randconfig-002-20250423    gcc-12
sparc                       sparc64_defconfig    clang-21
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64               randconfig-001-20250423    gcc-12
sparc64               randconfig-002-20250423    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                    randconfig-001-20250423    gcc-12
um                    randconfig-002-20250423    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250422    gcc-12
x86_64      buildonly-randconfig-001-20250423    gcc-12
x86_64      buildonly-randconfig-002-20250422    clang-20
x86_64      buildonly-randconfig-002-20250423    gcc-12
x86_64      buildonly-randconfig-003-20250422    gcc-12
x86_64      buildonly-randconfig-003-20250423    gcc-12
x86_64      buildonly-randconfig-004-20250422    gcc-12
x86_64      buildonly-randconfig-004-20250423    gcc-12
x86_64      buildonly-randconfig-005-20250422    clang-20
x86_64      buildonly-randconfig-005-20250423    gcc-12
x86_64      buildonly-randconfig-006-20250422    clang-20
x86_64      buildonly-randconfig-006-20250423    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250423    clang-20
x86_64                randconfig-002-20250423    clang-20
x86_64                randconfig-003-20250423    clang-20
x86_64                randconfig-004-20250423    clang-20
x86_64                randconfig-005-20250423    clang-20
x86_64                randconfig-006-20250423    clang-20
x86_64                randconfig-007-20250423    clang-20
x86_64                randconfig-008-20250423    clang-20
x86_64                randconfig-071-20250423    gcc-12
x86_64                randconfig-072-20250423    gcc-12
x86_64                randconfig-073-20250423    gcc-12
x86_64                randconfig-074-20250423    gcc-12
x86_64                randconfig-075-20250423    gcc-12
x86_64                randconfig-076-20250423    gcc-12
x86_64                randconfig-077-20250423    gcc-12
x86_64                randconfig-078-20250423    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                           allyesconfig    gcc-14.2.0
xtensa                randconfig-001-20250423    gcc-12
xtensa                randconfig-002-20250423    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
