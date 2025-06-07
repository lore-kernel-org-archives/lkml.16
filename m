Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4539184F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749289416; cv=none; b=dpiYtKdP9ufZmGgoaq41eBVNjIGN7lmB/O3eWRb3qz87ZzRNHHDQDn5rta5N2meh6DCWNoXBvo9eDmKXn3+p2Dl0jv437tXeUz3ncX53ZLFls9QIGONTDGruiA+Yas7IiHI1MBqwraFTROt9McD4AwTtYfSu7Rc51fhetIGj18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749289416; c=relaxed/simple;
	bh=F4CLySCe72VjhODpiBPegOC0jFoe+Qn2cElqYZDHF+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jFGk5OpjFPs/41AhVPGnCYPJb8CmAGP1JQgLh3I6wV9lc1g5/2iaOF6ZiuPwxkp8/S6g0ZavBQxokxYKRnBHnHBBjvQxr+ecX9leU2q/w5OvjeDJKtqYLoi/p7r4BZcEDTo4Z9Mace5XgZkWPgES0CIKkEN0rziL4be5v1C+5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqXND6CX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqXND6CX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749289415; x=1780825415;
  h=date:from:to:cc:subject:message-id;
  bh=F4CLySCe72VjhODpiBPegOC0jFoe+Qn2cElqYZDHF+U=;
  b=NqXND6CXSD8OLllUum9DP/19/gH82ehw/gvahRNfKjubyCVmi7uy03Rg
   5s3//5m4/9JCRaHTlEwZDJsomQhf/kc0U1RHUiNGDp7Kk0N2wXpEN40Yz
   G2SCjRw2rp1Nyy7+CofW39ISTfTjJl9NkihGtVbNpdVOcbVDaZPVTYbyd
   TRRK3lFguenvBDz34rbbkb5tFIzZCYKK8FiSZq+aYtB1LRGkjn3RM67L4
   A1pdc/NzHnIzP1tshqgA2chqiDSsFRKns35ewi6wBqWaKs9S7VLKxYuX+
   cXU8AW0KTLrsSHcvSTFZcc4xsyzCvUwE0m+X7+11fg7TqyoEu0Xq3r5ZS
   g==;
X-CSE-ConnectionGUID: harADQKNT+OQ72sPTFfKEQ==
X-CSE-MsgGUID: s3S+EZfITMGvwuvGcGdg2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51338284"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51338284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 02:43:34 -0700
X-CSE-ConnectionGUID: wu4g0dQwTFy+lt6ZjiPEjg==
X-CSE-MsgGUID: h7QINZqBQ822+smjJ6uHig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="151296112"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jun 2025 02:43:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNq5K-0005bM-0C;
	Sat, 07 Jun 2025 09:43:30 +0000
Date: Sat, 07 Jun 2025 17:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250606] BUILD REGRESSION
 2aebeb5c325881159c6896f61fa4b16f2af46067
Message-ID: <202506071707.qcXI9GGS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250606
branch HEAD: 2aebeb5c325881159c6896f61fa4b16f2af46067  cgroup: Avoid -Wflex-array-member-not-at-end warnings

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506070954.D6Eg0juq-lkp@intel.com

    kernel/sched/ext.c:3748:24: error: returning 'struct cgroup_hdr *' from a function with incompatible return type 'struct cgroup *' [-Werror=incompatible-pointer-types]
    kernel/sched/ext.c:7445:31: error: initialization of 'struct cgroup *' from incompatible pointer type 'struct cgroup_hdr *' [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-buildonly-randconfig-006-20250607
    |-- kernel-sched-ext.c:error:initialization-of-struct-cgroup-from-incompatible-pointer-type-struct-cgroup_hdr
    `-- kernel-sched-ext.c:error:returning-struct-cgroup_hdr-from-a-function-with-incompatible-return-type-struct-cgroup

elapsed time: 729m

configs tested: 122
configs skipped: 1

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250607    gcc-15.1.0
arc                   randconfig-002-20250607    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250607    clang-21
arm                   randconfig-002-20250607    gcc-13.3.0
arm                   randconfig-003-20250607    gcc-15.1.0
arm                   randconfig-004-20250607    gcc-14.3.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250607    clang-21
arm64                 randconfig-002-20250607    clang-21
arm64                 randconfig-003-20250607    clang-21
arm64                 randconfig-004-20250607    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250607    gcc-12.4.0
csky                  randconfig-002-20250607    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250607    clang-21
hexagon               randconfig-002-20250607    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250607    clang-20
i386        buildonly-randconfig-002-20250607    gcc-12
i386        buildonly-randconfig-003-20250607    gcc-12
i386        buildonly-randconfig-004-20250607    gcc-12
i386        buildonly-randconfig-005-20250607    clang-20
i386        buildonly-randconfig-006-20250607    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250607    gcc-13.3.0
loongarch             randconfig-002-20250607    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250607    gcc-10.5.0
nios2                 randconfig-002-20250607    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250607    gcc-12.4.0
parisc                randconfig-002-20250607    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc               randconfig-001-20250607    gcc-10.5.0
powerpc               randconfig-002-20250607    clang-21
powerpc               randconfig-003-20250607    clang-21
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250607    clang-19
powerpc64             randconfig-002-20250607    clang-21
powerpc64             randconfig-003-20250607    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250607    clang-21
riscv                 randconfig-002-20250607    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250607    clang-16
s390                  randconfig-002-20250607    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20250607    gcc-14.3.0
sh                    randconfig-002-20250607    gcc-9.3.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250607    gcc-10.3.0
sparc                 randconfig-002-20250607    gcc-12.4.0
sparc64               randconfig-001-20250607    gcc-9.3.0
sparc64               randconfig-002-20250607    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250607    clang-21
um                    randconfig-002-20250607    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250607    clang-20
x86_64      buildonly-randconfig-002-20250607    clang-20
x86_64      buildonly-randconfig-003-20250607    clang-20
x86_64      buildonly-randconfig-004-20250607    gcc-12
x86_64      buildonly-randconfig-005-20250607    gcc-12
x86_64      buildonly-randconfig-006-20250607    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250607    gcc-10.5.0
xtensa                randconfig-002-20250607    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
