Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3AB18D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749694019; cv=none; b=BfjUYGGW+VDLiXV6+Dkwu1JCLZ/7CgZgMu3uq2Z0p3XspGb6qN5zuHkWOLGwGFDs4rM4Kq0xQddAZiZXXUrpADBnR9Mgq/jkW7NMNVfYdy84S+X4S/L49qVT8EgYKqPt9rbUtSaMXYSMNP62czB33Sa6+QZjugqKku72ssGQaaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749694019; c=relaxed/simple;
	bh=VbrEBHDKO0HmOf7XVDTOvQdqM8w30o9Y6ns+67yUfcA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ICFRS+awiL8V4GwHlkzXKlRxWUdLzcSEgbqtnoQAUHIbDAZ7kc2nJqV3wTa433rsTqE2i71cMk50oenK49SH2XN0OmGyQrR+6kVhiKyw6UzkKuIt8fz1LIZHXWRFtARjOEEkFXsGalXfE76aqFG+cpsiFBMo6QvVWyfix8CxPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcAW6bnp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcAW6bnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749694018; x=1781230018;
  h=date:from:to:cc:subject:message-id;
  bh=VbrEBHDKO0HmOf7XVDTOvQdqM8w30o9Y6ns+67yUfcA=;
  b=fcAW6bnp/rDMDNLQZD3X/uRH6jVCcvZanfAnKLewDXP3l6hRANahQnfo
   ld+WBUHIFFlEZ1ahwZguTv743vZhYuUrMUF8/XAs4p+0o9NX8U8lH4W7v
   zb2Gq8YMfx4b47lzwEwN4AZyCM2I+m9XtbyR5PzQwdePmk2mow7eiFXFY
   Wxah8v5Hfv479/pTvJi99bQg0i1FAUAnKiN0ZRjt4L0nv6X0Jb/JDtpjQ
   zySJ+8/VRgrGRQ3wFvyb7a96WWpXwIRIe/aq4Zrsr/1MZXLq+r8XMe0i5
   zdcjZXi/egL4EDCodjE6ZHvJp18EliSlSStWqVBjVGzvr7pW+J8v6lZ4x
   Q==;
X-CSE-ConnectionGUID: 8X8FgFfhQoat29mixHcYFg==
X-CSE-MsgGUID: D0eujDdZQXuzVttEf+QQ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51942170"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51942170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 19:06:58 -0700
X-CSE-ConnectionGUID: tw7/R4bpTyaB9HoRSTBsXQ==
X-CSE-MsgGUID: EzDoSx9PQ5SYJ08tejdrcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147240679"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2025 19:06:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPXLC-000B0g-0j;
	Thu, 12 Jun 2025 02:06:54 +0000
Date: Thu, 12 Jun 2025 10:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: 
 [gustavoars:testing/wfamnae-next20250606-with-new-overflow-stddef-helpers]
 BUILD SUCCESS 578689cf92162f12ba626db1111a187d83858748
Message-ID: <202506121034.zI0rsp2q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250606-with-new-overflow-stddef-helpers
branch HEAD: 578689cf92162f12ba626db1111a187d83858748  acpi: nfit: intel: avoid multiple -Wflex-array-member-not-at-end warnings

elapsed time: 1470m

configs tested: 100
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                         assabet_defconfig    clang-18
arm                   randconfig-001-20250611    gcc-11.5.0
arm                   randconfig-002-20250611    clang-21
arm                   randconfig-003-20250611    gcc-13.3.0
arm                   randconfig-004-20250611    gcc-13.3.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250611    gcc-8.5.0
arm64                 randconfig-002-20250611    gcc-9.5.0
arm64                 randconfig-003-20250611    gcc-13.3.0
arm64                 randconfig-004-20250611    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-15.1.0
csky                  randconfig-002-20250611    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250611    clang-21
hexagon               randconfig-002-20250611    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250611    gcc-12
i386        buildonly-randconfig-002-20250611    gcc-12
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250611    gcc-12
i386        buildonly-randconfig-005-20250611    gcc-11
i386        buildonly-randconfig-006-20250611    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-15.1.0
loongarch             randconfig-002-20250611    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-9.3.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250611    gcc-11.5.0
parisc                randconfig-002-20250611    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                  mpc885_ads_defconfig    clang-21
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-002-20250611    gcc-13.3.0
powerpc               randconfig-003-20250611    clang-21
powerpc64             randconfig-001-20250611    clang-21
powerpc64             randconfig-002-20250611    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250611    clang-21
riscv                 randconfig-002-20250611    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250611    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-11.5.0
sparc                 randconfig-002-20250611    gcc-8.5.0
sparc64               randconfig-001-20250611    gcc-8.5.0
sparc64               randconfig-002-20250611    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250611    clang-21
um                    randconfig-002-20250611    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    gcc-12
x86_64      buildonly-randconfig-005-20250611    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250611    gcc-13.3.0
xtensa                randconfig-002-20250611    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
