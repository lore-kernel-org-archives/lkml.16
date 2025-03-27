Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54AD528
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743035842; cv=none; b=P02wkGC9b6h1nq34s05FkiJv9j4Hos6WvG29oB3Zt+FiXI2JLcrnAIW5D92jX17omwoTj2WmWmx/vwiHezLcdzTVH0wkTmP8GbWuFuBjrLxzO0fA20oIKK69PGf/swmg5mljChMkARE9avsp9X/6niGPbHqJK89k5AE3JoXWA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743035842; c=relaxed/simple;
	bh=t9CPf5M6ZkPLWCDPkDoefSVWJEylpY9RWrgUWpf38ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5QFSMnbvOj8zNARN+/raEcSsffUSNS0THLDXSW+CPShmc2lnJ3ujM77LgvYs7kQsNVcdDQZpOvLjo2+w+XV9Xsl2K9mwIg7Ipp6uL1oUkrgYavhE90BR4r1CMUExsVy6vUrvbMgKnfWduRVFbFF5apkavRaIJLnQPgyCpbVHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0kYe8Ct; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0kYe8Ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743035840; x=1774571840;
  h=date:from:to:cc:subject:message-id;
  bh=t9CPf5M6ZkPLWCDPkDoefSVWJEylpY9RWrgUWpf38ho=;
  b=c0kYe8Ct/8no5f+gEWk2BHALYghtczU81BnQku111Q88jECbeOsn87Q4
   vwkkhHGHObGMpPmbA8E/JzYWJAUkc5S9C6S9H15J0NvCLFWlxxwXTz19U
   1Klf7so55FZoaPHuzYV5brvu84BADfW+8eVdql0QavwXWPgCeW6Q9dcpx
   xoAv8hpZWpkdJeBSk5vB3ueNv/Pw8AgFncE3XZmXIzPvhMKEnus/r6k9b
   rPO7ackK+o9RBzj/vspsD8L9dkcV9VpR9ObkFkYaP6dd+cNoMTYzxvfeV
   3p4aW3z/1BxEFnqKhImp7lLESBoj+EkkVBUIVnL0XRL04FuroFKfwomUz
   A==;
X-CSE-ConnectionGUID: Qq2rfmjlQqqoI2lFfsUePw==
X-CSE-MsgGUID: Gl8qu8vcTJG5kZiJXcHonA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48138351"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="48138351"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 17:37:20 -0700
X-CSE-ConnectionGUID: KLrMuUEMRsygf2XQygSctQ==
X-CSE-MsgGUID: Z8C4MReOTsK8HXk/0M+n9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="124758517"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2025 17:37:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txbFE-0006Ep-1w;
	Thu, 27 Mar 2025 00:37:16 +0000
Date: Thu, 27 Mar 2025 08:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 d991a1c5b192146237df66348e6e225f12b829dd
Message-ID: <202503270813.w31tSh3N-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: d991a1c5b192146237df66348e6e225f12b829dd  srcu: Make FORCE_NEED_SRCU_NMI_SAFE depend on RCU_EXPERT

elapsed time: 1442m

configs tested: 57
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20250326    gcc-14.2.0
arc                  randconfig-002-20250326    gcc-8.5.0
arm                  randconfig-001-20250326    gcc-7.5.0
arm                  randconfig-002-20250326    clang-21
arm                  randconfig-003-20250326    gcc-8.5.0
arm                  randconfig-004-20250326    clang-21
arm64                randconfig-001-20250326    clang-21
arm64                randconfig-002-20250326    clang-21
arm64                randconfig-003-20250326    gcc-8.5.0
arm64                randconfig-004-20250326    gcc-6.5.0
csky                 randconfig-001-20250326    gcc-14.2.0
csky                 randconfig-002-20250326    gcc-14.2.0
hexagon              randconfig-001-20250326    clang-21
hexagon              randconfig-002-20250326    clang-21
i386       buildonly-randconfig-001-20250326    gcc-12
i386       buildonly-randconfig-002-20250326    clang-20
i386       buildonly-randconfig-003-20250326    clang-20
i386       buildonly-randconfig-004-20250326    clang-20
i386       buildonly-randconfig-005-20250326    gcc-12
i386       buildonly-randconfig-006-20250326    clang-20
loongarch            randconfig-001-20250326    gcc-14.2.0
loongarch            randconfig-002-20250326    gcc-12.4.0
nios2                randconfig-001-20250326    gcc-12.4.0
nios2                randconfig-002-20250326    gcc-10.5.0
parisc               randconfig-001-20250326    gcc-13.3.0
parisc               randconfig-002-20250326    gcc-7.5.0
powerpc              randconfig-001-20250326    clang-21
powerpc              randconfig-002-20250326    gcc-6.5.0
powerpc              randconfig-003-20250326    clang-19
powerpc64            randconfig-001-20250326    clang-21
powerpc64            randconfig-002-20250326    gcc-8.5.0
powerpc64            randconfig-003-20250326    clang-21
riscv                randconfig-001-20250326    clang-21
riscv                randconfig-002-20250326    gcc-8.5.0
s390                            allmodconfig    clang-18
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250326    clang-15
s390                 randconfig-002-20250326    clang-15
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250326    gcc-6.5.0
sh                   randconfig-002-20250326    gcc-6.5.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250326    gcc-11.5.0
sparc                randconfig-002-20250326    gcc-5.5.0
sparc64              randconfig-001-20250326    gcc-5.5.0
sparc64              randconfig-002-20250326    gcc-11.5.0
um                   randconfig-001-20250326    clang-15
um                   randconfig-002-20250326    gcc-11
x86_64     buildonly-randconfig-001-20250326    clang-20
x86_64     buildonly-randconfig-002-20250326    gcc-11
x86_64     buildonly-randconfig-003-20250326    clang-20
x86_64     buildonly-randconfig-004-20250326    clang-20
x86_64     buildonly-randconfig-005-20250326    clang-20
x86_64     buildonly-randconfig-006-20250326    clang-20
xtensa               randconfig-001-20250326    gcc-7.5.0
xtensa               randconfig-002-20250326    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
