Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666A1F561D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745527495; cv=none; b=KTbxQLCCpY2mNTusg1/jqSFZVCtwgbGgu6u8SnZHgb+zKfDwOnOVkYX7fx1ShAIhML8Tnso2lI1/ZTZoMi+KCJVStIOXUPhaVxDRXqHZM7apV+JqR1jclEHO4LVsAp6ttEo88nwn7G2I0fSfZKk93AVA2EePawqdxMfp6FVKeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745527495; c=relaxed/simple;
	bh=3yznIqySNOQb8XfUsCyztiFwTtcuut+Lqj9R9UCwAKo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EiF/pqExDj9nIyelcUe2bm2KvHvwnhf7l9yX23a0qk2TGNI4lNcWLmrRoFlaaoiq4i42L+ADI/52pomtP3U6P0U1EZMUQdfSw2rt7hk4yVGTiP5+g9XAjFh5vYcGVKSy1Oqd9J3vq30p+6XNa1IQ7nwhdHx58fyWGbp5EufrAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ry7PUO4M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ry7PUO4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745527493; x=1777063493;
  h=date:from:to:cc:subject:message-id;
  bh=3yznIqySNOQb8XfUsCyztiFwTtcuut+Lqj9R9UCwAKo=;
  b=Ry7PUO4MYoaHS6sa4H4xwAagtPCIeqfv1j4Gb8pFCxJyIIXdGVrxOUBA
   nNYJZ6aFxsbH1wILRaAiQntQeqWgbYt3qXiWfoFps64hQQuZMexdyGchb
   01J0QGhq47ALlDhsQYkelS3WOt8nrvE2WXCiGZ4mQMO2IPpeP5sdGoZRC
   3C31DZPqVv2QHdrMpeI+/usBNwOqSNm5dwZYjWBUq0h6YVrm/Q/gMz1Vf
   CkptUGrsAZB9EwULUfKt1bCrJaxRwltL6OlcybHTk+gOA2eSAEyCcJ1fa
   zjvCmmxrdIGWc7gLxtRLOaBWoBN4bN/Tz5YwWtKpMRvHGyDQ+ir6jLuHm
   g==;
X-CSE-ConnectionGUID: 0UDbZY2HTrmWrEdzgnMnWg==
X-CSE-MsgGUID: tGjivW7VQBmCFIH8+62OIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57828729"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="57828729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 13:44:52 -0700
X-CSE-ConnectionGUID: gd8EvODbQSWATKUm5vbR1g==
X-CSE-MsgGUID: ZZ9J15F8TnGGFO/D4UkCvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="136796027"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Apr 2025 13:44:51 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u83RB-0004ZZ-21;
	Thu, 24 Apr 2025 20:44:49 +0000
Date: Fri, 25 Apr 2025 04:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.04.22a] BUILD SUCCESS
 4722a317baa676ce587b4346bed9fc2d025ae6f0
Message-ID: <202504250413.IDbDEJuT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.04.22a
branch HEAD: 4722a317baa676ce587b4346bed9fc2d025ae6f0  tools/memory-model/Documentation: Fix SRCU section in explanation.txt

elapsed time: 1455m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250424    gcc-8.5.0
arc                   randconfig-002-20250424    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-19
arm                   randconfig-001-20250424    gcc-7.5.0
arm                   randconfig-002-20250424    gcc-7.5.0
arm                   randconfig-003-20250424    clang-21
arm                   randconfig-004-20250424    clang-21
arm                           sama7_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250424    clang-21
arm64                 randconfig-002-20250424    gcc-8.5.0
arm64                 randconfig-003-20250424    clang-21
arm64                 randconfig-004-20250424    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250424    gcc-12.4.0
csky                  randconfig-002-20250424    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250424    clang-21
hexagon               randconfig-002-20250424    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250424    gcc-12
i386        buildonly-randconfig-002-20250424    clang-20
i386        buildonly-randconfig-003-20250424    clang-20
i386        buildonly-randconfig-004-20250424    clang-20
i386        buildonly-randconfig-005-20250424    gcc-12
i386        buildonly-randconfig-006-20250424    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250424    gcc-14.2.0
loongarch             randconfig-002-20250424    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250424    gcc-10.5.0
nios2                 randconfig-002-20250424    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250424    gcc-9.3.0
parisc                randconfig-002-20250424    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250424    clang-21
powerpc               randconfig-002-20250424    clang-17
powerpc               randconfig-003-20250424    clang-21
powerpc64             randconfig-001-20250424    clang-21
powerpc64             randconfig-002-20250424    clang-21
powerpc64             randconfig-003-20250424    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250424    clang-21
riscv                 randconfig-002-20250424    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250424    gcc-9.3.0
s390                  randconfig-002-20250424    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250424    gcc-12.4.0
sh                    randconfig-002-20250424    gcc-6.5.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250424    gcc-10.3.0
sparc                 randconfig-002-20250424    gcc-11.5.0
sparc64               randconfig-001-20250424    gcc-9.3.0
sparc64               randconfig-002-20250424    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250424    clang-21
um                    randconfig-002-20250424    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250424    gcc-12
x86_64      buildonly-randconfig-002-20250424    clang-20
x86_64      buildonly-randconfig-003-20250424    gcc-12
x86_64      buildonly-randconfig-004-20250424    clang-20
x86_64      buildonly-randconfig-005-20250424    clang-20
x86_64      buildonly-randconfig-006-20250424    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250424    gcc-14.2.0
xtensa                randconfig-002-20250424    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
