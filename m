Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4623FD4
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 21:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748210371; cv=none; b=dyLZyVEGX4p5BwMz8op0vAMp3KYdt+hEIBpeo9YqhTjyHstVy9dcxX2b6IcfSQUMWc9VUcdaLHQHamV1FH2ylhKg9cTkV8wh1kbfQTW8yG6COShUudt8A2t7Q7u/mmEVv4rv/9bI7Zzob5sAv8z9dMFzWrYefbIO2LcA+Nh1O1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748210371; c=relaxed/simple;
	bh=IilcOZKha8eodnGXIf2VnOitAcCq/danvjb4FinJBxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TV8FpCmkvJsLsyZhpk1DO/aFWGd9ROExqyADJ8RmGQaK2KRwZcZbz2+y0JYayTTDTvYJliaWAggN7fxaV+ypX+o8dpRQHH1jg2Sx5yARWUUCiZXlKF8hYK2QZlw7n20hjiqctLTdP9BeybzaPE2DJx+NC+21iU8K2+p7THrhe2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AC39WWw7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AC39WWw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748210370; x=1779746370;
  h=date:from:to:cc:subject:message-id;
  bh=IilcOZKha8eodnGXIf2VnOitAcCq/danvjb4FinJBxc=;
  b=AC39WWw7hRpHcfpHGVZzRwf7GU7dBg3LN1KoMBWgW5ZS5Djj8H3rkrsi
   pBvC3+RXp3aTymXNHJJyjRBcvLlB5yChbH0QMQLqIk0rzDz9+lu6A/jkA
   DwVPwxnGOFsnDeiseV71RW7U5/i2bjsXHrvMS6Y+ukBemSP7QeItU1IDd
   r3Rmsi93h9lHu77d936huQzHK6+Vpi/lmUTzDHqJSGpiQB4JOHMQDCIfs
   TShQpRrpoX3r1KO21q2AngT6j9oRy6aoL8ayj7tVPwhvD6/9rja9Ee24L
   2F4ZjzO2xWSARYsrjU5ET8tb9CprG/MUhUb8ZBxctFmviEPeXcnBdrWRk
   A==;
X-CSE-ConnectionGUID: y5XPCcq1TUqKKb0yPsgV4g==
X-CSE-MsgGUID: EA7IilGqTZqfXIiPRyoyMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="61238128"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="61238128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:59:29 -0700
X-CSE-ConnectionGUID: J7/lh/KDSni1e2PcL2iLag==
X-CSE-MsgGUID: Cz+LWKKuSAioM7leA8oe/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="165290082"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 May 2025 14:59:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJJNO-000S1E-09;
	Sun, 25 May 2025 21:59:26 +0000
Date: Mon, 26 May 2025 05:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/core] BUILD SUCCESS
 e7d952cc39fca34386ec9f15f68cb2eaac01b5ae
Message-ID: <202505260514.ZoylP07O-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
branch HEAD: e7d952cc39fca34386ec9f15f68cb2eaac01b5ae  perf/headers: Clean up <linux/perf_event.h> a bit

elapsed time: 764m

configs tested: 140
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250525    gcc-12.4.0
arc                   randconfig-002-20250525    gcc-8.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                            dove_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250525    clang-21
arm                   randconfig-002-20250525    clang-21
arm                   randconfig-003-20250525    gcc-8.5.0
arm                   randconfig-004-20250525    gcc-7.5.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250525    clang-21
arm64                 randconfig-002-20250525    gcc-8.5.0
arm64                 randconfig-003-20250525    gcc-6.5.0
arm64                 randconfig-004-20250525    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250525    gcc-14.2.0
csky                  randconfig-002-20250525    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250525    clang-19
hexagon               randconfig-002-20250525    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250525    gcc-11
i386        buildonly-randconfig-002-20250525    clang-20
i386        buildonly-randconfig-003-20250525    gcc-12
i386        buildonly-randconfig-004-20250525    gcc-12
i386        buildonly-randconfig-005-20250525    gcc-12
i386        buildonly-randconfig-006-20250525    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250525    gcc-15.1.0
loongarch             randconfig-002-20250525    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-18
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250525    gcc-6.5.0
nios2                 randconfig-002-20250525    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250525    gcc-7.5.0
parisc                randconfig-002-20250525    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250525    clang-16
powerpc               randconfig-002-20250525    clang-21
powerpc               randconfig-003-20250525    clang-21
powerpc64             randconfig-001-20250525    clang-21
powerpc64             randconfig-002-20250525    clang-18
powerpc64             randconfig-003-20250525    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250525    clang-21
riscv                 randconfig-002-20250525    clang-21
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250525    clang-19
s390                  randconfig-002-20250525    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250525    gcc-6.5.0
sh                    randconfig-002-20250525    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250525    gcc-6.5.0
sparc                 randconfig-002-20250525    gcc-10.3.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250525    gcc-7.5.0
sparc64               randconfig-002-20250525    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250525    clang-18
um                    randconfig-002-20250525    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250525    clang-20
x86_64      buildonly-randconfig-002-20250525    clang-20
x86_64      buildonly-randconfig-003-20250525    clang-20
x86_64      buildonly-randconfig-004-20250525    gcc-12
x86_64      buildonly-randconfig-005-20250525    clang-20
x86_64      buildonly-randconfig-006-20250525    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250525    gcc-9.3.0
xtensa                randconfig-002-20250525    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
