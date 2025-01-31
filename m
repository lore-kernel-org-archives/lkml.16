Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B822615
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353425; cv=none; b=gvtftAyTJ9akGqJfWKCMDFkRBS2ilOw1a+fSakzZmhOxb6VHTirY9ricFKHjUStftqvwal6xDaqKb0maw0ptEp1d4afC2QqIQFjJMVRYD7tJTdoImTmnyTNh72NDEwQTAaNS4zNPFnm9o59kr7Eh97pX3vgyY63A/BcrPYqTJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353425; c=relaxed/simple;
	bh=fiDfEGaU1Vapg3o0jwWSplNk095bU6l6RVzzUvIHGuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k0RAhCpeKEkeuNfanpDwglXH3iYiAfbZBRNnPuT930k1rVCkLvOITv9ScHXHvD3eBvuoHyCwROrBt7HcygzxUKZMIg99/bFaimyfmUDwgUg+9MaDtGZl/MrsE1pVoYdzRtUP7RVbaQlyRSiklno0mIHX+4o/WRK710aFcnguB4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8D6BnkC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8D6BnkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738353424; x=1769889424;
  h=date:from:to:cc:subject:message-id;
  bh=fiDfEGaU1Vapg3o0jwWSplNk095bU6l6RVzzUvIHGuY=;
  b=c8D6BnkCcLrmdHR6RsO9o9HSvZmLi0/t7lNBZpF/pXMGV7k3hL0RbeSC
   lcdRkLMb1q2kJll6fUPcMkzoShqowEFYWjUa7culNK/xSAYBZ79h3wzbi
   aL62n9YRretU6GHnZLF+ES9kFTNCPtFYBvJBqp66622GkqS156tPs0hnG
   8rXNbas+h3FTf08KJa6LwOeAEjqkyOojIlDmcbvtiTZYOOwnA+1ihwACG
   0oRll6Wx9ceJHd8QmKXz9c2pJ/mwLWcGZXPBMdZMu6O6jm6ASdJ+IQAUK
   EdHmPnzqOdiESBrduwBF9FQiuGG09VF3kVmMWEvcHMJ8bjxGvqxRRjqcM
   w==;
X-CSE-ConnectionGUID: BV6b40qjT6WuOsZeXoEpdA==
X-CSE-MsgGUID: OcxKieY9RxSMR6CuzxqVrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38635197"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="38635197"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:57:04 -0800
X-CSE-ConnectionGUID: JqssN8cERl6pnb/p6uVn0Q==
X-CSE-MsgGUID: KAcCualnQbSK7PGx0BU8aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140603053"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2025 11:57:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdx8O-000n2h-1R;
	Fri, 31 Jan 2025 19:57:00 +0000
Date: Sat, 01 Feb 2025 03:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 9d8db12ec685c379534ce6b049c5c94feb9a8e20
Message-ID: <202502010311.EgAjiyB0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 9d8db12ec685c379534ce6b049c5c94feb9a8e20  EXP x86/asm: Make serialize __always_inline

elapsed time: 1442m

configs tested: 61
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250131    gcc-13.2.0
arc                  randconfig-002-20250131    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250131    clang-17
arm                  randconfig-002-20250131    clang-15
arm                  randconfig-003-20250131    gcc-14.2.0
arm                  randconfig-004-20250131    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250131    clang-15
arm64                randconfig-002-20250131    gcc-14.2.0
arm64                randconfig-003-20250131    clang-21
arm64                randconfig-004-20250131    gcc-14.2.0
csky                 randconfig-001-20250131    gcc-14.2.0
csky                 randconfig-002-20250131    gcc-14.2.0
hexagon              randconfig-001-20250131    clang-21
hexagon              randconfig-002-20250131    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250131    clang-19
i386       buildonly-randconfig-002-20250131    clang-19
i386       buildonly-randconfig-003-20250131    gcc-12
i386       buildonly-randconfig-004-20250131    gcc-12
i386       buildonly-randconfig-005-20250131    clang-19
i386       buildonly-randconfig-006-20250131    gcc-12
i386                               defconfig    clang-19
loongarch            randconfig-001-20250131    gcc-14.2.0
loongarch            randconfig-002-20250131    gcc-14.2.0
nios2                randconfig-001-20250131    gcc-14.2.0
nios2                randconfig-002-20250131    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250131    gcc-14.2.0
parisc               randconfig-002-20250131    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250131    gcc-14.2.0
powerpc              randconfig-002-20250131    clang-15
powerpc              randconfig-003-20250131    clang-21
powerpc64            randconfig-001-20250131    clang-15
powerpc64            randconfig-002-20250131    clang-17
powerpc64            randconfig-003-20250131    clang-15
riscv                            allnoconfig    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-21
s390                            allyesconfig    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
um                               allnoconfig    clang-18
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250131    gcc-11
x86_64     buildonly-randconfig-002-20250131    clang-19
x86_64     buildonly-randconfig-003-20250131    gcc-12
x86_64     buildonly-randconfig-004-20250131    gcc-12
x86_64     buildonly-randconfig-005-20250131    clang-19
x86_64     buildonly-randconfig-006-20250131    clang-19
x86_64                             defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
