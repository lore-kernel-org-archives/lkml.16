Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A631F2364
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739267812; cv=none; b=P+C76hnFaFHSqa23rJ/DjL7MvhOENiod1gSrnJCm9C5m2QEl1suxNgHj5cc48Wr5frs07hmUpJG42uVAss/qeJZiBE9sMax8n7js/eglfftdhiI8IEriSIgB+hu4QMfz2rq4L0LKqMrxAVGxRJlk11B/qzuhFfMSxXj7gzBKOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739267812; c=relaxed/simple;
	bh=lzt/vpCXcofodjI+n12ZDp/rfMSy+dSoFTU8up2tsbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hB76KINLyGVXHOnGBf1tcTbwCG4VQ/+VVx0tk5pc6z/w2fVRCounPjv+b7Zvwl2/O5C4hS9FJb3Q8M4cg173mAA1D9jAPAIclW1p6voMivTemuO54C7Sgiuj7guDpmVsDdnpU4sWXQG3PkOH6vYrgRz5FPmTdAWGgii3qEXc71c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q655K2GZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q655K2GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739267810; x=1770803810;
  h=date:from:to:cc:subject:message-id;
  bh=lzt/vpCXcofodjI+n12ZDp/rfMSy+dSoFTU8up2tsbI=;
  b=Q655K2GZIxTotL86wY3dC37OsWD7kBzGoBlvxdCyvTpcs8IPaB8P3kLl
   aO9xB7V1DBAR3+nJWeu73EqybMZR2E6RKubsLkw/VmuwqxEIRXyPVRxU8
   k+tLvAy1/N6D4nvXIldiC3GhcdE/yRu5Kv1Os0oUzFf5wh8EXAp84HqmY
   ftJQTgo9y97o0Wpfk+7z/AI/LCPqZO5ncPA8nBq/rKY6kb64PGP9ozwro
   MqsLbXZBOP+c0AkJnyXJYkVr3Zftn4QNgc86JWUPnsXDEfV1HqCLHoS9t
   9AUyNhjR11BEWPpp9YGiBi/ubDMenTdD4EmMFmG0skYDxv6GEpddzT/RY
   Q==;
X-CSE-ConnectionGUID: OnfUP0EkQeyLBc/LlJ3KeQ==
X-CSE-MsgGUID: yigHoV0ZRJOGMJPj5AzOsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39075627"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39075627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:56:49 -0800
X-CSE-ConnectionGUID: L2qfAEwwT/a24uCet/ZQLQ==
X-CSE-MsgGUID: wtPIixsQTFShd31DXut1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="143318848"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 01:56:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thn0X-0013zh-2h;
	Tue, 11 Feb 2025 09:56:45 +0000
Date: Tue, 11 Feb 2025 17:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 e9aa9417a3e82667c9246419c45ea71cfd633eaa
Message-ID: <202502111734.4ShcEHyM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: e9aa9417a3e82667c9246419c45ea71cfd633eaa  Merge branch into tip/master: 'x86/mm'

elapsed time: 1459m

configs tested: 157
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-001-20250211    clang-19
arc                   randconfig-002-20250210    gcc-13.2.0
arc                   randconfig-002-20250211    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-001-20250211    clang-19
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-002-20250211    clang-19
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-003-20250211    clang-19
arm                   randconfig-004-20250210    gcc-14.2.0
arm                   randconfig-004-20250211    clang-19
arm                             rpc_defconfig    clang-17
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-001-20250211    clang-19
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-002-20250211    clang-19
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-003-20250211    clang-19
arm64                 randconfig-004-20250210    gcc-14.2.0
arm64                 randconfig-004-20250211    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250210    clang-21
hexagon               randconfig-002-20250210    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-001-20250211    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-002-20250211    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-003-20250211    gcc-12
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-004-20250211    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-005-20250211    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386        buildonly-randconfig-006-20250211    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250210    gcc-14.2.0
loongarch             randconfig-002-20250210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250210    clang-21
powerpc               randconfig-002-20250210    clang-21
powerpc               randconfig-003-20250210    gcc-14.2.0
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250210    gcc-14.2.0
powerpc64             randconfig-002-20250210    gcc-14.2.0
powerpc64             randconfig-003-20250210    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-001-20250211    clang-15
riscv                 randconfig-002-20250210    gcc-14.2.0
riscv                 randconfig-002-20250211    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-001-20250211    clang-15
s390                  randconfig-002-20250210    clang-19
s390                  randconfig-002-20250211    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-001-20250211    clang-15
sh                    randconfig-002-20250210    gcc-14.2.0
sh                    randconfig-002-20250211    clang-15
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250210    gcc-14.2.0
sparc                 randconfig-001-20250211    clang-15
sparc                 randconfig-002-20250210    gcc-14.2.0
sparc                 randconfig-002-20250211    clang-15
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250210    gcc-14.2.0
sparc64               randconfig-001-20250211    clang-15
sparc64               randconfig-002-20250210    gcc-14.2.0
sparc64               randconfig-002-20250211    clang-15
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250210    clang-18
um                    randconfig-001-20250211    clang-15
um                    randconfig-002-20250210    clang-16
um                    randconfig-002-20250211    clang-15
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-001-20250211    clang-15
xtensa                randconfig-002-20250210    gcc-14.2.0
xtensa                randconfig-002-20250211    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
