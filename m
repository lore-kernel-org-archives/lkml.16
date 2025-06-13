Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A41C5F35
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749774558; cv=none; b=KDY2uzJKffpOb435P44VjFr7NryzepUzMdI2W9bDYNhZZJJ8jJVFIZQcY7DhLQSNM9ibIaKIZN7Xbq0Z8rOkBZ9PLwVf5SPU7F9DgW9j/ZGbE13dKYp3raJALWgFaBLZ3WPgSx33PEqZE968awvj70f8m7X9AX5pdhz+nFGQkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749774558; c=relaxed/simple;
	bh=6szosw9K0mEbz0ZCc+KigSj1rFBXue4gi0y78RNr2pk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b7Rg+hzldppQuOqigLdAHGtubMf+TaUgVj8UrxXRJXZlKaRUNUsfOXzE9ZwhU8s1HmdskexGyOTISgcJ8xRFIdzwzbS1t8+QNtoBMIpIO9ExggqPPHhTKzPRYQHI2H16Qi8IWseGjbVPcCfwOp8DN0ntsWLJzkM8LcexuLv+4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JK5EnNpA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JK5EnNpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749774557; x=1781310557;
  h=date:from:to:cc:subject:message-id;
  bh=6szosw9K0mEbz0ZCc+KigSj1rFBXue4gi0y78RNr2pk=;
  b=JK5EnNpAaylS1XIG2s5YgMB4FBNydc8XRVj0aMHfNFEXELDxDbUOjiy/
   gWGI+6QNxDPdTVp20BKRan64n+qCq8pdMtGhqg7agXeBjEPH153NIagds
   8XKZi21VIyu1hyVhplNpGgAoZ9AQXGD0H932EVU3LBL+6FvBP8vgFZuio
   /OUrrhZ/2OoSCZdNy/laeVgml8sltz2PAqDFW1vXH+Ght4Dsy8tOs8loJ
   khiuw35ZTfwTFLzF7TySNb6Euf7d5m9l5heQQlglk/xNxnByMDubG0wdA
   gVRKx9cXTnhyA7JrVdjKsQbx0Q0aAaafQRY4XqiWBKT78ZzAmpmbq6ZqQ
   Q==;
X-CSE-ConnectionGUID: U82rX2HrRdiDL1EEgDDXlQ==
X-CSE-MsgGUID: 5SS4qvsCReaVyNhDe3T46A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63331335"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="63331335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:29:16 -0700
X-CSE-ConnectionGUID: Ffo7clo0Q12G4BCCRrhzeg==
X-CSE-MsgGUID: YtvMLNJ0QU29vUN2tADn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="147657928"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jun 2025 17:29:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPsIC-000C3T-1u;
	Fri, 13 Jun 2025 00:29:12 +0000
Date: Fri, 13 Jun 2025 08:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250606-with-bare-unions]
 BUILD SUCCESS 68615602f1eef5c67d22b8737f81f924c8b4177e
Message-ID: <202506130839.lC8GZKJ8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250606-with-bare-unions
branch HEAD: 68615602f1eef5c67d22b8737f81f924c8b4177e  NFSD: Avoid multiple -Wflex-array-member-not-at-end warnings

elapsed time: 1460m

configs tested: 96
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250612    gcc-8.5.0
arc                   randconfig-002-20250612    gcc-10.5.0
arm                               allnoconfig    clang-21
arm                         assabet_defconfig    clang-18
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250612    clang-21
arm                   randconfig-002-20250612    clang-18
arm                   randconfig-003-20250612    clang-21
arm                   randconfig-004-20250612    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250612    clang-19
arm64                 randconfig-002-20250612    clang-17
arm64                 randconfig-003-20250612    clang-21
arm64                 randconfig-004-20250612    clang-18
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250612    gcc-11.5.0
csky                  randconfig-002-20250612    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250612    clang-21
hexagon               randconfig-002-20250612    clang-21
i386        buildonly-randconfig-001-20250612    clang-20
i386        buildonly-randconfig-002-20250612    gcc-12
i386        buildonly-randconfig-003-20250612    clang-20
i386        buildonly-randconfig-004-20250612    clang-20
i386        buildonly-randconfig-005-20250612    clang-20
i386        buildonly-randconfig-006-20250612    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250612    gcc-13.3.0
loongarch             randconfig-002-20250612    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250612    gcc-14.2.0
nios2                 randconfig-002-20250612    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250612    gcc-8.5.0
parisc                randconfig-002-20250612    gcc-10.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250612    clang-21
powerpc               randconfig-002-20250612    gcc-8.5.0
powerpc               randconfig-003-20250612    clang-17
powerpc64             randconfig-001-20250612    gcc-12.4.0
powerpc64             randconfig-002-20250612    clang-21
powerpc64             randconfig-003-20250612    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250612    clang-21
riscv                 randconfig-002-20250612    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250612    clang-21
s390                  randconfig-002-20250612    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250612    gcc-12.4.0
sh                    randconfig-002-20250612    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250612    gcc-14.3.0
sparc                 randconfig-002-20250612    gcc-10.3.0
sparc64               randconfig-001-20250612    gcc-13.3.0
sparc64               randconfig-002-20250612    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250612    clang-17
um                    randconfig-002-20250612    clang-21
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250612    gcc-12
x86_64      buildonly-randconfig-002-20250612    clang-20
x86_64      buildonly-randconfig-003-20250612    gcc-12
x86_64      buildonly-randconfig-004-20250612    gcc-12
x86_64      buildonly-randconfig-005-20250612    clang-20
x86_64      buildonly-randconfig-006-20250612    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250612    gcc-10.5.0
xtensa                randconfig-002-20250612    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
