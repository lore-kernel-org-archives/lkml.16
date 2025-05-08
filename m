Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6951DE4DC
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674906; cv=none; b=cfH5zKULSMESIRQVZ2t1nCrzra8hxD2uXV0RiQN8LTSYt5wFSKf0dEPt4wDjvTYBGW6KdhcrGlh/L+PVeOtuC4OFfhKHHn64pY/BdgwYUedOhFfBsB7K/oEE+CN/jOugVUcf9oALHcwI6QUxsbHnX1E2mM/VYRL7ZSLY937f4yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674906; c=relaxed/simple;
	bh=c8nFFMxcfqaVoDAZ0wk09wvzmP7ztZbQ7lRJt36AzeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fmBqXkl1ve1ft0+o5D85trJGoLFscOOfWZNihU9/mpcHpmVhcrfKnwg7kCKuM9cJR0spDNxYc5o8KQ2gFKYEL3WmFdV3LqTtDSbO6BcIvAaPog07Q9fPoXFotp9TC3WKBU6O5TKDy0QQ05/rsMFNQgN+quw+3092RqQdPzHb9dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bv9iIsOL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bv9iIsOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746674904; x=1778210904;
  h=date:from:to:cc:subject:message-id;
  bh=c8nFFMxcfqaVoDAZ0wk09wvzmP7ztZbQ7lRJt36AzeE=;
  b=bv9iIsOLnXerMDVfYclpJpHu4DEF3mKU9k8pkLn7Yqf0MW1vdEgnY5Ls
   9kdWX+pWjKa3Lv7V5q4gRUY1GgnFqCdrj1ErxN+KQIs+u28PeLb4t+lyu
   paH2gybZmk66fIch1RkeYUCRKpmu6yM8rPZI/1hSpRSqS5hBxNe0QS1BU
   RUHA0hdLsmhwbAAigkr4imAtuSSmHTo0E8Ed5Nt3KIqSrfRnKAVSdgFeh
   sluO+4m/RrZ2z1lMnM6NFMt0WXRDu3K6iE1iMCxDEHhppcKP+IJHAwb9P
   FxeZErdk4cXPtFFp4eSeNtOm9DthUJzloYHbSJZ/rCdPgUGsFwnyoeEmi
   A==;
X-CSE-ConnectionGUID: fOMxe0ZQTDe2HI0lby+69g==
X-CSE-MsgGUID: mgZZ21W7RtiSaLGISrkRdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59790367"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59790367"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 20:28:24 -0700
X-CSE-ConnectionGUID: gYCBFRXsSICio4v6z4/mBw==
X-CSE-MsgGUID: QWnPYab+RISw+t3mwbAXqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136095888"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 20:28:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCrvo-0009j2-1b;
	Thu, 08 May 2025 03:28:20 +0000
Date: Thu, 08 May 2025 11:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250424] BUILD SUCCESS
 604833e5a102945aa4596b80085ef9cada5e6d57
Message-ID: <202505081133.YSZAinzd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250424
branch HEAD: 604833e5a102945aa4596b80085ef9cada5e6d57  overflow: Fix direct struct member initialization in _DEFINE_FLEX()

elapsed time: 10286m

configs tested: 140
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
arc                   randconfig-001-20250501    gcc-13.3.0
arc                   randconfig-002-20250501    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-18
arm                                 defconfig    clang-21
arm                   randconfig-001-20250501    gcc-10.5.0
arm                   randconfig-002-20250501    gcc-6.5.0
arm                   randconfig-003-20250501    gcc-6.5.0
arm                   randconfig-004-20250501    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250501    gcc-9.5.0
arm64                 randconfig-002-20250501    gcc-7.5.0
arm64                 randconfig-003-20250501    clang-21
arm64                 randconfig-004-20250501    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250501    gcc-13.3.0
csky                  randconfig-002-20250501    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250501    clang-21
hexagon               randconfig-002-20250501    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250501    gcc-12
i386        buildonly-randconfig-002-20250501    gcc-12
i386        buildonly-randconfig-003-20250501    clang-20
i386        buildonly-randconfig-004-20250501    clang-20
i386        buildonly-randconfig-005-20250501    clang-20
i386        buildonly-randconfig-006-20250501    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250501    gcc-14.2.0
loongarch             randconfig-002-20250501    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250501    gcc-7.5.0
nios2                 randconfig-002-20250501    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250501    gcc-14.2.0
parisc                randconfig-002-20250501    gcc-8.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-21
powerpc               randconfig-001-20250501    clang-21
powerpc               randconfig-002-20250501    gcc-7.5.0
powerpc               randconfig-003-20250501    clang-21
powerpc64             randconfig-001-20250501    clang-21
powerpc64             randconfig-002-20250501    gcc-10.5.0
powerpc64             randconfig-003-20250501    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250501    clang-21
riscv                 randconfig-002-20250501    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250501    clang-21
s390                  randconfig-002-20250501    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250501    gcc-9.3.0
sh                    randconfig-002-20250501    gcc-5.5.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250501    gcc-10.3.0
sparc                 randconfig-002-20250501    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250501    gcc-14.2.0
sparc64               randconfig-002-20250501    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250501    gcc-11
um                    randconfig-002-20250501    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250501    clang-20
x86_64      buildonly-randconfig-002-20250501    gcc-12
x86_64      buildonly-randconfig-003-20250501    gcc-11
x86_64      buildonly-randconfig-004-20250501    clang-20
x86_64      buildonly-randconfig-005-20250501    gcc-12
x86_64      buildonly-randconfig-006-20250501    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250501    gcc-14.2.0
xtensa                randconfig-002-20250501    gcc-12.4.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
