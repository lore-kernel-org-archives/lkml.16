Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382612F399
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606167; cv=none; b=jV/LEgxtWHkwhRINcO6bwdCncAQmNHSqh3fOCURzuHqP7B5MJPoF+oqCRHb4bhBGmG54B5mW7fDHbI0fMm5m3noA5NqNHcN5c2/alofOwzkVM0sRsix440L7BJVwtUE2NrRvEvAg3Z4UYGPkRwVe1iop6lBKTEmLmX22XVYG9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606167; c=relaxed/simple;
	bh=zWcQi9KmWBUbhx91FbmoiQweMLRlOznUvpIQS73U08Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tI2Pm4eJYL7p+dzrocecL01J48PKJVKpYMs1HUtIum6b3BnloM9p/bNORWwtyXAPy2MDIwX0DOyso5A+bak1LC3gtK17gA8ONEmrKlROtAWBQwwiInVVXYxsXLft+aWfPxOGSElKFvYjVzVN1peBWeWhtbfL5ZXi5bfZb0uQMb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knSx9nAi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knSx9nAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749606166; x=1781142166;
  h=date:from:to:cc:subject:message-id;
  bh=zWcQi9KmWBUbhx91FbmoiQweMLRlOznUvpIQS73U08Y=;
  b=knSx9nAi3pCTF7y8UOsnxDIMhOrsPizSAioWPGpvUKcCy6jZ6Mx2j2uQ
   eOJT6TClN0IS9jhgP125FutaYBpz4AIwFVLlO+LpocAEiifC6v3RmDUef
   Pu7XilkJOtYTiKNGsUaYZubW8hTid8B4ai/ejQ21YIRtdGArdMMopWXSc
   1woqhAbH/hRBj1ZluLWNmhyVFRuf0H/b5Q0z2jqPT/m4lR34PA1o3Wa+b
   ienJcd11dix0uXmxIybp6x0PfBJqT/NS/ZbjS7my/wFYclCl1rq70J1Om
   omesMAhTRdRJAMtMsb8p3sw5qcW5WCVnJ3FupmoF9ynTlvN64KZY5EEpG
   g==;
X-CSE-ConnectionGUID: g92PvMiGS6iEighPG6ytpQ==
X-CSE-MsgGUID: 1IYvSVDRTF+43pQ87PWiaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51593588"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51593588"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 18:42:46 -0700
X-CSE-ConnectionGUID: fYZrIAqETLC9wthF2XirAQ==
X-CSE-MsgGUID: r1m/EV0XRv2REaxg0g0i2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="152157578"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2025 18:42:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uP0lZ-0008SE-1i;
	Tue, 10 Jun 2025 15:19:57 +0000
Date: Tue, 10 Jun 2025 23:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 783d03408f4dd8910a3c160dd805d0e7c028b048
Message-ID: <202506102310.wY5zVMPv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: 783d03408f4dd8910a3c160dd805d0e7c028b048  rcutorture: Make BUSTED scenario check and log readers

elapsed time: 1458m

configs tested: 36
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                randconfig-001-20250610    gcc-12.4.0
arc                randconfig-002-20250610    gcc-14.3.0
arm                randconfig-001-20250610    clang-19
arm                randconfig-002-20250610    gcc-8.5.0
arm                randconfig-003-20250610    clang-21
arm                randconfig-004-20250610    clang-16
arm64              randconfig-001-20250610    clang-21
arm64              randconfig-002-20250610    gcc-11.5.0
arm64              randconfig-003-20250610    clang-21
arm64              randconfig-004-20250610    clang-18
i386     buildonly-randconfig-001-20250610    clang-20
i386     buildonly-randconfig-002-20250610    clang-20
i386     buildonly-randconfig-003-20250610    clang-20
i386     buildonly-randconfig-004-20250610    gcc-12
i386     buildonly-randconfig-005-20250610    clang-20
i386     buildonly-randconfig-006-20250610    clang-20
riscv              randconfig-001-20250610    gcc-14.3.0
riscv              randconfig-002-20250610    clang-16
s390               randconfig-001-20250610    gcc-8.5.0
s390               randconfig-002-20250610    gcc-14.3.0
sh                 randconfig-001-20250610    gcc-9.3.0
sh                 randconfig-002-20250610    gcc-15.1.0
sparc              randconfig-001-20250610    gcc-15.1.0
sparc              randconfig-002-20250610    gcc-12.4.0
sparc64            randconfig-001-20250610    gcc-8.5.0
sparc64            randconfig-002-20250610    gcc-8.5.0
um                 randconfig-001-20250610    gcc-11
um                 randconfig-002-20250610    gcc-12
x86_64   buildonly-randconfig-001-20250610    clang-20
x86_64   buildonly-randconfig-002-20250610    gcc-12
x86_64   buildonly-randconfig-003-20250610    clang-20
x86_64   buildonly-randconfig-004-20250610    clang-20
x86_64   buildonly-randconfig-005-20250610    gcc-12
x86_64   buildonly-randconfig-006-20250610    gcc-12
xtensa             randconfig-001-20250610    gcc-11.5.0
xtensa             randconfig-002-20250610    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
