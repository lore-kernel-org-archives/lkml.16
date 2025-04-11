Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019051FBE83
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385007; cv=none; b=u7PZCAFdPxKEdROVBq4BPQeDyTi2YjBKFuOQXwWReHn9cVZpLv7m05Mon/1IauCCQYHCesjZNCqbGCBGBpjEDMbrwlOPOvlUy+UKhBvYwibGTWMEEQNAr/sRXm/aRkbCT74FGTBkDYOSfanBkJhZ/2pYd5QRclfsFEcMoW/vL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385007; c=relaxed/simple;
	bh=Dja6mY71DcS4qKppQYMTmXKJayc5RV62c8J/s5wyVdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JFqM6Wjb8aaRY1vacpxQm5Y/N1bS25KoFUrFO20Jgc1CJog/J3gIA2oEQ5WXfVfep2aG1M8LP9Ej3OaHtzloIgAx2N/MoO/ygRvVs2WVqklcslvRM6jOcxuB8YgVi9e6UpovZJ5pgsEshACvZmLlp7k2vytmiWrM09gKeqqRciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEL/+naP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEL/+naP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744385006; x=1775921006;
  h=date:from:to:cc:subject:message-id;
  bh=Dja6mY71DcS4qKppQYMTmXKJayc5RV62c8J/s5wyVdk=;
  b=LEL/+naPmxphu4rQRULbbbjXypaAyv5uoDcTR16lxJN0ZIRiC+0b65bA
   NhoYkw0ahB72pW2t40gWuV5ykFPgUaY44Vg6txWITyo+hH7Uk9xauR8Ew
   6HNnTNIljOWr7LLXJBYqICnYt45FrtZs+nOsK3pqliNDpub4X6Is5xqi3
   h2T+EzK50c0Co4cSg59euhrnag5xEr4cR2pk5wJ9sym/PN5VOV/TKRENs
   pzL5bZ2Bzt0O92WO+WHvlzcvqFtf5zBGe13cE1Wfc1cPXlms++936LMc5
   PIS/Bk5mHnebYTITGtiKd/LSXebqU1PFjkjIXzzAWhOgNWqzkbh4axAua
   Q==;
X-CSE-ConnectionGUID: HZlobhUKTwyVBg3EDuPTpg==
X-CSE-MsgGUID: glQA870EQRe+zLjhSBNkKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49773570"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="49773570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 08:23:25 -0700
X-CSE-ConnectionGUID: l4GcA5CESZeFD2gEnyHQkA==
X-CSE-MsgGUID: d4buSRtJSk2uDcTLmnd60w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="133979167"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2025 08:23:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3GDy-000BBK-1H;
	Fri, 11 Apr 2025 15:23:22 +0000
Date: Fri, 11 Apr 2025 23:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/core] BUILD SUCCESS
 1732e45b79bbb38cccc336ae1c2a5101e7c9e876
Message-ID: <202504112332.cLkenEma-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
branch HEAD: 1732e45b79bbb38cccc336ae1c2a5101e7c9e876  genirq: Fix typo in IRQ_NOTCONNECTED comment

elapsed time: 1456m

configs tested: 81
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                   randconfig-001-20250411    gcc-14.2.0
arc                   randconfig-002-20250411    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250411    clang-21
arm                   randconfig-002-20250411    clang-21
arm                   randconfig-003-20250411    gcc-6.5.0
arm                   randconfig-004-20250411    gcc-6.5.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250411    gcc-9.5.0
arm64                 randconfig-002-20250411    gcc-9.5.0
arm64                 randconfig-003-20250411    clang-21
arm64                 randconfig-004-20250411    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250411    gcc-14.2.0
csky                  randconfig-002-20250411    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250411    clang-21
hexagon               randconfig-002-20250411    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250411    gcc-12
i386        buildonly-randconfig-002-20250411    gcc-12
i386        buildonly-randconfig-003-20250411    gcc-12
i386        buildonly-randconfig-004-20250411    clang-20
i386        buildonly-randconfig-005-20250411    gcc-11
i386        buildonly-randconfig-006-20250411    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250411    gcc-14.2.0
loongarch             randconfig-002-20250411    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250411    gcc-9.3.0
nios2                 randconfig-002-20250411    gcc-7.5.0
parisc                randconfig-001-20250411    gcc-14.2.0
parisc                randconfig-002-20250411    gcc-8.5.0
powerpc               randconfig-001-20250411    gcc-9.3.0
powerpc               randconfig-002-20250411    clang-21
powerpc               randconfig-003-20250411    clang-21
powerpc64             randconfig-001-20250411    gcc-5.5.0
powerpc64             randconfig-002-20250411    gcc-5.5.0
powerpc64             randconfig-003-20250411    clang-21
riscv                 randconfig-001-20250411    gcc-9.3.0
riscv                 randconfig-002-20250411    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250411    clang-19
s390                  randconfig-002-20250411    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250411    gcc-11.5.0
sh                    randconfig-002-20250411    gcc-5.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250411    gcc-10.3.0
sparc                 randconfig-002-20250411    gcc-14.2.0
sparc64               randconfig-001-20250411    gcc-8.5.0
sparc64               randconfig-002-20250411    gcc-8.5.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250411    clang-17
um                    randconfig-002-20250411    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250411    gcc-11
x86_64      buildonly-randconfig-002-20250411    gcc-11
x86_64      buildonly-randconfig-003-20250411    clang-20
x86_64      buildonly-randconfig-004-20250411    gcc-12
x86_64      buildonly-randconfig-005-20250411    clang-20
x86_64      buildonly-randconfig-006-20250411    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250411    gcc-12.4.0
xtensa                randconfig-002-20250411    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
