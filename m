Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E42C2139D2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683352; cv=none; b=sxcvUkMjzUF707VUWfNhIAK3Wm7RCp2ybrFsLn2dWP4+lqqtZ/MXUcR7RKNX3QRUhNaFF/Wsw19BowHJRM8FMGHoNcX4lnnX+bTlPcwHnfrz3cnnvHXmjDzeO8mRWv3D0HWse3MZDaMSyJMUqdHXvyDFK0Fdf1OW2qMJYPvNURY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683352; c=relaxed/simple;
	bh=XN6OCZ6iEBCtr76tJ/NUeqMQlCMd9SauwYAqIXtVZbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dojad6B9JY044+DsKhUUtdsWCD3TLYmrPT6g6f9Nj5vO0nx4tO9jVUgfNOvwLHRJ8u8wcqiPDHutWwjbDSy6uTjgu4+zFFxHJgBkQ/3NkLpbqd9Y0rmzJ+sAebVUVaHfcdmO62lg+Iob5ocbuMpHFi+r6wwNCFEQsidVwBpfjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzSHEhfd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzSHEhfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746683351; x=1778219351;
  h=date:from:to:cc:subject:message-id;
  bh=XN6OCZ6iEBCtr76tJ/NUeqMQlCMd9SauwYAqIXtVZbY=;
  b=YzSHEhfd1QkEUtcgW4d7KvIihBb1q+hKGgxIIlfCZ0oxvhIerM/76nJ4
   daU96cp1XKodzU7Jit+UYlTU7/M8jjEgc9isxHE4zcj3omGWn5CMfVfl9
   KRXEI/WCdRCiC/VR1aw7YOejddKVaS9xOeYk7widBbtAJpzCfhLPrKG9C
   TMgRydrukgrnUrGrsAS3dHjThfRPFojlBtSAmuL2s0+vE71j4sssYkXcK
   Of7ZwIyfl08C5fmjn8AtNFr5I3ISm0g8T6Bky3szeP5NK115joXcwea82
   nL5KFU8En7tfZacgdiw7epYT1Dv2jAc6Jhqq979KdDVjbism6pomMVbUB
   w==;
X-CSE-ConnectionGUID: lKaEimczQxG6QuKc0anI7Q==
X-CSE-MsgGUID: l6FcWfpPSPW6WPI0hK4Ogw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52258289"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52258289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:49:10 -0700
X-CSE-ConnectionGUID: 5lM4RQoqSyCldH2Kg/x6jA==
X-CSE-MsgGUID: oCdYM8+zSh2NZxRfg9K6OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="140222199"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 22:49:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCu82-000AT9-2y;
	Thu, 08 May 2025 05:49:06 +0000
Date: Thu, 08 May 2025 13:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/microcode] BUILD SUCCESS
 4804f5ad5d63cf7ddad148132a3ecea11410dfa9
Message-ID: <202505081305.KOFd2ptx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/microcode
branch HEAD: 4804f5ad5d63cf7ddad148132a3ecea11410dfa9  x86/cpu: Add "Old Microcode" docs to hw-vuln toctree

elapsed time: 7865m

configs tested: 94
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                   randconfig-001-20250503    gcc-14.2.0
arc                   randconfig-002-20250503    gcc-11.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250503    gcc-6.5.0
arm                   randconfig-002-20250503    clang-21
arm                   randconfig-003-20250503    gcc-6.5.0
arm                   randconfig-004-20250503    clang-21
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250503    gcc-9.5.0
arm64                 randconfig-002-20250503    clang-21
arm64                 randconfig-003-20250503    clang-21
arm64                 randconfig-004-20250503    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250503    gcc-14.2.0
csky                  randconfig-002-20250503    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250503    clang-21
hexagon               randconfig-002-20250503    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250503    gcc-12
i386        buildonly-randconfig-002-20250503    gcc-12
i386        buildonly-randconfig-003-20250503    gcc-12
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-005-20250503    gcc-12
i386        buildonly-randconfig-006-20250503    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250503    gcc-14.2.0
loongarch             randconfig-002-20250503    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250503    gcc-11.5.0
nios2                 randconfig-002-20250503    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250503    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250503    gcc-5.5.0
powerpc               randconfig-002-20250503    gcc-9.3.0
powerpc               randconfig-003-20250503    clang-21
powerpc64             randconfig-001-20250503    gcc-7.5.0
powerpc64             randconfig-002-20250503    gcc-10.5.0
powerpc64             randconfig-003-20250503    gcc-7.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250503    clang-20
riscv                 randconfig-002-20250503    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250503    gcc-7.5.0
s390                  randconfig-002-20250503    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250503    gcc-5.5.0
sh                    randconfig-002-20250503    gcc-5.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250503    gcc-8.5.0
sparc                 randconfig-002-20250503    gcc-14.2.0
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-002-20250503    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250503    clang-21
um                    randconfig-002-20250503    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250503    clang-20
x86_64      buildonly-randconfig-006-20250503    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-002-20250503    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
