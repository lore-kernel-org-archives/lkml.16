Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863473074AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839073; cv=none; b=axvR+QFGuvVymTyI4DtZEX+qzqnCsU88unqnW5XnxZ6HG2K4NANYXYsEj8ct+BWROl7OdY7QpXCO/9PgTkfgTTajYisfFNtTAe/mUV6R0qTnrNQpWKq7Xfz82HIE7aeGz4BwD3xO3+viZ2n1rsQXNC9Q9MipkYICYcM+NS2sSUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839073; c=relaxed/simple;
	bh=eoQ8btc3w3Wau1cNd/Q6cSosXPhtX7VSzYfXWvC7H9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BlmHlQZMx5sngMtvw8Dh18kwqBDU4dM6zf4qSb8Q1JTtwhDziPEs2aJDOmFfwmv3GNcCYGEIz7zGcYG9VmUe4pGI/fjWSbXanKVhzRm91jcJl9O36J5A7LjL9XuAkKs47r+EycnhVUBNyYMq5sbDSYy4zbMocEvpZQ3+zCuQ9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CecYRBUq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CecYRBUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750839071; x=1782375071;
  h=date:from:to:cc:subject:message-id;
  bh=eoQ8btc3w3Wau1cNd/Q6cSosXPhtX7VSzYfXWvC7H9o=;
  b=CecYRBUqxqNvKNx/8icK2gv3X5ptEsS/Xh5ApVv5LgqsG/AqMu87k+uy
   G2EahUt141O4bWZi13mYYKDPzb8AouTEGln2RzqGoHjXXR4/+CP8MiCao
   ZEoLC19EYAQSkc/7xVzkUaQ+8gDQ0OJIdmSziHMXBrUTkplAopvHUtNCf
   JAlrXpYWLBedmn1MxM9iE2UEKIFNi0LHX4ZfUtnMW2rTBOFfH3tOgoNZh
   C1N8vRoUUqmydhiqS5qJG9Gev5EkOok2VjjtwQq/aCXqFuM3fyGMDeC3L
   oBwwGrv8afaB10t+Qle8Yj5TuvFGw3DHahK05BSThlUi1pw1my5c6xTnG
   w==;
X-CSE-ConnectionGUID: FUHxI0RJQ2GKpWiKU+YYeQ==
X-CSE-MsgGUID: z/ZASlE5Q061JRMHir90FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52969059"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52969059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:11:11 -0700
X-CSE-ConnectionGUID: c/+IhJ1VRKuf8tLcjQhqkA==
X-CSE-MsgGUID: qBdBDRhtRnO3yBQRuqzBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151759410"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jun 2025 01:11:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uULDn-000SsU-1j;
	Wed, 25 Jun 2025 08:11:07 +0000
Date: Wed, 25 Jun 2025 16:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu/next] BUILD SUCCESS
 5c23ce0cb897b491a12667e3c15288eb03f8928d
Message-ID: <202506251625.QUlJD1nv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: 5c23ce0cb897b491a12667e3c15288eb03f8928d  lib: Add stress test for ratelimit

elapsed time: 1144m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-002-20250624    gcc-8.5.0
arc                   randconfig-002-20250625    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-001-20250625    gcc-11.5.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-003-20250625    gcc-11.5.0
arm                   randconfig-004-20250624    clang-17
arm                   randconfig-004-20250625    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-002-20250625    gcc-11.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-003-20250625    gcc-11.5.0
arm64                 randconfig-004-20250624    clang-21
arm64                 randconfig-004-20250625    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-001-20250625    gcc-12
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-005-20250625    gcc-12
i386        buildonly-randconfig-006-20250624    gcc-12
i386        buildonly-randconfig-006-20250625    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250625    gcc-12
x86_64      buildonly-randconfig-002-20250625    clang-20
x86_64      buildonly-randconfig-002-20250625    gcc-12
x86_64      buildonly-randconfig-003-20250625    clang-20
x86_64      buildonly-randconfig-003-20250625    gcc-12
x86_64      buildonly-randconfig-004-20250625    clang-20
x86_64      buildonly-randconfig-004-20250625    gcc-12
x86_64      buildonly-randconfig-005-20250625    clang-20
x86_64      buildonly-randconfig-005-20250625    gcc-12
x86_64      buildonly-randconfig-006-20250625    clang-20
x86_64      buildonly-randconfig-006-20250625    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
