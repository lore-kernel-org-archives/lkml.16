Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736B1E5B64
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535590; cv=none; b=uDD7Ta60BjFNXA8HVHI58XZrz6rEBSH9OjLnV3UhHg+ULCPLB1Gc585okBNZUo44f4gC63St01tMTSNS00mYc1SPss2DVKAV1jLPbD5h6TsVQoOkyku3rlTXpOfqEufy6mAZuQYvQmLdg1iI+52RVF6z2nGqNLulbTvRvCrH+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535590; c=relaxed/simple;
	bh=c6nzZiFBdQirh+QYbKEKugUD1WIfLXaGcip85OmBL+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J+f7/bf0I9ic+0/kmVpF27ky5Z5l7KGYbxswZlHX0KU3k4qAzqgtw/Vk0B4jikGUsKBsc8DrcTfy0KStOc1xc+hI8knyacVJh/JYBzvIq9G78klIQEfen3jiLPJufibtZfnwL70XQtDXa/OGggwgqza4nBvFjyri/C9Dt/MsbS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBIrA187; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBIrA187"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743535588; x=1775071588;
  h=date:from:to:cc:subject:message-id;
  bh=c6nzZiFBdQirh+QYbKEKugUD1WIfLXaGcip85OmBL+M=;
  b=BBIrA187VcC9JCkUQMiKemOaOyEo8C/7VPe7jRoXmm0Zd3FF90Yfisyx
   6gYRj1FNbnepsHPrs7MTorxOq1zqRBs67kCNNB2H8MVVE3ticUGC05sq2
   Onhruo5zBuwvK5qGwU6t5bTpGVnRA8h7X77VY9hSVFHmlV01+6rLLvCqp
   pDk+aHgYj3pZWyZWyxsNKLJw1x8ufgxhqd+4NPeTW9lS59PlW/zvlVB28
   h6LojlnH6bLrSAFeu4x30Iz0iAm9AIxAPWfIoF3UYSP9py+Y/keeg+leS
   fnZhLVfq3AIvmfNqpIvK0bJ/T6pdm2lyzsnsu+1NPf4SJoaK19WZ7grRr
   A==;
X-CSE-ConnectionGUID: 7thUlUCGQWyaukzYD7aqqw==
X-CSE-MsgGUID: iGKESBDbR1C3TNWtuxf12w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56244404"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="56244404"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:26:26 -0700
X-CSE-ConnectionGUID: fKcfnPVFQz623Ed05I108g==
X-CSE-MsgGUID: gGTwjtwjQNOdWlSpP7pGTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131193253"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 12:26:24 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzhFe-000A5I-1Z;
	Tue, 01 Apr 2025 19:26:22 +0000
Date: Wed, 02 Apr 2025 03:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 aa360b19f1e63c1a014d3403f1ab903115f3ec50
Message-ID: <202504020321.c3NnImH4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: aa360b19f1e63c1a014d3403f1ab903115f3ec50  EXP PCI/AER: Rate-limit output from aer_print_error()

elapsed time: 1445m

configs tested: 60
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                  randconfig-001-20250401    gcc-12.4.0
arc                  randconfig-002-20250401    gcc-14.2.0
arm                  randconfig-001-20250401    gcc-7.5.0
arm                  randconfig-002-20250401    gcc-8.5.0
arm                  randconfig-003-20250401    clang-18
arm                  randconfig-004-20250401    clang-14
arm64                randconfig-001-20250401    clang-21
arm64                randconfig-002-20250401    clang-20
arm64                randconfig-003-20250401    gcc-8.5.0
arm64                randconfig-004-20250401    gcc-6.5.0
csky                 randconfig-001-20250401    gcc-14.2.0
csky                 randconfig-002-20250401    gcc-10.5.0
hexagon                         allmodconfig    clang-17
hexagon                         allyesconfig    clang-21
hexagon              randconfig-001-20250401    clang-21
hexagon              randconfig-002-20250401    clang-21
i386       buildonly-randconfig-001-20250401    gcc-12
i386       buildonly-randconfig-002-20250401    clang-20
i386       buildonly-randconfig-003-20250401    clang-20
i386       buildonly-randconfig-004-20250401    clang-20
i386       buildonly-randconfig-005-20250401    gcc-12
i386       buildonly-randconfig-006-20250401    clang-20
loongarch            randconfig-001-20250401    gcc-14.2.0
loongarch            randconfig-002-20250401    gcc-14.2.0
nios2                randconfig-001-20250401    gcc-8.5.0
nios2                randconfig-002-20250401    gcc-6.5.0
parisc               randconfig-001-20250401    gcc-11.5.0
parisc               randconfig-002-20250401    gcc-5.5.0
powerpc              randconfig-002-20250401    gcc-8.5.0
powerpc              randconfig-003-20250401    clang-20
powerpc64            randconfig-002-20250401    clang-17
powerpc64            randconfig-003-20250401    gcc-6.5.0
riscv                randconfig-001-20250401    clang-21
riscv                randconfig-002-20250401    clang-14
s390                            allmodconfig    clang-18
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250401    clang-15
s390                 randconfig-002-20250401    gcc-9.3.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250401    gcc-12.4.0
sh                   randconfig-002-20250401    gcc-12.4.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250401    gcc-11.5.0
sparc                randconfig-002-20250401    gcc-7.5.0
sparc64              randconfig-001-20250401    gcc-9.3.0
sparc64              randconfig-002-20250401    gcc-13.3.0
um                              allmodconfig    clang-19
um                              allyesconfig    gcc-12
um                   randconfig-001-20250401    gcc-12
um                   randconfig-002-20250401    gcc-11
x86_64     buildonly-randconfig-001-20250401    clang-20
x86_64     buildonly-randconfig-002-20250401    gcc-12
x86_64     buildonly-randconfig-003-20250401    clang-20
x86_64     buildonly-randconfig-004-20250401    clang-20
x86_64     buildonly-randconfig-005-20250401    gcc-12
x86_64     buildonly-randconfig-006-20250401    clang-20
xtensa               randconfig-001-20250401    gcc-9.3.0
xtensa               randconfig-002-20250401    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
