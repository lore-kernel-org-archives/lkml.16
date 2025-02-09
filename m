Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0074A4C9F
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739090122; cv=none; b=iC2O/xlIGz+wpPPfsI/K415lbkm8fbVcAVRbHH+iXfgsoJd0ANe+Ym/XdZh/ZmUHgoFJTkPJ+fQyLx8nvh/Ak/TCR/B213dlwKmGX84LoGmN430b9di7oMJb4zqkgMglzpzS6NC7WukM1vB5gExHT+vrfpVTy2fK+yIAmUjriwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739090122; c=relaxed/simple;
	bh=HhN76xzeMQWGQtDWlLY3y0ZR2vVthOitYIh0TkH98L0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c/m0q2pVAxYLGeDouAiIc/pahyhAyFHbH8sc0ULtqs98qJj9E+9OtRVhqkCzlwJ40LfhhBggIGj/0ZUAuYR9dJqL23dioH886JRBB4XVc2hoG2NpcY/DjmEkB4yZj2v+/Q04PvD2mhdWekHSB/WIh6016M1vMtUi68R5OJD47bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvYCWCkY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvYCWCkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739090120; x=1770626120;
  h=date:from:to:cc:subject:message-id;
  bh=HhN76xzeMQWGQtDWlLY3y0ZR2vVthOitYIh0TkH98L0=;
  b=GvYCWCkYICXABfiWeBt0KV0BpHZWc5COzkrpsFvWBiyLFuMWveO0C+m0
   lbz2xLNWoZkfViMDkPkMMI5Lvd+YaK1N2RkSEU1CmI30jC85mVqkkOM+o
   AzV9rFuV6IK5isM81ISzYIX1v59OCqiGNmN3YTsyciooDPOJGdkTzj666
   +Kj+DXgiKlzHfhMGC7k3P9zDSZa46t6mJ4PjJuZ2mxac5E2HYaVt3WlOp
   RUL57Nyb0OlprAsu0TNgJ9wHESATmKuwceqxaUzPThWWfwIWhsYQQpEHW
   LtMYxpFz/PnhL2+R3WCXJ+bK2KdE1tLA6H1yU+CXnu5BlbCbI1jimUVGC
   A==;
X-CSE-ConnectionGUID: SiUIe2u+QAWvcFxFJj2PHA==
X-CSE-MsgGUID: vCBFHR1+TAqpGSFjbJ9ehA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39947541"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="39947541"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 00:35:19 -0800
X-CSE-ConnectionGUID: cEJ5/0ONRrGJJeTcjUa8sg==
X-CSE-MsgGUID: q9Lti3hRR6O3QNfK8r3Wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="112418159"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2025 00:35:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th2ma-0011Gd-0r;
	Sun, 09 Feb 2025 08:35:16 +0000
Date: Sun, 09 Feb 2025 16:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:objtool/urgent] BUILD SUCCESS
 7e501637bd5b702a2fa627e903a0025654110e1e
Message-ID: <202502091619.ONKnXfyR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
branch HEAD: 7e501637bd5b702a2fa627e903a0025654110e1e  objtool: Move dodgy linker warn to verbose

elapsed time: 998m

configs tested: 200
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250209    gcc-13.2.0
arc                   randconfig-002-20250209    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-13.2.0
arm                   randconfig-001-20250209    gcc-13.2.0
arm                   randconfig-001-20250209    gcc-14.2.0
arm                   randconfig-002-20250209    clang-21
arm                   randconfig-002-20250209    gcc-13.2.0
arm                   randconfig-003-20250209    clang-21
arm                   randconfig-003-20250209    gcc-13.2.0
arm                   randconfig-004-20250209    gcc-13.2.0
arm                   randconfig-004-20250209    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250209    clang-18
arm64                 randconfig-001-20250209    gcc-13.2.0
arm64                 randconfig-002-20250209    gcc-13.2.0
arm64                 randconfig-002-20250209    gcc-14.2.0
arm64                 randconfig-003-20250209    gcc-13.2.0
arm64                 randconfig-003-20250209    gcc-14.2.0
arm64                 randconfig-004-20250209    gcc-13.2.0
arm64                 randconfig-004-20250209    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250209    gcc-14.2.0
csky                  randconfig-002-20250209    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250209    clang-21
hexagon               randconfig-001-20250209    gcc-14.2.0
hexagon               randconfig-002-20250209    clang-21
hexagon               randconfig-002-20250209    gcc-14.2.0
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
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250209    gcc-14.2.0
loongarch             randconfig-002-20250209    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250209    gcc-14.2.0
nios2                 randconfig-002-20250209    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250209    gcc-14.2.0
parisc                randconfig-002-20250209    gcc-14.2.0
parisc64                         alldefconfig    gcc-13.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    gcc-13.2.0
powerpc               randconfig-001-20250209    gcc-14.2.0
powerpc               randconfig-002-20250209    clang-21
powerpc               randconfig-002-20250209    gcc-14.2.0
powerpc               randconfig-003-20250209    gcc-14.2.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250209    gcc-14.2.0
powerpc64             randconfig-002-20250209    gcc-14.2.0
powerpc64             randconfig-003-20250209    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250209    clang-18
riscv                 randconfig-001-20250209    gcc-14.2.0
riscv                 randconfig-002-20250209    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250209    clang-21
s390                  randconfig-001-20250209    gcc-14.2.0
s390                  randconfig-002-20250209    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250209    gcc-14.2.0
sh                    randconfig-002-20250209    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-13.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250209    gcc-14.2.0
sparc                 randconfig-002-20250209    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250209    gcc-14.2.0
sparc64               randconfig-002-20250209    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250209    gcc-11
um                    randconfig-001-20250209    gcc-14.2.0
um                    randconfig-002-20250209    gcc-12
um                    randconfig-002-20250209    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
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
x86_64                                  kexec    clang-19
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
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250209    gcc-14.2.0
xtensa                randconfig-002-20250209    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
