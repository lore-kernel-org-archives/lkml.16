Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D4A221FA4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375272; cv=none; b=sNMEozu2MWd7B/mNSq9b80CM3fO1hMsAKSPfF6upgaogFvCOjFSzDmCDnK/eXTyKpWJBPiF2jQHZXyg6wuLaovXc/AKeWpsFe6BqmUADLy2ckzIWD3hfkrEZWddK4+RD8JNdsvz3gY/bZZUFmol+q77JmbPSJmwAT+gz7rLidPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375272; c=relaxed/simple;
	bh=TvQF61JySWNmCGg6hn44ulWgP3Wy96QL8eH90+jGnlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WA1xcdTaONUWAzxj3DlS2QI+zP86AtidMc3COOz56R6SrNUPkZu6ye1rj6mzfUPfvWtpsSmpMbKpDcJEfqCvi+slsKAFNHk5LADfHzNxhVtQJONbzXIXwq3h8K73SrgHeDtuGxFWqKWO6fhCrri32IFAMqze5RyrF4dFlhdblI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYRgJhfF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYRgJhfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744375271; x=1775911271;
  h=date:from:to:cc:subject:message-id;
  bh=TvQF61JySWNmCGg6hn44ulWgP3Wy96QL8eH90+jGnlc=;
  b=JYRgJhfFC1hJWTLjPZxcxfWzsUwyoS1ciaKpREUwestchYqfn1nc9iY/
   mpQE7AKzErgAI83m66MNoWDyliTIyvSEf4z2Ke/0wbrSqj3NV8/Q28uKc
   kOHOnmb2XUghAqDv0fdK1LIIlCBnf++/1HRaFNFr2jlpNEnpr1PVTAEgE
   Z46gaBZV/fUn3KV5al7R0zK9ajIkdIRHwRpzR7F3pW1AjfcOZsFbYB2xm
   PDKZZZcajO1VAxLwD6Jw4nVWZmTagpAqmLcD/oXTvSfTuE6OieQBksxRV
   INgp8poGtfx56d5tFZekFPk3KTCm0/okPXwNb2VWU/4Aq9O/Z+XlKlcFT
   Q==;
X-CSE-ConnectionGUID: ljQ65PX8TIKUk+lY7Bs91A==
X-CSE-MsgGUID: PoByh8ULSFCwr7N3r77XiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="71311982"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="71311982"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:41:11 -0700
X-CSE-ConnectionGUID: Q5hA1CXfTESYsA7/JAcrYQ==
X-CSE-MsgGUID: miaQjgL4Ti6Byqg8vnZhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="152370128"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Apr 2025 05:41:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Dgx-000B66-2n;
	Fri, 11 Apr 2025 12:41:07 +0000
Date: Fri, 11 Apr 2025 20:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/asm] BUILD SUCCESS
 7615b94b6371dab5d7d8c1ca4f95ed3f866e1c51
Message-ID: <202504112010.ajqD07XV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
branch HEAD: 7615b94b6371dab5d7d8c1ca4f95ed3f866e1c51  selftests/kexec: Add x86_64 selftest for kexec-jump and exception handling

elapsed time: 1467m

configs tested: 108
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250410    gcc-14.2.0
arc                   randconfig-002-20250410    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                   randconfig-001-20250410    clang-21
arm                   randconfig-002-20250410    clang-18
arm                   randconfig-003-20250410    gcc-7.5.0
arm                   randconfig-004-20250410    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250410    clang-21
arm64                 randconfig-002-20250410    clang-21
arm64                 randconfig-003-20250410    gcc-6.5.0
arm64                 randconfig-004-20250410    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250410    gcc-14.2.0
csky                  randconfig-002-20250410    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250410    clang-21
hexagon               randconfig-002-20250410    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250410    clang-20
i386        buildonly-randconfig-002-20250410    clang-20
i386        buildonly-randconfig-003-20250410    clang-20
i386        buildonly-randconfig-004-20250410    gcc-11
i386        buildonly-randconfig-005-20250410    clang-20
i386        buildonly-randconfig-006-20250410    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250410    gcc-12.4.0
loongarch             randconfig-002-20250410    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250410    gcc-14.2.0
nios2                 randconfig-002-20250410    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250410    gcc-5.5.0
parisc                randconfig-002-20250410    gcc-11.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc               randconfig-001-20250410    gcc-6.5.0
powerpc               randconfig-002-20250410    gcc-6.5.0
powerpc               randconfig-003-20250410    clang-21
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250410    clang-21
powerpc64             randconfig-002-20250410    clang-21
powerpc64             randconfig-003-20250410    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250410    clang-21
riscv                 randconfig-002-20250410    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250410    clang-17
s390                  randconfig-002-20250410    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250410    gcc-12.4.0
sh                    randconfig-002-20250410    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250410    gcc-10.3.0
sparc                 randconfig-002-20250410    gcc-7.5.0
sparc64               randconfig-001-20250410    gcc-7.5.0
sparc64               randconfig-002-20250410    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250410    clang-21
um                    randconfig-002-20250410    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250410    clang-20
x86_64      buildonly-randconfig-002-20250410    gcc-12
x86_64      buildonly-randconfig-003-20250410    clang-20
x86_64      buildonly-randconfig-004-20250410    clang-20
x86_64      buildonly-randconfig-005-20250410    clang-20
x86_64      buildonly-randconfig-006-20250410    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250410    gcc-14.2.0
xtensa                randconfig-002-20250410    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
