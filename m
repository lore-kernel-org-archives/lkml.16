Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8DC2905
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 23:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004623; cv=none; b=H8QrZS6FKso5ho0rnv9bfyqiY8M62PKeOAeYtJmPjUqeueeyyV/6zgX3KJTS1v6lgIhXhq0skYtGdjyW7W30BBUi8MOSQ6YUQeFh6s2b25cYJod6RRuSgyw+xnylmBk6uEQr+Dxb1aEopSQSmMEoAhoVWW4FU4rhw3zElHG0T8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004623; c=relaxed/simple;
	bh=ju9PQMKGfRD7RnGdyY8vcSP49hmndwWlOft4yIvPdck=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kDHUWoliD0uyt46agI4e9LCb+712mEwlipSJVfwex7kL80UlUBLrHiZl4tjRf2eJGX77c2sROlTQvZUKinPTebHY4JI0LZhYVsUc5lPggXYvmTntvLgrR4PM6HqtnLe4p62yTKizm/H5h6M5D4sZyPACXEs7YlOuWilvRHURhu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpGYmJtK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpGYmJtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747004621; x=1778540621;
  h=date:from:to:cc:subject:message-id;
  bh=ju9PQMKGfRD7RnGdyY8vcSP49hmndwWlOft4yIvPdck=;
  b=RpGYmJtK4JbiGj9pjEZVAHDtGXqlr5SPbFBY/VPRMg5FKvKO5yb9X6Tu
   NpoVi7NJgCdKOfHjLcPsMEocAWXtPKFqBMutkCP1aR5oxB/x3oMQwU1k8
   vnaZvoqz0PPrhbj9OIKd0fhhlREdNhIAke5MgIaAPAy721rDrahW+Klmx
   r9Isw6G3u2bTY51JAS9jph9Orhno3BGzEl39mdzZu76Sq4SUaVkUduCbp
   wcfsgp0m9q8G3eyjCXPyBC6+e5u4+vDHIrkTG7jn3jmSTHlHzyeV02pUd
   YUCLgnGgOrOb0LpXnUtq7nWdZqZE141ygrAYYNAtrYSWHkvYtNubc3YWP
   Q==;
X-CSE-ConnectionGUID: oTC3Gm4fRVaotwTxdYgv1A==
X-CSE-MsgGUID: 9vBEkMfaSyyRC1gh8mUqDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="36416854"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="36416854"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 16:03:40 -0700
X-CSE-ConnectionGUID: d6D1rS+QQ3OeypUY+ui2jg==
X-CSE-MsgGUID: XFKQ64oETCi2AVnD5V8eqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="138124448"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 May 2025 16:03:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEFho-000E3r-34;
	Sun, 11 May 2025 23:03:36 +0000
Date: Mon, 12 May 2025 07:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/futex] BUILD SUCCESS
 094ac8cff7858bee5fa4554f6ea66c964f8e160e
Message-ID: <202505120724.ykqqEE8Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/futex
branch HEAD: 094ac8cff7858bee5fa4554f6ea66c964f8e160e  futex: Relax the rcu_assign_pointer() assignment of mm->futex_phash in futex_mm_init()

elapsed time: 858m

configs tested: 129
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
arc                   randconfig-001-20250511    gcc-10.5.0
arc                   randconfig-002-20250511    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20250511    clang-18
arm                   randconfig-002-20250511    clang-21
arm                   randconfig-003-20250511    gcc-8.5.0
arm                   randconfig-004-20250511    gcc-7.5.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250511    clang-21
arm64                 randconfig-002-20250511    clang-21
arm64                 randconfig-003-20250511    clang-21
arm64                 randconfig-004-20250511    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250511    gcc-12.4.0
csky                  randconfig-002-20250511    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250511    clang-21
hexagon               randconfig-002-20250511    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250511    clang-20
i386        buildonly-randconfig-002-20250511    gcc-12
i386        buildonly-randconfig-003-20250511    clang-20
i386        buildonly-randconfig-004-20250511    clang-20
i386        buildonly-randconfig-005-20250511    clang-20
i386        buildonly-randconfig-006-20250511    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250511    gcc-14.2.0
loongarch             randconfig-002-20250511    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250511    gcc-10.5.0
nios2                 randconfig-002-20250511    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250511    gcc-11.5.0
parisc                randconfig-002-20250511    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     asp8347_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250511    clang-21
powerpc               randconfig-002-20250511    clang-21
powerpc               randconfig-003-20250511    clang-21
powerpc64             randconfig-001-20250511    gcc-6.5.0
powerpc64             randconfig-002-20250511    gcc-6.5.0
powerpc64             randconfig-003-20250511    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250511    gcc-8.5.0
riscv                 randconfig-002-20250511    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250511    gcc-9.3.0
s390                  randconfig-002-20250511    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20250511    gcc-10.5.0
sh                    randconfig-002-20250511    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250511    gcc-7.5.0
sparc                 randconfig-002-20250511    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250511    gcc-5.5.0
sparc64               randconfig-002-20250511    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250511    clang-19
um                    randconfig-002-20250511    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250511    clang-20
x86_64      buildonly-randconfig-002-20250511    clang-20
x86_64      buildonly-randconfig-003-20250511    clang-20
x86_64      buildonly-randconfig-004-20250511    clang-20
x86_64      buildonly-randconfig-005-20250511    gcc-12
x86_64      buildonly-randconfig-006-20250511    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250511    gcc-11.5.0
xtensa                randconfig-002-20250511    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
