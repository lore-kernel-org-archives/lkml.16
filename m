Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24DA1E7C1C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235825; cv=none; b=JG/FYsfGn9SYF/b/zwR40Jm0NYk7KSAQjZeZ5QF6OlG1+03ZBG7ekgwuwelk1/9EsI73bJaWg/3OfX4NxU8H0Cx74xfy0TsrP7TMXqvhT/GoV1bdMqpdFnxZQZ0g+uO20fLq8Ktz65J5OulOk74ZG/ICg6dHtpF3rwDnwTR3EwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235825; c=relaxed/simple;
	bh=yxhotLykWqk2kF3KgYI+q1UTkdASYJdhM9rlQQD3dJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o/NvZ1MqjXvlu0QlcrOCq6Lvtg4F4jT/7VrEBy0C3LH4IL+oUYFNOwzyGzNQFo3xxYadj3ZMZ2YAIDhL7aqbVp4CWCZJ/fOzD0XT7QXIU6QRJezpzOsWoz0eYUpfYtHCB276JNF4fC7NHuLmnEQkejBf7fxVT23moWMDJfWwzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNXfTdgj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNXfTdgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744235824; x=1775771824;
  h=date:from:to:cc:subject:message-id;
  bh=yxhotLykWqk2kF3KgYI+q1UTkdASYJdhM9rlQQD3dJs=;
  b=bNXfTdgjGN1dwguE0Y5clISnq0Vmdha1tA98LnLPkh3kMAO3R6fV9nKK
   uvEC+8emHW5DTOl3vbvouncpcoiMVbYHSurptD336/CS9xX28TaWxjD00
   u+eOtMDFv7FfNXvfEnM7X27vye0OMaGKe3c06W2bC/FcIPmSID6WtTluy
   a4+X2zNWJDWK3HkLUP4IG4kX9VNlqTmfkR9Jl9i/9In5Mp1z9VrWefTXu
   Exr775ZGBxXh8Xk1x7YTs5mUzA0EfsxlYXDkM+QcYHziLcaCFKKvSUbDS
   h3RDFWgQ6jU2ryzG9HILKm9fiyGkQLPVbCIpaOVNWDCz6FGMGd0JFlJAA
   g==;
X-CSE-ConnectionGUID: RILqL41tSTG8gIQOF2sF3w==
X-CSE-MsgGUID: f24fKKvIQuaXODN37sfHLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49575564"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="49575564"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 14:57:03 -0700
X-CSE-ConnectionGUID: vtuPy/+oST+4ybIj0xHbHw==
X-CSE-MsgGUID: HPI40T4nRYSDu5g5nRcmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133827862"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2025 14:57:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2dPo-0009MN-05;
	Wed, 09 Apr 2025 21:57:00 +0000
Date: Thu, 10 Apr 2025 05:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:objtool/urgent] BUILD SUCCESS
 2d12c6fb78753925f494ca9079e2383529e8ae0e
Message-ID: <202504100524.Na62NEDB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
branch HEAD: 2d12c6fb78753925f494ca9079e2383529e8ae0e  objtool: Remove ANNOTATE_IGNORE_ALTERNATIVE from CLAC/STAC

elapsed time: 1480m

configs tested: 74
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250409    gcc-12.4.0
arc                   randconfig-002-20250409    gcc-10.5.0
arm                   randconfig-001-20250409    gcc-7.5.0
arm                   randconfig-002-20250409    gcc-7.5.0
arm                   randconfig-003-20250409    gcc-7.5.0
arm                   randconfig-004-20250409    clang-14
arm64                 randconfig-001-20250409    clang-21
arm64                 randconfig-002-20250409    clang-21
arm64                 randconfig-003-20250409    clang-15
arm64                 randconfig-004-20250409    gcc-6.5.0
csky                  randconfig-001-20250409    gcc-14.2.0
csky                  randconfig-002-20250409    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250409    clang-21
hexagon               randconfig-002-20250409    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250409    gcc-12
i386        buildonly-randconfig-002-20250409    clang-20
i386        buildonly-randconfig-003-20250409    gcc-11
i386        buildonly-randconfig-004-20250409    clang-20
i386        buildonly-randconfig-005-20250409    gcc-12
i386        buildonly-randconfig-006-20250409    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250409    gcc-14.2.0
loongarch             randconfig-002-20250409    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250409    gcc-10.5.0
nios2                 randconfig-002-20250409    gcc-8.5.0
parisc                randconfig-001-20250409    gcc-13.3.0
parisc                randconfig-002-20250409    gcc-13.3.0
powerpc               randconfig-001-20250409    gcc-6.5.0
powerpc               randconfig-002-20250409    clang-21
powerpc               randconfig-003-20250409    clang-21
powerpc64             randconfig-001-20250409    clang-21
powerpc64             randconfig-002-20250409    gcc-8.5.0
powerpc64             randconfig-003-20250409    clang-21
riscv                 randconfig-001-20250409    clang-21
riscv                 randconfig-002-20250409    clang-21
s390                             allmodconfig    clang-18
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250409    gcc-9.3.0
s390                  randconfig-002-20250409    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250409    gcc-12.4.0
sh                    randconfig-002-20250409    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250409    gcc-13.3.0
sparc                 randconfig-002-20250409    gcc-7.5.0
sparc64               randconfig-001-20250409    gcc-11.5.0
sparc64               randconfig-002-20250409    gcc-13.3.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250409    gcc-12
um                    randconfig-002-20250409    clang-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250409    clang-20
x86_64      buildonly-randconfig-002-20250409    gcc-12
x86_64      buildonly-randconfig-003-20250409    clang-20
x86_64      buildonly-randconfig-004-20250409    clang-20
x86_64      buildonly-randconfig-005-20250409    gcc-12
x86_64      buildonly-randconfig-006-20250409    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250409    gcc-11.5.0
xtensa                randconfig-002-20250409    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
