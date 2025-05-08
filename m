Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B0252911
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714310; cv=none; b=S3QGMKWuZzdQ1N+CjYDSmC6P79AqnQbPfUfwfM+xS+UuUufLNNemdLVufb7fwJIhpSZA9GJbwNN1F5D6BbuFqZuFYIiDfAgmL3BtgbuRZhu855P08JucUMd0MMAQUda7RbKJa9OXL8ktWIJNRrHC71N5/ndi/dmBTD5JJDv4Apk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714310; c=relaxed/simple;
	bh=NXjCD/S01oxx9o6dfMvde6pbG13/wftDA7983YincL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WtS6dinec1aA2eWD+8b75pCCR3XeIKOBIZrdcvE0oEOpjvO3M32sERX0hS17oNwDnEKripBk73rWT+soGAmhmYQrEfg+tEBRzzUIVwCtLMC6I+nKCsnedkbL/t7+zR2c6ZvEvyceghy0ZDLJF3pRsDfFT1tMuYDWU3AFmuO0pSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDYK9xdw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDYK9xdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714308; x=1778250308;
  h=date:from:to:cc:subject:message-id;
  bh=NXjCD/S01oxx9o6dfMvde6pbG13/wftDA7983YincL4=;
  b=nDYK9xdwUMNN79k1SZBhzrlSkTaPUQezrYnwFt6a7wN29dW8ntGy77Rx
   RS7nAxoWY92swbvIDO+223F1301NLVN3MCcMqQOi6RXGebqALvRmoIpmP
   v4ab30m3pNuNI2QhUR76W6NOTy1OlH6ZsAviThKK9+Ty9HV1tKKWQ5KZ4
   Pqz15/Ir5SzputN7WGs+yPpo8YwIHkGWQuG4v8qPFUoOKQiS0Wv74X2ql
   Mgmp4reKN5m7vZzEWlzHFb+2Ds4oxV88JEPOK11tCV62E2d9TD86+sbeu
   UKAmkTZ0z0xD3HA/9nyMrV0NVF5tqzm6Vyyp9UbkXfcV3EjvEgqVN0Tch
   w==;
X-CSE-ConnectionGUID: frFxkfKLRnq+RZ4FGBep/A==
X-CSE-MsgGUID: 1JjNqBPPQCCbFLe6LyEhiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48408421"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48408421"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:25:07 -0700
X-CSE-ConnectionGUID: I8U0R9h3RsGmWQmKDsLTCQ==
X-CSE-MsgGUID: xkWyMmqURr6dLelsEtcbAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="140348248"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2025 07:25:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD2BM-000B2v-06;
	Thu, 08 May 2025 14:25:04 +0000
Date: Thu, 08 May 2025 22:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq/cleanups] BUILD SUCCESS
 c63e393a16c9c4cf8c9b70fedf9f27b442874ef2
Message-ID: <202505082204.NfzYc8IF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/cleanups
branch HEAD: c63e393a16c9c4cf8c9b70fedf9f27b442874ef2  irqdomain: Consolidate coding style

elapsed time: 1453m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-14.2.0
arc                     allnoconfig    gcc-14.2.0
arc                    allyesconfig    gcc-14.2.0
arc         randconfig-001-20250508    gcc-8.5.0
arc         randconfig-002-20250508    gcc-12.4.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-21
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20250508    clang-17
arm         randconfig-002-20250508    clang-21
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20250508    gcc-14.2.0
csky        randconfig-002-20250508    gcc-12.4.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-21
hexagon                allyesconfig    clang-21
hexagon     randconfig-002-20250508    clang-21
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                      defconfig    clang-20
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-21
riscv                  allmodconfig    clang-21
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-16
riscv       randconfig-002-20250508    gcc-14.2.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-21
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20250508    gcc-6.5.0
s390        randconfig-002-20250508    gcc-9.3.0
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh          randconfig-001-20250508    gcc-14.2.0
sh          randconfig-002-20250508    gcc-10.5.0
sparc                  allmodconfig    gcc-14.2.0
sparc                   allnoconfig    gcc-14.2.0
sparc       randconfig-002-20250508    gcc-6.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-21
um                     allyesconfig    gcc-12
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-11
x86_64                rhel-9.4-rust    clang-18
xtensa                  allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
