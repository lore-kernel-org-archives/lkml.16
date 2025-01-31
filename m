Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EA1199223
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 23:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367561; cv=none; b=RrTYhaa2MlB82qWO4/TsmT1XBFfUMnWdmewpfpxbA/9+JVhRCUrEaJcZOY0Cwso+K/yfupCYfGF3didl4GYO18qAcYVjmnooWLJrQE7nIRaboDqc9QXLqJyL20HzORpQIpg+r7N84cRtA0PA5jtqfvs3SWdbpWo9jBdXcuph6dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367561; c=relaxed/simple;
	bh=/tBAKrioT8ayNHTqmMfOAjqR45/u2f4W8KXCLslTWJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GgsagYdBXWR200x7A4pVby7dCDahvPZIuGvLqAyQhSkRxt0DvGWyhdTClMf2V18J6AMnEYYfUNTSt5UvtMaac1w5V1Qfe72vdhgVGqaQt2n+FgPcwWLfYigIrYr16WklaZ6/XBhu6pA0318YktYnXOh2ybS7Fc4so8x6AlLk834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcoDkcTg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcoDkcTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738367560; x=1769903560;
  h=date:from:to:cc:subject:message-id;
  bh=/tBAKrioT8ayNHTqmMfOAjqR45/u2f4W8KXCLslTWJk=;
  b=AcoDkcTgfE/IaFXqIOP/yhC0T1LXUivz/S6TRC85ENZhDcehdMP4mJ/m
   lEvZ+RaTKLJNteRVihzFv7EiusQllMvz9W0TwlHJw6QyMq6O5HnlPOQTw
   4vHNERhS88Fb9LOZ4ckR1gsnB5cG9gEeem3hYXN6/YbcYhmFRIxSRNjac
   ksMVKGvHcch9//C72EwaDjbYNf66W01M1b/0nGLUUGEd3mlthHUTPDIKG
   DDC5eIdzew1hz037nN/GXrzGk2gikZSl2CbVbJso5NKU4QX98naeWjtZT
   hGLNCz5/kehBwiYxOX1BVMpPyUHThM/8XbUsCP9zUkaVw6xpyt3h1BFXA
   w==;
X-CSE-ConnectionGUID: cL+X0eP8Tu6Y3PreGvuMgQ==
X-CSE-MsgGUID: u6GiivTpRhWMqHMIwYO51Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56374163"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="56374163"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 15:52:39 -0800
X-CSE-ConnectionGUID: dbQWxANRSeqOaiv4fc5LoQ==
X-CSE-MsgGUID: u9Qv3fR1SuGEVjgkiGdVqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="110341301"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jan 2025 15:52:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te0oO-000nQr-0Y;
	Fri, 31 Jan 2025 23:52:36 +0000
Date: Sat, 01 Feb 2025 07:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/urgent] BUILD SUCCESS
 bb2784d9ab49587ba4fbff37a319fff2924db289
Message-ID: <202502010702.mPNmgPi8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
branch HEAD: bb2784d9ab49587ba4fbff37a319fff2924db289  jiffies: Cast to unsigned long in secs_to_jiffies() conversion

elapsed time: 852m

configs tested: 130
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250131    gcc-13.2.0
arc                   randconfig-002-20250131    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250131    clang-15
arm64                 randconfig-002-20250131    gcc-14.2.0
arm64                 randconfig-003-20250131    clang-21
arm64                 randconfig-004-20250131    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250131    gcc-14.2.0
csky                  randconfig-002-20250131    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-002-20250131    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-002-20250131    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-002-20250131    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-18
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-003-20250131    clang-21
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-003-20250131    clang-15
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250131    clang-19
riscv                 randconfig-002-20250131    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250131    clang-16
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    clang-19
um                    randconfig-002-20250131    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                randconfig-002-20250131    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
