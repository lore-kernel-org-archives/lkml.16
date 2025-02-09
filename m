Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80480243378
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739105088; cv=none; b=MIvhsedO7X6AXgPttu/FjD0Y657exeZT2mof3ZGfRVzNPp/SPOpKcFY8fW7G2FtIMR6wxpBV+NFugbQyGTMJodNMZXEgF33EEETMA8m32v2l5XdWl87L7CenDZ//B+7NLKYOK8iCeUH0MSnBli2aKkP9zQBBybgq1c4q6jje82g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739105088; c=relaxed/simple;
	bh=zgTTGYt0CPOAWOeFZUn6ZSrHCoi6z1QWiS0kmN4qIts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s6gwxHwwDn8g3SYH6LK8kH1/pwwkNAMnfN4z8MDtjtLinK52Zt7V2b9iggkrBH/Afdf6N7U5WqFh4VLWVUmc/+yUOElx2kApRDq9MAErQ3kI1XjbE/dVA26E3kBDFQ7df5QG8Cu+AeAzaj4Ur41uAH8pM8YmezJ+UkNB0yoVdM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfgso2Aj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfgso2Aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739105087; x=1770641087;
  h=date:from:to:cc:subject:message-id;
  bh=zgTTGYt0CPOAWOeFZUn6ZSrHCoi6z1QWiS0kmN4qIts=;
  b=lfgso2AjGiB5fG6z91DJY4dZx9JNO+ByvJu471QkuCN/Lew6OpN/6rMO
   GDZNSRBvNjVUzo3fMsjW0xFI3WDBR9vH9QvKZlXVQkUUTTEYGUPBljeP+
   h93eldfm4vBhzDHiJ37FmFU0dUSD4K4Cj5lVJNBBtE4EdgU762dbTqh9U
   57Op3urKAPE6PqwrxJT/GDvwVb2VJY9ZgCseUHbM1Zrhf50YNtkBl0jIn
   Dses31YIgxVw830azsNZ28N8H/L9uOki73gOLJvCDliT4KAv+B8V2fqoB
   LAI8znGJ1Qn96GI6wukwYMM+xlY1oXo3BeeWIO+H7FVk1QL0YijQgButT
   A==;
X-CSE-ConnectionGUID: PJG9BiATQACGg+z31FENmg==
X-CSE-MsgGUID: WZaIFNGSSb6JS2BeytPizw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51126448"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51126448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 04:44:46 -0800
X-CSE-ConnectionGUID: 2QpJZ/LTR2mTAJpC1okXTQ==
X-CSE-MsgGUID: zGuhWi9wQj28guerEzPifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111783870"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2025 04:44:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th6fx-0011SZ-2m;
	Sun, 09 Feb 2025 12:44:41 +0000
Date: Sun, 09 Feb 2025 20:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched/urgent] BUILD SUCCESS
 bcc6244e13b4d4903511a1ea84368abf925031c0
Message-ID: <202502092029.Q6ccrsH5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: bcc6244e13b4d4903511a1ea84368abf925031c0  sched: Clarify wake_up_q()'s write to task->wake_q.next

elapsed time: 739m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250209    gcc-13.2.0
arc                   randconfig-002-20250209    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250209    gcc-14.2.0
arm                   randconfig-002-20250209    clang-21
arm                   randconfig-003-20250209    clang-21
arm                   randconfig-004-20250209    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250209    clang-18
arm64                 randconfig-002-20250209    gcc-14.2.0
arm64                 randconfig-003-20250209    gcc-14.2.0
arm64                 randconfig-004-20250209    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250209    gcc-14.2.0
csky                  randconfig-002-20250209    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250209    clang-21
hexagon               randconfig-002-20250209    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250209    gcc-12
i386        buildonly-randconfig-002-20250209    clang-19
i386        buildonly-randconfig-003-20250209    clang-19
i386        buildonly-randconfig-004-20250209    gcc-12
i386        buildonly-randconfig-005-20250209    clang-19
i386        buildonly-randconfig-006-20250209    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250209    clang-19
i386                  randconfig-002-20250209    clang-19
i386                  randconfig-003-20250209    clang-19
i386                  randconfig-004-20250209    clang-19
i386                  randconfig-005-20250209    clang-19
i386                  randconfig-006-20250209    clang-19
i386                  randconfig-007-20250209    clang-19
i386                  randconfig-011-20250209    clang-19
i386                  randconfig-012-20250209    clang-19
i386                  randconfig-013-20250209    clang-19
i386                  randconfig-014-20250209    clang-19
i386                  randconfig-015-20250209    clang-19
i386                  randconfig-016-20250209    clang-19
i386                  randconfig-017-20250209    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250209    gcc-14.2.0
loongarch             randconfig-002-20250209    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250209    gcc-14.2.0
nios2                 randconfig-002-20250209    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250209    gcc-14.2.0
parisc                randconfig-002-20250209    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250209    gcc-14.2.0
powerpc               randconfig-002-20250209    clang-21
powerpc               randconfig-003-20250209    gcc-14.2.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250209    gcc-14.2.0
powerpc64             randconfig-002-20250209    gcc-14.2.0
powerpc64             randconfig-003-20250209    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250209    clang-18
riscv                 randconfig-002-20250209    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250209    clang-21
s390                  randconfig-002-20250209    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250209    gcc-14.2.0
sh                    randconfig-002-20250209    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250209    gcc-14.2.0
sparc                 randconfig-002-20250209    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250209    gcc-14.2.0
sparc64               randconfig-002-20250209    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250209    gcc-11
um                    randconfig-002-20250209    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250209    gcc-12
x86_64      buildonly-randconfig-002-20250209    gcc-12
x86_64      buildonly-randconfig-003-20250209    gcc-12
x86_64      buildonly-randconfig-004-20250209    gcc-12
x86_64      buildonly-randconfig-005-20250209    gcc-11
x86_64      buildonly-randconfig-006-20250209    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250209    gcc-12
x86_64                randconfig-002-20250209    gcc-12
x86_64                randconfig-003-20250209    gcc-12
x86_64                randconfig-004-20250209    gcc-12
x86_64                randconfig-005-20250209    gcc-12
x86_64                randconfig-006-20250209    gcc-12
x86_64                randconfig-007-20250209    gcc-12
x86_64                randconfig-008-20250209    gcc-12
x86_64                randconfig-071-20250209    gcc-12
x86_64                randconfig-072-20250209    gcc-12
x86_64                randconfig-073-20250209    gcc-12
x86_64                randconfig-074-20250209    gcc-12
x86_64                randconfig-075-20250209    gcc-12
x86_64                randconfig-076-20250209    gcc-12
x86_64                randconfig-077-20250209    gcc-12
x86_64                randconfig-078-20250209    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250209    gcc-14.2.0
xtensa                randconfig-002-20250209    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
