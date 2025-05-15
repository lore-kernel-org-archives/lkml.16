Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB151401B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747274444; cv=none; b=Umcux6AuSRAT1Ej0jfrRPWMsY4vMKPH7DSQ35t8yH5RnM3gbtZX8yG1d6OgJ8d2CMtgoRGzGLw7jdlBAIQzXxQ56XnAYbP/Zo3ZYdXFzrcFAEJvTGeRp55YlU/1vOGb3OYLO572rHJh3Rd1kwOQuAZB5A2XUhlJ7+fmeN08Lhu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747274444; c=relaxed/simple;
	bh=AB52t5Eh9sYqbsUbWIdtwOvPq7XY783pI5GEXiPVJrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OdW6qofmwLx4LCkIZqleHcbndgS6Z79W2f9FX7wZa4zidZJdk74zv2cAZb8wJlmvTEFtwgRBFFdhSxjiqXmC4IqcHF4ESeXzhiD+orNJ8Ko7iJCBSi3JtJ7IPRdxQweq1cTN2m1xqSrlyxPBNX2n+61yTpsUdpkVAKbc6MnRclA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bg+nnSO4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg+nnSO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747274443; x=1778810443;
  h=date:from:to:cc:subject:message-id;
  bh=AB52t5Eh9sYqbsUbWIdtwOvPq7XY783pI5GEXiPVJrs=;
  b=bg+nnSO4Gofi1Iyu2Z9/Z0M6TijbmJcgdjDh6zuYgfZ0F4SNU7eUW37q
   L5xOuIl6rziGtdhbky8fr5MFqDCF60cbIQR41wegYP9NAD424/Jr8X+o+
   T56AX/ytVl5PpkDGuJ+jTdqtfeOeOW95stluq3iO0h8MjrLhVCH5ILRR2
   xo6dnXjqvdr3yhaliUl6LyGzC0hLAnUh3JaDM5kJ0NPbMJxaqI+cRRKYJ
   exJB+OMn/3jT0sqI+dx7hgF008Tohr4HzKGz0gt2GbNn03LLks/BFgyz8
   XKP0yZ4jPkgXu2FhiVGgeGbhQ45/2Pf54XoA5BuPMVoEjiBhYittUvAql
   Q==;
X-CSE-ConnectionGUID: 5SCD3ljPS4S/cBip+hBCZQ==
X-CSE-MsgGUID: +3ijc0e/QteolWdOo6ob9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59829173"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="59829173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 19:00:41 -0700
X-CSE-ConnectionGUID: 4XkjzqTiQgeYPfXCf+eGmQ==
X-CSE-MsgGUID: AuiMYkJWRk2OhS+Z2ArXIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138636401"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2025 19:00:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNtl-000HmZ-33;
	Thu, 15 May 2025 02:00:37 +0000
Date: Thu, 15 May 2025 10:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/cleanups] BUILD SUCCESS
 f449bf98b7b63702e86155fe5fa3c853c3bf1fda
Message-ID: <202505150957.g3Q8yOOw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cleanups
branch HEAD: f449bf98b7b63702e86155fe5fa3c853c3bf1fda  x86/power: hibernate: Fix W=1 build kernel-doc warnings

elapsed time: 984m

configs tested: 122
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                   randconfig-001-20250515    gcc-6.5.0
arc                   randconfig-002-20250515    gcc-6.5.0
arm                               allnoconfig    gcc-14.2.0
arm                   randconfig-001-20250515    gcc-6.5.0
arm                   randconfig-002-20250515    gcc-6.5.0
arm                   randconfig-003-20250515    gcc-6.5.0
arm                   randconfig-004-20250515    gcc-6.5.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250515    gcc-6.5.0
arm64                 randconfig-002-20250515    gcc-6.5.0
arm64                 randconfig-003-20250515    gcc-6.5.0
arm64                 randconfig-004-20250515    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
hexagon                           allnoconfig    gcc-14.2.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250514    clang-20
i386        buildonly-randconfig-001-20250515    gcc-11
i386        buildonly-randconfig-002-20250514    gcc-12
i386        buildonly-randconfig-002-20250515    gcc-11
i386        buildonly-randconfig-003-20250514    clang-20
i386        buildonly-randconfig-003-20250515    gcc-11
i386        buildonly-randconfig-004-20250514    clang-20
i386        buildonly-randconfig-004-20250515    gcc-11
i386        buildonly-randconfig-005-20250514    gcc-12
i386        buildonly-randconfig-005-20250515    gcc-11
i386        buildonly-randconfig-006-20250514    gcc-12
i386        buildonly-randconfig-006-20250515    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-011-20250515    gcc-12
i386                  randconfig-012-20250515    gcc-12
i386                  randconfig-013-20250515    gcc-12
i386                  randconfig-014-20250515    gcc-12
i386                  randconfig-015-20250515    gcc-12
i386                  randconfig-016-20250515    gcc-12
i386                  randconfig-017-20250515    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250515    gcc-9.3.0
riscv                 randconfig-002-20250515    gcc-9.3.0
s390                             allmodconfig    gcc-14.2.0
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250515    gcc-9.3.0
s390                  randconfig-002-20250515    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250515    gcc-9.3.0
sh                    randconfig-002-20250515    gcc-9.3.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250515    gcc-9.3.0
sparc                 randconfig-002-20250515    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250515    gcc-9.3.0
sparc64               randconfig-002-20250515    gcc-9.3.0
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250515    gcc-9.3.0
um                    randconfig-002-20250515    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250514    clang-20
x86_64      buildonly-randconfig-001-20250515    gcc-12
x86_64      buildonly-randconfig-002-20250514    gcc-12
x86_64      buildonly-randconfig-002-20250515    gcc-12
x86_64      buildonly-randconfig-003-20250514    gcc-12
x86_64      buildonly-randconfig-003-20250515    gcc-12
x86_64      buildonly-randconfig-004-20250514    gcc-12
x86_64      buildonly-randconfig-004-20250515    gcc-12
x86_64      buildonly-randconfig-005-20250514    clang-20
x86_64      buildonly-randconfig-005-20250515    gcc-12
x86_64      buildonly-randconfig-006-20250514    gcc-12
x86_64      buildonly-randconfig-006-20250515    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250515    gcc-12
x86_64                randconfig-002-20250515    gcc-12
x86_64                randconfig-003-20250515    gcc-12
x86_64                randconfig-004-20250515    gcc-12
x86_64                randconfig-005-20250515    gcc-12
x86_64                randconfig-006-20250515    gcc-12
x86_64                randconfig-007-20250515    gcc-12
x86_64                randconfig-008-20250515    gcc-12
x86_64                randconfig-071-20250515    clang-20
x86_64                randconfig-072-20250515    clang-20
x86_64                randconfig-073-20250515    clang-20
x86_64                randconfig-074-20250515    clang-20
x86_64                randconfig-075-20250515    clang-20
x86_64                randconfig-076-20250515    clang-20
x86_64                randconfig-077-20250515    clang-20
x86_64                randconfig-078-20250515    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-9.3.0
xtensa                randconfig-002-20250515    gcc-9.3.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
