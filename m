Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7F20328
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 22:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747001078; cv=none; b=Mujvtm3pMrzB7mMjbAgS3tXGcPNJnL7ZWjFAnPGj701MDtj8AHUivdoJfbMV/c4MHGQ1pstxU6ozs9vQ47fb+9uq8PZa9dQQQX6YUXchhW85w0c1KdonW0yn0BmjQ0SSp3u95BjwnYdT7C08TNurppyGb4HIhzqQ/3rZfQ/zmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747001078; c=relaxed/simple;
	bh=8Sd78TFosm+8lOixefW7+MQo1cD6xcF43l9bOo/vH2c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ORyTGtRF3dN/5G5E3P/lBxhjtJl7BFNQDv85p5dzRwHEZ9wUbN0ur1r7sh31gJ2r08LD1WIu+Ipx9fcgGlhashY8KSOblLBZ6EcO9Q0Lcbzat7tDT9qvWn+AonbhBu1upfApJCmrGukzDuWCCXboqfgYoMKDgGoevo99rXLc0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iK0Nh9aB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iK0Nh9aB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747001075; x=1778537075;
  h=date:from:to:cc:subject:message-id;
  bh=8Sd78TFosm+8lOixefW7+MQo1cD6xcF43l9bOo/vH2c=;
  b=iK0Nh9aBtX+NnH9IuzdlATBcXi3KV7oGLO02brzGKnzIcqBuEVoPInZ7
   +Y1h8ffaGXRGBWZOneNdFWy3QlSnuxKRyMg7Dc5b+zBA2+Ht4igZdp7C2
   qmuZEIo2GZ0aWp1iUZcbKdPjVfpTU1ORDt8GPnEDHE1qxaTQVT97ukgLC
   boTGJuLBVmUfTJ2AIHJ49fYw1El3l6yj0SQSNXib9UriodQtWBposNmV8
   pUaZGkLEdX5g/+QWMSYEdDlFnId7n36bDrNCvKgeJaB9L1FAAx2RRqVT9
   eiBt8iWjMPSvOR8QogTxSgx2Iu4JSp8EAoGDQYMtLhjbF+f+szRwDc1KA
   w==;
X-CSE-ConnectionGUID: 8P/KxlI4R8Sg4sZzjHYCzg==
X-CSE-MsgGUID: v6Wca8rAQY60YTpfHt+D7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48687542"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48687542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 15:04:35 -0700
X-CSE-ConnectionGUID: VeT9OXPAT52Mz9nQqb3wiA==
X-CSE-MsgGUID: TL+LHV/lTr6gCoSAPAcYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="168123046"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 May 2025 15:04:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEEme-000E1Y-0U;
	Sun, 11 May 2025 22:04:32 +0000
Date: Mon, 12 May 2025 06:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 f7387eff4bad33d12719c66c43541c095556ae4e
Message-ID: <202505120656.3Ai2rLEv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: f7387eff4bad33d12719c66c43541c095556ae4e  x86/sev: Fix operator precedence in GHCB_MSR_VMPL_REQ_LEVEL macro

elapsed time: 721m

configs tested: 20
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250511    clang-20
i386    buildonly-randconfig-002-20250511    gcc-12
i386    buildonly-randconfig-003-20250511    clang-20
i386    buildonly-randconfig-004-20250511    clang-20
i386    buildonly-randconfig-005-20250511    clang-20
i386    buildonly-randconfig-006-20250511    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250511    clang-20
x86_64  buildonly-randconfig-002-20250511    clang-20
x86_64  buildonly-randconfig-003-20250511    clang-20
x86_64  buildonly-randconfig-004-20250511    clang-20
x86_64  buildonly-randconfig-005-20250511    gcc-12
x86_64  buildonly-randconfig-006-20250511    clang-20
x86_64                          defconfig    gcc-11
x86_64                      rhel-9.4-rust    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
