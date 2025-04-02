Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6E01DE3CA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582682; cv=none; b=hb/KmHTrQc9X6eS2Ww+cSXXso0kghgrTf2upvtseRPGNOC+f3RWKagUK79Pb0fz7iqdIeOP23zMgkF5xTD4AMawTvoaPt7VZThemOnxcGf0Yl2AgzXr4n/lwFzGqWhCMY4Hrd4sySXloV/5FM+QvBgdlT0f5ozGxhqx4EhgB14k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582682; c=relaxed/simple;
	bh=+BvzsBsnZhBYfAtOGTDGEH/a2H1EcVUmVg8dCVI3/jU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A7JDPCy76lpQKt+kbC9/27ddFG2LKCZ7qFueyB1uj/0CpUcAgYBp7iDSfU8lcRm82aMwhNLtC3fi5SsN5GdF0pTpQL32U+9Oj66E76ceBlfqUIYlpjLyd3e7IKiKx3OosIITbAlYQBGwBlSZKmLWOeWF/+O04hG55BuCOiMvsrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oif41D3E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oif41D3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743582680; x=1775118680;
  h=date:from:to:cc:subject:message-id;
  bh=+BvzsBsnZhBYfAtOGTDGEH/a2H1EcVUmVg8dCVI3/jU=;
  b=Oif41D3EbBVeEOerO9fF8JGSe+n3r7iNxuJBYbcPVywyu57lpS424LRa
   wQD/kV83xZzR5ME1gex8zZlqhaImcdIk/OHbK5mnxQKc0jb98kL7gV7Vy
   RDJhF5eVcDdOYfVawf3pOhvF/Ci1VsAh+ZtmpDxv6hqGl/Z74vN5xI7Vt
   bFt7ewibE7Nl8u6eAOZIA7Dt7qoicdUFThfgdeNYDwOi5xN7o1qtBNPNh
   Je2JMXkpyEJNoB2rJ0Nvff2oVRaRNzqUSEoXw1lWJ2LvEkxhj8knigubk
   t7O1dTOj9R3ZTzi+8jBylziHEy5f0cwL1Wa9bhcLMRxOVNX6Oq8SoY5eY
   w==;
X-CSE-ConnectionGUID: DqSA7jtRSPiuaEHiBzz1ZA==
X-CSE-MsgGUID: a57rCAeQS0ymfhw+9pKYQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55928339"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="55928339"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 01:31:19 -0700
X-CSE-ConnectionGUID: G0q9UAT5Q3q3UDt7ZI5xRQ==
X-CSE-MsgGUID: Hnyla76+RZGM4SHgFLIQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="127115473"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2025 01:31:17 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tztVD-000AZq-2C;
	Wed, 02 Apr 2025 08:31:15 +0000
Date: Wed, 02 Apr 2025 16:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:WIP.x86/msr] BUILD SUCCESS
 297f2b0c16c6dc64ce67dab3600c853eaeac6ec7
Message-ID: <202504021632.1xg4Vnkm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/msr
branch HEAD: 297f2b0c16c6dc64ce67dab3600c853eaeac6ec7  x86/msr: Rename 'wrmsrl_cstar()' to 'wrmsrq_cstar()'

elapsed time: 1450m

configs tested: 168
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250401    gcc-12.4.0
arc                   randconfig-001-20250402    gcc-14.2.0
arc                   randconfig-002-20250401    gcc-14.2.0
arc                   randconfig-002-20250402    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250401    gcc-7.5.0
arm                   randconfig-001-20250402    clang-20
arm                   randconfig-002-20250401    gcc-8.5.0
arm                   randconfig-002-20250402    clang-16
arm                   randconfig-003-20250401    clang-18
arm                   randconfig-003-20250402    clang-20
arm                   randconfig-004-20250401    clang-14
arm                   randconfig-004-20250402    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250401    clang-21
arm64                 randconfig-001-20250402    gcc-5.5.0
arm64                 randconfig-002-20250401    clang-20
arm64                 randconfig-002-20250402    gcc-7.5.0
arm64                 randconfig-003-20250401    gcc-8.5.0
arm64                 randconfig-003-20250402    gcc-9.5.0
arm64                 randconfig-004-20250401    gcc-6.5.0
arm64                 randconfig-004-20250402    clang-17
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250401    gcc-14.2.0
csky                  randconfig-001-20250402    gcc-9.3.0
csky                  randconfig-002-20250401    gcc-10.5.0
csky                  randconfig-002-20250402    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250401    clang-21
hexagon               randconfig-001-20250402    clang-21
hexagon               randconfig-002-20250401    clang-21
hexagon               randconfig-002-20250402    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250401    gcc-12
i386        buildonly-randconfig-001-20250402    gcc-12
i386        buildonly-randconfig-002-20250401    clang-20
i386        buildonly-randconfig-002-20250402    gcc-12
i386        buildonly-randconfig-003-20250401    clang-20
i386        buildonly-randconfig-003-20250402    gcc-12
i386        buildonly-randconfig-004-20250401    clang-20
i386        buildonly-randconfig-004-20250402    gcc-12
i386        buildonly-randconfig-005-20250401    gcc-12
i386        buildonly-randconfig-005-20250402    gcc-11
i386        buildonly-randconfig-006-20250401    clang-20
i386        buildonly-randconfig-006-20250402    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250401    gcc-14.2.0
loongarch             randconfig-001-20250402    gcc-14.2.0
loongarch             randconfig-002-20250401    gcc-14.2.0
loongarch             randconfig-002-20250402    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250401    gcc-8.5.0
nios2                 randconfig-001-20250402    gcc-7.5.0
nios2                 randconfig-002-20250401    gcc-6.5.0
nios2                 randconfig-002-20250402    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250401    gcc-11.5.0
parisc                randconfig-001-20250402    gcc-14.2.0
parisc                randconfig-002-20250401    gcc-5.5.0
parisc                randconfig-002-20250402    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc               randconfig-001-20250401    clang-21
powerpc               randconfig-001-20250402    clang-21
powerpc               randconfig-002-20250401    gcc-8.5.0
powerpc               randconfig-002-20250402    gcc-9.3.0
powerpc               randconfig-003-20250401    clang-20
powerpc               randconfig-003-20250402    clang-21
powerpc                     tqm8560_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250401    clang-21
powerpc64             randconfig-001-20250402    clang-21
powerpc64             randconfig-002-20250401    clang-17
powerpc64             randconfig-002-20250402    clang-21
powerpc64             randconfig-003-20250401    gcc-6.5.0
powerpc64             randconfig-003-20250402    gcc-5.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250401    clang-21
riscv                 randconfig-001-20250402    gcc-9.3.0
riscv                 randconfig-002-20250401    clang-14
riscv                 randconfig-002-20250402    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250401    clang-15
s390                  randconfig-001-20250402    clang-15
s390                  randconfig-002-20250401    gcc-9.3.0
s390                  randconfig-002-20250402    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250401    gcc-12.4.0
sh                    randconfig-001-20250402    gcc-7.5.0
sh                    randconfig-002-20250401    gcc-12.4.0
sh                    randconfig-002-20250402    gcc-7.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250401    gcc-11.5.0
sparc                 randconfig-001-20250402    gcc-12.4.0
sparc                 randconfig-002-20250401    gcc-7.5.0
sparc                 randconfig-002-20250402    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250401    gcc-9.3.0
sparc64               randconfig-001-20250402    gcc-14.2.0
sparc64               randconfig-002-20250401    gcc-13.3.0
sparc64               randconfig-002-20250402    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250401    gcc-12
um                    randconfig-001-20250402    gcc-12
um                    randconfig-002-20250401    gcc-11
um                    randconfig-002-20250402    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250401    clang-20
x86_64      buildonly-randconfig-002-20250401    gcc-12
x86_64      buildonly-randconfig-003-20250401    clang-20
x86_64      buildonly-randconfig-004-20250401    clang-20
x86_64      buildonly-randconfig-005-20250401    gcc-12
x86_64      buildonly-randconfig-006-20250401    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250401    gcc-9.3.0
xtensa                randconfig-001-20250402    gcc-8.5.0
xtensa                randconfig-002-20250401    gcc-13.3.0
xtensa                randconfig-002-20250402    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
