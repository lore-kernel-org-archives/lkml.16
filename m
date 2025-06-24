Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5A72C15B1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772245; cv=none; b=nIcg6MkqM/kzgTsI4iG2dUdUHcXUSiuXmJ1YigcLV1Ux4UrZuLCq/pnri3pOKNL27GITFLexuAPV6b8cOk1TZijzOl9lhA0wvqVvbpaTWU1mrtgnSGmUmtH01A9qUh2vpTlESODNuT30/iMW5o1A0/hijvZbw1tYeHBd5Y7DGow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772245; c=relaxed/simple;
	bh=+ltlBpVYhLwnkAk6inoitwcen1CP+3aSMapL+QKO2NM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oCMDVGw2PFvqzpFFTXQxl+5Fw7Iau1OyoVPmNhwoSrug3EFR0VHYDdRHCrIv7gfS1RCpRjH7e+az6RJaY4jMozClG4C6Hpz3JaNhR5pgA8aC93I3Pnci79znfdEOfNGfWiQl490nRojOX7uqjs4QFAeu/NMLlRdbYmmbYK8k8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ajhrb2lY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ajhrb2lY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750772243; x=1782308243;
  h=date:from:to:cc:subject:message-id;
  bh=+ltlBpVYhLwnkAk6inoitwcen1CP+3aSMapL+QKO2NM=;
  b=Ajhrb2lYz6Ak9y9fWspJaKbG7xYAsD45LKByAYOvb1n5U0Eg1lbNLYPZ
   8/mHnfvdYjFDbn8PKYZ8Xb6DuOyCEi+bO33NrdSdc58VVUdLfrloT+KIG
   jGVX/2r82NjVbWSaS/6O7oCiIqCbq3XSTu6BtHoWJVSKhJFIL4aEdIIPj
   wexinUIM9MnYpjIc3zVJ+T2weAI2J6w/ilqLH6T1qVrjE/JmdUR3XLKZs
   gc3ijecdeoJuRcaG6P4N0iU3Il/IM1wkB4LpLqBdW2TtrYMskyBaBDVMA
   jrjaO84mLKM7Tvw+pENDYhmv+5INF6gNilKkBj5Apei9SxK93H7T3DRbI
   Q==;
X-CSE-ConnectionGUID: 3Pn0Y1Q2SaW+c/cpR+9fsA==
X-CSE-MsgGUID: 7L0LO/Z+QhGf1m8OiWwM6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="78432267"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="78432267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:37:23 -0700
X-CSE-ConnectionGUID: IIxH/soXQcGPBdnwYBMY9g==
X-CSE-MsgGUID: tiXYhwWcRy2tkMmSNKsC1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152215512"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2025 06:37:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU3pw-000SAm-0W;
	Tue, 24 Jun 2025 13:37:20 +0000
Date: Tue, 24 Jun 2025 21:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/urgent] BUILD SUCCESS
 a24cc6ce1933eade12aa2b9859de0fcd2dac2c06
Message-ID: <202506242127.RlWme4QX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/urgent
branch HEAD: a24cc6ce1933eade12aa2b9859de0fcd2dac2c06  futex: Initialize futex_phash_new during fork().

elapsed time: 1452m

configs tested: 58
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-004-20250624    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-004-20250624    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-006-20250624    gcc-12
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
