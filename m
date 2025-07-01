Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA2274FFC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382808; cv=none; b=oF/AcT7IR+aJQdj1q+EVSQHt1VZdEoDPG3JwYFy1jtZmIGstWEukSW6ijZvmHCwOiZhfQsCVQScr0zZOvl8eQdJzBCMDjxl+z1CaEEP/Dhf4PbQpFmGyxbuIKZGdQpAEcjRsd3+EmQBC224X/eLj/RoKHAIwVv87mYw4mI6sgdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382808; c=relaxed/simple;
	bh=1uzBIXOnAiZPEixbcJsq6n4TZt5l7HkXQcGoiN96/zk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J+h9Uy3iRDLVVZWF/Q/vC1KcF4uNCoM85xCsbnCXNpUc+60dT3VRA/uNvRlFCEf7+kiUR0TCATXHUoY3xqQEBy1KImV2q64/dlhu4NnFsVWVLw/awjyNF1g7UNxgimfFYh1ndhEDeaZRASpWbF9SZby5cX90UpGu5ZaOXwVL+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWPZkTgy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWPZkTgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751382807; x=1782918807;
  h=date:from:to:cc:subject:message-id;
  bh=1uzBIXOnAiZPEixbcJsq6n4TZt5l7HkXQcGoiN96/zk=;
  b=mWPZkTgycVrkgR/LkTTmuB631rQszyyUjFnzlIwYzWhmtLeyLZPt3rM6
   a55VKlMLkg0e1an6D+r6Ntp1FAYjPXpusv9V0CGbIFTb6eaViHk7rFQfc
   O2PD0znH5ZkMDWrTyRafJq72XS1g1bNMTg6XojMYYf3oSccYw6OaiqVnw
   RaJQVGkTE+K4uUMyuJPQnbYizJJvsXlWD37/AOQTvsflEPMfzaiuP0ug3
   VWTL0VeJWAZIRZeyXAEhH/IbPwFdjdS4Zn3sRzGwM2rP+mSAmaDI1LYSo
   yuI7BUXpQ2GEE+vuZp2ZqqPofgU+PG1iJLUVen9Z1MKXSAJzLSUhqx75g
   Q==;
X-CSE-ConnectionGUID: mXOv2A2iTei00wj7K9FMSg==
X-CSE-MsgGUID: J76lipP2Q3y5gOlhqQUdHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57464173"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57464173"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 08:13:26 -0700
X-CSE-ConnectionGUID: VsfIa3k7QgyTjTZWzokRnQ==
X-CSE-MsgGUID: vSxmieicTgOgMsnKG/KzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154291004"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2025 08:13:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWcfi-000aM6-1F;
	Tue, 01 Jul 2025 15:13:22 +0000
Date: Tue, 01 Jul 2025 23:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/core] BUILD SUCCESS
 7ff495e26a39f3e7a3d4058df59b5b6d6f943cab
Message-ID: <202507012348.zz1YVKiC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
branch HEAD: 7ff495e26a39f3e7a3d4058df59b5b6d6f943cab  local_lock: Move this_cpu_ptr() notation from internal to main header

elapsed time: 1391m

configs tested: 248
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250701    gcc-13.3.0
arc                   randconfig-001-20250701    gcc-8.5.0
arc                   randconfig-002-20250701    gcc-15.1.0
arc                   randconfig-002-20250701    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                        mvebu_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250701    clang-17
arm                   randconfig-001-20250701    gcc-8.5.0
arm                   randconfig-002-20250701    gcc-8.5.0
arm                   randconfig-003-20250701    clang-21
arm                   randconfig-003-20250701    gcc-8.5.0
arm                   randconfig-004-20250701    clang-21
arm                   randconfig-004-20250701    gcc-8.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250701    clang-21
arm64                 randconfig-001-20250701    gcc-8.5.0
arm64                 randconfig-002-20250701    gcc-15.1.0
arm64                 randconfig-002-20250701    gcc-8.5.0
arm64                 randconfig-003-20250701    clang-18
arm64                 randconfig-003-20250701    gcc-8.5.0
arm64                 randconfig-004-20250701    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250701    gcc-11.5.0
csky                  randconfig-001-20250701    gcc-13.3.0
csky                  randconfig-002-20250701    gcc-10.5.0
csky                  randconfig-002-20250701    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250701    clang-21
hexagon               randconfig-001-20250701    gcc-13.3.0
hexagon               randconfig-002-20250701    clang-21
hexagon               randconfig-002-20250701    gcc-13.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250701    gcc-12
i386        buildonly-randconfig-002-20250701    gcc-12
i386        buildonly-randconfig-003-20250701    gcc-12
i386        buildonly-randconfig-004-20250701    gcc-12
i386        buildonly-randconfig-005-20250701    gcc-12
i386        buildonly-randconfig-006-20250701    clang-20
i386        buildonly-randconfig-006-20250701    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250701    clang-20
i386                  randconfig-002-20250701    clang-20
i386                  randconfig-003-20250701    clang-20
i386                  randconfig-004-20250701    clang-20
i386                  randconfig-005-20250701    clang-20
i386                  randconfig-006-20250701    clang-20
i386                  randconfig-007-20250701    clang-20
i386                  randconfig-011-20250701    clang-20
i386                  randconfig-012-20250701    clang-20
i386                  randconfig-013-20250701    clang-20
i386                  randconfig-014-20250701    clang-20
i386                  randconfig-015-20250701    clang-20
i386                  randconfig-016-20250701    clang-20
i386                  randconfig-017-20250701    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250701    gcc-13.3.0
loongarch             randconfig-002-20250701    gcc-13.3.0
loongarch             randconfig-002-20250701    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250701    gcc-13.3.0
nios2                 randconfig-001-20250701    gcc-14.2.0
nios2                 randconfig-002-20250701    gcc-13.3.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250701    gcc-13.3.0
parisc                randconfig-001-20250701    gcc-14.3.0
parisc                randconfig-002-20250701    gcc-10.5.0
parisc                randconfig-002-20250701    gcc-13.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250701    gcc-13.3.0
powerpc               randconfig-002-20250701    clang-21
powerpc               randconfig-002-20250701    gcc-13.3.0
powerpc               randconfig-003-20250701    clang-21
powerpc               randconfig-003-20250701    gcc-13.3.0
powerpc                     sequoia_defconfig    gcc-15.1.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64                        alldefconfig    gcc-15.1.0
powerpc64             randconfig-001-20250701    clang-21
powerpc64             randconfig-001-20250701    gcc-13.3.0
powerpc64             randconfig-002-20250701    clang-21
powerpc64             randconfig-002-20250701    gcc-13.3.0
powerpc64             randconfig-003-20250701    gcc-10.5.0
powerpc64             randconfig-003-20250701    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250701    gcc-12
riscv                 randconfig-001-20250701    gcc-14.3.0
riscv                 randconfig-002-20250701    gcc-10.5.0
riscv                 randconfig-002-20250701    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250701    gcc-12
s390                  randconfig-001-20250701    gcc-9.3.0
s390                  randconfig-002-20250701    clang-17
s390                  randconfig-002-20250701    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20250701    gcc-12
sh                    randconfig-001-20250701    gcc-15.1.0
sh                    randconfig-002-20250701    gcc-12
sh                    randconfig-002-20250701    gcc-13.3.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250701    gcc-10.3.0
sparc                 randconfig-001-20250701    gcc-12
sparc                 randconfig-002-20250701    gcc-12
sparc                 randconfig-002-20250701    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250701    gcc-12
sparc64               randconfig-001-20250701    gcc-8.5.0
sparc64               randconfig-002-20250701    gcc-12
sparc64               randconfig-002-20250701    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250701    gcc-12
um                    randconfig-002-20250701    gcc-12
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-15.1.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250701    gcc-12
x86_64      buildonly-randconfig-002-20250701    gcc-12
x86_64      buildonly-randconfig-003-20250701    gcc-12
x86_64      buildonly-randconfig-004-20250701    gcc-12
x86_64      buildonly-randconfig-005-20250701    clang-20
x86_64      buildonly-randconfig-005-20250701    gcc-12
x86_64      buildonly-randconfig-006-20250701    clang-20
x86_64      buildonly-randconfig-006-20250701    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250701    gcc-12
x86_64                randconfig-002-20250701    gcc-12
x86_64                randconfig-003-20250701    gcc-12
x86_64                randconfig-004-20250701    gcc-12
x86_64                randconfig-005-20250701    gcc-12
x86_64                randconfig-006-20250701    gcc-12
x86_64                randconfig-007-20250701    gcc-12
x86_64                randconfig-008-20250701    gcc-12
x86_64                randconfig-071-20250701    gcc-12
x86_64                randconfig-072-20250701    gcc-12
x86_64                randconfig-073-20250701    gcc-12
x86_64                randconfig-074-20250701    gcc-12
x86_64                randconfig-075-20250701    gcc-12
x86_64                randconfig-076-20250701    gcc-12
x86_64                randconfig-077-20250701    gcc-12
x86_64                randconfig-078-20250701    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250701    gcc-12
xtensa                randconfig-001-20250701    gcc-15.1.0
xtensa                randconfig-002-20250701    gcc-12
xtensa                randconfig-002-20250701    gcc-13.3.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
