Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038ED1FC0E6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116371; cv=none; b=UJCWg7gq4Y7QU2bbInAWSbUyPu2iQpR6us4ElqEwD3wUwB3wfe4OzOYZNXYzO4X2lUc5SJdnEAZo91rBfHUYuCM1YzgFIVNQf2uVhhnkTUUXNCn3cdD569mrDw9Is0YAF0+F1jJ1QyWfmbYslhUMyV5GMqPRUzHD0WmmgNR98UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116371; c=relaxed/simple;
	bh=4SpCrsJcQqI0YMa4rUn1cVMy8TGZeQt++dsexo5y5UU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UkML+0t8xywbWrUq1YOpush3JoV+WaaqXlMc4AvL2ps92QJqNZbXn0dFB2RKSKGf0fyQa0+Hfjg7sKJNwKNMCsWMgBS8q3v/Ke0WxfA8c6IruRt6zEoBMFZTW3pvqFh15IINPKRYzlAcWG/SF+uZ8Ew6Qd5EiQBtu9wMAOtTBKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn3rv/sm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn3rv/sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749116369; x=1780652369;
  h=date:from:to:cc:subject:message-id;
  bh=4SpCrsJcQqI0YMa4rUn1cVMy8TGZeQt++dsexo5y5UU=;
  b=hn3rv/smdQ5N9m76/i1GmQOsiBH0Pu8DOUgIxgnkDJRJZTRcgJJyVoOC
   IFhwzWYxiCa/kAooGOQ6zwq7VCpAp7b4deawunJRpVgkELZtH9f3PHRpi
   kZNqkocVV3PJ+ztFcnVe0SXkfziZyh9L3+ZUYQJB8c3OumdmZ++y6hnFe
   VmSO4vO3nciGOUsrGB0YieEO3t5WSFGVXfcRkQlQbm9aWdN6QLZ6l+UcH
   xe6MSj4cOqHb4jSy59fk+e0BiYgcPJgvYPXAj0yI/cjIvNgTRESgsexmC
   0HEGmqS9CV/39Q2lOIh9UbWOP3zfF/7BQp9Mdzkg3TWUIj9fCGJg/IjVB
   w==;
X-CSE-ConnectionGUID: ufiZZIIdQQWtL1gOTgXbyw==
X-CSE-MsgGUID: SZFo9oYkSGeOhGkrFQB1bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62618840"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="62618840"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:39:28 -0700
X-CSE-ConnectionGUID: 6Jov9F47Stmo3u8cK9kOxA==
X-CSE-MsgGUID: 3drn+mT3Qeq9AIGXThwfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="176323149"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2025 02:39:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN74G-0003xh-2r;
	Thu, 05 Jun 2025 09:39:24 +0000
Date: Thu, 05 Jun 2025 17:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 11ef58d03471a06395509d20ffc935049a3d4d6a
Message-ID: <202506051738.I5F5Df0W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 11ef58d03471a06395509d20ffc935049a3d4d6a  torture: Add textid.txt file to --do-allmodconfig and --do-rcu-rust runs

elapsed time: 725m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250605    clang-21
arc                   randconfig-002-20250605    clang-21
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                     davinci_all_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-21
arm                   randconfig-001-20250605    clang-21
arm                   randconfig-002-20250605    clang-21
arm                   randconfig-003-20250605    clang-21
arm                   randconfig-004-20250605    clang-21
arm                        spear6xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250605    clang-21
arm64                 randconfig-002-20250605    clang-21
arm64                 randconfig-003-20250605    clang-21
arm64                 randconfig-004-20250605    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250605    clang-21
csky                  randconfig-002-20250605    clang-21
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250605    clang-21
hexagon               randconfig-002-20250605    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250605    clang-20
i386        buildonly-randconfig-002-20250605    clang-20
i386        buildonly-randconfig-003-20250605    clang-20
i386        buildonly-randconfig-004-20250605    clang-20
i386        buildonly-randconfig-005-20250605    clang-20
i386        buildonly-randconfig-006-20250605    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250605    clang-20
i386                  randconfig-002-20250605    clang-20
i386                  randconfig-003-20250605    clang-20
i386                  randconfig-004-20250605    clang-20
i386                  randconfig-005-20250605    clang-20
i386                  randconfig-006-20250605    clang-20
i386                  randconfig-007-20250605    clang-20
i386                  randconfig-011-20250605    clang-20
i386                  randconfig-012-20250605    clang-20
i386                  randconfig-013-20250605    clang-20
i386                  randconfig-014-20250605    clang-20
i386                  randconfig-015-20250605    clang-20
i386                  randconfig-016-20250605    clang-20
i386                  randconfig-017-20250605    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250605    clang-21
loongarch             randconfig-002-20250605    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250605    clang-21
nios2                 randconfig-002-20250605    clang-21
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250605    clang-21
parisc                randconfig-002-20250605    clang-21
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc               randconfig-001-20250605    clang-21
powerpc               randconfig-002-20250605    clang-21
powerpc               randconfig-003-20250605    clang-21
powerpc64             randconfig-001-20250605    clang-21
powerpc64             randconfig-002-20250605    clang-21
powerpc64             randconfig-003-20250605    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250605    clang-21
riscv                 randconfig-002-20250605    clang-21
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250605    clang-21
s390                  randconfig-002-20250605    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-15.1.0
sh                          landisk_defconfig    clang-21
sh                    randconfig-001-20250605    clang-21
sh                    randconfig-002-20250605    clang-21
sh                          rsk7201_defconfig    clang-21
sh                          rsk7269_defconfig    clang-21
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250605    clang-21
sparc                 randconfig-002-20250605    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250605    clang-21
sparc64               randconfig-002-20250605    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250605    clang-21
um                    randconfig-002-20250605    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250605    clang-20
x86_64      buildonly-randconfig-002-20250605    clang-20
x86_64      buildonly-randconfig-003-20250605    clang-20
x86_64      buildonly-randconfig-004-20250605    clang-20
x86_64      buildonly-randconfig-005-20250605    clang-20
x86_64      buildonly-randconfig-006-20250605    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250605    gcc-12
x86_64                randconfig-002-20250605    gcc-12
x86_64                randconfig-003-20250605    gcc-12
x86_64                randconfig-004-20250605    gcc-12
x86_64                randconfig-005-20250605    gcc-12
x86_64                randconfig-006-20250605    gcc-12
x86_64                randconfig-007-20250605    gcc-12
x86_64                randconfig-008-20250605    gcc-12
x86_64                randconfig-071-20250605    clang-20
x86_64                randconfig-072-20250605    clang-20
x86_64                randconfig-073-20250605    clang-20
x86_64                randconfig-074-20250605    clang-20
x86_64                randconfig-075-20250605    clang-20
x86_64                randconfig-076-20250605    clang-20
x86_64                randconfig-077-20250605    clang-20
x86_64                randconfig-078-20250605    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250605    clang-21
xtensa                randconfig-002-20250605    clang-21
xtensa                    xip_kc705_defconfig    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
