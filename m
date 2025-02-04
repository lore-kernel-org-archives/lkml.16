Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794216B3A1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666974; cv=none; b=k83yXtMVcDcPIbNc4dTVWjOetrj3FAKI6ilc234rUJeaYu1cR0DgzzHgQ8WMoJdiSUK1NVc6JTFTK96KqEP/ISUqz+a43Q9t2Ycfeji/PdLlYSW3ft+LfvJw31uahgP1ITAPcRLP22biGOW3MeuD22hz5hkaqnCgF7zz0Ox7nKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666974; c=relaxed/simple;
	bh=4xZQiqZO8DUm2TFSd6oAqAdjoui62QESi7492Gc3e3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sqmVOa9e8pmfhxuUH1LOvhsDRVMG5xf0VtBLx8LrruWISmUyUP1xt26ZCz6bJRFar1mgAcIcAl1Ssm4ATtIzj6ErsQieE7jTkB21pnUzDHMqciQGFoiOFK8l70bCc9aJk5iNcenT2h9LQJ85mqek2JaB6D0UjIX7pY01xgsb2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/wbinGS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/wbinGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738666972; x=1770202972;
  h=date:from:to:cc:subject:message-id;
  bh=4xZQiqZO8DUm2TFSd6oAqAdjoui62QESi7492Gc3e3w=;
  b=k/wbinGSO1Gj+z75PJKlT/4+4LikhODdr0/3Y0xdeWHNESRRxcS5JDpu
   n+oJg5kkStwiRwgEoRN2hmoJLrc3T99/i7CYfW16vid9AUZBT8EcBVU6n
   lU8y5pjAxlRrR0bYc5pxSmOQ0fwZqNA1V+O0Nn3U5Zy3PC7UruSK7Z5x/
   1vRaue596GwXoVpsTLSbZM+v12Svsxz+WDbDeyTWw7oDbc4U2Q/MUAk89
   FDhsaUl/bhyv+DQyK/5HPjdVTcx7tKe6uD1oYBj02JStYX10Mfp/mWUYt
   GP4xE+AlNHWaKLDtw/+bj9RqsidDTvBRwi/9WppeCpOrUnagCXLXepdoJ
   g==;
X-CSE-ConnectionGUID: aiHs4fvCQwaFGNuQmQtKxQ==
X-CSE-MsgGUID: H7XcubN6STuiiNKfZy1pFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50577875"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50577875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 03:02:51 -0800
X-CSE-ConnectionGUID: P6hMLG+MS3WtGL+H8OLUhQ==
X-CSE-MsgGUID: He3dr4djSXGYn8VG/oOQng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="141450057"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 03:02:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfGhb-000sN7-2D;
	Tue, 04 Feb 2025 11:02:47 +0000
Date: Tue, 04 Feb 2025 19:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/mm] BUILD SUCCESS
 3ef938c3503563bfc2ac15083557f880d29c2e64
Message-ID: <202502041919.NzlLbd7g-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
branch HEAD: 3ef938c3503563bfc2ac15083557f880d29c2e64  x86/mm: Fix flush_tlb_range() when used for zapping normal PMDs

elapsed time: 1388m

configs tested: 246
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250203    gcc-13.2.0
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-002-20250203    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-21
arm                       netwinder_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-001-20250204    gcc-13.2.0
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-002-20250204    gcc-13.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-003-20250204    gcc-13.2.0
arm                   randconfig-004-20250203    gcc-14.2.0
arm                   randconfig-004-20250204    gcc-13.2.0
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-001-20250204    gcc-13.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-002-20250204    gcc-13.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-003-20250204    gcc-13.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
arm64                 randconfig-004-20250204    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250203    clang-21
hexagon               randconfig-001-20250204    gcc-14.2.0
hexagon               randconfig-002-20250203    clang-21
hexagon               randconfig-002-20250204    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-002-20250204    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-003-20250204    gcc-12
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-005-20250204    gcc-12
i386        buildonly-randconfig-006-20250203    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250204    clang-19
i386                  randconfig-002-20250204    clang-19
i386                  randconfig-003-20250204    clang-19
i386                  randconfig-004-20250204    clang-19
i386                  randconfig-005-20250204    clang-19
i386                  randconfig-006-20250204    clang-19
i386                  randconfig-007-20250204    clang-19
i386                  randconfig-011-20250204    clang-19
i386                  randconfig-012-20250204    clang-19
i386                  randconfig-013-20250204    clang-19
i386                  randconfig-014-20250204    clang-19
i386                  randconfig-015-20250204    clang-19
i386                  randconfig-016-20250204    clang-19
i386                  randconfig-017-20250204    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    clang-21
m68k                        mvme16x_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250203    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250203    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250203    gcc-14.2.0
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250203    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-21
powerpc                     kmeter1_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    clang-21
powerpc                      pasemi_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250203    clang-21
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250203    clang-16
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc               randconfig-003-20250204    gcc-14.2.0
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    clang-18
powerpc64             randconfig-002-20250204    gcc-14.2.0
powerpc64             randconfig-003-20250203    gcc-14.2.0
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250203    clang-16
riscv                 randconfig-001-20250204    gcc-14.2.0
riscv                 randconfig-002-20250203    gcc-14.2.0
riscv                 randconfig-002-20250204    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-001-20250204    gcc-14.2.0
s390                  randconfig-002-20250203    clang-21
s390                  randconfig-002-20250204    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-001-20250204    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                    randconfig-002-20250204    gcc-14.2.0
sh                           se7750_defconfig    clang-21
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-001-20250204    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc                 randconfig-002-20250204    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-001-20250204    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
sparc64               randconfig-002-20250204    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-001-20250204    gcc-14.2.0
um                    randconfig-002-20250203    clang-18
um                    randconfig-002-20250204    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-004-20250204    clang-19
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250204    clang-19
x86_64                randconfig-002-20250204    clang-19
x86_64                randconfig-003-20250204    clang-19
x86_64                randconfig-004-20250204    clang-19
x86_64                randconfig-005-20250204    clang-19
x86_64                randconfig-006-20250204    clang-19
x86_64                randconfig-007-20250204    clang-19
x86_64                randconfig-008-20250204    clang-19
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250204    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-21
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-001-20250204    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0
xtensa                randconfig-002-20250204    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
