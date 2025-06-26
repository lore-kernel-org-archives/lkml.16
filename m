Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA42ECE80
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961676; cv=none; b=J3Xva23RxFlQBhIB2COy2Bd8hWB56gZFt4hReP9neIID+4UckGn3BEWodIaoWGomceLf+yO5DwPBT9/plHnjwu9hPD+7ToahenTXIVf7RoTwj2Y2O2AH0u+TdN+LPR5rBqvKT3UrX7PK+EuiKU5yZVFJs1gQN1OdF6rRsfQhybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961676; c=relaxed/simple;
	bh=Wypp5r6nB0NDGvG/zFS4NFbxzbafwEncAhIhaI6bOJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kThKAXb1ezbgSYy6I92a2/iZoZzUZnZp+11jaBq7OJUk0DZ5GX8ciwpQYla5p7SlFRGMvh/sfr6tD7qFk+RuONtyAuS2ze6c6S/5TWz91UOlW2bydLnPM48kMFGrTVLQohCOLAs317UVPtui7+q/w7DyywxTIAUPT5muwDiMnns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXW/YJs7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXW/YJs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750961674; x=1782497674;
  h=date:from:to:cc:subject:message-id;
  bh=Wypp5r6nB0NDGvG/zFS4NFbxzbafwEncAhIhaI6bOJk=;
  b=dXW/YJs7E7kKf244u/OgI++OeF7AqTKbDRRE5DbOB8CqDdmMY0Ypi3KC
   byuHmxlWmU7Proy8pC2UKffTYaTvGnQv9f3YKy52lhGqOBvnudev2alPX
   iHoCAU/Ykdx3MfonylMQcy3U9fPgZbCMgWQCLA9mglDKv3Sm1DQYXJ4jO
   9BnxQkT3nVx+8+VsZP0gQ7fgmkcVWA36FV3+urumKFeoLSa/gclHnOIwY
   2B18LFEnP90pMaST7kMGrctMZwEeWJ4fNPtm+8Fn+2qQnrReeUsYIRdx8
   JucC8DFRa5RAOeOFNfdH++KuxhVHZhVo4+KGrfZ8FqwL9L1BArh8JDemh
   w==;
X-CSE-ConnectionGUID: VMrkCgn5R5arv2XdwKPxOQ==
X-CSE-MsgGUID: ycmgA6jXSQamJIJDteHMJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53344836"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53344836"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:14:34 -0700
X-CSE-ConnectionGUID: jM33DZR5QwGRoalpkp714Q==
X-CSE-MsgGUID: 3f3OsVUQRWWZaujz4bil5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="151997838"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jun 2025 11:14:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUr7G-000VPc-0k;
	Thu, 26 Jun 2025 18:14:30 +0000
Date: Fri, 27 Jun 2025 02:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250616] BUILD REGRESSION
 78f053980ba50a0becae798ab7d07527d97e790d
Message-ID: <202506270238.Ia9msE6v-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
branch HEAD: 78f053980ba50a0becae798ab7d07527d97e790d  treewide: Avoid -Wflex-array-member-not-at-end warnings

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506260845.3py4BoAJ-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202506260858.2DTGYCvK-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202506261829.It6MPDTn-lkp@intel.com

    Warning: drivers/gpu/drm/xlnx/zynqmp_disp.c:103 Excess struct member 'xt' description in 'zynqmp_disp_layer_dma'
    include/asm-generic/tlb.h:367:28: error: expected ';' at end of declaration list
    include/asm-generic/tlb.h:378:2: error: expected member name or ';' after declaration specifiers
    include/asm-generic/tlb.h:378:2: error: type name requires a specifier or qualifier
    kernel/sched/ext.c:3712:10: error: incompatible pointer types returning 'struct cgroup_hdr *' from a function with result type 'struct cgroup *' [-Werror,-Wincompatible-pointer-types]
    kernel/sched/ext.c:7407:17: error: incompatible pointer types initializing 'struct cgroup *' with an expression of type 'struct cgroup_hdr *' [-Werror,-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- alpha-allyesconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- arm64-randconfig-004-20250626
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- hexagon-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- hexagon-allyesconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- loongarch-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- m68k-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- m68k-allyesconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- microblaze-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- microblaze-allyesconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- s390-allmodconfig
|   |-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|   |-- include-asm-generic-tlb.h:error:expected-at-end-of-declaration-list
|   |-- include-asm-generic-tlb.h:error:expected-member-name-or-after-declaration-specifiers
|   `-- include-asm-generic-tlb.h:error:type-name-requires-a-specifier-or-qualifier
|-- s390-allnoconfig
|   |-- include-asm-generic-tlb.h:error:expected-at-end-of-declaration-list
|   |-- include-asm-generic-tlb.h:error:expected-member-name-or-after-declaration-specifiers
|   `-- include-asm-generic-tlb.h:error:type-name-requires-a-specifier-or-qualifier
|-- s390-allyesconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- sparc-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- um-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- um-allyesconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- x86_64-allmodconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
|-- x86_64-allyesconfig
|   `-- Warning:drivers-gpu-drm-xlnx-zynqmp_disp.c-Excess-struct-member-xt-description-in-zynqmp_disp_layer_dma
`-- x86_64-buildonly-randconfig-005-20250626
    |-- kernel-sched-ext.c:error:incompatible-pointer-types-initializing-struct-cgroup-with-an-expression-of-type-struct-cgroup_hdr-Werror-Wincompatible-pointer-types
    `-- kernel-sched-ext.c:error:incompatible-pointer-types-returning-struct-cgroup_hdr-from-a-function-with-result-type-struct-cgroup-Werror-Wincompatible-pointer-types

elapsed time: 1458m

configs tested: 59
configs skipped: 1

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250626    gcc-12.4.0
arc                   randconfig-002-20250626    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250626    clang-21
arm                   randconfig-002-20250626    clang-20
arm                   randconfig-003-20250626    gcc-10.5.0
arm                   randconfig-004-20250626    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250626    clang-21
arm64                 randconfig-002-20250626    clang-17
arm64                 randconfig-003-20250626    gcc-8.5.0
arm64                 randconfig-004-20250626    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386        buildonly-randconfig-001-20250626    clang-20
i386        buildonly-randconfig-002-20250626    clang-20
i386        buildonly-randconfig-003-20250626    clang-20
i386        buildonly-randconfig-004-20250626    clang-20
i386        buildonly-randconfig-005-20250626    clang-20
i386        buildonly-randconfig-006-20250626    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
