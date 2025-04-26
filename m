Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DD190462
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 00:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745629159; cv=none; b=UWZ6luJH3+63CbZaTouUJoMdxXczAEBcF1uRXDDUTT3u5rezIZrVN3kMXwJCOqrm253QkQisqzxuNtMvOf3EDTEuKhDotEQfJIlVFVV9Mw9bc8tCQzJbWYSkzBtu6trNMcs1Y04rdfcpgz75kMUsJ82netfjqgY1EXD67tAd3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745629159; c=relaxed/simple;
	bh=/ojsbPJUUmFpD76uxXEjrUZURGgqcVS2sIV0Pe+zm8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AMygsp5Thf8qWzD/z2q2cHniRoHcML5pL+CnWWkxuIMzr/hq/vUQkPlo1mB7v3ra7Zx2iwmP4AYWcb+ZmnQkz+g2L3QBjQYAvvuHAeSCumJsQj1bjy90X232dp7csGs9b+3tHRXru28Qj4tVzT9Mq7M1q8qSgfBE5fLs5980qsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTJ8R8UT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTJ8R8UT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745629158; x=1777165158;
  h=date:from:to:cc:subject:message-id;
  bh=/ojsbPJUUmFpD76uxXEjrUZURGgqcVS2sIV0Pe+zm8Y=;
  b=nTJ8R8UTFfJ0yCI80dSxLoVfAx6onQgSoYq3YOqk6BUbtbE7PAng6TFC
   5/SQn7cDZZlOCkT0cKRjV3so+SCkgQdBNpHSgNkcYRoKdHgLRNHoe1/KQ
   Y5yKrvFCVR2UEOZBrmIaca6+q/rh50AR2dA5nZUWv+nmnOQBv9/iQLLeN
   IOmhkot7EUXtKN74KhzFMpWGSfH0vGCssbTwegkI8zmUdFPNoAzBuNO1x
   6BJl8yMSFYwN4Yo6uBGEY+s+jHvbDcj0+JVqeJemjE+6UC8Gy5MWQqgx/
   0dJnykGfcU5J8RoohTRywce4wRU0Qcgfl+tMcSyvF4xmGA772Kz0uVRl8
   g==;
X-CSE-ConnectionGUID: 0YIAEPTjSQu/edewJCVteg==
X-CSE-MsgGUID: UT5KMCXDS1Gebs98HVD4Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="64829215"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="64829215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 17:59:15 -0700
X-CSE-ConnectionGUID: PX2ZrweNTAWNjyIxjkt1qg==
X-CSE-MsgGUID: gtV+Oc+0RS62C9oskzE+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="137851471"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2025 17:59:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Tsu-0005cn-09;
	Sat, 26 Apr 2025 00:59:12 +0000
Date: Sat, 26 Apr 2025 08:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 be77f5238d220efa4b1347b47ce27054e343658f
Message-ID: <202504260853.0unKHhoU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: be77f5238d220efa4b1347b47ce27054e343658f  rcu: Protect ->defer_qs_iw_pending from data race

elapsed time: 1456m

configs tested: 81
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                   randconfig-001-20250426    gcc-8.5.0
arc                   randconfig-002-20250426    gcc-10.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250426    clang-21
arm                   randconfig-002-20250426    gcc-7.5.0
arm                   randconfig-003-20250426    clang-21
arm                   randconfig-004-20250426    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250426    clang-16
arm64                 randconfig-002-20250426    gcc-8.5.0
arm64                 randconfig-003-20250426    clang-17
arm64                 randconfig-004-20250426    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250426    gcc-14.2.0
csky                  randconfig-002-20250426    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250426    clang-19
hexagon               randconfig-002-20250426    clang-19
i386        buildonly-randconfig-001-20250426    gcc-12
i386        buildonly-randconfig-002-20250426    gcc-12
i386        buildonly-randconfig-003-20250426    clang-20
i386        buildonly-randconfig-004-20250426    clang-20
i386        buildonly-randconfig-005-20250426    gcc-12
i386        buildonly-randconfig-006-20250426    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250426    gcc-14.2.0
loongarch             randconfig-002-20250426    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250426    gcc-10.5.0
nios2                 randconfig-002-20250426    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250426    gcc-7.5.0
parisc                randconfig-002-20250426    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250426    gcc-6.5.0
powerpc               randconfig-002-20250426    clang-21
powerpc               randconfig-003-20250426    gcc-8.5.0
powerpc64             randconfig-001-20250426    gcc-6.5.0
powerpc64             randconfig-002-20250426    clang-21
powerpc64             randconfig-003-20250426    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250426    gcc-14.2.0
riscv                 randconfig-002-20250426    clang-21
s390                              allnoconfig    clang-21
s390                  randconfig-001-20250426    clang-21
s390                  randconfig-002-20250426    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250426    gcc-14.2.0
sh                    randconfig-002-20250426    gcc-12.4.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250426    gcc-10.3.0
sparc                 randconfig-002-20250426    gcc-10.3.0
sparc64               randconfig-001-20250426    gcc-7.5.0
sparc64               randconfig-002-20250426    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250426    clang-21
um                    randconfig-002-20250426    clang-21
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250426    gcc-12
x86_64      buildonly-randconfig-002-20250426    clang-20
x86_64      buildonly-randconfig-003-20250426    gcc-12
x86_64      buildonly-randconfig-004-20250426    clang-20
x86_64      buildonly-randconfig-005-20250426    clang-20
x86_64      buildonly-randconfig-006-20250426    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250426    gcc-14.2.0
xtensa                randconfig-002-20250426    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
