Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D506198E60
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743792055; cv=none; b=C/4iz+1612VPwEb2kqBlAEhfx97GLk0WKX5enoclXOi2qZ+/RnueUubA1Zl5V3yJTz30BgWdXzskFWaXGsrF6T/Z7TiRcVsgRG/3KzktfZgHjGxTGF6rNBP7VZxGS49GZkmc4sa2DLEv3Q6tXKwdwflojcmTcl8weOZdRQ/kvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743792055; c=relaxed/simple;
	bh=PBHE7KBGypEv5fkHxRSe/Cy7ScJtNanrANcXjXzjkHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MHlFaErkFyoWxv4oAsdFOE23FxXyyOq9CKl5Ju+GFGpmziVLSamf8jdDTL/C4wZsCEwZ5nHklS0i2wqejVOgGkK3CiAkHdHdKtfZB7OxS/x0eaurXpLWJMewNZtZXtlOeS4nj7/M3zRKMMGaoJ8LK24RPTBdrNe4UKhO0+OMZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yf3IoyRG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yf3IoyRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743792053; x=1775328053;
  h=date:from:to:cc:subject:message-id;
  bh=PBHE7KBGypEv5fkHxRSe/Cy7ScJtNanrANcXjXzjkHk=;
  b=Yf3IoyRGmwwLGVfCFZrEhMcHcHJ8uhyxOUsALSPbe1YtjqD2crd9svOg
   P5GX9Pa9lqLTftcIFt514NQW1/i49EtmWBelI9yxbK43UELUMRGlmQq9L
   GPMl2Z84H0uCqsflvw54MofXtWhsy33F7N5suU8C6hI5r2iBhLVLYyRKM
   hjZzRcz1vE/5ajwwGGspjDhD//3AmfuLN/+qd329nlcZq09Lj90jGP6Y7
   rv1EQRfZvM2wAssdttbFUh3O3u4mKdj7oiIF97uW7H+GuvyNz9Zyxz68K
   8pcc3dbTAITvZtbCm1iidp33o0NUSlmCW18kFqfcpx80Ep9FNad35bbDg
   g==;
X-CSE-ConnectionGUID: 3Wm8XFgZTa+uro5Ypae0AA==
X-CSE-MsgGUID: L03e944ITCa6+sgZ8+Ma6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55904531"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="55904531"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 11:40:52 -0700
X-CSE-ConnectionGUID: rUoaoSUIShKlUHuEq6uCrQ==
X-CSE-MsgGUID: JWH9NoaZQ4qO+dfuyMg7AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="132502600"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2025 11:40:52 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0lyD-0001SQ-2h;
	Fri, 04 Apr 2025 18:40:49 +0000
Date: Sat, 05 Apr 2025 02:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.03.31a] BUILD SUCCESS
 cc7eda9f61052500791646a102964cf892704385
Message-ID: <202504050216.tMqR6uDa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.03.31a
branch HEAD: cc7eda9f61052500791646a102964cf892704385  lib: Add trivial kunit test for ratelimit

elapsed time: 1450m

configs tested: 116
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250404    gcc-14.2.0
arc                   randconfig-002-20250404    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-15
arm                           imxrt_defconfig    clang-21
arm                   randconfig-001-20250404    clang-21
arm                   randconfig-002-20250404    gcc-7.5.0
arm                   randconfig-003-20250404    clang-21
arm                   randconfig-004-20250404    clang-21
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250404    gcc-5.5.0
arm64                 randconfig-002-20250404    gcc-7.5.0
arm64                 randconfig-003-20250404    gcc-9.5.0
arm64                 randconfig-004-20250404    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250404    gcc-13.3.0
csky                  randconfig-002-20250404    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250404    clang-15
hexagon               randconfig-002-20250404    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250404    gcc-12
i386        buildonly-randconfig-002-20250404    gcc-12
i386        buildonly-randconfig-003-20250404    gcc-12
i386        buildonly-randconfig-004-20250404    gcc-12
i386        buildonly-randconfig-005-20250404    gcc-12
i386        buildonly-randconfig-006-20250404    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250404    gcc-14.2.0
loongarch             randconfig-002-20250404    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-21
mips                          rm200_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250404    gcc-5.5.0
nios2                 randconfig-002-20250404    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250404    gcc-8.5.0
parisc                randconfig-002-20250404    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250404    gcc-5.5.0
powerpc               randconfig-002-20250404    gcc-9.3.0
powerpc               randconfig-003-20250404    clang-21
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250404    gcc-10.5.0
powerpc64             randconfig-002-20250404    clang-21
powerpc64             randconfig-003-20250404    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250404    gcc-14.2.0
riscv                 randconfig-002-20250404    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250404    clang-15
s390                  randconfig-002-20250404    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250404    gcc-5.5.0
sh                    randconfig-002-20250404    gcc-5.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250404    gcc-14.2.0
sparc                 randconfig-002-20250404    gcc-8.5.0
sparc64               randconfig-001-20250404    gcc-10.5.0
sparc64               randconfig-002-20250404    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250404    gcc-12
um                    randconfig-002-20250404    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250404    clang-20
x86_64      buildonly-randconfig-002-20250404    clang-20
x86_64      buildonly-randconfig-003-20250404    clang-20
x86_64      buildonly-randconfig-004-20250404    gcc-12
x86_64      buildonly-randconfig-005-20250404    gcc-12
x86_64      buildonly-randconfig-006-20250404    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250404    gcc-14.2.0
xtensa                randconfig-002-20250404    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
