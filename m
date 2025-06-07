Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5951A239F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749282445; cv=none; b=jec5QIhVFEoEeNuHVCvG+VOq3AO5xRw+hdGzT6QtghG9FUkk6hNm8O+Ky/QTc/dLK9RRuhrYwL+0HtYpVajmxnzE9BSqHg4vbgnEAWCKOfp0dlttXlAO6WzVmB4XZP8uLoDACIvf6GuNyfTPwDel2+jjwZuaIazenE6VYgmeMW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749282445; c=relaxed/simple;
	bh=q27D0Nw7AMugEJavgBZp0IhMA+H5dvm9UGg/+lO+opg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kOj+vLU1ql0LQ5p8INTGQSS/iWgltKCuWZLayo3VNX+VGoAivf8LnuoH8qiFT0wHJoKuZfeVXgPTbKv6OW46vvXTbLTTsxHQ5lBSTgObdYJin9BuYMO4GFBH2oeRWJKp9UGZfWjm+eWl8J0ZbLPL0gi/bSuW4skmdwSoOKvGssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RooDthtE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RooDthtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749282443; x=1780818443;
  h=date:from:to:cc:subject:message-id;
  bh=q27D0Nw7AMugEJavgBZp0IhMA+H5dvm9UGg/+lO+opg=;
  b=RooDthtERe4Dd8HaRDeHtF5rt1I7pI3PIC1NLX/MYYCKc6DJj4I3hqmx
   Jcp8/Fg7Zf63i33nLW9KMLkgmZXqleR44kC27RX7g5cU9FZDqz+T4i4Yp
   WeTob07h8tN6AVL2bfqGDmnIe+Jv+aZqb/TzQN3etUHnIX52FpcLilhUa
   tQfVawHkHM1L7Qv8n7E9ePxnsLKX3Y/lAdbu2KeNsGo8fM9saZhxgy4Wc
   Ndnb1rWp6rUbP2y4vw7RW+W8nceRmGYxS/5Y4YjBPZmPOHbE/Xjd0RTDV
   bXQ7q/9qtz+7gHCuLwWzlpZ/FqaOjyar6kmp3jkgtxd1RCCED5m+d3QDr
   Q==;
X-CSE-ConnectionGUID: u550hv5/QY6NJgBJnPgwyg==
X-CSE-MsgGUID: LAnPlgt2TUyYVlXYSL8fLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="76822454"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="76822454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 00:47:22 -0700
X-CSE-ConnectionGUID: NWbPtGaPQTOfF7EQ/HhPVQ==
X-CSE-MsgGUID: Xbhfo5uST6yCW7iKjcZWCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="146989548"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jun 2025 00:47:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNoGt-0005XN-0m;
	Sat, 07 Jun 2025 07:47:19 +0000
Date: Sat, 07 Jun 2025 15:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 cf2c03bb6d69f54288e6146d08afeb349ce397fa
Message-ID: <202506071509.IYZo8hm9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: cf2c03bb6d69f54288e6146d08afeb349ce397fa  rcutorture: Make BUSTED scenario check and log readers

elapsed time: 985m

configs tested: 149
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250607    gcc-15.1.0
arc                   randconfig-002-20250607    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250607    clang-21
arm                   randconfig-003-20250607    gcc-15.1.0
arm                   randconfig-004-20250607    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250607    clang-21
csky                  randconfig-001-20250607    gcc-12.4.0
csky                  randconfig-002-20250607    clang-21
csky                  randconfig-002-20250607    gcc-9.3.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20250607    clang-21
hexagon               randconfig-002-20250607    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250607    clang-20
i386        buildonly-randconfig-002-20250607    gcc-12
i386        buildonly-randconfig-003-20250607    gcc-12
i386        buildonly-randconfig-004-20250607    gcc-12
i386        buildonly-randconfig-005-20250607    clang-20
i386        buildonly-randconfig-006-20250607    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250607    gcc-12
i386                  randconfig-012-20250607    gcc-12
i386                  randconfig-013-20250607    gcc-12
i386                  randconfig-014-20250607    gcc-12
i386                  randconfig-015-20250607    gcc-12
i386                  randconfig-016-20250607    gcc-12
i386                  randconfig-017-20250607    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250607    clang-21
loongarch             randconfig-001-20250607    gcc-13.3.0
loongarch             randconfig-002-20250607    clang-21
loongarch             randconfig-002-20250607    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                      maltasmvp_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    gcc-15.1.0
mips                           rs90_defconfig    gcc-15.1.0
nios2                 randconfig-001-20250607    clang-21
nios2                 randconfig-001-20250607    gcc-10.5.0
nios2                 randconfig-002-20250607    clang-21
nios2                 randconfig-002-20250607    gcc-5.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250607    clang-21
parisc                randconfig-002-20250607    clang-21
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250607    clang-21
powerpc               randconfig-002-20250607    clang-21
powerpc               randconfig-003-20250607    clang-21
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250607    clang-19
powerpc64             randconfig-001-20250607    clang-21
powerpc64             randconfig-002-20250607    clang-21
powerpc64             randconfig-003-20250607    clang-21
powerpc64             randconfig-003-20250607    gcc-7.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20250607    clang-21
riscv                 randconfig-001-20250607    gcc-12
riscv                 randconfig-002-20250607    clang-16
riscv                 randconfig-002-20250607    gcc-12
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250607    clang-16
s390                  randconfig-001-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-12
s390                  randconfig-002-20250607    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250607    gcc-12
sh                    randconfig-001-20250607    gcc-14.3.0
sh                    randconfig-002-20250607    gcc-12
sh                    randconfig-002-20250607    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                 randconfig-001-20250607    gcc-10.3.0
sparc                 randconfig-001-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12
sparc                 randconfig-002-20250607    gcc-12.4.0
sparc64               randconfig-001-20250607    gcc-12
sparc64               randconfig-001-20250607    gcc-9.3.0
sparc64               randconfig-002-20250607    gcc-12
sparc64               randconfig-002-20250607    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                    randconfig-001-20250607    clang-21
um                    randconfig-001-20250607    gcc-12
um                    randconfig-002-20250607    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250607    clang-20
x86_64      buildonly-randconfig-002-20250607    clang-20
x86_64      buildonly-randconfig-003-20250607    clang-20
x86_64      buildonly-randconfig-004-20250607    gcc-12
x86_64      buildonly-randconfig-005-20250607    gcc-12
x86_64      buildonly-randconfig-006-20250607    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250607    clang-20
x86_64                randconfig-002-20250607    clang-20
x86_64                randconfig-003-20250607    clang-20
x86_64                randconfig-004-20250607    clang-20
x86_64                randconfig-005-20250607    clang-20
x86_64                randconfig-006-20250607    clang-20
x86_64                randconfig-007-20250607    clang-20
x86_64                randconfig-008-20250607    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                randconfig-001-20250607    gcc-10.5.0
xtensa                randconfig-001-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-12
xtensa                randconfig-002-20250607    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
