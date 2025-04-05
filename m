Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C187148FE6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743871181; cv=none; b=bQ9W77Qc2qzBuOMoESlztzDn+0HlSFKeftKHJVPj70DA2rKE42AVHKONSc6qWdHeL/mrvWg36iJdDpYvXGxMTvuDxgDYlZcYcCJdSqni+GdzRs91REZHpN5QtteH40h9QN/9OCKyL3ZIrbBH5pcmJf8AbqxdzU+HtQq7ds3Z5f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743871181; c=relaxed/simple;
	bh=VYbIh048qEtCrej7/euSqTCPyyi3TGPEfTPalPqgOEE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JD4shMzzrOsJKavp7M00QSwiT7tGheZofRJ0UskjCRmourhLA51mQ+EG+/fzgE9xg/YVrop58G3sI5O5wi67Ph0c6KQiKcLhIIY8VRyxxszNg1ue0WnziFj9jLFMfEIP3g05406F9P75dOsRShYQPJ18tJqVlziShmx9uSfIL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSq3ii1/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSq3ii1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743871180; x=1775407180;
  h=date:from:to:cc:subject:message-id;
  bh=VYbIh048qEtCrej7/euSqTCPyyi3TGPEfTPalPqgOEE=;
  b=MSq3ii1//CduuLukYbpco6Nqc4go6g8vG0IPC6BBntdljhmLvNkvHxkH
   Z6I2G0KVQRVxLfWsPRTA9rDUzYXrXJJU6rSVvNw59MhIgtXWU6NXFRol9
   uguho/qdrMbBqWqrqa7BbTENcKe0tmIl0231HCGO3qP5Ba0lRrS6eJC3Y
   wxkBGksculbpI9lRqHZ+PZiCcSlYZ9FOV+mPgKeDcL2ncCUZUXql6zaQv
   w7HY73ZtY3xCAb2btGbAXGIRnPTqnu/iQqr05Wro1da2Aa+gNFq1UmyP8
   lqDwuklb9G0196VoQIn0nI0L3wHX3hP0SlQjmwhi/uZcJdtd5AvqSjPIu
   Q==;
X-CSE-ConnectionGUID: Pp+OzINXSvmtjCnLSiH8kw==
X-CSE-MsgGUID: +N/y2YCuTDuHEpzuQnZGKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45186771"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="45186771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 09:39:39 -0700
X-CSE-ConnectionGUID: diMAd2BKTOq9ONr4VSdnbA==
X-CSE-MsgGUID: QA5uMss9QeqjCyWh8BcGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="128081077"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Apr 2025 09:39:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u16YR-00029g-2P;
	Sat, 05 Apr 2025 16:39:35 +0000
Date: Sun, 06 Apr 2025 00:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250404] BUILD SUCCESS
 74be3f75065b45f7612094c0668010823b202c53
Message-ID: <202504060057.hCDO2drk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250404
branch HEAD: 74be3f75065b45f7612094c0668010823b202c53  wifi: iwlwifi: mvm/fw: Avoid -Wflex-array-member-not-at-end warnings

elapsed time: 1448m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250405    gcc-14.2.0
arc                   randconfig-002-20250405    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-21
arm                           imxrt_defconfig    clang-21
arm                   randconfig-001-20250405    clang-18
arm                   randconfig-002-20250405    gcc-7.5.0
arm                   randconfig-003-20250405    gcc-8.5.0
arm                   randconfig-004-20250405    clang-21
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250405    clang-19
arm64                 randconfig-002-20250405    gcc-8.5.0
arm64                 randconfig-003-20250405    gcc-8.5.0
arm64                 randconfig-004-20250405    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250405    gcc-14.2.0
csky                  randconfig-002-20250405    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250405    clang-21
hexagon               randconfig-002-20250405    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250405    gcc-12
i386        buildonly-randconfig-002-20250405    clang-20
i386        buildonly-randconfig-003-20250405    clang-20
i386        buildonly-randconfig-004-20250405    clang-20
i386        buildonly-randconfig-005-20250405    clang-20
i386        buildonly-randconfig-006-20250405    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250405    gcc-14.2.0
loongarch             randconfig-002-20250405    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250405    gcc-12.4.0
nios2                 randconfig-002-20250405    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250405    gcc-11.5.0
parisc                randconfig-002-20250405    gcc-9.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      pcm030_defconfig    clang-15
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250405    gcc-8.5.0
powerpc               randconfig-002-20250405    gcc-8.5.0
powerpc               randconfig-003-20250405    gcc-8.5.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250405    clang-21
powerpc64             randconfig-002-20250405    clang-21
powerpc64             randconfig-003-20250405    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250405    clang-21
riscv                 randconfig-002-20250405    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250405    clang-15
s390                  randconfig-002-20250405    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250405    gcc-14.2.0
sh                    randconfig-002-20250405    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250405    gcc-11.5.0
sparc                 randconfig-002-20250405    gcc-10.3.0
sparc64               randconfig-001-20250405    gcc-9.3.0
sparc64               randconfig-002-20250405    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250405    clang-17
um                    randconfig-002-20250405    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250405    gcc-12
x86_64      buildonly-randconfig-002-20250405    clang-20
x86_64      buildonly-randconfig-003-20250405    clang-20
x86_64      buildonly-randconfig-004-20250405    clang-20
x86_64      buildonly-randconfig-005-20250405    gcc-12
x86_64      buildonly-randconfig-006-20250405    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250405    gcc-11.5.0
xtensa                randconfig-002-20250405    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
