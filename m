Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA644219313
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607951; cv=none; b=RmqFl2NqpwUABJ1mpAIDQmB4ODDnUK89R06E0NVGOASmJP+NrJ9JL8/yAk3+HzqPz5tW8VG7sGoTm5JpdtXYfhf515v3zZ6e57z/3wQ7HpIjvZCJfjaIc/YN3E4sbmjdGBW9F1hdAv+botYku+tSHN5zRHHim+XL48JJaFpVin4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607951; c=relaxed/simple;
	bh=I6tcg4LOCvTHqKkq2YINtXecYUdGdj/z74rYmseILvs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r9hrRLW8W1ouWmsrk9TOUb/BMC4YsgAf8n92T3TxZQ79hQdfupyJEH3Tm5jYINh2jlbFKgbKDmHaK+SHYEgwxhyhD4p+pFqrGq6JSdnNqSSBeu9Jgr+0+Fcp7kDteA20ngUYHRwJlUUlQIBvY0xLrTKDDx6rkIz10hohB6CW7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBAjXyQM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBAjXyQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745607950; x=1777143950;
  h=date:from:to:cc:subject:message-id;
  bh=I6tcg4LOCvTHqKkq2YINtXecYUdGdj/z74rYmseILvs=;
  b=eBAjXyQMqm0YeQ79iwpKfAiAvmHHqaalKfRWvPQe+3US5M3AxxWUpD2h
   GARKJ6L2uI+ws/lv5FVhFO+Qmr2/bzaucn89xCNf/PH1Dvzs0rfEbzyZb
   wefAFRZFcBkriWiBVkCmnQBL9lC3pTeYgHiLUfV2KhVYj07VmK167U6rg
   wV/jpADZjT38TiRMLhxMm8IVgg8bAukI58h+ZpypijJPID1bL7m8OJvat
   mY3Og5sNhcYBYN+SPDuPbPqnskxoPfHsl6Ih1TOamI6nAfmsp6UAs7W1G
   AvdWmcY+LA40gpKICAokK5YzM14zfjlUQihcC6l7C7wLuCIj/xv5FDt8r
   A==;
X-CSE-ConnectionGUID: Wo6z0nNoRs+C8pH1D2soSw==
X-CSE-MsgGUID: chiR/RtNRFyVF/EFhl3euw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="46397034"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46397034"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 12:05:47 -0700
X-CSE-ConnectionGUID: dq9ZJ0yZQfG3y+Ku6426YA==
X-CSE-MsgGUID: LaABtgMNRHKWkgnMo+ArOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133476257"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Apr 2025 12:05:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8OMp-0005RM-2F;
	Fri, 25 Apr 2025 19:05:43 +0000
Date: Sat, 26 Apr 2025 03:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 85fd85bc025a525354acb2241beb3c5387c551ec
Message-ID: <202504260316.wWNawuiA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 85fd85bc025a525354acb2241beb3c5387c551ec  x86/insn: Fix CTEST instruction decoding

elapsed time: 1451m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250425    gcc-14.2.0
arc                   randconfig-002-20250425    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250425    clang-21
arm                   randconfig-002-20250425    gcc-6.5.0
arm                   randconfig-003-20250425    clang-21
arm                   randconfig-004-20250425    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250425    clang-21
arm64                 randconfig-002-20250425    gcc-7.5.0
arm64                 randconfig-003-20250425    gcc-7.5.0
arm64                 randconfig-004-20250425    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250425    gcc-13.3.0
csky                  randconfig-002-20250425    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250425    clang-21
hexagon               randconfig-002-20250425    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250425    gcc-12
i386        buildonly-randconfig-002-20250425    gcc-12
i386        buildonly-randconfig-003-20250425    clang-20
i386        buildonly-randconfig-004-20250425    gcc-12
i386        buildonly-randconfig-005-20250425    gcc-12
i386        buildonly-randconfig-006-20250425    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250426    clang-20
i386                  randconfig-002-20250426    clang-20
i386                  randconfig-003-20250426    clang-20
i386                  randconfig-004-20250426    clang-20
i386                  randconfig-005-20250426    clang-20
i386                  randconfig-006-20250426    clang-20
i386                  randconfig-007-20250426    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250425    gcc-14.2.0
loongarch             randconfig-002-20250425    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250425    gcc-5.5.0
nios2                 randconfig-002-20250425    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250425    gcc-10.5.0
parisc                randconfig-002-20250425    gcc-8.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250425    clang-21
powerpc               randconfig-002-20250425    gcc-9.3.0
powerpc               randconfig-003-20250425    gcc-9.3.0
powerpc64             randconfig-001-20250425    clang-21
powerpc64             randconfig-002-20250425    gcc-7.5.0
powerpc64             randconfig-003-20250425    gcc-10.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250425    gcc-14.2.0
riscv                 randconfig-002-20250425    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250425    clang-17
s390                  randconfig-002-20250425    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250425    gcc-7.5.0
sh                    randconfig-002-20250425    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250425    gcc-8.5.0
sparc                 randconfig-002-20250425    gcc-14.2.0
sparc64               randconfig-001-20250425    gcc-10.5.0
sparc64               randconfig-002-20250425    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250425    clang-21
um                    randconfig-002-20250425    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250425    gcc-12
x86_64      buildonly-randconfig-002-20250425    clang-20
x86_64      buildonly-randconfig-003-20250425    gcc-12
x86_64      buildonly-randconfig-004-20250425    gcc-12
x86_64      buildonly-randconfig-005-20250425    clang-20
x86_64      buildonly-randconfig-006-20250425    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250425    gcc-6.5.0
xtensa                randconfig-002-20250425    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
