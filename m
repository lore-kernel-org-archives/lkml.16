Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9F1B4F0F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751730671; cv=none; b=cMRFYsvVI5ZWAzgzrXG0tKZfJgu7B9VrQaDuI9WjZY5GzjtZ9j5dYBeDf4SsL0ayTww6Sf/mLK2DMXJbjccj7AbCF0wXjBp5ZF3pl2gTMrR2/1Xc9DBGJhnkJD6Ml8jDB5aWSKkEnKwrN4D3LuN+MI+vPnlSVaVwK2JkzFJHkus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751730671; c=relaxed/simple;
	bh=qrAm4kXWv9K4DUv72FTlRFjeddt/NvfnSxijl4C0XCk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QoOP/DMqaKw+F2YsynGgbGqKkgK5KkU1Oyw4blpnV45FYnyq/g3noxjHIckydKs7TozWmv4jqVVuEmiDiByztn8rp11BFIL1O3tDLag6XyL3q+dQFl3gnzZKIrEt08KLA/eVXoKKoKE8RVDFj2cbcIdSai1Ds3sKa4xs69AnQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQXPEqLs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQXPEqLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751730671; x=1783266671;
  h=date:from:to:cc:subject:message-id;
  bh=qrAm4kXWv9K4DUv72FTlRFjeddt/NvfnSxijl4C0XCk=;
  b=gQXPEqLsLttrM41ZFbJW40VFW2+TdEp/PmQGpgh3x9g8XNd6gnkFj+Rw
   ybbMJVHhSFXlneH3dH5ll/TWVRIohAKQauo/mabvO5s4M1Gu4RI3f81Qg
   ZlJpcafzimaf1Gt/QwT2oy8Pwkwq8F9QGVyRAqNiApIz8HJ7v/dEo4Fnh
   ULBH17eI13bg8YwMKpw7QOZ6IG/WYCYnzNXhakzuTOGe2KGldEsgiSrzi
   WMzEm2suL2B/OOjnHcdoDsSldrRJuDZKYF69qvlMlCISob79PuJrHDHOe
   yQVU44N4SPHJRZUyngbWCFZbrXvQObAbJzbIDxmqoqWkyJTfJlF3/bQcN
   g==;
X-CSE-ConnectionGUID: OXjtmrD+SCWJLyiClsM+9g==
X-CSE-MsgGUID: U2kUPjJjTS6rO8fVZ+or7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53883662"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="53883662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 08:51:10 -0700
X-CSE-ConnectionGUID: fBeoCnN+QOS8MX1t1PYnbw==
X-CSE-MsgGUID: wbL/0OlLTzWtUx0d8lEsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="159190884"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jul 2025 08:51:09 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY5AQ-0004ZX-0v;
	Sat, 05 Jul 2025 15:51:06 +0000
Date: Sat, 05 Jul 2025 23:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 3a9e5d64afcfeb0c24d112170cc8c972949417ed
Message-ID: <202507052339.tIBYQi2V-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 3a9e5d64afcfeb0c24d112170cc8c972949417ed  Merge irq/drivers into tip/master

elapsed time: 1443m

configs tested: 132
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250705    gcc-8.5.0
arc                   randconfig-002-20250705    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250705    gcc-12.4.0
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250705    gcc-8.5.0
arm                   randconfig-004-20250705    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250705    gcc-10.5.0
arm64                 randconfig-002-20250705    clang-17
arm64                 randconfig-003-20250705    gcc-11.5.0
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250705    gcc-10.5.0
csky                  randconfig-002-20250705    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250705    clang-19
hexagon               randconfig-002-20250705    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250705    gcc-11
i386        buildonly-randconfig-002-20250705    clang-20
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250705    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250705    gcc-15.1.0
loongarch             randconfig-002-20250705    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250705    gcc-8.5.0
nios2                 randconfig-002-20250705    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250705    gcc-9.3.0
parisc                randconfig-002-20250705    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250705    gcc-11.5.0
powerpc               randconfig-002-20250705    gcc-9.3.0
powerpc               randconfig-003-20250705    gcc-12.4.0
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250705    clang-21
powerpc64             randconfig-002-20250705    clang-21
powerpc64             randconfig-003-20250705    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250705    clang-21
riscv                 randconfig-002-20250705    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250705    clang-21
s390                  randconfig-002-20250705    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250705    gcc-15.1.0
sh                    randconfig-002-20250705    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250705    gcc-13.4.0
sparc                 randconfig-002-20250705    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250705    gcc-8.5.0
sparc64               randconfig-002-20250705    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250705    clang-20
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250705    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250705    gcc-12.4.0
xtensa                randconfig-002-20250705    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
