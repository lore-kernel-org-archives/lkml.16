Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1333428E17
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685345; cv=none; b=Baa73zEyToCDNi8y8jCN9hAQohnWmEmpkh2GsUakIIQQMKWBimGoy/2THzHgWYIrwIZyslS+MSrLFO0Qdvi2+W8bE9eWZ+I+oVq05x8/tB+vH2g6Sc24jqAxq68ENrLuE/mO37n4BKS6bsRKYap/7GMt4vGCkP7CKQ1/aU7Soq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685345; c=relaxed/simple;
	bh=FRGadOKXD/0qhxB+ApG2aEjr9bZ6ix+2m19qPwL9EIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b7imgu/b1OmbV0EsBrW5o5QXz3krFdTVcJjhq1HQ9uP1WXDpU8OPehOnI1iJNKw5V4+gV1nK57QMN3bJX66KOEaaZ1KNyvd6aDsnWwhJx4JK1FTr7j1RpG4D1AkKHgtBeP/DqvQqCyES0zgj1aB0N7jdurfS4Qngrl0UP7VhAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0BE4BAS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0BE4BAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746685344; x=1778221344;
  h=date:from:to:cc:subject:message-id;
  bh=FRGadOKXD/0qhxB+ApG2aEjr9bZ6ix+2m19qPwL9EIA=;
  b=D0BE4BASpvam3gTKjDnbwsvhI0yvjvm6dtyp9OMGdrVWWITqD+AiIQIi
   CbE6BvCFORKqd4cEkGlKX2yukH6y5+VM9/cV6W7ElE8KVjcATJ2tNXJhE
   Vnj1Ge8vbfcGHprEtoo6DAAcgG9Bhv9HSv3xzeeQ0ecWAQZB5J0N90MMr
   rV6I5AcyHobqUPpz9G3sqntG7hm86tQYLdqJCb66Eq0Opu48MmEZ0Ks2Q
   26B7F7aKTtSWajZyuhLxCqw0YZ08sxDM3iIYljCwxdK4z4+5sCOGOZIWl
   UUDT3aFScunxgCNyQB52PzO6NdqJlH/qR+tqDbMVivQSnz43wNZKpOf0o
   w==;
X-CSE-ConnectionGUID: g40lgGCQRaq9605bDLv+CA==
X-CSE-MsgGUID: YGNKoyMwQZCIH8SMsqnNGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48561297"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48561297"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 23:22:23 -0700
X-CSE-ConnectionGUID: CizIWZ/FRh6KcUZEazO46g==
X-CSE-MsgGUID: IVo4L0wKSSCjMrW/mNQ2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="135893802"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2025 23:22:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCueC-000Adp-06;
	Thu, 08 May 2025 06:22:20 +0000
Date: Thu, 08 May 2025 14:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/alternatives] BUILD SUCCESS
 7f9958230d8a79d474829bee25ec9426397335ce
Message-ID: <202505081422.DFJHuBHF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/alternatives
branch HEAD: 7f9958230d8a79d474829bee25ec9426397335ce  x86/mm: Fix false positive warning in switch_mm_irqs_off()

elapsed time: 2672m

configs tested: 74
configs skipped: 133

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250506    clang-20
x86_64      buildonly-randconfig-002-20250506    gcc-12
x86_64      buildonly-randconfig-003-20250506    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
