Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E871CFEC3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258462; cv=none; b=UdSqTmFntdav48jHQMsFHhLbKS7/7eP/BmbiHbEllHJEUdriMReD3TqLlW00hmFVdTrUP1h2ZRuAT2qT2P7UEH6s7HtbVenYhMYGiFlWRvGsiRmBxaX3j700LaloLUDckH8UQTy7JcCUuxcmPyDIy+VE7jKCcsQhmce9BwzGJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258462; c=relaxed/simple;
	bh=T9EoI4WG92/6GXDiZZjEkdgmp78CtKN3SRWbV7xF+yA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qqdlMRDJEBpBoPyir21BXusFmJ3OTaWG2KF4oEoO9CgzUg4izzDkG4rVqAsnIhnX34168kAviFRopd74iTgo0kDW5TzlN64oliqwHmwajOTj1RbHQsSoNA8myDDln0P54kV+1Ky06ypbmqxtZbKQIRjkztcDzwYv4KNF4J/RLUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpK0s2S8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpK0s2S8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743258461; x=1774794461;
  h=date:from:to:cc:subject:message-id;
  bh=T9EoI4WG92/6GXDiZZjEkdgmp78CtKN3SRWbV7xF+yA=;
  b=hpK0s2S8pGtJ2gc/w2f0Pun8YjdDECR0yJrTn/2T4pnUcGSed+GqPH87
   h9OxbVt4QM+C30UKhZWXeeDco16qTJoSFtjJzuLtRTVbI8DxKTtF3pl+T
   s3C+6knEK/jFUK90anMRv8sGjW6n3rocYyo01+QhmYNgagkVeMfyelpYy
   5mEQwURAOSGT6ilRBWQfiZlufaXfhO6B4SsSSByGILV7+n5gmFMvXZ8Cp
   HWMbn5bcZyEPSp1RTRtrdXsHaCy/7+LE1Z5pQ0NPyJQxbOjr3ad8DCd18
   JH12/pTDW6iEogbyWdLLJvBLvB646S8NhTZBASVk4c2knR75HKFm4MJrY
   A==;
X-CSE-ConnectionGUID: IZzamXriSqGzi0eclsyHRw==
X-CSE-MsgGUID: VvIKVhHmQS2HsssZOYS09Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="54808089"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="54808089"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 07:27:40 -0700
X-CSE-ConnectionGUID: ETXWB1cFQWatjtwrUjPjGQ==
X-CSE-MsgGUID: ciAV17jVTKOoRtNUs0UPvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="125932814"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Mar 2025 07:27:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyX9s-0008A0-25;
	Sat, 29 Mar 2025 14:27:36 +0000
Date: Sat, 29 Mar 2025 22:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250325] BUILD SUCCESS
 c1e303f2e575e92e4bf4fad5efab6be3ffb9cc88
Message-ID: <202503292203.6b6edLuy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250325
branch HEAD: c1e303f2e575e92e4bf4fad5efab6be3ffb9cc88  platform/chrome: cros_ec: Avoid -Wflex-array-member-not-at-end warning

elapsed time: 1442m

configs tested: 127
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250328    gcc-12.4.0
arc                   randconfig-002-20250328    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-19
arm                            mmp2_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250328    clang-18
arm                   randconfig-002-20250328    gcc-8.5.0
arm                   randconfig-003-20250328    clang-18
arm                   randconfig-004-20250328    gcc-8.5.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250328    gcc-8.5.0
arm64                 randconfig-002-20250328    clang-15
arm64                 randconfig-003-20250328    clang-16
arm64                 randconfig-004-20250328    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250329    gcc-11.5.0
csky                  randconfig-002-20250329    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250329    clang-21
hexagon               randconfig-002-20250329    clang-21
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250328    gcc-12
i386        buildonly-randconfig-002-20250328    gcc-12
i386        buildonly-randconfig-003-20250328    clang-20
i386        buildonly-randconfig-004-20250328    gcc-12
i386        buildonly-randconfig-005-20250328    clang-20
i386        buildonly-randconfig-006-20250328    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250329    gcc-14.2.0
loongarch             randconfig-002-20250329    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250329    gcc-7.5.0
nios2                 randconfig-002-20250329    gcc-7.5.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250329    gcc-6.5.0
parisc                randconfig-002-20250329    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250329    gcc-5.5.0
powerpc               randconfig-002-20250329    gcc-5.5.0
powerpc               randconfig-003-20250329    gcc-9.3.0
powerpc                     sequoia_defconfig    clang-17
powerpc                     skiroot_defconfig    clang-21
powerpc64             randconfig-001-20250329    gcc-9.3.0
powerpc64             randconfig-002-20250329    gcc-9.3.0
powerpc64             randconfig-003-20250329    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250328    gcc-8.5.0
riscv                 randconfig-002-20250328    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250328    gcc-6.5.0
s390                  randconfig-002-20250328    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250328    gcc-10.5.0
sh                    randconfig-002-20250328    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250328    gcc-13.3.0
sparc                 randconfig-002-20250328    gcc-7.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250328    gcc-11.5.0
sparc64               randconfig-002-20250328    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250328    clang-17
um                    randconfig-002-20250328    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250328    clang-20
x86_64      buildonly-randconfig-002-20250328    clang-20
x86_64      buildonly-randconfig-003-20250328    clang-20
x86_64      buildonly-randconfig-004-20250328    clang-20
x86_64      buildonly-randconfig-005-20250328    clang-20
x86_64      buildonly-randconfig-006-20250328    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250328    gcc-9.3.0
xtensa                randconfig-002-20250328    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
