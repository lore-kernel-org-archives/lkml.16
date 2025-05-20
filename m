Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAC4B1E4B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733178; cv=none; b=qiqWYWn9s07DXY8yWMC268gvdhOP6Ux8hGlK4N6rv9u3jLBP0Z7NCc8MT+pg+UOsrJwDE+MznJQTiBQcQATNgzP9d2tUSv5L1tJ3sHk/jRqCUQhS3c7qtM6sIPMJvSFkDXJJwkI7zbO2OSUVl7zwVEpmqfr+KzMxbPlxRwnL7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733178; c=relaxed/simple;
	bh=OxfJMzp34cC2Kd7GhstqxirxKR6G5mbAV5uFLcHCCWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TY+vWTtxQm3LVSTVMV2AXALASPOdAsggSSPbo3st56ZfuUxIzJT8aSGaQ2CwPncjcF+TpHzH87INUwlnAMe6oC/9A4YJm9j2Oq7KvYur7egBKcWsV+AVNki3rgKAMGIPYi0P+5WSuxjVdWf6YUSq0hToYPRQTE95I3RnmZON0po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqIP4DMG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqIP4DMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747733176; x=1779269176;
  h=date:from:to:cc:subject:message-id;
  bh=OxfJMzp34cC2Kd7GhstqxirxKR6G5mbAV5uFLcHCCWo=;
  b=PqIP4DMGZOPzTjF2jE7XUHELzgzVvsSbjKnqcECqF6Zs1BLdWJpb1j6I
   EQx1YGLltIJuatzeBXg90kX5Jtx6XgKAVYKnn3TRq3qk4XWWOPCByjg52
   HxJyIHMSkgslZ+SXr1ZcP8g2trLtq83X0cgqMGrnwxSq6j05z9oTmqwsx
   eq4C8D1L3VgmQqw8jZuM2NOWaT/ej/eF54eqmkU7kUrQG2OxSqxs/q+cT
   itGVwElwWvAySQ3oDOyteYElQtOKdLLWa3Ya8LUuGuZM26UEmBlIQPjnD
   zwcfiDWLhgD1ZemU4uSkQ/VzFbptI9pmG0p6UYEQYhhiiqPcDX2WIxWXx
   g==;
X-CSE-ConnectionGUID: NrMeMXRQSbaRO9zFoousJA==
X-CSE-MsgGUID: Qcgg0tg3Q0eKuB8kOqapEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67210635"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67210635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:26:15 -0700
X-CSE-ConnectionGUID: VFv5grCCTHCplLjvia5DmQ==
X-CSE-MsgGUID: UCUqreAKQCOtLvWST+glfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143630393"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 02:26:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHJEi-000MO8-2f;
	Tue, 20 May 2025 09:26:12 +0000
Date: Tue, 20 May 2025 17:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 3ee84e3dd88e39b55b534e17a7b9a181f1d46809
Message-ID: <202505201735.bwSHe7U4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 3ee84e3dd88e39b55b534e17a7b9a181f1d46809  Merge branch into tip/master: 'x86/sgx'

elapsed time: 1143m

configs tested: 123
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250520    gcc-11.5.0
arc                   randconfig-002-20250520    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250520    gcc-6.5.0
arm                   randconfig-002-20250520    gcc-10.5.0
arm                   randconfig-003-20250520    clang-19
arm                   randconfig-004-20250520    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250520    clang-21
arm64                 randconfig-002-20250520    gcc-9.5.0
arm64                 randconfig-003-20250520    clang-18
arm64                 randconfig-004-20250520    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250519    gcc-10.5.0
csky                  randconfig-002-20250519    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250519    clang-21
hexagon               randconfig-002-20250519    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250519    clang-20
i386        buildonly-randconfig-002-20250519    clang-20
i386        buildonly-randconfig-003-20250519    gcc-12
i386        buildonly-randconfig-004-20250519    gcc-12
i386        buildonly-randconfig-005-20250519    gcc-12
i386        buildonly-randconfig-006-20250519    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250519    gcc-14.2.0
loongarch             randconfig-002-20250519    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250519    gcc-14.2.0
nios2                 randconfig-002-20250519    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250519    gcc-7.5.0
parisc                randconfig-002-20250519    gcc-13.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   motionpro_defconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250519    gcc-8.5.0
powerpc               randconfig-002-20250519    gcc-6.5.0
powerpc               randconfig-003-20250519    gcc-8.5.0
powerpc64             randconfig-001-20250519    clang-20
powerpc64             randconfig-002-20250519    gcc-6.5.0
powerpc64             randconfig-003-20250519    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250519    gcc-14.2.0
riscv                 randconfig-002-20250519    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250519    gcc-7.5.0
s390                  randconfig-002-20250519    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250519    gcc-12.4.0
sh                    randconfig-002-20250519    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250519    gcc-11.5.0
sparc                 randconfig-002-20250519    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250519    gcc-7.5.0
sparc64               randconfig-002-20250519    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250519    gcc-12
um                    randconfig-002-20250519    gcc-12
um                           x86_64_defconfig    clang-21
x86_64      buildonly-randconfig-001-20250519    clang-20
x86_64      buildonly-randconfig-002-20250519    gcc-12
x86_64      buildonly-randconfig-003-20250519    clang-20
x86_64      buildonly-randconfig-004-20250519    clang-20
x86_64      buildonly-randconfig-005-20250519    gcc-12
x86_64      buildonly-randconfig-006-20250519    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250519    gcc-7.5.0
xtensa                randconfig-002-20250519    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
