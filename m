Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D224221266
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374911; cv=none; b=kbyRS8rkM98J7MkjixjIcOMuUDzF9sYWbxZt4J/J1POxbNichmd1F6dMJQYlcB/oWq8dTrFfwNncV8JQvLSECqKDCMxDwXg2BlzIBKJpvrMa9VNPszHorZ0UltbPDNk4AjulRrnW83Zzt+xxx1g3kqFOYlH/s8PQsR/van91+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374911; c=relaxed/simple;
	bh=EC6fzVkAc5QBoX1E1chjXEc7nrbHL8W4dzov1UpCg5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lWxAXZAou4bKajfsi4FJBx1PBFSu3cavi6m6+dK1C6Kwbl58324pCSpJiaCZb+7+zJ+X43jXJDEdgstylDOeCOkXXByQyuY2YQHOdqSp5lV4677xCFYo5XciBrQCOkEE0yNo1E4/jEQByuexTanCV6aoo9fNXe4KIRG/2NUD3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxdlmLKL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxdlmLKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744374909; x=1775910909;
  h=date:from:to:cc:subject:message-id;
  bh=EC6fzVkAc5QBoX1E1chjXEc7nrbHL8W4dzov1UpCg5g=;
  b=lxdlmLKLWKSDKWEfh1vkikE5XqR9CjniB/NO37zrqF4dOY9nIbpEJ/Oo
   xaNNYSfp2++TFaK8Cj8jvKdilNqr5yZRvyMH6ZSracUsU+m25suNrC3RF
   P+JZ0n5dtnsx3EzrWp4+oqsP3GX1sP6lHT/SVnxmLETp/z11joiQt+1Fa
   XxGbJe0/0LJPWXWXTKH1IhvXAeHv76PFOGmbSuINYicpt/z//jWjF8quK
   oriBZRiFy/t8wzbeWilWLOEsfoJVYgu7gxXiUIZX/UXh3phaxXmk8Bs0Q
   3JRU0EC+x+lo8XdVJN5UpJqTYpjJraawjNy22GwQTukgD0648V1asfhat
   Q==;
X-CSE-ConnectionGUID: mXz9BVdlQt2PYsWNsABaeg==
X-CSE-MsgGUID: LMVel354Thi6DmB5U6tUxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46087936"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="46087936"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:35:08 -0700
X-CSE-ConnectionGUID: U5ZsnPZARvSoFXrqmFUjlw==
X-CSE-MsgGUID: c/jWpVq3QsabVGtV+ZYKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="129749371"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Apr 2025 05:35:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Db7-000B5q-1q;
	Fri, 11 Apr 2025 12:35:05 +0000
Date: Fri, 11 Apr 2025 20:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/boot] BUILD SUCCESS
 9e8e879426d863fc326cda53d704bbc7369c1afc
Message-ID: <202504112033.A81WyxEK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: 9e8e879426d863fc326cda53d704bbc7369c1afc  Merge tag 'v6.15-rc1' into x86/boot, to pick up fixes and refresh to a known base

elapsed time: 1461m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250410    gcc-14.2.0
arc                   randconfig-002-20250410    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    clang-21
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20250410    clang-21
arm                   randconfig-002-20250410    clang-18
arm                   randconfig-003-20250410    gcc-7.5.0
arm                   randconfig-004-20250410    gcc-8.5.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250410    clang-21
arm64                 randconfig-002-20250410    clang-21
arm64                 randconfig-003-20250410    gcc-6.5.0
arm64                 randconfig-004-20250410    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250410    gcc-14.2.0
csky                  randconfig-002-20250410    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250410    clang-21
hexagon               randconfig-002-20250410    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250410    clang-20
i386        buildonly-randconfig-002-20250410    clang-20
i386        buildonly-randconfig-003-20250410    clang-20
i386        buildonly-randconfig-004-20250410    gcc-11
i386        buildonly-randconfig-005-20250410    clang-20
i386        buildonly-randconfig-006-20250410    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250410    gcc-12.4.0
loongarch             randconfig-002-20250410    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250410    gcc-14.2.0
nios2                 randconfig-002-20250410    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250410    gcc-5.5.0
parisc                randconfig-002-20250410    gcc-11.5.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-21
powerpc               randconfig-001-20250410    gcc-6.5.0
powerpc               randconfig-002-20250410    gcc-6.5.0
powerpc               randconfig-003-20250410    clang-21
powerpc64             randconfig-001-20250410    clang-21
powerpc64             randconfig-002-20250410    clang-21
powerpc64             randconfig-003-20250410    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250410    clang-21
riscv                 randconfig-002-20250410    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250410    clang-17
s390                  randconfig-002-20250410    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250410    gcc-12.4.0
sh                    randconfig-002-20250410    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250410    gcc-10.3.0
sparc                 randconfig-002-20250410    gcc-7.5.0
sparc64               randconfig-001-20250410    gcc-7.5.0
sparc64               randconfig-002-20250410    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250410    clang-21
um                    randconfig-002-20250410    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250410    clang-20
x86_64      buildonly-randconfig-002-20250410    gcc-12
x86_64      buildonly-randconfig-003-20250410    clang-20
x86_64      buildonly-randconfig-004-20250410    clang-20
x86_64      buildonly-randconfig-005-20250410    clang-20
x86_64      buildonly-randconfig-006-20250410    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250410    gcc-14.2.0
xtensa                randconfig-002-20250410    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
