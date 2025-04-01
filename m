Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143D9461
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535588; cv=none; b=AFyLEHCPd/K7PDT15WTNqkX5qY0S7oKFk0nmjtT19vk1EovLJlv3JDHqgPSy5D6GV6S09fLOxkZ/cx8Qc14s64sc7DWivBTQjd2MEYc7E6aY/b6UIVtG9gsoF5o3+Cc4tGdrd0G2rbzKBsO3tsChLPuT62R92KOMAogU4S4U/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535588; c=relaxed/simple;
	bh=1w0V2ehMhVAeL/+WpQSUz8w92itOezjFWuxEU+2FDQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hO8dtzRITeia8R6m3lnPlXhVluOshdWEzKQISLvnrLMb/C4bnLmUCaQVFbcuYoDDsh0zxsh1SayZyP6hW7C7Z/XdVth7fbodXJaU471lEjnFuI5RDnqADAaDwysAA4j34PZp6biW3V55g5hnyPn1nzUa65vhG/zXyNn9+aEMjMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0h4bhMJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0h4bhMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743535586; x=1775071586;
  h=date:from:to:cc:subject:message-id;
  bh=1w0V2ehMhVAeL/+WpQSUz8w92itOezjFWuxEU+2FDQ4=;
  b=j0h4bhMJ1zjZ/qZYLhhCcTE9zZGYlvVbarrw+f6HXu1sHVgZgvnMkdUf
   doK67GTMNc3ezuxB/xQzLgHRrEe5g9qJtGsBMEQl37UbZv6cUV4Mpk15z
   oiDcGofLccdLRQ8PXwJTEyNiR6VdmuTdYGX10URTNc/jrO4tI0Gr581Ed
   CXxd1qA97zSucyLGyqw8Sq1HC9QPe7kXDNa1JWLufnwg9BFFs6NNPCgGb
   TRATRR5epuheFLPTGHNWNGOTusaf9GbKYk0DIKR+xzNZhH/o3dteB3795
   7yoxkhKBT2OjA3IZEZiVvKhJCxPZid3T4rRSnVQSxNKyH4PcQUuh0WzUG
   A==;
X-CSE-ConnectionGUID: rIQPxXAnQdqBJrle/g1c2w==
X-CSE-MsgGUID: g3nM45BtT62lS6cZDN5x+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56244402"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="56244402"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:26:26 -0700
X-CSE-ConnectionGUID: FuAqYcgLQOCgtEiKPA5QRw==
X-CSE-MsgGUID: oKAs9Cd3TQ6V4yn4T4sjgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131193252"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 12:26:24 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzhFe-000A5G-1U;
	Tue, 01 Apr 2025 19:26:22 +0000
Date: Wed, 02 Apr 2025 03:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.03.25a] BUILD SUCCESS
 cedfad9ced72fc8c873e11a4c6a089a415489166
Message-ID: <202504020339.IzsJmVBB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.03.25a
branch HEAD: cedfad9ced72fc8c873e11a4c6a089a415489166  ratelimit: Reduce ratelimit's false-positive misses

elapsed time: 1516m

configs tested: 122
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250401    gcc-12.4.0
arc                   randconfig-002-20250401    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250401    gcc-7.5.0
arm                   randconfig-002-20250401    gcc-8.5.0
arm                   randconfig-003-20250401    clang-18
arm                   randconfig-004-20250401    clang-14
arm                        realview_defconfig    clang-16
arm                       versatile_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250401    clang-21
arm64                 randconfig-002-20250401    clang-20
arm64                 randconfig-003-20250401    gcc-8.5.0
arm64                 randconfig-004-20250401    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250401    gcc-14.2.0
csky                  randconfig-002-20250401    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250401    clang-21
hexagon               randconfig-002-20250401    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250401    gcc-12
i386        buildonly-randconfig-002-20250401    clang-20
i386        buildonly-randconfig-003-20250401    clang-20
i386        buildonly-randconfig-004-20250401    clang-20
i386        buildonly-randconfig-005-20250401    gcc-12
i386        buildonly-randconfig-006-20250401    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250401    gcc-14.2.0
loongarch             randconfig-002-20250401    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250401    gcc-8.5.0
nios2                 randconfig-002-20250401    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250401    gcc-11.5.0
parisc                randconfig-002-20250401    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250401    clang-21
powerpc               randconfig-002-20250401    gcc-8.5.0
powerpc               randconfig-003-20250401    clang-20
powerpc64             randconfig-001-20250401    clang-21
powerpc64             randconfig-002-20250401    clang-17
powerpc64             randconfig-003-20250401    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250401    clang-21
riscv                 randconfig-002-20250401    clang-14
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250401    clang-15
s390                  randconfig-002-20250401    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250401    gcc-12.4.0
sh                    randconfig-002-20250401    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250401    gcc-11.5.0
sparc                 randconfig-002-20250401    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250401    gcc-9.3.0
sparc64               randconfig-002-20250401    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250401    gcc-12
um                    randconfig-002-20250401    gcc-11
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250401    clang-20
x86_64      buildonly-randconfig-002-20250401    gcc-12
x86_64      buildonly-randconfig-003-20250401    clang-20
x86_64      buildonly-randconfig-004-20250401    clang-20
x86_64      buildonly-randconfig-005-20250401    gcc-12
x86_64      buildonly-randconfig-006-20250401    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250401    gcc-9.3.0
xtensa                randconfig-002-20250401    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
