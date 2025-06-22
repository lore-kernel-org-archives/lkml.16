Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305E3C0C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750578081; cv=none; b=MjZNL9XF2ZKYrYD94XeWAQrryk5+6YgTjFjRSs9MWhannm9TBWwAsmA6C6dBN/iCWoa+qaJNRe5A7BNP8J5TJSs5+PFjYbxFF163Ny0FbEAJBHc9CSGOT37lfiMkZMt122Nhu/L5jMUdBBXo+1tCR4oJxPybosER21UG/8cK3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750578081; c=relaxed/simple;
	bh=X1czQV/W8kFXxmWgT6WBkKemv+IpagZnozjpUyzcu94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SIa4ULwtfvrj8PVeU96QKU727AnFfDZdSOJ/k+P4HZtWzamifa3lcwap19D/5Aq1Kxp3MhAuStE4yIl067EIMYQb89CKn3aNOMMABt31kwZ6T/5I3LHpE6mpBGXP5fp4c+n/kZ+OTzJWirnpQjpIah4yPpMrNM8K4gQnynMvh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xkj2pNvf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xkj2pNvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750578080; x=1782114080;
  h=date:from:to:cc:subject:message-id;
  bh=X1czQV/W8kFXxmWgT6WBkKemv+IpagZnozjpUyzcu94=;
  b=Xkj2pNvfnVulamp9ZPL1pDQ9Sk1Y5nTPtuLXPFP9nQVdwxz2yMcGGlTQ
   tLuvUX2G2Aa3xqC+0MlGZCksG5/tDWYP5nVU783TVk2hB2TV3k3lHIQ1W
   ktfjC7PuqSynUbXnw0I+McENQpj7NYKQZF4+enBjmhyDXwj4e2n0rnoJ8
   /xUe6jI0SUVzB/KCoYPLWwh8LjpoWKQGVS6M4ayYEHsw0ja7xKIUMqMpM
   /yQtkhrGl58cKDD9VyxebZ6saOob/V/gS0lPh0kPNPzII34+FpoO+X9FA
   AKUrRC/kM6ET66Ew2p8V6FWP7eKQeOlCgRottTlqai2TKrIlsDZGokghz
   g==;
X-CSE-ConnectionGUID: gAoc+K56SJqrOaD/opvuSQ==
X-CSE-MsgGUID: vjpDdhYaQM6Bv2k8kTiByw==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="63477150"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="63477150"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 00:41:19 -0700
X-CSE-ConnectionGUID: BTI2dsvlQD6u5X67vQCnRg==
X-CSE-MsgGUID: YVNcLcRETC6Vg1Om4LRYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="155609365"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2025 00:41:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTFKG-000N8I-0z;
	Sun, 22 Jun 2025 07:41:16 +0000
Date: Sun, 22 Jun 2025 15:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/cpu] BUILD SUCCESS
 65f55a30176662ee37fe18b47430ee30b57bfc98
Message-ID: <202506221535.1PoqlteR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cpu
branch HEAD: 65f55a30176662ee37fe18b47430ee30b57bfc98  x86/CPU/AMD: Add CPUID faulting support

elapsed time: 723m

configs tested: 102
configs skipped: 130

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                        keystone_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250622    gcc-12
i386        buildonly-randconfig-002-20250622    clang-20
i386        buildonly-randconfig-003-20250622    clang-20
i386        buildonly-randconfig-004-20250622    gcc-12
i386        buildonly-randconfig-005-20250622    gcc-12
i386        buildonly-randconfig-006-20250622    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250622    clang-20
i386                  randconfig-002-20250622    clang-20
i386                  randconfig-003-20250622    clang-20
i386                  randconfig-004-20250622    clang-20
i386                  randconfig-005-20250622    clang-20
i386                  randconfig-006-20250622    clang-20
i386                  randconfig-007-20250622    clang-20
i386                  randconfig-011-20250622    gcc-11
i386                  randconfig-012-20250622    gcc-11
i386                  randconfig-013-20250622    gcc-11
i386                  randconfig-014-20250622    gcc-11
i386                  randconfig-015-20250622    gcc-11
i386                  randconfig-016-20250622    gcc-11
i386                  randconfig-017-20250622    gcc-11
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                              defconfig    gcc-12
powerpc                       holly_defconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-19
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250622    clang-20
x86_64      buildonly-randconfig-002-20250622    clang-20
x86_64      buildonly-randconfig-003-20250622    clang-20
x86_64      buildonly-randconfig-004-20250622    clang-20
x86_64      buildonly-randconfig-005-20250622    gcc-12
x86_64      buildonly-randconfig-006-20250622    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250622    gcc-12
x86_64                randconfig-002-20250622    gcc-12
x86_64                randconfig-003-20250622    gcc-12
x86_64                randconfig-004-20250622    gcc-12
x86_64                randconfig-005-20250622    gcc-12
x86_64                randconfig-006-20250622    gcc-12
x86_64                randconfig-007-20250622    gcc-12
x86_64                randconfig-008-20250622    gcc-12
x86_64                randconfig-071-20250622    gcc-12
x86_64                randconfig-072-20250622    gcc-12
x86_64                randconfig-073-20250622    gcc-12
x86_64                randconfig-074-20250622    gcc-12
x86_64                randconfig-075-20250622    gcc-12
x86_64                randconfig-076-20250622    gcc-12
x86_64                randconfig-077-20250622    gcc-12
x86_64                randconfig-078-20250622    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
