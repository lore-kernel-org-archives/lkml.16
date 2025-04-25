Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5E192B6D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608309; cv=none; b=Lyzlc8hX8V94zaQ05OOUyEcZLJe9a5Suv1M9SsNTEtokHnXMNWh/IxNCZXs8tx8IhYhwYy3yI8CGZQ5BuANnVORUXoh1q/A5YH99Buv+EknBJ1aOHlGzM+P46N+67uTf1t6QhfyOC7BWiNnV1zyxvF3J3SROv6xHIzLbb8jx+Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608309; c=relaxed/simple;
	bh=GVuKrwqb1Jb9rIw9Hpt7AUYiv9g6FGszlIcIpDCiybw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GTWq7fjGsXH5Kmyc0X/TF5JHxyZAFOOMZIES0A+gJ8y+CNU8SyxOlPXuiDZPBi/pWrzJE9Lo0fIfBCkpYUwSF8WC8Jp2xEKgwqXqNRrSeOg4BBz4UO0U2ITaar2hKDUEsMqeI8jaAdAH7gafOr1qUOtvCjAiXhyeG0vQTp03CXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Li29MxDY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Li29MxDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745608308; x=1777144308;
  h=date:from:to:cc:subject:message-id;
  bh=GVuKrwqb1Jb9rIw9Hpt7AUYiv9g6FGszlIcIpDCiybw=;
  b=Li29MxDYduaJO0cR7Fxgn/uGRr5W17MSWhlb1RbaBEno6mHL0QWiKp9x
   xyPLZsOeGuwVcP7NEu0EiDrxgkpg/WfuykRJG09/Z8RR9ArNhLV2ZRV2l
   JpaLSb2M7knsNOlmEc+CsdH/ZCDChGsOCnllst+WTHOn5rWAgshR3nV+I
   kwX6m+3OyScLy4PErPyol6wivws1lKPDgy30KZWNqtcJrNCFSUZWv2rT6
   EAhsLrmJPCBcnE1xHrnTO/TdnmIZjcWLdBIor015KdoiG3vKUEAmuuk3h
   WGrPNa6YX+L7hUtHZyytBjoVXktY0Q+glbIyliuawpuY7u5eZ6CyUGVgO
   Q==;
X-CSE-ConnectionGUID: Io1KbVZjQKCh8mcBU4lSGw==
X-CSE-MsgGUID: uZVTApr1TEmYPt4YbNb3ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="34894841"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="34894841"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 12:11:48 -0700
X-CSE-ConnectionGUID: HJyIQGHSRZe+Gp+Kk1I7oA==
X-CSE-MsgGUID: lXY5+5stTmWjrY8WveSDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132970387"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2025 12:11:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8OSe-0005SL-1u;
	Fri, 25 Apr 2025 19:11:44 +0000
Date: Sat, 26 Apr 2025 03:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 0c6ae66ef164c408daeab6a61aace4b86010369a
Message-ID: <202504260357.RL17tp1n-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: 0c6ae66ef164c408daeab6a61aace4b86010369a  Merge branch into tip/master: 'x86/sev'

elapsed time: 1457m

configs tested: 99
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250425    gcc-14.2.0
arc                   randconfig-002-20250425    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250425    clang-21
arm                   randconfig-002-20250425    gcc-6.5.0
arm                   randconfig-003-20250425    clang-21
arm                   randconfig-004-20250425    gcc-6.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250425    clang-21
arm64                 randconfig-002-20250425    gcc-7.5.0
arm64                 randconfig-003-20250425    gcc-7.5.0
arm64                 randconfig-004-20250425    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250425    gcc-13.3.0
csky                  randconfig-002-20250425    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250425    clang-21
hexagon               randconfig-002-20250425    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250425    gcc-12
i386        buildonly-randconfig-002-20250425    gcc-12
i386        buildonly-randconfig-003-20250425    clang-20
i386        buildonly-randconfig-004-20250425    gcc-12
i386        buildonly-randconfig-005-20250425    gcc-12
i386        buildonly-randconfig-006-20250425    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250425    gcc-14.2.0
loongarch             randconfig-002-20250425    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250425    gcc-5.5.0
nios2                 randconfig-002-20250425    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250425    gcc-10.5.0
parisc                randconfig-002-20250425    gcc-8.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250425    clang-21
powerpc               randconfig-002-20250425    gcc-9.3.0
powerpc               randconfig-003-20250425    gcc-9.3.0
powerpc64             randconfig-001-20250425    clang-21
powerpc64             randconfig-002-20250425    gcc-7.5.0
powerpc64             randconfig-003-20250425    gcc-10.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250425    gcc-14.2.0
riscv                 randconfig-002-20250425    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250425    clang-17
s390                  randconfig-002-20250425    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250425    gcc-7.5.0
sh                    randconfig-002-20250425    gcc-9.3.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250425    gcc-8.5.0
sparc                 randconfig-002-20250425    gcc-14.2.0
sparc64               randconfig-001-20250425    gcc-10.5.0
sparc64               randconfig-002-20250425    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250425    clang-21
um                    randconfig-002-20250425    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250425    gcc-12
x86_64      buildonly-randconfig-002-20250425    clang-20
x86_64      buildonly-randconfig-003-20250425    gcc-12
x86_64      buildonly-randconfig-004-20250425    gcc-12
x86_64      buildonly-randconfig-005-20250425    clang-20
x86_64      buildonly-randconfig-006-20250425    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250425    gcc-6.5.0
xtensa                randconfig-002-20250425    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
