Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADDA229B0D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744153; cv=none; b=EGiU0kslF0bqKjOaeKpYnNEf3BHz82kLlTF0G53DtcXYvTe1c45uQHgJJv56TZzif0m4hSM6yBTBssiND4FE2CnBVqeVdxC4HxO5aRCkbgfDOyZuM2gzSGMdrXRMOPQRzh74m6ixexBuaYhqkrf4k/L4esfscLX7BssSOMjPWs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744153; c=relaxed/simple;
	bh=BzD+SPkwwBRCCgaK1fAGtwaug2HXZkhXXxmB/y9MBw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IbI3Ml/P1kIPXHTRe10UgfwfFSkwALVx9v5pl8bEvlYQWeUoGJEP8CsI9/APlPImTGrmVAXOZSlJCojLWTW67njNXnJ12PPXgF2P6/ynWInaJS3MBc/EKNNo4T8e3pgjlKR/muCgVazzJfQQv9Dz/2CVgQVE3m3TgZRbcddpPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9A3eNfD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9A3eNfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738744151; x=1770280151;
  h=date:from:to:cc:subject:message-id;
  bh=BzD+SPkwwBRCCgaK1fAGtwaug2HXZkhXXxmB/y9MBw4=;
  b=c9A3eNfDuQSheDpdbZbB1K2T1TM1aVp0uqZnD/KY7P3MBsb4rmTYdyPV
   N0523gT9tYEi6wAEKA1HWFg81tmkkWz/6kkri+cDrJHYvOIswyQW6FDLv
   DA5bOvQlTS3e5yQnasmRlniXgTmznARkQnKXGZv5OXpYCtfRui4XSAZRj
   A91gu7IOr5pCFjLyxR6gOoH+yJ0lgmWGieuGQiCgffCykHjqDArLhzFru
   rUrPl36dIUr7cUOqsyxcICimv2qy/oHgQE4cm2M/bZyYFgIGzSbOHrCai
   lzDKvu2WPMK0C45E9xv8tXya8w+LIn2NJ2i4LI9JJl4OBmml4msehdqr3
   A==;
X-CSE-ConnectionGUID: RUJNPMH/Qf+TW3p3b5DB2A==
X-CSE-MsgGUID: ciMCMhrhQ6uGeeZZGefy2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61768025"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="61768025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:29:09 -0800
X-CSE-ConnectionGUID: Jmdq+UEVSda9ETifTjO2ag==
X-CSE-MsgGUID: nOyBteSWRmyiZOuUE/qdfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116026554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2025 00:29:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfamQ-000tep-0A;
	Wed, 05 Feb 2025 08:29:06 +0000
Date: Wed, 05 Feb 2025 16:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 3e9fc9c9698de5b6ff64ac8450d42c89de09c514
Message-ID: <202502051620.WPYBORbS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 3e9fc9c9698de5b6ff64ac8450d42c89de09c514  Merge branch into tip/master: 'x86/mm'

elapsed time: 1447m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-004-20250205    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-002-20250204    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-002-20250205    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-002-20250205    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
