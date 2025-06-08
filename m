Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B6D194137
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749411463; cv=none; b=hweXOaGZoqzQ3v/M8o07H0chAyLj3yZ4B1eYppIgiWRMjhYBAfruwlkcM93Lw1XrX0RmnRy0CPYZ3bnRFoBKP1M6Enx1TYlxKB+THvJca0Y35/5uOhtCVfYS3WgyClD0hwxjqmOBDmEe3oeM0ryNAFIibP8G8KrlCTSjtT+CV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749411463; c=relaxed/simple;
	bh=GQolLZCaQAW1YLfc8qiRtS2D7x03bwSxsxSo5NAKkv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRswc4PRO1RS7aUyh+2ub7s7gagA24+QcYYalhZ/aB31ms77NCgnur6BC7QgbRufKJPw8r3EZFaNmXpvJJqd3Uuhnsbc2Rb01tDWM+N71sUfDnhlK36GktsQQejA33QqWvA3JRLnSHGQ+9j1WqtyUkLNriNb3nee7jxx7zRUGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJ7xDFNc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJ7xDFNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749411461; x=1780947461;
  h=date:from:to:cc:subject:message-id;
  bh=GQolLZCaQAW1YLfc8qiRtS2D7x03bwSxsxSo5NAKkv4=;
  b=IJ7xDFNc8Lm4dXXNDr6E6XEmU/40eJBABQO7wuH7zVhxzkeHvsxVyVpx
   z3ifjQPUNxgjDW0YU9DAmeFdZYPiLdnMRyrQxLr3W1UdBstWgwfN5radH
   Mh6PQDhMgkwdnepJEM72uwc46m8cqpXSEZ77ztU5phAOXbQO5xeUq5LqQ
   IZese2H2HSSm+XWlYelisG4dtTfr5w/V4grH4EYJ+//Rq5RYGN713VSJf
   rBReqLgpznoWI+xa3pumGgturJkiXqtoK6/VXmLNcBYoFEaq8ldCWLXs3
   2SdBJSJXsRKUaiADj4RuMVKruNS5KjdWxZh3pToEyfkDvVLD/k186vCau
   A==;
X-CSE-ConnectionGUID: myKUX2ujRZCoPpO5/HONnA==
X-CSE-MsgGUID: 0b+vnAAaTaqvOzejzlpjbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62893705"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="62893705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 12:37:40 -0700
X-CSE-ConnectionGUID: ZCZkRo3tTtes6uqrDeyNdA==
X-CSE-MsgGUID: kV7r8NCoSMubgNpp8A1O3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="177219890"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jun 2025 12:37:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOLpo-0006XB-2R;
	Sun, 08 Jun 2025 19:37:36 +0000
Date: Mon, 09 Jun 2025 03:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/cleanups] BUILD SUCCESS
 41cb08555c4164996d67c78b3bf1c658075b75f1
Message-ID: <202506090303.HEbVKjoQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
branch HEAD: 41cb08555c4164996d67c78b3bf1c658075b75f1  treewide, timers: Rename from_timer() to timer_container_of()

elapsed time: 722m

configs tested: 197
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250608    gcc-8.5.0
arc                   randconfig-002-20250608    gcc-8.5.0
arc                        vdk_hs38_defconfig    clang-21
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    clang-21
arm                         bcm2835_defconfig    clang-21
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    clang-21
arm                                 defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-21
arm                        mvebu_v7_defconfig    clang-21
arm                       omap2plus_defconfig    clang-21
arm                          pxa3xx_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250608    gcc-8.5.0
arm                   randconfig-002-20250608    gcc-8.5.0
arm                   randconfig-003-20250608    gcc-12.4.0
arm                   randconfig-004-20250608    gcc-8.5.0
arm                             rpc_defconfig    clang-18
arm                          sp7021_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250608    clang-21
arm64                 randconfig-002-20250608    gcc-12.3.0
arm64                 randconfig-003-20250608    clang-21
arm64                 randconfig-004-20250608    gcc-13.3.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250608    gcc-10.5.0
csky                  randconfig-002-20250608    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250608    clang-21
hexagon               randconfig-002-20250608    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250608    clang-20
i386        buildonly-randconfig-002-20250608    clang-20
i386        buildonly-randconfig-003-20250608    gcc-12
i386        buildonly-randconfig-004-20250608    clang-20
i386        buildonly-randconfig-005-20250608    gcc-12
i386        buildonly-randconfig-006-20250608    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250609    clang-20
i386                  randconfig-002-20250609    clang-20
i386                  randconfig-003-20250609    clang-20
i386                  randconfig-004-20250609    clang-20
i386                  randconfig-005-20250609    clang-20
i386                  randconfig-006-20250609    clang-20
i386                  randconfig-007-20250609    clang-20
i386                  randconfig-011-20250609    clang-20
i386                  randconfig-012-20250609    clang-20
i386                  randconfig-013-20250609    clang-20
i386                  randconfig-014-20250609    clang-20
i386                  randconfig-015-20250609    clang-20
i386                  randconfig-016-20250609    clang-20
i386                  randconfig-017-20250609    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250608    gcc-14.3.0
loongarch             randconfig-002-20250608    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           rs90_defconfig    clang-21
mips                        vocore2_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250608    gcc-12.4.0
nios2                 randconfig-002-20250608    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250608    gcc-8.5.0
parisc                randconfig-002-20250608    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    clang-21
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    clang-21
powerpc               randconfig-001-20250608    clang-21
powerpc               randconfig-002-20250608    gcc-8.5.0
powerpc               randconfig-003-20250608    clang-21
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250608    clang-21
powerpc64             randconfig-002-20250608    gcc-8.5.0
powerpc64             randconfig-003-20250608    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250608    gcc-13.3.0
riscv                 randconfig-002-20250608    gcc-8.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250608    clang-21
s390                  randconfig-002-20250608    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                               j2_defconfig    clang-21
sh                 kfr2r09-romimage_defconfig    clang-21
sh                     magicpanelr2_defconfig    clang-21
sh                    randconfig-001-20250608    gcc-11.5.0
sh                    randconfig-002-20250608    gcc-13.3.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7722_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250608    gcc-11.5.0
sparc                 randconfig-002-20250608    gcc-12.4.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250608    gcc-13.3.0
sparc64               randconfig-002-20250608    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250608    gcc-12
um                    randconfig-002-20250608    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250608    gcc-11
x86_64      buildonly-randconfig-002-20250608    clang-20
x86_64      buildonly-randconfig-003-20250608    gcc-12
x86_64      buildonly-randconfig-004-20250608    gcc-12
x86_64      buildonly-randconfig-005-20250608    clang-20
x86_64      buildonly-randconfig-006-20250608    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250609    gcc-12
x86_64                randconfig-002-20250609    gcc-12
x86_64                randconfig-003-20250609    gcc-12
x86_64                randconfig-004-20250609    gcc-12
x86_64                randconfig-005-20250609    gcc-12
x86_64                randconfig-006-20250609    gcc-12
x86_64                randconfig-007-20250609    gcc-12
x86_64                randconfig-008-20250609    gcc-12
x86_64                randconfig-071-20250609    clang-20
x86_64                randconfig-072-20250609    clang-20
x86_64                randconfig-073-20250609    clang-20
x86_64                randconfig-074-20250609    clang-20
x86_64                randconfig-075-20250609    clang-20
x86_64                randconfig-076-20250609    clang-20
x86_64                randconfig-077-20250609    clang-20
x86_64                randconfig-078-20250609    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250608    gcc-9.3.0
xtensa                randconfig-002-20250608    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
