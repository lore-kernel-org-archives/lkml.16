Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E4290F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115000; cv=none; b=aPALXaDntaJZpR51AebzfAy9/EN1UwSfTZzxv4DchQEeL1Ua8aIdadhBLlmyMX+KWg9dVcNbu0HjhxYUsroVmtxAX4uaNKmcJpCqyB4oMQqpHgcNnyBUd4qYgSd0BJaJsVyerd6Zo5dstSODBGjM7VXdRQG6ujFuHiHcx36h16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115000; c=relaxed/simple;
	bh=1JhOXWqoYeM8bClO98qNw8UBKuzb4MdKLTuTZL/T03U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kPVz+xhD3TjDTtTaOWlaUm2iFdadFxqH4Gj8X47ht1YSJdefQ3iuMWt4UBG74H125laIllX8QrpZKnDDmP8/Do16SPOEsGt94s75AgNzuyzZ93pjlpi688BRLIF7qa1EAWl0O19sJCXTnpWfO75emVTayTywNhVZQcrN1ktU5m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRKgioD4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRKgioD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747114998; x=1778650998;
  h=date:from:to:cc:subject:message-id;
  bh=1JhOXWqoYeM8bClO98qNw8UBKuzb4MdKLTuTZL/T03U=;
  b=jRKgioD4dcIW7x5vR2Wdihx7nULHm6h0VKo4UjyS2qVhPg6pAIYIvClz
   ywGWFYbeC1HwzjVgBONvfEiamn+Oae5501f49u3XS7JqxrfYYcng093Kx
   gvDcBDyyJlflaTgtu4vpDBmli9GBGTnnbB3+p3YFtjL+e3BAdjaL/hW+U
   oLZThrKgR6I52Q1CmaeHTdec7xOymKQ2lbEKASqQYmsNmC7kUer5GUkul
   NGUGFJi++pxUOBNGZR+YNSURld2psIVZ5E3q97l0ky+P6oHhObV1yRMWh
   vxrApWyESJ3da/C7G+/XhcC2+gcgXMo7CZaC8OEf1AHBPwIisOOe9/u1x
   w==;
X-CSE-ConnectionGUID: 3SVpqRtwTTidCkU5vnu+ew==
X-CSE-MsgGUID: CMs9wFJrRWyfDQOer/35pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36568814"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="36568814"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:43:14 -0700
X-CSE-ConnectionGUID: MF5l9W29RvqZEp+v29WjZw==
X-CSE-MsgGUID: yHfD4/D7SemEwOuXq5cysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142720574"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2025 22:43:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEiQ2-000FkV-1s;
	Tue, 13 May 2025 05:43:10 +0000
Date: Tue, 13 May 2025 13:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 b671c27ccae55303f42c9f32de65cd07c0ba028f
Message-ID: <202505131341.cpmRZ9ZZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: b671c27ccae55303f42c9f32de65cd07c0ba028f  Merge branch into tip/master: 'x86/sgx'

elapsed time: 954m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-14.2.0
arc                   randconfig-001-20250512    gcc-14.2.0
arc                   randconfig-002-20250512    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250512    gcc-7.5.0
arm                   randconfig-002-20250512    clang-17
arm                   randconfig-003-20250512    gcc-6.5.0
arm                   randconfig-004-20250512    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250512    gcc-7.5.0
arm64                 randconfig-002-20250512    clang-21
arm64                 randconfig-003-20250512    clang-21
arm64                 randconfig-004-20250512    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250513    gcc-14.2.0
csky                  randconfig-002-20250513    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250513    clang-21
hexagon               randconfig-002-20250513    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250512    gcc-11
i386        buildonly-randconfig-002-20250512    clang-20
i386        buildonly-randconfig-003-20250512    clang-20
i386        buildonly-randconfig-004-20250512    gcc-12
i386        buildonly-randconfig-005-20250512    clang-20
i386        buildonly-randconfig-006-20250512    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250513    gcc-14.2.0
loongarch             randconfig-002-20250513    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250513    gcc-10.5.0
nios2                 randconfig-002-20250513    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250513    gcc-11.5.0
parisc                randconfig-002-20250513    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250513    clang-21
powerpc               randconfig-002-20250513    gcc-8.5.0
powerpc               randconfig-003-20250513    clang-21
powerpc64             randconfig-001-20250513    clang-21
powerpc64             randconfig-003-20250513    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250512    gcc-7.5.0
riscv                 randconfig-002-20250512    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250512    clang-18
s390                  randconfig-002-20250512    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250512    gcc-11.5.0
sh                    randconfig-002-20250512    gcc-9.3.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250512    gcc-10.3.0
sparc                 randconfig-002-20250512    gcc-8.5.0
sparc64               randconfig-001-20250512    gcc-6.5.0
sparc64               randconfig-002-20250512    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250512    gcc-12
um                    randconfig-002-20250512    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250512    gcc-12
x86_64      buildonly-randconfig-002-20250512    gcc-12
x86_64      buildonly-randconfig-003-20250512    clang-20
x86_64      buildonly-randconfig-004-20250512    clang-20
x86_64      buildonly-randconfig-005-20250512    clang-20
x86_64      buildonly-randconfig-006-20250512    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250512    gcc-12.4.0
xtensa                randconfig-002-20250512    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
