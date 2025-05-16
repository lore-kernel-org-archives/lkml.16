Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6121FF2E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377019; cv=none; b=b1u6GDvxVwqArqGmtCHtAxTvHVGnah2fizVVh+RtNtG7dstoemKbl5ftue9VsijuCLmoUU3qxN8ePmbwhIClXUBjbFhfAgTeqx6AUihcS3CaNxEbCMgL6C5+33nnRmpjFmwNYJETz/LG6ojIINVeiRovYcwQ1dHzjJftYY212lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377019; c=relaxed/simple;
	bh=VUGan+omI6h4jj7V2lZJACg1h+Qseb8likTCCX8qd1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GE3OqZiZxf5PaABXx66HMIggHtysMl/O2CEx4yBCrRuZ9OM5Jzd+qMVSod0ppankkNk0dC0kFO7TeWlGUq/N5vIYxLdrhpF9OucjbnfC9cItuCG7TcLkQZBJQjx4dbTpPtE33JUWsVL8MRQCMjfZuM6SxQgmTg/aGNnuTOr3UOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myS+KzW7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myS+KzW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747377017; x=1778913017;
  h=date:from:to:cc:subject:message-id;
  bh=VUGan+omI6h4jj7V2lZJACg1h+Qseb8likTCCX8qd1o=;
  b=myS+KzW7h0zctrijnHhLo55MMuxGLn6Nb8dOkRwlP8pI5gDZl2RFLdDQ
   hQNLE6C2WVRFrtya8G91wSJ1cDAcz0GtHxathbOc6El1e+/USGspbrRfB
   dp1T7O0oRozx92hhjuyh1IbQyeRirW3HyU+N/Z9kg1IU8sjrWLMbn9L5L
   aORBpBUNMS7pCa/DA+kLAmPdnfht+hElMBNXMHItpvgzDTrFXijZAmrtd
   QA1N/4f5zjsfmNUnkST1d0V+EUHsgYqRlk1jLdyoghMnwX0P05WrcVbya
   JQsDcqdnEUhLUfGEQ2uUBOtkr1vknvEMeXlvepixNRUmEtcc7m6r1N8JT
   A==;
X-CSE-ConnectionGUID: X4UwNZnySTmUH2n8ESoRBA==
X-CSE-MsgGUID: tMRjy+9yQcOGjfHTU9sq8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60361265"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60361265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:30:10 -0700
X-CSE-ConnectionGUID: G67x8KtcQLSKkDRQ0DPu8w==
X-CSE-MsgGUID: UF6KsqCHQwSl8YE9x5/UZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="175728974"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2025 23:30:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFoa6-000J35-14;
	Fri, 16 May 2025 06:30:06 +0000
Date: Fri, 16 May 2025 14:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 99bcd91fabada0dbb1d5f0de44532d8008db93c6
Message-ID: <202505161419.7jmHkovd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 99bcd91fabada0dbb1d5f0de44532d8008db93c6  perf/x86/intel: Fix segfault with PEBS-via-PT with sample_freq

elapsed time: 737m

configs tested: 140
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250516    gcc-9.5.0
arc                   randconfig-002-20250516    gcc-9.5.0
arm                              allmodconfig    clang-19
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                   randconfig-001-20250516    gcc-9.5.0
arm                   randconfig-002-20250516    gcc-9.5.0
arm                   randconfig-003-20250516    gcc-9.5.0
arm                   randconfig-004-20250516    gcc-9.5.0
arm64                            allmodconfig    clang-19
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250516    gcc-9.5.0
arm64                 randconfig-002-20250516    gcc-9.5.0
arm64                 randconfig-003-20250516    gcc-9.5.0
arm64                 randconfig-004-20250516    gcc-9.5.0
csky                                defconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
i386                             alldefconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250516    clang-20
i386        buildonly-randconfig-002-20250516    clang-20
i386        buildonly-randconfig-002-20250516    gcc-12
i386        buildonly-randconfig-003-20250516    clang-20
i386        buildonly-randconfig-004-20250516    clang-20
i386        buildonly-randconfig-005-20250516    clang-20
i386        buildonly-randconfig-006-20250516    clang-20
i386        buildonly-randconfig-006-20250516    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250516    gcc-12
i386                  randconfig-002-20250516    gcc-12
i386                  randconfig-003-20250516    gcc-12
i386                  randconfig-004-20250516    gcc-12
i386                  randconfig-005-20250516    gcc-12
i386                  randconfig-006-20250516    gcc-12
i386                  randconfig-007-20250516    gcc-12
i386                  randconfig-011-20250516    gcc-12
i386                  randconfig-012-20250516    gcc-12
i386                  randconfig-013-20250516    gcc-12
i386                  randconfig-014-20250516    gcc-12
i386                  randconfig-015-20250516    gcc-12
i386                  randconfig-016-20250516    gcc-12
i386                  randconfig-017-20250516    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-21
mips                          eyeq6_defconfig    clang-21
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250516    gcc-7.5.0
riscv                 randconfig-002-20250516    gcc-7.5.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250516    gcc-7.5.0
s390                  randconfig-002-20250516    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250516    gcc-7.5.0
sh                    randconfig-002-20250516    gcc-7.5.0
sh                            shmin_defconfig    clang-21
sh                              ul2_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250516    gcc-7.5.0
sparc                 randconfig-002-20250516    gcc-7.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250516    gcc-7.5.0
sparc64               randconfig-002-20250516    gcc-7.5.0
um                                allnoconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250516    gcc-7.5.0
um                    randconfig-002-20250516    gcc-7.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250516    clang-20
x86_64      buildonly-randconfig-001-20250516    gcc-12
x86_64      buildonly-randconfig-002-20250516    gcc-12
x86_64      buildonly-randconfig-003-20250516    clang-20
x86_64      buildonly-randconfig-003-20250516    gcc-12
x86_64      buildonly-randconfig-004-20250516    clang-20
x86_64      buildonly-randconfig-004-20250516    gcc-12
x86_64      buildonly-randconfig-005-20250516    gcc-12
x86_64      buildonly-randconfig-006-20250516    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250516    gcc-12
x86_64                randconfig-002-20250516    gcc-12
x86_64                randconfig-003-20250516    gcc-12
x86_64                randconfig-004-20250516    gcc-12
x86_64                randconfig-005-20250516    gcc-12
x86_64                randconfig-006-20250516    gcc-12
x86_64                randconfig-007-20250516    gcc-12
x86_64                randconfig-008-20250516    gcc-12
x86_64                randconfig-071-20250516    clang-20
x86_64                randconfig-072-20250516    clang-20
x86_64                randconfig-073-20250516    clang-20
x86_64                randconfig-074-20250516    clang-20
x86_64                randconfig-075-20250516    clang-20
x86_64                randconfig-076-20250516    clang-20
x86_64                randconfig-077-20250516    clang-20
x86_64                randconfig-078-20250516    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                randconfig-001-20250516    gcc-7.5.0
xtensa                randconfig-002-20250516    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
