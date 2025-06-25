Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88D29AAF7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843821; cv=none; b=PpkuN0NDSeWQKR+6PM5hZ6go1i5BacqDu6ucoRTPbuoSAOWDl6zf3p5pnMwkapSyK6xdZsRGG6j1l16/U2dC8/M96tFRX5/N02si8R78JweXIjtL9YdcXJkkoT10Y19yYr5RB6NUs7po9MrsuTzG+r12MT+LTvmb7znW4S8iXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843821; c=relaxed/simple;
	bh=aaYgX3TKVBSeaHYQkGIdkBXfBIMcYV/Tr4cAK0xXsFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IAuUTiWwq3l182WtNpirlAx+JUySu/UnrpOVy3KFpK0w554vApq03fGzJg3eB1jmrbSLQLJ1hNzzPcH5HnnRo6KZ+RRueHIj8NDwLoxqMMTfc6gBrMv7YOgYFukBRpJ5uRSZVl7QbVgsu1RBf+JfgBIay0vwtQWsFYsIiqmmyRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR7EC3cL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR7EC3cL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750843820; x=1782379820;
  h=date:from:to:cc:subject:message-id;
  bh=aaYgX3TKVBSeaHYQkGIdkBXfBIMcYV/Tr4cAK0xXsFw=;
  b=lR7EC3cLRy5b2G7DBBuy6OnYk7AmtVc6p5wo7F4BJZbNMlHdXQs/YgQn
   uLpPnf8e3GEVe5A27CRuOitXiKmXaYrRuVHvmjGFxI7DzfxetUHrCzRxZ
   CIipvt1ZKgigWapTg+RUD5bvrAxEG4z7GGPCbVTrT+eWYhUhVMhlR0PHT
   abxOeSEubgHJZocTSeUToaSMlBbIZEiGM+uRghY80dDLI2Eu3ZwGtK492
   PIQFeJecBoQ7l1MtGOuWSUZhpdUV/y1eKe0GnZG+KBN2phlj5ZXoQSXGY
   XpAwe+ZGxbSXARR3yEZEQiSXwAGu0upZkjWztZ/QEkT294IEV2Azl/U24
   w==;
X-CSE-ConnectionGUID: Ua4C3cCBTg2AZs/nAqET9g==
X-CSE-MsgGUID: Nj3wRbPTRs6lOLfEzyXc+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53246485"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="53246485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:30:18 -0700
X-CSE-ConnectionGUID: isMwokfmR2i/1fuwU9X+fA==
X-CSE-MsgGUID: BvxrnqtlS9OEc+UeZ31Q5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152306151"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jun 2025 02:30:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUMSM-000Sx9-2M;
	Wed, 25 Jun 2025 09:30:14 +0000
Date: Wed, 25 Jun 2025 17:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 38580b01f6d83380415373a4d43406a0785a5ee9
Message-ID: <202506251703.OoUv39ld-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: 38580b01f6d83380415373a4d43406a0785a5ee9  Merge branch into tip/master: 'locking/urgent'

elapsed time: 1448m

configs tested: 57
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-004-20250624    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-004-20250624    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-006-20250624    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
