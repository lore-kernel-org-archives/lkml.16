Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B31519A6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452240; cv=none; b=CN0teiBLS8jeovjQO+jBDAHAeytDQ3UteYB1mnEKRYE2TWPF+UTpaN+C7pkXiWmatTPFMdijRK4ZGZgNlZMpc+Z9k4hTYRVMQ3zrecKmKzjpLw8PyVFE7s30B4JXQw2TBI8yt/f/FgnrUB2rlAEfxuydQ6wXFAq6VwOm4dvYxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452240; c=relaxed/simple;
	bh=4YAmMb1xiYyI2Fpa9bsasL2uEV9W7HYkldVbh2qBk/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rca3+g6x7EgKnCTd2LZKsXYmpH3w6pBZQRyypcsOx1+q+1nCmK6DYfjKdIBoDwo6RBDkkABZjf0fuv8ARVCyKJHMqqp+dkEavkWcW/vH0nZDK5IfF7X4rr8iOmAb7qGW3G/dxS72H7wH7hu0dbnYedtvGpz/KJG5JDH8Bjv7obA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imkOyJ2u; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imkOyJ2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744452238; x=1775988238;
  h=date:from:to:cc:subject:message-id;
  bh=4YAmMb1xiYyI2Fpa9bsasL2uEV9W7HYkldVbh2qBk/k=;
  b=imkOyJ2uvpwfpdIcPrEafVzACvaqY069QGYJldmwcOJ12I6EcpnYLwua
   pQNpmXQJVoN6P176S4DwQrzPaE3tne2EcDq9LFy13z3Jy7jkIrzyxFK3J
   jIHu4/sOR7OnSUHZXMUpqsYqG4kWBhQ9QS6Lx0AGs1U1qnjl0fM+Bj6wD
   ooOvM2BcMIgRToOPNDHk4l1GfHruyJ6NS8euBOi8ww3ks2OB4XVRose+E
   kYrpCMyUDtTtwRTBWwSXfdfgBtSgC0bf1xZ6eYrdGiXawRVbadiaUML62
   uT5PNhHZDz3mlLJBsYUUnV5cWuocTgUm0D9bpvHYfciD31G+gC56Z+/uR
   Q==;
X-CSE-ConnectionGUID: +aBqym6oQJmb5eOUiAN8Cg==
X-CSE-MsgGUID: wIC4ta7ORVC+B6gSDOeQsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45877654"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="45877654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 03:03:57 -0700
X-CSE-ConnectionGUID: IsI294xcQY2iSw0EHOkOrQ==
X-CSE-MsgGUID: /L5pd+YOSnuflVi1XeSzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134253933"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Apr 2025 03:03:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3XiM-000BiA-1G;
	Sat, 12 Apr 2025 10:03:54 +0000
Date: Sat, 12 Apr 2025 18:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/cpu] BUILD SUCCESS
 62e565273993ee47c82ca2975e65ce4bec3c3697
Message-ID: <202504121852.sA3S8rxB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cpu
branch HEAD: 62e565273993ee47c82ca2975e65ce4bec3c3697  x86/cacheinfo: Standardize header files and CPUID references

elapsed time: 1444m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250411    gcc-14.2.0
arc                   randconfig-002-20250411    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-21
arm                        multi_v5_defconfig    gcc-14.2.0
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
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250411    gcc-9.3.0
nios2                 randconfig-002-20250411    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250411    gcc-14.2.0
parisc                randconfig-002-20250411    gcc-8.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250411    gcc-9.3.0
powerpc               randconfig-002-20250411    clang-21
powerpc               randconfig-003-20250411    clang-21
powerpc64             randconfig-001-20250411    gcc-5.5.0
powerpc64             randconfig-002-20250411    gcc-5.5.0
powerpc64             randconfig-003-20250411    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
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
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250412    gcc-14.2.0
sh                    randconfig-002-20250412    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
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
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250412    gcc-14.2.0
xtensa                randconfig-002-20250412    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
