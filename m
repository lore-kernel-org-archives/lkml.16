Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B4426AA83
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857583; cv=none; b=NM6kGCoUGglpjN5QgM7h6Qc4JBiXG5OJGLarRUp0DxfSSnuVbx5UpKuGr8cgv9Ib078ll+q0sFFDOEYwYcT9aDn393BtSz2bqAQvJBLTWWJVLxjLFR99bRROPA0zYdTBGuiOSM3YJy0d4xqOd6Fc1VPB+vVKeFwivIGNGJzYdzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857583; c=relaxed/simple;
	bh=qrhKZPYkGxL/+D8ghgoJ0NSDadgal0sGTErP2Yn0lrU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QOFNAEoeS8fIxJUQRPszIaCNju6DR4rn9CgZMyf05XBxUwBmKZS/vmqzHMBfAyXtNukQF/RBqirZ8CzmL3/DpT5qr3ovrKfS3W5fyhNXC4tKw9EbFHkGEKEJTGf1mtU20Dg2VnTIKbtZxOYBEqqn4aOyEFMRVWtaJskuLbNnqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9cgz6wT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9cgz6wT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750857581; x=1782393581;
  h=date:from:to:cc:subject:message-id;
  bh=qrhKZPYkGxL/+D8ghgoJ0NSDadgal0sGTErP2Yn0lrU=;
  b=C9cgz6wTW8DbmSC2p8zYXX/njnnTwxn2U8W/+Jt2fZ/gsu1LPgzRS11e
   ZsCkqxTWjHD9fcCDnEUisYqiYUX2/A1tEl3YfQxfngRPw7QMqdZHDZw7C
   q4ElpAZOs9CHSMnOJP61glr1ZaJXDcITeJjps/KFQFCzlFthstoWvUgFr
   v45B/T+npVZXTmznv8nsbiLF+LkbGKDJ7lo8l0+XW8tYtuPFQeICFO0wH
   Mig4nWZdCAt8gg+9OwSs7E68FN0AEHpagqOxfnOyiZzZR5RwSUAuyRn/1
   CQzVhKigPLlk6kdxPWzTzdmTsaMBxnR76mVpE9E2+c1/VMIbxo5Hu7b4t
   A==;
X-CSE-ConnectionGUID: x6O/c5QXSQ6ZILOiwXmghA==
X-CSE-MsgGUID: PJsbCONkSLG2QS4u/xAytA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75666091"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="75666091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:19:41 -0700
X-CSE-ConnectionGUID: F09t3e2jTkO1itgCGsRRKw==
X-CSE-MsgGUID: RPUc/UdqTNKNhAt/C2AHcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156494645"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jun 2025 06:19:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUQ2L-000T8I-2K;
	Wed, 25 Jun 2025 13:19:37 +0000
Date: Wed, 25 Jun 2025 21:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.06.09a] BUILD SUCCESS
 55edf54333c0d306ea89acff59dd9209d0e42c6e
Message-ID: <202506252115.cujce3Z7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.06.09a
branch HEAD: 55edf54333c0d306ea89acff59dd9209d0e42c6e  rcu: Document that rcu_barrier() hurries lazy callbacks

elapsed time: 1453m

configs tested: 64
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-004-20250624    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-004-20250624    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-006-20250624    gcc-12
i386                                defconfig    clang-20
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
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250625    gcc-12
x86_64      buildonly-randconfig-002-20250625    clang-20
x86_64      buildonly-randconfig-003-20250625    clang-20
x86_64      buildonly-randconfig-004-20250625    clang-20
x86_64      buildonly-randconfig-005-20250625    clang-20
x86_64      buildonly-randconfig-006-20250625    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
