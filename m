Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4437257D
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747559357; cv=none; b=k/O1pJjcKWZ76izAbLWtJkvlNZieB5TqTXUJlddNUMBENqWuvj6Dk4rfd7TD8HoyMNgC9W9XrxREgZnnKgrFvAiefcfOPZPbUkAXe3qh+0uHnt8YrFU5j47xfcx9P/QJHEBrc02nYCphQsABfZ1gkDgXxNFHg9Pmv4QIElA+yj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747559357; c=relaxed/simple;
	bh=NQbRrwhK2QUiJWipP0CR2HNKrJaxl6WodKZ0WT+MP0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VA+JlY93PWxyHOO6yXs3mgs7sBe8M5K1UH+AXEnQa97ZvQYFMYbvEwJkpIZHPipXzWpVg+BhcfdYrygxPgYhJmiMcv82Zlge4Ok8GmhERiJwZc811zgFh7CzODFetYdW1WgBBfEwfcWozSQOm42MYARDFDA1smEWfQcjXXJliUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Orwp0jWO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Orwp0jWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747559356; x=1779095356;
  h=date:from:to:cc:subject:message-id;
  bh=NQbRrwhK2QUiJWipP0CR2HNKrJaxl6WodKZ0WT+MP0U=;
  b=Orwp0jWOq0/ZOouGsuptXj1DAWLinocuMecUMYwsuwmi3ZhKXQlJcPCC
   ep9gW8lJpqVENNu1fTuTPV9FVi/ZHbzf9BgLA7Gr3fMDF3hfvAHlXIcs+
   MtLBQJ+tuPAUXX1Eypoj0cHTly8/8gz3J+AysiGI1c4A7mR36GfJratdm
   BTSRVR88JVdyz4V0zQESo6P+Ys5tFrfapvPR8GC96UsFsP8snblGmRd6d
   SVfhHhfom/pcQN34BXyR+Fn55Is0dYeV0ZOenYEurKqPbpoPB6SPe3qve
   6xCPBOoof8FC4mkM4NCx5J7AbG814/1gZdEUMdnGsfELJBbYPQ/Lwijqm
   g==;
X-CSE-ConnectionGUID: fEnJjTs1TguZZdkjD0M4Jw==
X-CSE-MsgGUID: vSJ78c9FQn+b/bOIhEjLBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="37094968"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="37094968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 02:09:15 -0700
X-CSE-ConnectionGUID: tkLYkuonQkiHrQBz/4uWpg==
X-CSE-MsgGUID: pnBsK+uFT9aeCYTkwGH8eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139617033"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2025 02:09:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGa19-000KiJ-0l;
	Sun, 18 May 2025 09:09:11 +0000
Date: Sun, 18 May 2025 17:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/cache] BUILD SUCCESS
 54d14f25664bbb75c2928dd0d64a095c0f488176
Message-ID: <202505181745.katJr4fl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cache
branch HEAD: 54d14f25664bbb75c2928dd0d64a095c0f488176  MAINTAINERS: Add reviewers for fs/resctrl

elapsed time: 1389m

configs tested: 251
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250517    gcc-10.5.0
arc                   randconfig-002-20250517    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                           imxrt_defconfig    clang-21
arm                          moxart_defconfig    clang-21
arm                        multi_v5_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250517    clang-21
arm                   randconfig-002-20250517    gcc-8.5.0
arm                   randconfig-003-20250517    gcc-8.5.0
arm                   randconfig-004-20250517    clang-21
arm                        shmobile_defconfig    clang-21
arm                           stm32_defconfig    clang-21
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250517    clang-17
arm64                 randconfig-002-20250517    clang-16
arm64                 randconfig-003-20250517    gcc-6.5.0
arm64                 randconfig-004-20250517    gcc-8.5.0
csky                             alldefconfig    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250517    gcc-10.5.0
csky                  randconfig-001-20250518    gcc-10.5.0
csky                  randconfig-002-20250517    gcc-14.2.0
csky                  randconfig-002-20250518    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250517    clang-21
hexagon               randconfig-001-20250518    gcc-10.5.0
hexagon               randconfig-002-20250517    clang-21
hexagon               randconfig-002-20250518    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250517    clang-20
i386        buildonly-randconfig-002-20250517    clang-20
i386        buildonly-randconfig-003-20250517    clang-20
i386        buildonly-randconfig-004-20250517    gcc-12
i386        buildonly-randconfig-005-20250517    clang-20
i386        buildonly-randconfig-006-20250517    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250518    gcc-12
i386                  randconfig-002-20250518    gcc-12
i386                  randconfig-003-20250518    gcc-12
i386                  randconfig-004-20250518    gcc-12
i386                  randconfig-005-20250518    gcc-12
i386                  randconfig-006-20250518    gcc-12
i386                  randconfig-007-20250518    gcc-12
i386                  randconfig-011-20250518    gcc-12
i386                  randconfig-012-20250518    gcc-12
i386                  randconfig-013-20250518    gcc-12
i386                  randconfig-014-20250518    gcc-12
i386                  randconfig-015-20250518    gcc-12
i386                  randconfig-016-20250518    gcc-12
i386                  randconfig-017-20250518    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250517    gcc-14.2.0
loongarch             randconfig-001-20250518    gcc-10.5.0
loongarch             randconfig-002-20250517    gcc-14.2.0
loongarch             randconfig-002-20250518    gcc-10.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-21
mips                      maltaaprp_defconfig    clang-21
mips                        omega2p_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250517    gcc-14.2.0
nios2                 randconfig-001-20250518    gcc-10.5.0
nios2                 randconfig-002-20250517    gcc-10.5.0
nios2                 randconfig-002-20250518    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250517    gcc-5.5.0
parisc                randconfig-001-20250518    gcc-10.5.0
parisc                randconfig-002-20250517    gcc-11.5.0
parisc                randconfig-002-20250518    gcc-10.5.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-21
powerpc                      bamboo_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250517    gcc-6.5.0
powerpc               randconfig-001-20250518    gcc-10.5.0
powerpc               randconfig-002-20250517    gcc-6.5.0
powerpc               randconfig-002-20250518    gcc-10.5.0
powerpc               randconfig-003-20250517    clang-16
powerpc               randconfig-003-20250518    gcc-10.5.0
powerpc                    sam440ep_defconfig    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250517    clang-21
powerpc64             randconfig-001-20250518    gcc-10.5.0
powerpc64             randconfig-002-20250517    gcc-6.5.0
powerpc64             randconfig-002-20250518    gcc-10.5.0
powerpc64             randconfig-003-20250517    gcc-6.5.0
powerpc64             randconfig-003-20250518    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250517    clang-21
riscv                 randconfig-001-20250518    gcc-8.5.0
riscv                 randconfig-002-20250517    clang-21
riscv                 randconfig-002-20250518    gcc-8.5.0
s390                             alldefconfig    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250517    gcc-7.5.0
s390                  randconfig-001-20250518    gcc-8.5.0
s390                  randconfig-002-20250517    gcc-9.3.0
s390                  randconfig-002-20250518    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    clang-21
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-21
sh                          lboxre2_defconfig    clang-21
sh                    randconfig-001-20250517    gcc-12.4.0
sh                    randconfig-001-20250518    gcc-8.5.0
sh                    randconfig-002-20250517    gcc-10.5.0
sh                    randconfig-002-20250518    gcc-8.5.0
sh                           se7721_defconfig    clang-21
sh                           se7722_defconfig    clang-21
sh                        sh7763rdp_defconfig    clang-21
sh                        sh7785lcr_defconfig    clang-21
sh                            shmin_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250517    gcc-11.5.0
sparc                 randconfig-001-20250518    gcc-8.5.0
sparc                 randconfig-002-20250517    gcc-7.5.0
sparc                 randconfig-002-20250518    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250517    gcc-7.5.0
sparc64               randconfig-001-20250518    gcc-8.5.0
sparc64               randconfig-002-20250517    gcc-5.5.0
sparc64               randconfig-002-20250518    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250517    gcc-12
um                    randconfig-001-20250518    gcc-8.5.0
um                    randconfig-002-20250517    gcc-12
um                    randconfig-002-20250518    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250517    gcc-12
x86_64      buildonly-randconfig-001-20250518    clang-20
x86_64      buildonly-randconfig-002-20250517    gcc-12
x86_64      buildonly-randconfig-002-20250518    clang-20
x86_64      buildonly-randconfig-003-20250517    clang-20
x86_64      buildonly-randconfig-003-20250518    clang-20
x86_64      buildonly-randconfig-004-20250517    clang-20
x86_64      buildonly-randconfig-004-20250518    clang-20
x86_64      buildonly-randconfig-005-20250517    clang-20
x86_64      buildonly-randconfig-005-20250518    clang-20
x86_64      buildonly-randconfig-006-20250517    clang-20
x86_64      buildonly-randconfig-006-20250518    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250518    clang-20
x86_64                randconfig-002-20250518    clang-20
x86_64                randconfig-003-20250518    clang-20
x86_64                randconfig-004-20250518    clang-20
x86_64                randconfig-005-20250518    clang-20
x86_64                randconfig-006-20250518    clang-20
x86_64                randconfig-007-20250518    clang-20
x86_64                randconfig-008-20250518    clang-20
x86_64                randconfig-071-20250518    gcc-12
x86_64                randconfig-072-20250518    gcc-12
x86_64                randconfig-073-20250518    gcc-12
x86_64                randconfig-074-20250518    gcc-12
x86_64                randconfig-075-20250518    gcc-12
x86_64                randconfig-076-20250518    gcc-12
x86_64                randconfig-077-20250518    gcc-12
x86_64                randconfig-078-20250518    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250517    gcc-9.3.0
xtensa                randconfig-001-20250518    gcc-8.5.0
xtensa                randconfig-002-20250517    gcc-13.3.0
xtensa                randconfig-002-20250518    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
