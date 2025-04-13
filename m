Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D012B94
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744576258; cv=none; b=tHdCBHkCr13ZduXtxa2t5XCNKro12arVcp7ZyjrFZ8ve7tl2eAkEMcpgkNkPnJ62Vjn6h1WF88e0zEEuTpf2JjddvFh3LD+QcUMbKsqCKkjh0ZanwqpGv1uouZohTnv2+A3FLJXdaGuKujZO33ksijn3GGorMMbnMhCrY62pgjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744576258; c=relaxed/simple;
	bh=JvCHi0hijrMmx2VzGRM7kZk0DMISdRmOENmpd2rIA+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gV0IWQPvOfHUXzd/4Uisd0XSwWE8s+LjjSeHZhxQWnD4LAFUvO4PO1GVU+BvRhPENrks0lFyX6qHTdqjwPdHjGvyJMGtDbWUX/HEHCYl3TpgKDDXZUX59snOxNrB5k4bbNq4Vgg59WHDtc2RM+ToKvA6RL2DvQdFnF0EgXBaaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeMtA6Jv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeMtA6Jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744576256; x=1776112256;
  h=date:from:to:cc:subject:message-id;
  bh=JvCHi0hijrMmx2VzGRM7kZk0DMISdRmOENmpd2rIA+I=;
  b=jeMtA6JvMrt5bAHGonNGpVi3qukk8sYLhWhjZwpV13Rw0zy3Mv8ZgxjA
   n8tXWCFIueosdB7WyW63NWTsmfNCqMc0rRXDtIY47cHSKgrqw37PtdnXX
   8kMOzg/1OPYzIZv38+wIfSvyM13Y16p3uZFP46fuspy2nDcoknvTDi7fR
   yNOLD0uPAUPpkY+ojwKwLaBte35j51PGv72tMeyK1UdYKlKbVPcAnL68Z
   KDYCGUhnB88tLoQbe8q9cFOKKJKsh2FAMKluRAmnmtbVxMlnAYKV2/43e
   CCIDqRFbIaZSG4HXKYZu5vNU90DyQ4J6dxhHwEIsCiOwYGAJgOVTsc8Lg
   g==;
X-CSE-ConnectionGUID: bRjAeJ6ST9a19c+1otYiOA==
X-CSE-MsgGUID: yiwdoObYRnaIw8gcmVQ3Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49876627"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49876627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 13:30:56 -0700
X-CSE-ConnectionGUID: rkqUdzGDTyyoBj0gwMsuVw==
X-CSE-MsgGUID: r0+JADX1Trm0eU67UMXNhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134725361"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Apr 2025 13:30:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u43ye-000Csi-2k;
	Sun, 13 Apr 2025 20:30:52 +0000
Date: Mon, 14 Apr 2025 04:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/boot] BUILD SUCCESS
 221df25fdf827b1fe5b904c6a396af06461a32f6
Message-ID: <202504140416.Tfi4OBRX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: 221df25fdf827b1fe5b904c6a396af06461a32f6  x86/sev: Prepare for splitting off early SEV code

elapsed time: 1737m

configs tested: 137
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250413    gcc-11.5.0
arc                   randconfig-002-20250413    gcc-13.3.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                            hisi_defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-21
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250413    gcc-6.5.0
arm                   randconfig-002-20250413    gcc-6.5.0
arm                   randconfig-003-20250413    clang-21
arm                   randconfig-004-20250413    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250413    gcc-7.5.0
arm64                 randconfig-002-20250413    clang-21
arm64                 randconfig-003-20250413    gcc-7.5.0
arm64                 randconfig-004-20250413    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250413    gcc-9.3.0
csky                  randconfig-002-20250413    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250413    clang-21
hexagon               randconfig-002-20250413    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250413    gcc-12
i386        buildonly-randconfig-002-20250413    clang-20
i386        buildonly-randconfig-003-20250413    gcc-12
i386        buildonly-randconfig-004-20250413    gcc-12
i386        buildonly-randconfig-005-20250413    clang-20
i386        buildonly-randconfig-006-20250413    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250413    gcc-14.2.0
loongarch             randconfig-002-20250413    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-21
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250413    gcc-9.3.0
nios2                 randconfig-002-20250413    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250413    gcc-10.5.0
parisc                randconfig-002-20250413    gcc-12.4.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250413    clang-21
powerpc               randconfig-002-20250413    gcc-5.5.0
powerpc               randconfig-003-20250413    clang-17
powerpc64             randconfig-001-20250413    gcc-5.5.0
powerpc64             randconfig-002-20250413    gcc-10.5.0
powerpc64             randconfig-003-20250413    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250413    gcc-14.2.0
riscv                 randconfig-002-20250413    clang-21
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250413    gcc-8.5.0
s390                  randconfig-002-20250413    gcc-8.5.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250413    gcc-11.5.0
sh                    randconfig-002-20250413    gcc-9.3.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250413    gcc-6.5.0
sparc                 randconfig-002-20250413    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250413    gcc-14.2.0
sparc64               randconfig-002-20250413    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250413    gcc-11
um                    randconfig-002-20250413    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250413    clang-20
x86_64      buildonly-randconfig-002-20250413    gcc-12
x86_64      buildonly-randconfig-003-20250413    gcc-12
x86_64      buildonly-randconfig-004-20250413    gcc-12
x86_64      buildonly-randconfig-005-20250413    clang-20
x86_64      buildonly-randconfig-006-20250413    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250413    gcc-6.5.0
xtensa                randconfig-002-20250413    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
