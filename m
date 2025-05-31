Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BA06FB9
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726450; cv=none; b=BetZDom74EEAe4HOCDJQFUyH37nvIdu++KTeSLbQgiF3OECtIbJoFA+NO1E0o5UHeI2n8DrQV6c/DAm/NlNuSn+ZSsxCpMcv4xMt2XwwBpW4mXBHEsqOzd7q+AgKrQVxtmCiNPubCGIsVtWjhxx6wCR47u9jb14RVudJnfZM4t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726450; c=relaxed/simple;
	bh=G5YXIwlLDjGRJxHwe01wtnwMzWHJ20KeR6JUWXx31OE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lw8+S9Rbo4p1jnfpJMgQYwZKyImk66OWx6wlNZ5m6yl00wzi5/11o7sC0nZPRmxrE0aiQmUHRVi/u5tWhgfjBfX7Ng9e8LZg5Wfo0JzveQi2k2dvAEdlWdU3tFm5kupxMq2rOF/qlbQk+KUbW0AgXmP2nfMsI7qLp244A9p9u+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahKIfjdk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahKIfjdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748726449; x=1780262449;
  h=date:from:to:cc:subject:message-id;
  bh=G5YXIwlLDjGRJxHwe01wtnwMzWHJ20KeR6JUWXx31OE=;
  b=ahKIfjdkThBpCFtf7eZ9OpQYlnwELTAYYSk6FCM0OFnR66VMjkPky610
   yL6OQLb8J16456IvFSTdX6JvDHNBnUZDqeYyVDZdnf3LGxDYJIsZLCJBL
   JAcygyMoaWpuZOPRTMdZC4sW6iJ+9fMD0XAIVSL9EDYntWcUZ+5ySk/fq
   nk5wTKKtlja98corP283sFsBcIQTxp9KDk/D55vUioKLoaZPSI5sOSQHK
   vaBKuUz1ggs9gmn+zYrAXdVMAjwToINlh24bRfbsXz7RXiOKjVUmy9RnJ
   rcDGdQ9v2yd6r/Sp+2dSqLmtKf7xHk12IIvC4lh6G1B0lKcZBVOv3WSpr
   g==;
X-CSE-ConnectionGUID: 2tYFdyqRRJCYdFROY8hKAQ==
X-CSE-MsgGUID: lqCqbAseR0+QG7wmBBrS1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50793300"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50793300"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:20:49 -0700
X-CSE-ConnectionGUID: cpW+4vikRIKm14F0Nezu9g==
X-CSE-MsgGUID: 8MxI/afwQjynO3q9JHorIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144210102"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2025 14:20:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLTdF-000Yea-1g;
	Sat, 31 May 2025 21:20:45 +0000
Date: Sun, 01 Jun 2025 05:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:perf/urgent] BUILD SUCCESS
 86aa94cd50b138be0dd872b0779fa3036e641881
Message-ID: <202506010529.y1Ylf40v-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/urgent
branch HEAD: 86aa94cd50b138be0dd872b0779fa3036e641881  perf/x86/intel: Fix incorrect MSR index calculations in intel_pmu_config_acr()

elapsed time: 727m

configs tested: 20
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250531    gcc-12
i386    buildonly-randconfig-002-20250531    gcc-12
i386    buildonly-randconfig-003-20250531    gcc-12
i386    buildonly-randconfig-004-20250531    clang-20
i386    buildonly-randconfig-005-20250531    clang-20
i386    buildonly-randconfig-006-20250531    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250531    clang-20
x86_64  buildonly-randconfig-002-20250531    gcc-12
x86_64  buildonly-randconfig-003-20250531    gcc-12
x86_64  buildonly-randconfig-004-20250531    gcc-12
x86_64  buildonly-randconfig-005-20250531    clang-20
x86_64  buildonly-randconfig-006-20250531    clang-20
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
