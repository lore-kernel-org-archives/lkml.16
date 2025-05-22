Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1872356CB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920412; cv=none; b=YcYgp/5cniEO0fAtTpf21D2SwAdac1z2kkeQXNVywTb67qc3Fni8dgLndCDZYfao7IP0KJk5URmfJ0szzYHupkVTFy7UNEYrdRcZbcR1oNexptGoi9+pMal7oAWw6H5T5S1cnQ/80WfwHFZfCwzSdAcva8hMnLn01of/6N7bGq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920412; c=relaxed/simple;
	bh=wVcXWke1H00O8eS52URTngi4ghwGulmWiT8pcjkcZ6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bwcwZ/9MVPdKn8CSmRRwH4SjF9XdyG2e0+S1InVy/aO4ySFSIGcDaNe/0mO+DFU/Y5ueMVbikh7WtJb+wib+Mq94dXWdNy5EnE5fPp44qBdRfnhapHwGjIUvBWi8ROXdF6ggzKSTMDGkh61ECz0g40ChdbHdyEh6vtcIyMwj3ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbTU1WzA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbTU1WzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747920411; x=1779456411;
  h=date:from:to:cc:subject:message-id;
  bh=wVcXWke1H00O8eS52URTngi4ghwGulmWiT8pcjkcZ6g=;
  b=kbTU1WzAmF17UnV4ZB1Qht24nn+Tud9JZiCS9AzT1q0QzmNpta1iGFb6
   zOqPIavGFJOY1Yd3Bhy5Bwa6r637oVJ8El4kUTWvGIWtWZC7Uc7EEqFAp
   XtDS3pEo5bk05k8CjMrIThE8Si+DuCi0s+jIaKK6NNj4aYM7I4M70dscW
   B3rh/DffwEokbASQv4DKpuBivqbaxhrSU8nOIdw5Zo4QLgRtG2t3BW/fK
   b39BJuOTNR/u/9J0pXFdv0UDrSIQxKM70zSlFBL7kiWVb5/Z3CTO8JmVa
   /J6HMhFhkNC4UjzQt2FDzMgdy1nTDyrx6mBv64VVcgXnT5yaKB93LLOvt
   Q==;
X-CSE-ConnectionGUID: CRu6jI1UQVS/h+kIBmkMmw==
X-CSE-MsgGUID: h6EaNO8dTeO/DNoOnqdNaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49862346"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49862346"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 06:26:50 -0700
X-CSE-ConnectionGUID: WaeygXZTQCmaa14QSXSk/Q==
X-CSE-MsgGUID: KewnLBPPSV+YMbJkVk5KZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140409089"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 May 2025 06:26:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI5wb-000PNE-35;
	Thu, 22 May 2025 13:26:45 +0000
Date: Thu, 22 May 2025 21:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:locking/futex] BUILD SUCCESS
 78272d44970c07899c78661f6b7492b5a7e14a90
Message-ID: <202505222145.WUOj6pfu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/futex
branch HEAD: 78272d44970c07899c78661f6b7492b5a7e14a90  selftests/futex: Fix spelling mistake "unitiliazed" -> "uninitialized"

elapsed time: 1456m

configs tested: 125
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250521    gcc-10.5.0
arc                   randconfig-002-20250521    gcc-12.4.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              alldefconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-003-20250521    clang-16
arm                   randconfig-004-20250521    clang-21
arm                        realview_defconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250521    gcc-6.5.0
arm64                 randconfig-002-20250521    gcc-6.5.0
arm64                 randconfig-003-20250521    gcc-8.5.0
arm64                 randconfig-004-20250521    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250522    gcc-15.1.0
csky                  randconfig-002-20250522    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250522    clang-17
hexagon               randconfig-002-20250522    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250521    clang-20
i386        buildonly-randconfig-002-20250521    clang-20
i386        buildonly-randconfig-003-20250521    gcc-12
i386        buildonly-randconfig-004-20250521    clang-20
i386        buildonly-randconfig-005-20250521    gcc-12
i386        buildonly-randconfig-006-20250521    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250522    gcc-15.1.0
loongarch             randconfig-002-20250522    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                           jazz_defconfig    clang-17
mips                        vocore2_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250522    gcc-6.5.0
parisc                randconfig-002-20250522    gcc-12.4.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250522    clang-21
powerpc               randconfig-003-20250522    gcc-7.5.0
powerpc                     skiroot_defconfig    clang-21
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250522    clang-21
powerpc64             randconfig-002-20250522    gcc-10.5.0
powerpc64             randconfig-003-20250522    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250522    gcc-9.3.0
riscv                 randconfig-002-20250522    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250522    clang-19
s390                  randconfig-002-20250522    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250522    gcc-13.3.0
sh                    randconfig-002-20250522    gcc-13.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250522    gcc-14.2.0
sparc                 randconfig-002-20250522    gcc-6.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250522    gcc-14.2.0
sparc64               randconfig-002-20250522    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250522    gcc-12
um                    randconfig-002-20250522    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250521    clang-20
x86_64      buildonly-randconfig-002-20250521    clang-20
x86_64      buildonly-randconfig-003-20250521    gcc-12
x86_64      buildonly-randconfig-004-20250521    gcc-12
x86_64      buildonly-randconfig-005-20250521    clang-20
x86_64      buildonly-randconfig-006-20250521    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250522    gcc-14.2.0
xtensa                randconfig-002-20250522    gcc-10.5.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
