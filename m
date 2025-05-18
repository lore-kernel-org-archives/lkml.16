Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB518A55
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747596365; cv=none; b=Pl6fOD0Kb0YOQ7ZLh6jGt1FdPf8fwOvBUW9/phpyKeKpSvWBYCkKK9/RrOIWcM/pdw8bQGtwXAcedQCQ6pueNUaoy4ogpE8eZvj+v9HpMK+eIfsmQPHn/CZWVG/LLVDJrRc2Dg07yIRoqRy6fqyJnFt4nZtOibDkOL8GWdJqQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747596365; c=relaxed/simple;
	bh=B1pU+kV+pbL7LjDJphGWA3UTf5S63LjMGb67LL14bfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oJY+1wv5GyonQrN5zvrs4i98Qwk1ksDHVEf4nmQfJTUmu7sNmQkGsZnBokqolNP0AzWEE6IKMgERJdZXBMCDZtqYkurzSrhIf89iy29N9HHtU5MFheLjDaD/2FBNw8ROQo7CLJ7wHqKJiHh3MmnF/b0b8usTm6Zz/jg+z9HPvBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgEM0rtK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgEM0rtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747596362; x=1779132362;
  h=date:from:to:cc:subject:message-id;
  bh=B1pU+kV+pbL7LjDJphGWA3UTf5S63LjMGb67LL14bfU=;
  b=GgEM0rtKpiHnvyNxPkBxozOP1YKgQWOtS/er3Kjg9LuBrSPPUFOVLrfH
   cQBm3RRMUZXGuLE4vHa91LI0Zy/eVqP+GzrMqlwoG1RhkLNP+QX/Ye9LW
   CD9ZdwYxBQ7pxPSj7dAvsjIy19xrlBCK57VjY7Q/95PiBJg5gwXwLBNlv
   23En3w2WKuCIw3wAreqycun9MOjHKshrEfNkn72OE1/5q45QuNiCfXqa1
   xyVBhErutnPIRvwR6p1lJuNxmMHdo9QPSEEoRNGLh8NFHXqwo3O4+1waQ
   6qPLjhMOZCybIk8ROctSVjk0N0kE5b7LWtUK4AtU7LJkxt0ip6EE3aY0m
   A==;
X-CSE-ConnectionGUID: IwWW4I9xQ9q8VNZzjIa3gw==
X-CSE-MsgGUID: F6QWWo1QSDC2ru5HaLGmSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="67050827"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="67050827"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 12:26:01 -0700
X-CSE-ConnectionGUID: mEjmWsqpSzq+nNDl7aorTw==
X-CSE-MsgGUID: GJsT22gORmyBAAAIQwmT+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="170104382"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2025 12:26:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGje2-000L0B-0s;
	Sun, 18 May 2025 19:25:58 +0000
Date: Mon, 19 May 2025 03:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 0a07e59b3b29f97a746e0960869234009042e697
Message-ID: <202505190310.7PmipwlX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 0a07e59b3b29f97a746e0960869234009042e697  Merge branch into tip/master: 'x86/sgx'

elapsed time: 723m

configs tested: 132
configs skipped: 3

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
arc                   randconfig-001-20250518    gcc-14.2.0
arc                   randconfig-002-20250518    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250518    gcc-10.5.0
arm                   randconfig-002-20250518    clang-21
arm                   randconfig-003-20250518    gcc-7.5.0
arm                   randconfig-004-20250518    clang-16
arm                           stm32_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250518    gcc-7.5.0
arm64                 randconfig-002-20250518    clang-21
arm64                 randconfig-003-20250518    clang-21
arm64                 randconfig-004-20250518    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250518    gcc-14.2.0
csky                  randconfig-002-20250518    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250518    clang-21
hexagon               randconfig-002-20250518    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250518    gcc-12
i386        buildonly-randconfig-002-20250518    clang-20
i386        buildonly-randconfig-003-20250518    gcc-12
i386        buildonly-randconfig-004-20250518    gcc-12
i386        buildonly-randconfig-005-20250518    gcc-12
i386        buildonly-randconfig-006-20250518    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250518    gcc-13.3.0
loongarch             randconfig-002-20250518    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250518    gcc-5.5.0
nios2                 randconfig-002-20250518    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250518    gcc-8.5.0
parisc                randconfig-002-20250518    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250518    gcc-7.5.0
powerpc               randconfig-002-20250518    gcc-5.5.0
powerpc               randconfig-003-20250518    clang-21
powerpc64             randconfig-001-20250518    gcc-10.5.0
powerpc64             randconfig-002-20250518    gcc-7.5.0
powerpc64             randconfig-003-20250518    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250518    clang-21
riscv                 randconfig-002-20250518    clang-20
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250518    gcc-7.5.0
s390                  randconfig-002-20250518    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250518    gcc-13.3.0
sh                    randconfig-002-20250518    gcc-7.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250518    gcc-12.4.0
sparc                 randconfig-002-20250518    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250518    gcc-6.5.0
sparc64               randconfig-002-20250518    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250518    clang-19
um                    randconfig-002-20250518    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250518    gcc-12
x86_64      buildonly-randconfig-002-20250518    clang-20
x86_64      buildonly-randconfig-003-20250518    gcc-12
x86_64      buildonly-randconfig-004-20250518    gcc-12
x86_64      buildonly-randconfig-005-20250518    gcc-12
x86_64      buildonly-randconfig-006-20250518    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250518    gcc-12.4.0
xtensa                randconfig-002-20250518    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
