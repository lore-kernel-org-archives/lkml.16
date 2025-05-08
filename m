Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843619D080
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680035; cv=none; b=WwlHyFPUoJkPcRzwQh2F/jhVag44kxW0IqhtZpKaNvscKIchDOa68bqYgAtqSwx68cH4JAWdPEgnva4FbgzTNYCjx6AwNTNYILaMNQEO/f76FERiRCxX2DGUhfvd76oVKMSgCq7WAHF6GeJ7SdL8RrpxMfhcWt6Gt+m/Vu4/FMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680035; c=relaxed/simple;
	bh=6Oq8irr5gTW+A0tDc4USFEnKH2DbH5E+uRpMR+leISw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NwJV8KlfxbDsH/jKCgcTV7eipuc4UPz0bN+LxsydsEVJ+zrkUKwAPC+fwXCk8/xJzg4KX0GrDjixmmqsv5YBZTXtjvzmrXPCQ78AXHV6TKe1VlhIRpeEz2NbS96EcllMHDaZXN18mOyEgMVv/4j2S3POle1vuuJSqq6iPU8NCJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMEJ1Rs5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMEJ1Rs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746680033; x=1778216033;
  h=date:from:to:cc:subject:message-id;
  bh=6Oq8irr5gTW+A0tDc4USFEnKH2DbH5E+uRpMR+leISw=;
  b=ZMEJ1Rs5x+s8g5NcKzQ0Opm/H94WJEQf8TKcrRiAsGeNnuArERY50caM
   mslNyNNPA8oarxRO9FmShlrZDe86bO30NKDnxBIa0B15arTVMSFnwE8bw
   V9L7smgCtbNnwc/L09gcN2PrvxYlI0mxOHXd5eWRix0rOAQMsJlCevDrE
   GelEkqWGfFXBb2xEWPj0cAZLdTpunepXKFRwndRcyuaqXswZpTluTYv6F
   PvrDrLivqDSIXgQhT36sNVBiytMYQ6uaACDQu62mkDTfUFXCvMSrpVRaF
   JKO4/7xEVXAmJe+S5qB+G8MXEMcjnmN7u6Ud7uJs9Ekh4xIKUsJ7MA55t
   A==;
X-CSE-ConnectionGUID: s/RPzUItTIuy+JkhOk4xrA==
X-CSE-MsgGUID: qL0KdN7kRsyjHX6/H7MfVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47545609"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="47545609"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:53:53 -0700
X-CSE-ConnectionGUID: TtzG0C+zSxqDmoXcyNWJdg==
X-CSE-MsgGUID: PHaGsbMGQcCKRHAgjmVCkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136060391"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 21:53:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtGX-000AAh-0v;
	Thu, 08 May 2025 04:53:49 +0000
Date: Thu, 08 May 2025 12:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:non-rcu/next] BUILD SUCCESS
 9c147c183e3da7a8a20a4aa06a500799136ed1ed
Message-ID: <202505081247.JRrR5vVE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git non-rcu/next
branch HEAD: 9c147c183e3da7a8a20a4aa06a500799136ed1ed  Merge branches 'lkmm.2025.04.22a' and 'ratelimit.2025.05.05a' into HEAD

elapsed time: 3355m

configs tested: 103
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250506    gcc-8.5.0
arc                   randconfig-002-20250506    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250506    clang-21
arm                   randconfig-002-20250506    clang-21
arm                   randconfig-003-20250506    clang-17
arm                   randconfig-004-20250506    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250506    clang-21
arm64                 randconfig-002-20250506    gcc-8.5.0
arm64                 randconfig-003-20250506    clang-21
arm64                 randconfig-004-20250506    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250506    gcc-14.2.0
csky                  randconfig-002-20250506    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250506    clang-21
hexagon               randconfig-002-20250506    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250506    clang-20
i386        buildonly-randconfig-002-20250506    clang-20
i386        buildonly-randconfig-003-20250506    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386        buildonly-randconfig-005-20250506    clang-20
i386        buildonly-randconfig-006-20250506    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250506    gcc-14.2.0
loongarch             randconfig-002-20250506    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250506    gcc-8.5.0
nios2                 randconfig-002-20250506    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250506    gcc-11.5.0
parisc                randconfig-002-20250506    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250506    clang-21
powerpc               randconfig-002-20250506    gcc-8.5.0
powerpc               randconfig-003-20250506    gcc-8.5.0
powerpc64             randconfig-001-20250506    clang-20
powerpc64             randconfig-002-20250506    gcc-8.5.0
powerpc64             randconfig-003-20250506    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250506    clang-19
riscv                 randconfig-002-20250506    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250506    gcc-9.3.0
s390                  randconfig-002-20250506    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250506    gcc-12.4.0
sh                    randconfig-002-20250506    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250506    gcc-11.5.0
sparc                 randconfig-002-20250506    gcc-6.5.0
sparc64               randconfig-001-20250506    gcc-7.5.0
sparc64               randconfig-002-20250506    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250506    clang-17
um                    randconfig-002-20250506    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250506    clang-20
x86_64      buildonly-randconfig-002-20250506    gcc-12
x86_64      buildonly-randconfig-003-20250506    gcc-12
x86_64      buildonly-randconfig-004-20250506    clang-20
x86_64      buildonly-randconfig-005-20250506    clang-20
x86_64      buildonly-randconfig-006-20250506    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250506    gcc-13.3.0
xtensa                randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
