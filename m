Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33BF1DDC0F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288620; cv=none; b=pC7SNz/O19J3gNjJRX9Bu0cUGT/0VlLYqM3uUb5TBPjXQMH3fDPVfCK0PgefFPD31c4IscZC+GaD+MykHLzAbREwwrs7+VG+u5Hb2gLQV3SYRYOJ2S5Q7b8ZkdiDV+vIvhHJf6HQj7MIIvp/0jS0gV8YyayggRiDQN6qqQGephc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288620; c=relaxed/simple;
	bh=eRw8R3KbTCkQg55gW5KaTF5WRDaiRFdjGb3BWucvEJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mnguH8qYBcgokLl+nUZZbNahi1eWDkI4vgMCAKgSEru0FMs1LGWPjHy3KClRMeymvbH6/FGCQdYnRK+0lmFpnoARUNAGocFSobmQ+p/uQSka7/WIJeAn4/nbz1T079/rjNW5nHnhqBNmt2nugTQPxleVRKKvByvghG9b+ed8A6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a48u9H9W; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a48u9H9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744288619; x=1775824619;
  h=date:from:to:cc:subject:message-id;
  bh=eRw8R3KbTCkQg55gW5KaTF5WRDaiRFdjGb3BWucvEJk=;
  b=a48u9H9WRz2lQUPfqD9KQ2MSJuA1Crtx6+lPaar+Ex4Ql9GNA2y/ZscX
   AW8ivZGEUtMJCMJWjtv43IxGwJsIBKwtA9yKBkyC6v7MP4lYm40lnBFIm
   1zj7tzpOYGIxSV1GEbxf4QiFTIpN13MXn8ziud6+YRChMEIXRq8Lj4IGc
   jqyfpvJLrjFxWJbs6o7hQPoCOzk8a/htIdXryrweqz8ua4VqGBBxPzzC6
   BNhaZHOFp8YzdxytsXi/+dZgIXOnd+flVAH7QkQX4WzzpZl/16p/JBgzB
   Y/Tg44xjEauFV87lnRqcSM8QLMAx3KoQfrb0hTc6dgbiGKRjCdwYzODTp
   g==;
X-CSE-ConnectionGUID: BosOShQKQHa63jr1rj02ng==
X-CSE-MsgGUID: nh2BYLbsTSilQVw4dyT5wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45694616"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45694616"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 05:36:58 -0700
X-CSE-ConnectionGUID: OhDLvryMSPWMewHz+BWn+w==
X-CSE-MsgGUID: s4q5i8AJQreC7uCXyFZGBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133865888"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Apr 2025 05:36:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2r9K-000A3j-1Y;
	Thu, 10 Apr 2025 12:36:54 +0000
Date: Thu, 10 Apr 2025 20:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/core] BUILD SUCCESS
 1734d98fbcce343eafba16e18e3a3001b3e94ab5
Message-ID: <202504102049.zFROWVsJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
branch HEAD: 1734d98fbcce343eafba16e18e3a3001b3e94ab5  perf/arch: Record sample last_period before updating on the x86 and PowerPC platforms

elapsed time: 1467m

configs tested: 28
configs skipped: 100

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250409    gcc-12
i386       buildonly-randconfig-002-20250409    clang-20
i386       buildonly-randconfig-003-20250409    gcc-11
i386       buildonly-randconfig-004-20250409    clang-20
i386       buildonly-randconfig-005-20250409    gcc-12
i386       buildonly-randconfig-006-20250409    gcc-12
i386                               defconfig    clang-20
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-21
powerpc              randconfig-001-20250409    gcc-6.5.0
powerpc              randconfig-002-20250409    clang-21
powerpc              randconfig-003-20250409    clang-21
powerpc64            randconfig-001-20250409    clang-21
powerpc64            randconfig-002-20250409    gcc-8.5.0
powerpc64            randconfig-003-20250409    clang-21
x86_64                           allnoconfig    clang-20
x86_64                          allyesconfig    clang-20
x86_64     buildonly-randconfig-001-20250409    clang-20
x86_64     buildonly-randconfig-002-20250409    gcc-12
x86_64     buildonly-randconfig-003-20250409    clang-20
x86_64     buildonly-randconfig-004-20250409    clang-20
x86_64     buildonly-randconfig-005-20250409    gcc-12
x86_64     buildonly-randconfig-006-20250409    gcc-12
x86_64                             defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
