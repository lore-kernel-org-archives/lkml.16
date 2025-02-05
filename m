Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A122A1EA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744092; cv=none; b=fBoTqQPv4gm/DeZojQpxvCP9nVTMxJOq5G8xRBIDRe1pWmxs9Xu34rlUVrqsLg78+A954lXOuApcLRscA90U5Pb+AKq914X7Bea7kNB78yJZWGt1dV0mOyI6EpqHpcWczE4dJlC0uZi2tu0/+0ysTJeByQALTMiCpdPiSuoU51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744092; c=relaxed/simple;
	bh=wPPiE4WssOXXu5e2omQ8GbA5fpSg9jfmgtde5W1Vzn0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dxYSe/RmKmHfI7cWyxsZknfqJyi3wUByWp3SNwRSbEFpIxafAL36HtXYU+gvghI/0iq0mW24p3zo3jXfpxEszYSxUDUW/T1jWu5EywtY+c0SoIPvp2cPr0GuU/Z2wtZDNA4DyYl/puumiOxTn1HfppNVvpQGZpriS0tC1m9v1tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4fIXZ8q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4fIXZ8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738744090; x=1770280090;
  h=date:from:to:cc:subject:message-id;
  bh=wPPiE4WssOXXu5e2omQ8GbA5fpSg9jfmgtde5W1Vzn0=;
  b=P4fIXZ8qiii9IKuyr6w7RgjdFswn/ojnwWHVNG17THhNUX4vCr6ThPER
   Zv+U9YvxFFw7CKhMwXaPNSblwgxan4zRcPZ0vXhktxojiIWFQ58Bt1oti
   gh2iBYNrmh4gk5whYw5CnZx5F6aKJnj4sT10EDVdxnWQXqe+2bRrajJ4V
   x0EOx2XC9STiIS8umrwiSNmoS/rGlW9u+HuDdFgPYShOaAokF80JaERnA
   f+4PTPLylYIaXhaS5EAiCKwposYzrj+AQQpLFuxWzjL3RsL82Fl70Mciy
   ZevWnvnoj472ZusvsGTzh5zf+/T7auaJ2E9kN8kFQe8+H8SXeYYRyxKHF
   Q==;
X-CSE-ConnectionGUID: qwFuP+ZCQNqtYwHTHAgCkQ==
X-CSE-MsgGUID: ker7TwbgRzyClhoOzVVGMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43218196"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="43218196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:28:09 -0800
X-CSE-ConnectionGUID: yCEGMGPTQNmXIA+qP8GYNQ==
X-CSE-MsgGUID: hM+0etufQVqoMCYAIThscg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="111012300"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2025 00:28:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfalR-000tel-39;
	Wed, 05 Feb 2025 08:28:05 +0000
Date: Wed, 05 Feb 2025 16:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 a869ffcd79a0ce8713bfb2169db88e885c0a120d
Message-ID: <202502051629.EE24M0SP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: a869ffcd79a0ce8713bfb2169db88e885c0a120d  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1446m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-21
arm                   randconfig-001-20250204    clang-21
arm                   randconfig-002-20250204    clang-17
arm                   randconfig-003-20250204    clang-19
arm                   randconfig-004-20250204    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250204    clang-21
arm64                 randconfig-002-20250204    clang-21
arm64                 randconfig-003-20250204    clang-17
arm64                 randconfig-004-20250204    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250204    clang-21
hexagon               randconfig-002-20250204    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250204    clang-19
i386        buildonly-randconfig-003-20250204    clang-19
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250204    clang-19
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250204    clang-21
powerpc64             randconfig-002-20250204    clang-19
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-002-20250205    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-002-20250205    clang-21
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-004-20250204    gcc-11
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
