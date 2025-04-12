Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5F18DB1E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744457048; cv=none; b=abrKLze2vWVSWPBjPEpLOX/OCfBknKkmHKkA8xXHkgEEa8Cc0w3eEpT5y3E5oMZUBZGg05Ha71rP2mX/hr2gb1gOXFxUyM/uoFQ7VJnC3Tc+WBYsgxqyMtWGrUGvDM1usfnom7A7Ff0p2X+YlJOkuT94NA5spIEdMzPpL1d9B3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744457048; c=relaxed/simple;
	bh=53NKjumHgsLqyMy58ePGVe/UjMn/kzPjvjDjTUvU7s8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VipbRuJT7/CH9P0AQvXiei19bZkqTYlgyKJLmhvY/oBDrRX4b7Uj4eMY/FLn3LG8uJQlZUYKo0x1Di8L1shIqXBPqQymQ3eEzxVcaLkYAZxhBjakDwuX7iIc7Boa1Xneyd7I6nMDFULG/+dmZrmlecgl4BHtho3UWFZysShgkGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJ6k5+3y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJ6k5+3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744457046; x=1775993046;
  h=date:from:to:cc:subject:message-id;
  bh=53NKjumHgsLqyMy58ePGVe/UjMn/kzPjvjDjTUvU7s8=;
  b=LJ6k5+3ylLZPAOXKDorlXtpG+NOxJro+wtVbcv+SukAaSViqxJNsH8lr
   bQ0UWfV9MH9HQ3RPAj9JPk2gUSQVmtfBc3gL31uVLK2b7wKZtDotah3m1
   IshcClsivNg0mYZeKdMS9RqTgVjnoIsLkvTuiGS5J22/lZYBe6eeHaFak
   IJdg/QiUF+y2iFDjdPuleo7pIQFDa4s+7DpIeBQ8omaIRY5yhRFWQevPg
   7+dtEYAaGy62ttkJLPBpvhp1TrFwEuz55D0dla6+Iw4S9jXu0K5H4lrab
   SEoDo+8PhDKXP/skMm+98m6H2gLcCuKQrvSUxPWn3qljgopwjgY39JUQ3
   Q==;
X-CSE-ConnectionGUID: a++XeBz3RaS9CGyJ0ww0BQ==
X-CSE-MsgGUID: ZzR4fv9xS8yw9HkF1Ipp5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46132858"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="46132858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 04:24:06 -0700
X-CSE-ConnectionGUID: fObNHezZTae8ZyuGA9gamg==
X-CSE-MsgGUID: MJkiu/K3SAKJnc23okijTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134571524"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2025 04:24:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Yxu-000Bky-24;
	Sat, 12 Apr 2025 11:24:02 +0000
Date: Sat, 12 Apr 2025 19:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/sev] BUILD SUCCESS
 e396dd85172c6098e3b70b17e91424edc7bb2d8f
Message-ID: <202504121946.rU4CIS2s-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sev
branch HEAD: e396dd85172c6098e3b70b17e91424edc7bb2d8f  x86/sev: Register tpm-svsm platform device

elapsed time: 1446m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250411    gcc-14.2.0
arc                   randconfig-002-20250411    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250411    clang-21
arm                   randconfig-002-20250411    clang-21
arm                   randconfig-003-20250411    gcc-6.5.0
arm                   randconfig-004-20250411    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250411    gcc-9.5.0
arm64                 randconfig-002-20250411    gcc-9.5.0
arm64                 randconfig-003-20250411    clang-21
arm64                 randconfig-004-20250411    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250411    gcc-14.2.0
csky                  randconfig-002-20250411    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250411    clang-21
hexagon               randconfig-002-20250411    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250411    gcc-12
i386        buildonly-randconfig-002-20250411    gcc-12
i386        buildonly-randconfig-003-20250411    gcc-12
i386        buildonly-randconfig-004-20250411    clang-20
i386        buildonly-randconfig-005-20250411    gcc-11
i386        buildonly-randconfig-006-20250411    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250411    gcc-14.2.0
loongarch             randconfig-002-20250411    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250411    gcc-9.3.0
nios2                 randconfig-002-20250411    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250411    gcc-14.2.0
parisc                randconfig-002-20250411    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250411    gcc-9.3.0
powerpc               randconfig-002-20250411    clang-21
powerpc               randconfig-003-20250411    clang-21
powerpc64             randconfig-001-20250411    gcc-5.5.0
powerpc64             randconfig-002-20250411    gcc-5.5.0
powerpc64             randconfig-003-20250411    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250412    clang-20
riscv                 randconfig-002-20250412    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250412    clang-18
s390                  randconfig-002-20250412    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250412    gcc-14.2.0
sh                    randconfig-002-20250412    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250412    gcc-10.3.0
sparc                 randconfig-002-20250412    gcc-13.3.0
sparc64               randconfig-001-20250412    gcc-13.3.0
sparc64               randconfig-002-20250412    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250412    gcc-12
um                    randconfig-002-20250412    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250411    gcc-11
x86_64      buildonly-randconfig-002-20250411    gcc-11
x86_64      buildonly-randconfig-003-20250411    clang-20
x86_64      buildonly-randconfig-004-20250411    gcc-12
x86_64      buildonly-randconfig-005-20250411    clang-20
x86_64      buildonly-randconfig-006-20250411    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250412    gcc-14.2.0
xtensa                randconfig-002-20250412    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
