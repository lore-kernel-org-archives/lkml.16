Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31471ACEC6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394206; cv=none; b=KK5xqECReU/RPPk8qpowzZ6pa4LCeCDV3YRp9dGSCoJdGqSoiCl8xFn+0BjnyCghseQrftCpHreSvNc17kwyMpbmBZIfH0wHH72y8qKKkvDlzGLBGh0DjE9uhiFf5cC3syrFFwpBhPI79Dk2QKcz3XakkdsAhY+8i5r0so9lOeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394206; c=relaxed/simple;
	bh=RiIdC6a3QGEgQlu51y+WZOCye6VDJS7Vo5lTTOJSqlE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FTIEutKaIj7r5uMIRYdesE6dRrA4rOs39d3zzYeDCgfje2N/QlsVRZpSKqnIuHcWCVRzha0rw14wU8sEU+4VEcQq+OvtLfTk5TQlMBqpth+rtVdxo9ldua1+Hn6Lwlf+Jj+Ezh3bUI255IhBiUtfH2RA81cOmKzQ5A+2fRAjYUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4hh0Wsu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4hh0Wsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745394203; x=1776930203;
  h=date:from:to:cc:subject:message-id;
  bh=RiIdC6a3QGEgQlu51y+WZOCye6VDJS7Vo5lTTOJSqlE=;
  b=T4hh0Wsutyb8jAQgJYuSCCqYKEvBnT2ztNicshgmleG6rgrvSJKmQaKe
   cVPOC12vH3fz+x7i6Q3Al2Rzhb3XW5LogDgvcG4eGiih/0OENxoFrrsdl
   TxCwhJeUatjzTBnw6JwU3IQKN6JqII36Lj2pOF0y/J11/kDQwLnGorja1
   YAd8QMglwOESGyKWPfL8DR37gf71eEdf6tRGCF6wMIhz/KPhJKau3F+eU
   xZhy8grjKYImCCW7ZkF5gETnDUk7yL1LVbCismlnhtWhPnUhayuNdODX1
   NA+x3+VeS/sm+zsC0Rhc7RTXwkB1aVr75A1ZOXeEg4qNZV6jKYzsmuw59
   Q==;
X-CSE-ConnectionGUID: 8MqNIzueSKaTe9u4iM0miA==
X-CSE-MsgGUID: VVOeztGzTkqXRn0rNQV7vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46989061"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46989061"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:43:14 -0700
X-CSE-ConnectionGUID: fOfqFWriTR2CZPpcvurQ6g==
X-CSE-MsgGUID: 8tGi1lFSRxWmCdU+aSz58A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132230526"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Apr 2025 00:42:56 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7Ukw-0001h9-1f;
	Wed, 23 Apr 2025 07:42:54 +0000
Date: Wed, 23 Apr 2025 15:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/microcode] BUILD SUCCESS
 4e2c719782a84702db7fc2dc07ced796f308fec7
Message-ID: <202504231550.wbWZqdDl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/microcode
branch HEAD: 4e2c719782a84702db7fc2dc07ced796f308fec7  x86/cpu: Help users notice when running old Intel microcode

elapsed time: 1453m

configs tested: 127
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250422    gcc-8.5.0
arc                   randconfig-002-20250422    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250422    gcc-8.5.0
arm                   randconfig-002-20250422    gcc-8.5.0
arm                   randconfig-003-20250422    gcc-7.5.0
arm                   randconfig-004-20250422    gcc-7.5.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250422    gcc-6.5.0
arm64                 randconfig-002-20250422    clang-21
arm64                 randconfig-003-20250422    clang-18
arm64                 randconfig-004-20250422    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250422    gcc-10.5.0
csky                  randconfig-002-20250422    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250422    clang-21
hexagon               randconfig-002-20250422    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250422    clang-20
i386        buildonly-randconfig-002-20250422    clang-20
i386        buildonly-randconfig-003-20250422    gcc-12
i386        buildonly-randconfig-004-20250422    gcc-12
i386        buildonly-randconfig-005-20250422    clang-20
i386        buildonly-randconfig-006-20250422    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250422    gcc-14.2.0
loongarch             randconfig-002-20250422    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250422    gcc-10.5.0
nios2                 randconfig-002-20250422    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250422    gcc-7.5.0
parisc                randconfig-002-20250422    gcc-11.5.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250422    clang-21
powerpc               randconfig-002-20250422    gcc-6.5.0
powerpc               randconfig-003-20250422    clang-16
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250422    clang-21
powerpc64             randconfig-002-20250422    gcc-6.5.0
powerpc64             randconfig-003-20250422    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250422    clang-21
riscv                 randconfig-002-20250422    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250422    gcc-7.5.0
s390                  randconfig-002-20250422    clang-21
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20250422    gcc-14.2.0
sh                    randconfig-002-20250422    gcc-6.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250422    gcc-10.3.0
sparc                 randconfig-002-20250422    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250422    gcc-7.5.0
sparc64               randconfig-002-20250422    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250422    gcc-12
um                    randconfig-002-20250422    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250422    gcc-12
x86_64      buildonly-randconfig-002-20250422    clang-20
x86_64      buildonly-randconfig-003-20250422    gcc-12
x86_64      buildonly-randconfig-004-20250422    gcc-12
x86_64      buildonly-randconfig-005-20250422    clang-20
x86_64      buildonly-randconfig-006-20250422    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250422    gcc-14.2.0
xtensa                randconfig-002-20250422    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
