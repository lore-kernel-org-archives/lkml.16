Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C45221F3F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335354; cv=none; b=qez1CcRX1qwss3nJsIsRPml4LIBN0ujH6up6lLJnhyk9vMaK/3IMyqfRbS/DWfXVIKCfcLUqD7DyW2i/3VHbemd0DdHreJdkDdd2ixpJMPLq8a1nIFWmC4QTgseRUI6TdBXHXJTKrd5VB6URtC+sGneq9fPwH4x+Eg1ZRZvXnL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335354; c=relaxed/simple;
	bh=EhQ9DWkQfqHeph/K66iF/kPgRAGjHzBTBB0sn6kSpIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IBD5DXzO1Ir1UHfDtfbRoU2GsbHSNQGGUGh8BmmhBmus/aEHNvudvPZT8gCPnX57KXH/UIC56QG+9kYgHF5uSjItlMtFtbr+1OCibGTKaXheyjzeKtFAG8iS5g4A5dZrwLTZKWdOc1Y94tig/lpqSrX5BXbdwMRoyakz1Kqv1PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THkalhtq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THkalhtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750335353; x=1781871353;
  h=date:from:to:cc:subject:message-id;
  bh=EhQ9DWkQfqHeph/K66iF/kPgRAGjHzBTBB0sn6kSpIo=;
  b=THkalhtqHszKgYK/Qxa6I8nmp0m2EQUdW/M8DCE0rhW0e+JJdOwidC60
   ulag4NOlIO/R/GxZ5VpDOHB0qHsaH/HUHTI2dTaNoUOqUL17qbOCyD46f
   xdMkVeYwCgy9o02RimHjaZijbF9aCJ/VctsURDY3aztO02c64XY8nrcFa
   tdy1L+U5rP5Nz2PelBZEOyPEbW5B9RJFqm6J6ERxPsphq1+E7hWhLuQPa
   CnMoPWY0bA3x0RIVs2e1C7Q/koUTm7crw8kKEUR8T4B3cCsOhXekIZZ4/
   8sXNF64Osw4rrsOyO0fIJa01B36zZrvZsU7WPbabl7XbXyfxJAS3PcGCW
   A==;
X-CSE-ConnectionGUID: KsQQNO3fQGKNGH0Yx8bO7w==
X-CSE-MsgGUID: wZIl1OVuRjugwSKUCVXisQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56269751"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56269751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:15:53 -0700
X-CSE-ConnectionGUID: BTN2Rqv2QaasTzhwNnESgw==
X-CSE-MsgGUID: 5hC5MzPRS+2laiE2D4I1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150229563"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jun 2025 05:15:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSEBJ-000KjY-0w;
	Thu, 19 Jun 2025 12:15:49 +0000
Date: Thu, 19 Jun 2025 20:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 2aebf5ee43bf0ed225a09a30cf515d9f2813b759
Message-ID: <202506192014.guILJZ9Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 2aebf5ee43bf0ed225a09a30cf515d9f2813b759  x86/alternatives: Fix int3 handling failure from broken text_poke array

elapsed time: 1452m

configs tested: 72
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250619    gcc-15.1.0
arc                   randconfig-002-20250619    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                   randconfig-001-20250619    gcc-15.1.0
arm                   randconfig-002-20250619    gcc-15.1.0
arm                   randconfig-003-20250619    gcc-15.1.0
arm                   randconfig-004-20250619    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250619    gcc-15.1.0
arm64                 randconfig-002-20250619    gcc-15.1.0
arm64                 randconfig-003-20250619    gcc-15.1.0
arm64                 randconfig-004-20250619    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250619    gcc-8.5.0
csky                  randconfig-002-20250619    gcc-8.5.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon               randconfig-001-20250619    gcc-8.5.0
hexagon               randconfig-002-20250619    gcc-8.5.0
i386        buildonly-randconfig-001-20250618    clang-20
i386        buildonly-randconfig-001-20250619    clang-20
i386        buildonly-randconfig-002-20250618    gcc-12
i386        buildonly-randconfig-002-20250619    clang-20
i386        buildonly-randconfig-003-20250618    clang-20
i386        buildonly-randconfig-003-20250619    clang-20
i386        buildonly-randconfig-004-20250618    clang-20
i386        buildonly-randconfig-004-20250619    clang-20
i386        buildonly-randconfig-005-20250618    clang-20
i386        buildonly-randconfig-005-20250619    clang-20
i386        buildonly-randconfig-006-20250618    clang-20
i386        buildonly-randconfig-006-20250619    clang-20
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-8.5.0
loongarch             randconfig-002-20250619    gcc-8.5.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250619    gcc-8.5.0
nios2                 randconfig-002-20250619    gcc-8.5.0
openrisc                          allnoconfig    clang-21
parisc                            allnoconfig    clang-21
parisc                randconfig-001-20250619    gcc-8.5.0
parisc                randconfig-002-20250619    gcc-8.5.0
powerpc                           allnoconfig    clang-21
powerpc               randconfig-001-20250619    gcc-8.5.0
powerpc               randconfig-002-20250619    gcc-8.5.0
powerpc               randconfig-003-20250619    gcc-8.5.0
powerpc64             randconfig-001-20250619    gcc-8.5.0
powerpc64             randconfig-002-20250619    gcc-8.5.0
powerpc64             randconfig-003-20250619    gcc-8.5.0
riscv                             allnoconfig    clang-21
s390                              allnoconfig    clang-21
sh                                allnoconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                                allnoconfig    clang-21
x86_64      buildonly-randconfig-001-20250618    clang-20
x86_64      buildonly-randconfig-001-20250619    gcc-12
x86_64      buildonly-randconfig-002-20250618    clang-20
x86_64      buildonly-randconfig-002-20250619    gcc-12
x86_64      buildonly-randconfig-003-20250618    gcc-12
x86_64      buildonly-randconfig-003-20250619    gcc-12
x86_64      buildonly-randconfig-004-20250618    clang-20
x86_64      buildonly-randconfig-004-20250619    gcc-12
x86_64      buildonly-randconfig-005-20250618    clang-20
x86_64      buildonly-randconfig-005-20250619    gcc-12
x86_64      buildonly-randconfig-006-20250618    gcc-12
x86_64      buildonly-randconfig-006-20250619    gcc-12
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
