Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007D8C1E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684379; cv=none; b=LWuAC4KdM+QomHswXfGNyycbBO6S2S1pRSSY9oHPpb/iBMezvf3LPmbxaKa1LvgY5y+dfYewjC/CZK/5aCW2H9fCFIN/jXGfLXeXWKRyEPpslPdhG5HvL+j71bnkZe/scWjAK+b3M+09P5LeabZVH5O2rgq7+C59HtbF1lqZRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684379; c=relaxed/simple;
	bh=tS+HEM9P8uzRn+zEWZ27CkzrT2QBybu1J1kMfzBsqV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KB67Uz6Pn3DUJw5z8iihfGwRDyw5eHE/ogftWR3sK0e5fzkP03MoDs5XzKgz7sT2R+2glbBlwIG5vl1MNJWWyZ5iE4IIM9HBpjoQYKnQ0DeBJdPFQ/aWHnamAo6CySE9N3y0S5rwI/T9rPGqKQFtU2naPfwbHMrGBKcMCdi0FLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mORRwj88; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mORRwj88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746684378; x=1778220378;
  h=date:from:to:cc:subject:message-id;
  bh=tS+HEM9P8uzRn+zEWZ27CkzrT2QBybu1J1kMfzBsqV8=;
  b=mORRwj881cajNKnLMVv4F4Be+IQK02wB0D/H7Y+e7VOyleR11w1a6e8Q
   JWOoAvyqryiZOGIqjdm5Tw2oerfTdGMDyouN79cWa22ZEb2tww1IDQpZy
   l8JBkHrRLWe1purMRgiuNPRd975GxThbTkQNQBPXwCXQm/tpZGmRoT+jF
   XvHa2yzxDAjglcARBstKoVpJMvj+cGSVvqc3+WdedHHgV3PjIWYFyDv1o
   Or39YjXi8VyhHIwLdV2VREb2pau3uRzUQmiPmTuN6tZRIv0+RqLhZqkrC
   EIgkCYQd/1D7cGOK0Q6QnSSEIhKedglqAxWOEHnpzFL1+RNp16tGhjyzp
   w==;
X-CSE-ConnectionGUID: uI33ElsAQ8O/tOTxu2JPFw==
X-CSE-MsgGUID: xx19RS1yRJWRI+qyn/9NFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48558792"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48558792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 23:06:16 -0700
X-CSE-ConnectionGUID: OvgxHwM+RDGYpshk47qCbw==
X-CSE-MsgGUID: zQ+ieabQRwCGdQT7zv0yHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="135889672"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2025 23:06:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCuOb-000AYF-0C;
	Thu, 08 May 2025 06:06:13 +0000
Date: Thu, 08 May 2025 14:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/asm] BUILD SUCCESS
 4b626015e1bf119cd31d7e62f9bd9eb1412fce7b
Message-ID: <202505081433.8JMlR0hV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
branch HEAD: 4b626015e1bf119cd31d7e62f9bd9eb1412fce7b  x86/insn: Stop decoding i64 instructions in x86-64 mode at opcode

elapsed time: 2572m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    clang-19
alpha                  allyesconfig    gcc-14.2.0
alpha                     defconfig    gcc-14.2.0
arc                    allmodconfig    clang-19
arc                     allnoconfig    gcc-14.2.0
arc                    allyesconfig    clang-19
arc                       defconfig    gcc-14.2.0
arc         randconfig-001-20250506    gcc-8.5.0
arc         randconfig-002-20250506    gcc-12.4.0
arm                    allmodconfig    clang-19
arm                     allnoconfig    clang-21
arm                     allnoconfig    gcc-14.2.0
arm                    allyesconfig    clang-19
arm                       defconfig    gcc-14.2.0
arm         randconfig-001-20250506    clang-21
arm         randconfig-002-20250506    clang-21
arm         randconfig-003-20250506    clang-17
arm         randconfig-004-20250506    clang-21
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-14.2.0
arm64                     defconfig    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky                      defconfig    gcc-14.2.0
csky        randconfig-001-20250506    gcc-14.2.0
csky        randconfig-002-20250506    gcc-14.2.0
hexagon                allmodconfig    clang-17
hexagon                allmodconfig    clang-19
hexagon                 allnoconfig    clang-21
hexagon                 allnoconfig    gcc-14.2.0
hexagon                allyesconfig    clang-19
hexagon                allyesconfig    clang-21
hexagon                   defconfig    gcc-14.2.0
hexagon     randconfig-001-20250506    clang-21
hexagon     randconfig-002-20250506    clang-21
i386                   allmodconfig    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    clang-20
i386                    allnoconfig    gcc-12
i386                   allyesconfig    clang-20
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-20
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch                 defconfig    gcc-14.2.0
loongarch   randconfig-001-20250506    gcc-14.2.0
loongarch   randconfig-002-20250506    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
m68k                      defconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
microblaze                defconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2                     defconfig    gcc-14.2.0
nios2       randconfig-001-20250506    gcc-8.5.0
nios2       randconfig-002-20250506    gcc-6.5.0
openrisc                allnoconfig    clang-21
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    clang-21
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc      randconfig-001-20250506    gcc-11.5.0
parisc      randconfig-002-20250506    gcc-5.5.0
parisc64                  defconfig    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    clang-21
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    gcc-14.2.0
powerpc     randconfig-001-20250506    clang-21
powerpc     randconfig-002-20250506    gcc-8.5.0
powerpc     randconfig-003-20250506    gcc-8.5.0
riscv                  allmodconfig    gcc-14.2.0
riscv                   allnoconfig    clang-21
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    gcc-14.2.0
riscv       randconfig-001-20250506    clang-19
riscv       randconfig-002-20250506    clang-21
s390                   allmodconfig    clang-18
s390                   allmodconfig    gcc-14.2.0
s390                    allnoconfig    clang-21
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20250506    gcc-9.3.0
s390        randconfig-002-20250506    clang-21
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh          randconfig-001-20250506    gcc-12.4.0
sh          randconfig-002-20250506    gcc-12.4.0
sparc                  allmodconfig    gcc-14.2.0
sparc                   allnoconfig    gcc-14.2.0
sparc       randconfig-001-20250506    gcc-11.5.0
sparc       randconfig-002-20250506    gcc-6.5.0
sparc64     randconfig-001-20250506    gcc-7.5.0
sparc64     randconfig-002-20250506    gcc-5.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-21
um                     allyesconfig    clang-19
um                     allyesconfig    gcc-12
um          randconfig-001-20250506    clang-17
um          randconfig-002-20250506    clang-21
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    clang-20
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    clang-18
x86_64               rhel-9.4-kunit    clang-18
x86_64                 rhel-9.4-ltp    clang-18
x86_64                rhel-9.4-rust    clang-18
xtensa                  allnoconfig    gcc-14.2.0
xtensa      randconfig-001-20250506    gcc-13.3.0
xtensa      randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
